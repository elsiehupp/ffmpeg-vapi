/***********************************************************
@copyright 2001 Fabrice Bellard

This file is part of FFmpeg.

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

namespace LibAVCodec {
using LibAVUtil;

/***********************************************************
@file
@ingroup libavc
LibAVCodec external API header
***********************************************************/

/***********************************************************
@defgroup lavc_parsing Frame parsing
***********************************************************/

public delegate int ParserInitDelegate (
    CodecParserContext s
);
public delegate int ParserParseDelegate (
    CodecParserContext s,
    CodecContext avctx,
    out uint8[] poutbuf, out int poutbuf_size,
    uint8[] buf, int buf_size
);
public delegate void ParserCloseDelegate (
    CodecParserContext s
);
public delegate int ParserSplitDelegate (
    CodecContext avctx,
    uint8[] buf,
    int buf_size
);

[CCode (cname="struct AVCodecParser", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public struct CodecParser {
    /***********************************************************
    @brief Several codec IDs are permitted
    ***********************************************************/
    [CCode (cname="codec_ids")]
    public int codec_ids[5];
    [CCode (cname="priv_data_size")]
    public int priv_data_size;

    [CCode (cname="parser_init")]
    public ParserInitDelegate parser_init;

    /***********************************************************
    @brief This callback never returns an error. A negative value means
    that the frame start was in a previous packet.
    ***********************************************************/
    [CCode (cname="parser_parse")]
    public ParserParseDelegate parser_parse;

    [CCode (cname="parser_close")]
    public ParserCloseDelegate parser_close;
    [CCode (cname="split")]
    public ParserSplitDelegate split;

    [CCode (cname="next")]
    public CodecParser *next;

    /***********************************************************
    @brief Iterate over all registered codec parsers.

    @param opaque a pointer where LibAVCodec will store the
    iteration state. Must point to null to start the
    iteration.

    @return the next registered codec parser or null when the
    iteration is finished
    ***********************************************************/
    [CCode (cname="av_parser_iterate", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public CodecParser av_parser_iterate (out void *opaque);

}

/***********************************************************
@addtogroup lavc_encoding
***********************************************************/

/***********************************************************
@defgroup lavc_misc Utility functions
@ingroup libavc

Miscellaneous utility functions related to both encoding and decoding
(or neither).
***********************************************************/

/***********************************************************
@defgroup lavc_misc_pixfmt Pixel formats

Functions for working with pixel formats.
***********************************************************/

/***********************************************************
@brief Return a value representing the fourCC code associated to the
pixel format pixel_format, or 0 if no associated fourCC code can be
found.
***********************************************************/
[CCode (cname="avcodec_pix_fmt_to_codec_tag", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public uint avcodec_pix_fmt_to_codec_tag (
    LibAVUtil.PixelFormat pixel_format
);

/***********************************************************
@brief Find the best pixel format to convert to given a certain source pixel
format. When converting from one pixel format to another, information loss
may occur. For example, when converting from RGB24 to GRAY, the color
information will be lost. Similarly, other losses occur when converting from
some formats to other formats. avcodec_find_best_pix_fmt_of_2 () searches which of
the given pixel formats should be used to suffer the least amount of loss.
The pixel formats from which it chooses one, are determined by the
pix_fmt_list parameter.

 *
@param[in] pix_fmt_list LibAVUtil.PixelFormat.NONE terminated array of pixel formats to choose from
@param[in] input_pix_fmt source pixel format
@param[in] has_alpha Whether the source pixel format alpha channel is used.
@param[out] loss_ptr Combination of flags informing you what kind of losses will occur.
@return The best pixel format to convert to or -1 if none was found.
***********************************************************/
[CCode (cname="avcodec_find_best_pix_fmt_of_list", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public LibAVUtil.PixelFormat avcodec_find_best_pix_fmt_of_list (
    LibAVUtil.PixelFormat[] pix_fmt_list,
    LibAVUtil.PixelFormat input_pix_fmt,
    int has_alpha, out int loss_ptr
);

/***********************************************************
@brief Fill LibAVUtil.Frame audio data and linesize pointers.

The buffer buf must be a preallocated buffer with a size big enough
to contain the specified samples amount. The filled LibAVUtil.Frame data
pointers will point to this buffer.

LibAVUtil.Frame extended_data channel pointers are allocated if necessary for
planar audio.

@param frame the LibAVUtil.Frame
    frame->nb_samples must be set prior to calling the
    function. This function fills in frame->data,
    frame->extended_data, frame->linesize[0].
@param nb_channels channel count
@param sample_fmt sample format
@param buf buffer to use for frame data
@param buf_size size of buffer
@param align plane size sample alignment (0 = default)
@return    >=0 on success, negative error code on failure
@todo return the size in bytes required to store the samples in
case of success, at the next libavutil bump
***********************************************************/
[CCode (cname="avcodec_fill_audio_frame", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public int avcodec_fill_audio_frame (
    LibAVUtil.Frame frame,
    int nb_channels,
    LibAVUtil.SampleFormat sample_fmt,
    uint8[] buf,
    int buf_size,
    int align
);

/***********************************************************
@brief Return the PCM codec associated with a sample format.
@param be endianness, 0 for little, 1 for big,
    -1 (or anything else) for native
@return CodecID
***********************************************************/
[CCode (cname="av_get_pcm_codec", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public CodecID av_get_pcm_codec (
    LibAVUtil.SampleFormat fmt,
    int be
);

} // namespace LibAVCodec
