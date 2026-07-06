/***********************************************************
@brief RTP demuxer definitions
@copyright 2002 Fabrice Bellard
@copyright 2006 Ryan Martell <rdm4@martellventures.com>
***********************************************************/
/***********************************************************
@brief This file is part of FFmpeg.

FFmpeg is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

FFmpeg is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with FFmpeg; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
***********************************************************/

namespace LibAVFormat {

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/rtpdec.h")]
public const size_t RTP_MIN_PACKET_LENGTH;

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/rtpdec.h")]
public const size_t RTP_MAX_PACKET_LENGTH;

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/rtpdec.h")]
public const size_t RTP_REORDER_QUEUE_DEFAULT_SIZE;

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/rtpdec.h")]
public const uint32 RTP_NOTS_VALUE;

/***********************************************************
@brief Send a dummy packet on both port pairs to set up the connection
state in potential NAT routers, so that we're able to receive
packets.

Note, this only works if the NAT router doesn't remap ports. This
isn't a standardized procedure, but it works in many cases in practice.

The same routine is used with RDT too, even if RDT doesn't use normal
RTP packets otherwise.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/rtpdec.h")]
public void ff_rtp_send_punch_packets (
    URLContext* rtp_handle
);

/***********************************************************
@brief Packet parsing for "private" payloads in the RTP specs.

@param format_context RTSP demuxer context
@param payload_context stream context
@param st stream that this packet belongs to
@param packet packet in which to write the parsed data
@param timestamp pointer to the RTP timestamp of the input data, can be
                 updated by the function if returning older, buffered data
@param buffer pointer to raw RTP packet data
@param len length of buffer
@param seq RTP sequence number of the packet
@param flags flags from the RTP packet header (RTP_FLAG_*)
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/rtpdec.h")]
public delegate int DynamicPayloadPacketHandlerProc (
    LibAVFormat.FormatContext format_context,
    PayloadContext payload_context,
    LibAVFormat.Stream st,
    LibAVCodec.Packet packet,
    uint32[] timestamp,
    uint8[] buffer,
    int len,
    uint16 seq,
    int flags
);

/***********************************************************
@brief From rtsp.c, but used by rtp dynamic protocol handlers.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/rtpdec.h")]
public int ff_rtsp_next_attr_and_value (
    string[] p,
    string attr,
    int attr_size,
    string value,
    int value_size
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/rtpdec.h")]
public delegate int ParseFMTPDelegate (
    LibAVFormat.FormatContext format_context,
    LibAVFormat.Stream stream,
    PayloadContext data,
    string attr,
    string value
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/rtpdec.h")]
public int ff_parse_fmtp (
    LibAVFormat.FormatContext format_context,
    LibAVFormat.Stream stream,
    PayloadContext data,
    string p,
    ParseFMTPDelegate parse_fmtp
);

/***********************************************************
@brief Close the dynamic buffer and make a packet from it.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/rtpdec.h")]
public int ff_rtp_finalize_packet (
    LibAVCodec.Packet packet,
    out LibAVFormat.IOContext dyn_buf,
    int stream_idx
);

} // namespace LibAVFormat
