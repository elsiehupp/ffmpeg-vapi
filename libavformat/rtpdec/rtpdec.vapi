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

[CCode (cname="struct PayloadContext", cheader_filename="")]
public struct PayloadContext { }

[CCode (cname="", cheader_filename="")]
public const size_t RTP_MIN_PACKET_LENGTH;

[CCode (cname="", cheader_filename="")]
public const size_t RTP_MAX_PACKET_LENGTH;

[CCode (cname="", cheader_filename="")]
public const size_t RTP_REORDER_QUEUE_DEFAULT_SIZE;

[CCode (cname="", cheader_filename="")]
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
[CCode (cname="", cheader_filename="")]
public void ff_rtp_send_punch_packets (
    URLContext* rtp_handle
);

/***********************************************************
@brief Some rtp servers assume client is dead if they don't hear from them...
so we send a Receiver Report to the provided URLContext or AVIOContext
(we don't have access to the rtcp handle from here)
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ff_rtp_check_and_send_back_rr (
    RTPDemuxContext rtp_demux_context,
    URLContext fd,
    AVIOContext avio,
    int count
);

[CCode (cname="", cheader_filename="")]
public int ff_rtp_send_rtcp_feedback (
    RTPDemuxContext rtp_demux_context,
    URLContext fd,
    AVIOContext avio
);

/***********************************************************
@brief Phese statistics are used for rtcp receiver reports...
***********************************************************/
[CCode (cname="", cheader_filename="")]
public struct RTPStatistics {
    /***********************************************************
    @brief Highest sequence number seen
    ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public uint16 max_seq;

    /***********************************************************
    @brief Shifted count of sequence number cycles
    ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public uint32 cycles;

    /***********************************************************
    @brief Base sequence number
    ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public uint32 base_seq;

    /***********************************************************
    @brief Last bad sequence number + 1
    ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public uint32 bad_seq;

    /***********************************************************
    @brief Sequence packets till source is valid
    ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int probation;

    /***********************************************************
    @brief Packets received
    ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public uint32 received;

    /***********************************************************
    @brief Packets expected in last interval
    ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public uint32 expected_prior;

    /***********************************************************
    @brief Packets received in last interval
    ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public uint32 received_prior;

    /***********************************************************
    @brief Relative transit time for previous packet
    ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public uint32 transit;

    /***********************************************************
    @brief Estimated jitter
    ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public uint32 jitter;
}

[Flags]
public enum RTPDecoderFlags {
    /***********************************************************
    @brief RTP packet contains a keyframe
    ***********************************************************/
    RTP_FLAG_KEY,
    /***********************************************************
    @brief RTP marker bit was set for this packet
    ***********************************************************/
    RTP_FLAG_MARKER,
}

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
public delegate int DynamicPayloadPacketHandlerProc (
    AVFormatContext format_context,
    PayloadContext payload_context,
    AVStream st,
    LibAVCodec.Packet packet,
    uint32[] timestamp,
    uint8[] buffer,
    int len,
    uint16 seq,
    int flags
);

[CCode (cname="", cheader_filename="")]
public abstract class RTPDynamicProtocolHandler {
    [CCode (cname="", cheader_filename="")]
    public abstract string enc_name { public get; }

    [CCode (cname="", cheader_filename="")]
    public abstract LibAVUtil.MediaType codec_type { public get; }

    [CCode (cname="", cheader_filename="")]
    public abstract LibAVCodec.CodecID codec_id { public get; }

    [CCode (cname="", cheader_filename="")]
    public abstract AVStreamParseType need_parsing { public get; }

