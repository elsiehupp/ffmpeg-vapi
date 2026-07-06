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

[CCode (cname="struct RTPDynamicProtocolHandler",cheader_filename="subprojects/ffmpeg/libavformat/rtpdec.h")]
public abstract class RTPDynamicProtocolHandler {
    [CCode (cname="")]
    public abstract string enc_name { public get; }

    [CCode (cname="")]
    public abstract LibAVUtil.MediaType codec_type { public get; }

    [CCode (cname="")]
    public abstract LibAVCodec.CodecID codec_id { public get; }

    [CCode (cname="")]
    public abstract LibAVFormat.StreamParseType need_parsing { public get; }

    /***********************************************************
    0 means no payload id is set. 0 is a valid
    payload ID (PCMU), too, but that format doesn't
    require any custom depacketization code.
    ***********************************************************/
    [CCode (cname="")]
    public int static_payload_id;

    [CCode (cname="")]
    public abstract size_t priv_data_size { public get; }

    /***********************************************************
    @brief Initialize dynamic protocol handler, called after the full rtpmap line is parsed, may be null
    ***********************************************************/
    [CCode (cname="")]
    public abstract int init (
        LibAVFormat.FormatContext format_context,
        int st_index,
        PayloadContext priv_data
    );

    /***********************************************************
    @brief Parse the a= line from the sdp field
    ***********************************************************/
    [CCode (cname="")]
    public abstract int parse_sdp_a_line (
        LibAVFormat.FormatContext format_context,
        int st_index,
        PayloadContext priv_data,
        string line
    );

    /***********************************************************
    @brief Free any data needed by the rtp parsing for this dynamic data.
    Don't free the protocol_data pointer itself, that is freed by the
    caller. This is called even if the init method failed.
    ***********************************************************/
    [CCode (cname="")]
    public abstract void close (
        PayloadContext protocol_data
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
    [CCode (cname="")]
    public abstract int parse_packet (
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

    [CCode (cname="")]
    public abstract int need_keyframe (
        PayloadContext context
    );

    [CCode (cname="")]
    public RTPDynamicProtocolHandler next;

    /***********************************************************
    @brief Iterate over all registered rtp dynamic protocol handlers.

    @param opaque a pointer where libavformat will store the iteration state. Must
                  point to NULL to start the iteration.

    @return the next registered rtp dynamic protocol handler or NULL when the iteration is
            finished
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/rtpdec.h")]
    public RTPDynamicProtocolHandler ff_rtp_handler_iterate (
        out void *opaque
    );

    /***********************************************************
    @brief Find a registered rtp dynamic protocol handler with the specified name.

    @param name name of the requested rtp dynamic protocol handler
    @return A rtp dynamic protocol handler if one was found, NULL otherwise.
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/rtpdec.h")]
    public RTPDynamicProtocolHandler ff_rtp_handler_find_by_name (
        string name,
        LibAVUtil.MediaType codec_type
    );

    /***********************************************************
    @brief Find a registered rtp dynamic protocol handler with a matching codec ID.

    @param id LibAVCodec.CodecID of the requested rtp dynamic protocol handler.
    @return A rtp dynamic protocol handler if one was found, NULL otherwise.
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/rtpdec.h")]
    public RTPDynamicProtocolHandler ff_rtp_handler_find_by_id (
        int id,
        LibAVUtil.MediaType codec_type
    );

}

} // namespace LibAVFormat
