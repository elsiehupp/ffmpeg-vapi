/***********************************************************
@brief This file is part of FFmpeg.

FFmpeg is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

FFmpeg is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with FFmpeg; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
***********************************************************/
/***********************************************************
@copyright 2001 Fabrice Bellard
***********************************************************/
namespace LibAVCodec {
using LibAVUtil;

/***********************************************************
@file @ingroup libavc
LibAVCodec external API header
***********************************************************/

/***********************************************************
@defgroup libavc LibAVCodec
Encoding/Decoding Library


@defgroup lavc_decoding Decoding

@defgroup lavc_encoding Encoding

@defgroup lavc_codec Codecs
@defgroup lavc_codec_native Native Codecs
@defgroup lavc_codec_wrappers External library wrappers
@defgroup lavc_codec_hwaccel Hardware Accelerators bridge
@defgroup lavc_internal Internal
***********************************************************/

/***********************************************************
@ingroup libavc
@defgroup lavc_encdec send/receive encoding and decoding API overview

The LibACCodec.CodecContext.avcodec_send_packet ()/avcodec_receive_frame ()/avcodec_send_frame ()/
avcodec_receive_packet () functions provide an encode/decode API, which
decouples input and output.

The API is very similar for encoding/decoding and audio/video, and works as
follows:
- Set up and open the CodecContext as usual.
- Send valid input:
    - For decoding, call LibACCodec.CodecContext.avcodec_send_packet () to give the decoder raw
        compressed data in an Packet.
    - For encoding, call avcodec_send_frame () to give the encoder an LibAVUtil.Frame
        containing uncompressed audio or video.
    In both cases, it is recommended that AVPackets and AVFrames are
    refcounted, or LibAVCodec might have to copy the input data. (libavformat
    always returns refcounted AVPackets, and av_frame_get_buffer () allocates
    refcounted AVFrames.)
- Receive output in a loop. Periodically call one of the avcodec_receive_*()
    functions and process their output:
    - For decoding, call avcodec_receive_frame (). On success, it will return
        an LibAVUtil.Frame containing uncompressed audio or video data.
    - For encoding, call avcodec_receive_packet (). On success, it will return
        an Packet with a compressed frame.
    Repeat this call until it returns LibAVUtil.ErrorCode (EAGAIN) or an error. The
    LibAVUtil.ErrorCode (EAGAIN) return value means that new input data is required to
    return new output. In this case, continue with sending input. For each
    input frame/packet, the codec will typically return 1 output frame/packet,
    but it can also be 0 or more than 1.

At the beginning of decoding or encoding, the codec might accept multiple
input frames/packets without returning a frame, until its internal buffers
are filled. This situation is handled transparently if you follow the steps
outlined above.

In theory, sending input can result in EAGAIN - this should happen only if
not all output was received. You can use this to structure alternative decode
or encode loops other than the one suggested above. For example, you could
try sending new input on each iteration, and try to receive output if that
returns EAGAIN.

End of stream situations. These require "flushing" (aka draining) the codec,
as the codec might buffer multiple frames or packets internally for
performance or out of necessity (consider B-frames).
This is handled as follows:
- Instead of valid input, send null to the LibACCodec.CodecContext.avcodec_send_packet () (decoding)
    or avcodec_send_frame () (encoding) functions. This will enter draining
    mode.
- Call avcodec_receive_frame () (decoding) or avcodec_receive_packet ()
    (encoding) in a loop until AVERROR_EOF is returned. The functions will
    not return LibAVUtil.ErrorCode (EAGAIN), unless you forgot to enter draining mode.
- Before decoding can be resumed again, the codec has to be reset with
    avcodec_flush_buffers ().

Using the API as outlined above is highly recommended. But it is also
possible to call functions outside of this rigid schema. For example, you can
call LibACCodec.CodecContext.avcodec_send_packet () repeatedly without calling
avcodec_receive_frame (). In this case, LibACCodec.CodecContext.avcodec_send_packet () will succeed
until the codec's internal buffer has been filled up (which is typically of
size 1 per output frame, after initial input), and then reject input with
LibAVUtil.ErrorCode (EAGAIN). Once it starts rejecting input, you have no choice but to
read at least some output.

Not all codecs will follow a rigid and predictable dataflow; the only
guarantee is that an LibAVUtil.ErrorCode (EAGAIN) return value on a send/receive call on
one end implies that a receive/send call on the other end will succeed, or
at least will not fail with LibAVUtil.ErrorCode (EAGAIN). In general, no codec will
permit unlimited buffering of input or output.

This API replaces the following legacy functions:
- avcodec_decode_video2 () and avcodec_decode_audio4 ():
    Use LibACCodec.CodecContext.avcodec_send_packet () to feed input to the decoder, then use
    avcodec_receive_frame () to receive decoded frames after each packet.
    Unlike with the old video decoding API, multiple frames might result from
    a packet. For audio, splitting the input packet into frames by partially
    decoding packets becomes transparent to the API user. You never need to
    feed an Packet to the API twice (unless it is rejected with LibAVUtil.ErrorCode (EAGAIN) - then
    no data was read from the packet).
    Additionally, sending a flush/draining packet is required only once.
- avcodec_encode_video2 ()/avcodec_encode_audio2 ():
    Use avcodec_send_frame () to feed input to the encoder, then use
    avcodec_receive_packet () to receive encoded packets.
    Providing user-allocated buffers for avcodec_receive_packet () is not
    possible.
- The new API does not handle subtitles yet.

Mixing new and old function calls on the same CodecContext is not allowed,
and will result in undefined behavior.

Some codecs might require using the new API; using the old API will return
an error when calling it. All codecs support the new API.

A codec is not allowed to return LibAVUtil.ErrorCode (EAGAIN) for both sending and receiving. This
would be an invalid state, which could put the codec user into an endless
loop. The API has no concept of time either: it cannot happen that trying to
do LibACCodec.CodecContext.avcodec_send_packet () results in LibAVUtil.ErrorCode (EAGAIN), but a repeated call 1 second
later accepts the packet (with no other receive/flush API calls involved).
The API is a strict state machine, and the passage of time is not supposed
to influence it. Some timing-dependent behavior might still be deemed
acceptable in certain cases. But it must never result in both send/receive
returning EAGAIN at the same time at any point. It must also absolutely be
avoided that the current state is "unstable" and can "flip-flop" between
the send/receive APIs allowing progress. For example, it's not allowed that
the codec randomly decides that it actually wants to consume a packet now
instead of returning a frame, after it just returned LibAVUtil.ErrorCode (EAGAIN) on an
LibACCodec.CodecContext.avcodec_send_packet () call.
***********************************************************/

/***********************************************************
@defgroup lavc_core Core functions/structures.
@ingroup libavc

Basic definitions, functions for querying LibAVCodec capabilities,
allocating core structures, etc.
***********************************************************/

/***********************************************************
@ingroup lavc_decoding
Required number of additionally allocated bytes at the end of the input bitstream for decoding.
This is mainly needed because some optimized bitstream readers read
32 or 64 bit at once and could read over the end.<br>
Note: If the first 23 bits of the additional bytes are not 0, then damaged
MPEG bitstreams could cause overread and segfault.
***********************************************************/
[CCode (cname="AV_INPUT_BUFFER_PADDING_SIZE", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public const size_t AV_INPUT_BUFFER_PADDING_SIZE;

/***********************************************************
@ingroup lavc_encoding
minimum encoding buffer size
Used to avoid some checks during header writing.
***********************************************************/
[CCode (cname="AV_INPUT_BUFFER_MIN_SIZE", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public const size_t AV_INPUT_BUFFER_MIN_SIZE;

#if FF_API_COPY_CONTEXT
/***********************************************************
@brief Get the LibAVUtil.Class for LibAVUtil.Frame. It can be used in combination with
OptionSearchFlags.FAKE_OBJECT_PARAMETER for examining options.

@see @link av_opt_find ().
***********************************************************/
[CCode (cname="avcodec_get_frame_class", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public const LibAVUtil.Class avcodec_get_frame_class ();

/***********************************************************
@brief Get the LibAVUtil.Class for SubtitleRect. It can be used in combination with
OptionSearchFlags.FAKE_OBJECT_PARAMETER for examining options.

@see @link av_opt_find ().
***********************************************************/
[CCode (cname="avcodec_get_subtitle_rect_class", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public const LibAVUtil.Class avcodec_get_subtitle_rect_class ();

#endif

[CCode (cname="av_packet_side_data_name", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public string av_packet_side_data_name (
    PacketSideDataType type
);

/***********************************************************
@brief Pack a dictionary for use in side_data.

@param dict The dictionary to pack.
@param size pointer to store the size of the returned data
@return pointer to data if successful, null otherwise
***********************************************************/
uint8[] av_packet_pack_dictionary (
    LibAVUtil.Dictionary dict,
    out int size
);

/***********************************************************
@brief Unpack a dictionary from side_data.

@param data data from side_data
@param size size of the data
@param dict the metadata storage dictionary
@return 0 on success, < 0 on failure
***********************************************************/
[CCode (cname="av_packet_unpack_dictionary", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public int av_packet_unpack_dictionary (
    uint8[] data,
    int size,
    out LibAVUtil.Dictionary dict
);

/***********************************************************
@addtogroup lavc_decoding
***********************************************************/

/***********************************************************
@brief Converts LibAVUtil.ChromaLocation to swscale x/y chroma position.

The positions represent the chroma (0,0) position in a coordinates system
with luma (0,0) representing the origin and luma (1,1) representing 256,256

@param xpos horizontal chroma sample position
@param ypos vertical chroma sample position
***********************************************************/
[CCode (cname="avcodec_enum_to_chroma_pos", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public int avcodec_enum_to_chroma_pos (
    int xpos,
    int ypos,
    LibAVUtil.ChromaLocation pos
);

/***********************************************************
@brief Converts swscale x/y chroma position to LibAVUtil.ChromaLocation.

The positions represent the chroma (0,0) position in a coordinates system
with luma (0,0) representing the origin and luma (1,1) representing 256,256

@param xpos horizontal chroma sample position
@param ypos vertical chroma sample position
***********************************************************/
[CCode (cname="avcodec_chroma_pos_to_enum", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public LibAVUtil.ChromaLocation avcodec_chroma_pos_to_enum (
    int xpos,
    int ypos
);

/***********************************************************
@brief Memory
***********************************************************/

/***********************************************************
@brief Same behaviour av_fast_malloc but the buffer has additional
AV_INPUT_BUFFER_PADDING_SIZE at the end which will always be 0.

In addition the whole buffer will initially and after resizes
be 0-initialized so that no uninitialized data will ever appear.
***********************************************************/
[CCode (cname="av_fast_padded_malloc", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public void av_fast_padded_malloc (
    void *ptr,
    out uint size,
    size_t min_size
);

/***********************************************************
@brief Same behaviour av_fast_padded_malloc except that buffer will always
be 0-initialized after call.
***********************************************************/
[CCode (cname="av_fast_padded_mallocz", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public void av_fast_padded_mallocz (
    void *ptr,
    out uint size,
    size_t min_size
);

/***********************************************************
@brief Encode extradata length to a buffer. Used by xiph codecs.

@param s buffer to write to; must be at least (data_size/255+1) bytes long
@param data_size size of extradata in bytes
@return number of bytes written to the buffer.
***********************************************************/
[CCode (cname="av_xiphlacing", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public uint av_xiphlacing (
    out uchar[] s,
    uint data_size
);

} // namespace LibAVCodec