    /***********************************************************
    0 means no payload id is set. 0 is a valid
    payload ID (PCMU), too, but that format doesn't
    require any custom depacketization code.
    ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int static_payload_id;

    [CCode (cname="", cheader_filename="")]
    public abstract size_t priv_data_size { public get; }

    /***********************************************************
    @brief Initialize dynamic protocol handler, called after the full rtpmap line is parsed, may be null
    ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public abstract int init (
        AVFormatContext format_context,
        int st_index,
        PayloadContext priv_data
    );

    /***********************************************************
    @brief Parse the a= line from the sdp field
    ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public abstract int parse_sdp_a_line (
        AVFormatContext format_context,
        int st_index,
        PayloadContext priv_data,
        string line
    );

    /***********************************************************
    @brief Free any data needed by the rtp parsing for this dynamic data.
    Don't free the protocol_data pointer itself, that is freed by the
    caller. This is called even if the init method failed.
    ***********************************************************/
    [CCode (cname="", cheader_filename="")]
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
    [CCode (cname="", cheader_filename="")]
    public abstract int parse_packet (
        AVFormatContext format_context,
        PayloadContext payload_context,
        AVStream st,
        LibAVCodec.Packet packet,
        uint32[] timestamp,
        uint8[] buffer,
        int len,
        uint16 seq,
        int flags
    );

    [CCode (cname="", cheader_filename="")]
    public abstract int need_keyframe (
        PayloadContext context
    );

    [CCode (cname="", cheader_filename="")]
    public RTPDynamicProtocolHandler next;
}

[CCode (cname="struct RTPPacket", cheader_filename="")]
public struct RTPPacket {
    [CCode (cname="", cheader_filename="")]
    public uint16 seq;

    [CCode (cname="", cheader_filename="")]
    public uint8[] buffer;

    [CCode (cname="", cheader_filename="")]
    public int len;

    [CCode (cname="", cheader_filename="")]
    public int64 recvtime;

    [CCode (cname="", cheader_filename="")]
    public RTPPacket *next;
}

[CCode (cname="struct RTPDemuxContext", cheader_filename="")]
public struct RTPDemuxContext {
    [CCode (cname="", cheader_filename="")]
    public AVFormatContext ic;

    [CCode (cname="", cheader_filename="")]
    public AVStream st;

    [CCode (cname="", cheader_filename="")]
    public int payload_type;

    [CCode (cname="", cheader_filename="")]
    public uint32 ssrc;

    [CCode (cname="", cheader_filename="")]
    public uint16 seq;

    [CCode (cname="", cheader_filename="")]
    public uint32 timestamp;

    [CCode (cname="", cheader_filename="")]
    public uint32 base_timestamp;

    [CCode (cname="", cheader_filename="")]
    public int64 unwrapped_timestamp;

    [CCode (cname="", cheader_filename="")]
    public int64 range_start_offset;

    [CCode (cname="", cheader_filename="")]
    public int max_payload_size;

    /***********************************************************
    used to send back RTCP RR
    ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public char hostname[256];

    [CCode (cname="", cheader_filename="")]
    public int srtp_enabled;

    [CCode (cname="", cheader_filename="")]
    public SRTPContext srtp;

    /***********************************************************
    @brief Statistics for this stream (used by RTCP receiver reports)
    ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public RTPStatistics statistics;

    /***********************************************************
    @brief Fields for packet reordering @{
    ***********************************************************/
    /***********************************************************
    @brief The return value of the actual parsing of the previous packet
    ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int prev_ret;

    /***********************************************************
    @brief A sorted queue of buffered packets not yet returned
    ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public RTPPacket[] queue;

    /***********************************************************
    @brief The number of packets in queue
    ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int queue_len;

    /***********************************************************
    @brief The size of queue, or 0 if reordering is disabled
    ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int queue_size;
    /*@}*/

    /***********************************************************
    @brief Rtcp sender statistics receive
    ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public uint64 last_rtcp_ntp_time;

    [CCode (cname="", cheader_filename="")]
    public int64 last_rtcp_reception_time;

    [CCode (cname="", cheader_filename="")]
    public uint64 first_rtcp_ntp_time;

    [CCode (cname="", cheader_filename="")]
    public uint32 last_rtcp_timestamp;

    [CCode (cname="", cheader_filename="")]
    public int64 rtcp_ts_offset;

    /***********************************************************
    @brief Rtcp sender statistics
    ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public uint packet_count;

    [CCode (cname="", cheader_filename="")]
    public uint octet_count;

    [CCode (cname="", cheader_filename="")]
    public uint last_octet_count;

    [CCode (cname="", cheader_filename="")]
    public int64 last_feedback_time;

    /***********************************************************
    @brief Dynamic payload stuff
    ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public RTPDynamicProtocolHandler handler;

    [CCode (cname="", cheader_filename="")]
    public PayloadContext dynamic_protocol_context;

    [CCode (cname="", cheader_filename="")]
    public RTPDemuxContext ff_rtp_parse_open (
        AVFormatContext s1,
        AVStream st,
        int payload_type,
        int queue_size
    );

    [CCode (cname="", cheader_filename="")]
    public void ff_rtp_parse_set_dynamic_protocol (
        RTPDemuxContext rtp_demux_context,
        PayloadContext payload_context,
        RTPDynamicProtocolHandler handler
    );

    [CCode (cname="", cheader_filename="")]
    public void ff_rtp_parse_set_crypto (
        RTPDemuxContext rtp_demux_context,
        string suite,
        string params
    );

    [CCode (cname="", cheader_filename="")]
    public int ff_rtp_parse_packet (
        RTPDemuxContext rtp_demux_context,
        LibAVCodec.Packet packet,
        out uint8[] buffer,
        int len
    );

    [CCode (cname="", cheader_filename="")]
    public void ff_rtp_parse_close (
        RTPDemuxContext rtp_demux_context
    );

    [CCode (cname="", cheader_filename="")]
    public int64 ff_rtp_queued_packet_time (
        RTPDemuxContext rtp_demux_context
    );

    [CCode (cname="", cheader_filename="")]
    public void ff_rtp_reset_packet_queue (
        RTPDemuxContext rtp_demux_context
    );
}

/***********************************************************
@brief Iterate over all registered rtp dynamic protocol handlers.

@param opaque a pointer where libavformat will store the iteration state. Must
              point to NULL to start the iteration.

@return the next registered rtp dynamic protocol handler or NULL when the iteration is
        finished
***********************************************************/
[CCode (cname="", cheader_filename="")]
public RTPDynamicProtocolHandler ff_rtp_handler_iterate (
    out void *opaque
);

/***********************************************************
@brief Find a registered rtp dynamic protocol handler with the specified name.

@param name name of the requested rtp dynamic protocol handler
@return A rtp dynamic protocol handler if one was found, NULL otherwise.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public RTPDynamicProtocolHandler ff_rtp_handler_find_by_name (
    string name,
    LibAVUtil.MediaType codec_type
);

/***********************************************************
@brief Find a registered rtp dynamic protocol handler with a matching codec ID.

@param id LibAVCodec.CodecID of the requested rtp dynamic protocol handler.
@return A rtp dynamic protocol handler if one was found, NULL otherwise.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public RTPDynamicProtocolHandler ff_rtp_handler_find_by_id (
    int id,
    LibAVUtil.MediaType codec_type
);

/***********************************************************
@brief From rtsp.c, but used by rtp dynamic protocol handlers.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ff_rtsp_next_attr_and_value (
    string[] p,
    string attr,
    int attr_size,
    string value,
    int value_size
);

public delegate int ParseFMTPDelegate (
    AVFormatContext format_context,
    AVStream stream,
    PayloadContext data,
    string attr,
    string value
);

[CCode (cname="", cheader_filename="")]
public int ff_parse_fmtp (
    AVFormatContext format_context,
    AVStream stream,
    PayloadContext data,
    string p,
    ParseFMTPDelegate parse_fmtp
);

/***********************************************************
@brief Close the dynamic buffer and make a packet from it.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ff_rtp_finalize_packet (
    LibAVCodec.Packet packet,
    out AVIOContext dyn_buf,
    int stream_idx
);

} // namespace LibAVFormat
