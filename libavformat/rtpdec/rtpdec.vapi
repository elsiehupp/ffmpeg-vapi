/***********************************************************
RTP demuxer definitions
@copyright 2002 Fabrice Bellard
@copyright 2006 Ryan Martell <rdm4@martellventures.com>

This file is part of FFmpeg.

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

public struct PayloadContext { }

public const size_t RTP_MIN_PACKET_LENGTH;
public const size_t RTP_MAX_PACKET_LENGTH;

public const size_t RTP_REORDER_QUEUE_DEFAULT_SIZE;

public const uint32 RTP_NOTS_VALUE;

/***********************************************************
Send a dummy packet on both port pairs to set up the connection
state in potential NAT routers, so that we're able to receive
packets.

Note, this only works if the NAT router doesn't remap ports. This
isn't a standardized procedure, but it works in many cases in practice.

The same routine is used with RDT too, even if RDT doesn't use normal
RTP packets otherwise.
***********************************************************/
public void ff_rtp_send_punch_packets (
    URLContext* rtp_handle
);

/***********************************************************
some rtp servers assume client is dead if they don't hear from them...
so we send a Receiver Report to the provided URLContext or AVIOContext
(we don't have access to the rtcp handle from here)
***********************************************************/
public int ff_rtp_check_and_send_back_rr (
    RTPDemuxContext rtp_demux_context,
    URLContext fd,
    AVIOContext avio,
    int count
);

public int ff_rtp_send_rtcp_feedback (
    RTPDemuxContext rtp_demux_context,
    URLContext fd,
    AVIOContext avio
);

/***********************************************************
Phese statistics are used for rtcp receiver reports...
***********************************************************/
public struct RTPStatistics {
    /***********************************************************
    Highest sequence number seen
    ***********************************************************/
    public uint16 max_seq;
    /***********************************************************
    Shifted count of sequence number cycles
    ***********************************************************/
    public uint32 cycles;
    /***********************************************************
    Base sequence number
    ***********************************************************/
    public uint32 base_seq;
    /***********************************************************
    Last bad sequence number + 1
    ***********************************************************/
    public uint32 bad_seq;
    /***********************************************************
    Sequence packets till source is valid
    ***********************************************************/
    public int probation;
    /***********************************************************
    Packets received
    ***********************************************************/
    public uint32 received;
    /***********************************************************
    Packets expected in last interval
    ***********************************************************/
    public uint32 expected_prior;
    /***********************************************************
    Packets received in last interval
    ***********************************************************/
    public uint32 received_prior;
    /***********************************************************
    Relative transit time for previous packet
    ***********************************************************/
    public uint32 transit;
    /***********************************************************
    Estimated jitter
    ***********************************************************/
    public uint32 jitter;
}

[Flags]
public enum RTPDecoderFlags {
    /***********************************************************
    RTP packet contains a keyframe
    ***********************************************************/
    RTP_FLAG_KEY,
    /***********************************************************
    RTP marker bit was set for this packet
    ***********************************************************/
    RTP_FLAG_MARKER,
}

/***********************************************************
Packet parsing for "private" payloads in the RTP specs.

@param format_context RTSP demuxer context
@param payload_context stream context
@param st stream that this packet belongs to
@param packet packet in which to write the parsed data
@param timestamp pointer to the RTP timestamp of the input data, can be
                 updated by the function if returning older, buffered data
@param buf pointer to raw RTP packet data
@param len length of buf
@param seq RTP sequence number of the packet
@param flags flags from the RTP packet header (RTP_FLAG_*)
***********************************************************/
public delegate int DynamicPayloadPacketHandlerProc (
    AVFormatContext format_context,
    PayloadContext payload_context,
    AVStream st,
    LibAVCodec.Packet packet,
    uint32[] timestamp,
    uint8[] buf,
    int len,
    uint16 seq,
    int flags
);

public abstract class RTPDynamicProtocolHandler {
    public string enc_name;
    public LibAVUtil.MediaType codec_type;
    public LibAVCodec.CodecID codec_id;
    public AVStreamParseType need_parsing;
    public int static_payload_id; /***********************************************************
    0 means no payload id is set. 0 is a valid
    payload ID (PCMU), too, but that format doesn't
    require any custom depacketization code.
    ***********************************************************/
    public int priv_data_size;

    /***********************************************************
    Initialize dynamic protocol handler, called after the full rtpmap line is parsed, may be null
    ***********************************************************/
    public abstract int init (
        AVFormatContext format_context,
        int st_index,
        PayloadContext priv_data
    );
    /***********************************************************
    Parse the a= line from the sdp field
    ***********************************************************/
    public abstract int parse_sdp_a_line (
        AVFormatContext format_context,
        int st_index,
        PayloadContext priv_data,
        string line
    );
    /***********************************************************
    Free any data needed by the rtp parsing for this dynamic data.
    Don't free the protocol_data pointer itself, that is freed by the
    caller. This is called even if the init method failed.
    ***********************************************************/
    public abstract void close (
        PayloadContext protocol_data
    );
    /***********************************************************
    Parse handler for this dynamic packet
    ***********************************************************/
    public DynamicPayloadPacketHandlerProc parse_packet;
    public abstract int need_keyframe (
        PayloadContext context
    );

    public RTPDynamicProtocolHandler next;
}

public struct RTPPacket {
    public uint16 seq;
    public uint8[] buf;
    public int len;
    public int64 recvtime;
    public RTPPacket *next;
}

public struct RTPDemuxContext {
    public AVFormatContext ic;
    public AVStream st;
    public int payload_type;
    public uint32 ssrc;
    public uint16 seq;
    public uint32 timestamp;
    public uint32 base_timestamp;
    public int64 unwrapped_timestamp;
    public int64 range_start_offset;
    public int max_payload_size;
    /***********************************************************
    used to send back RTCP RR
    ***********************************************************/
    public char hostname[256];

    public int srtp_enabled;
    public SRTPContext srtp;

    /***********************************************************
    Statistics for this stream (used by RTCP receiver reports)
    ***********************************************************/
    public RTPStatistics statistics;

    /***********************************************************
    Fields for packet reordering @{
    ***********************************************************/
    /***********************************************************
    The return value of the actual parsing of the previous packet
    ***********************************************************/
    public int prev_ret;
    /***********************************************************
    A sorted queue of buffered packets not yet returned
    ***********************************************************/
    public RTPPacket[] queue;
    /***********************************************************
    The number of packets in queue
    ***********************************************************/
    public int queue_len;
    /***********************************************************
    The size of queue, or 0 if reordering is disabled
    ***********************************************************/
    public int queue_size;
    /*@}*/

    /***********************************************************
    rtcp sender statistics receive
    ***********************************************************/
    public uint64 last_rtcp_ntp_time;
    public int64 last_rtcp_reception_time;
    public uint64 first_rtcp_ntp_time;
    public uint32 last_rtcp_timestamp;
    public int64 rtcp_ts_offset;

    /***********************************************************
    rtcp sender statistics
    ***********************************************************/
    public uint packet_count;
    public uint octet_count;
    public uint last_octet_count;
    public int64 last_feedback_time;

    /***********************************************************
    dynamic payload stuff
    ***********************************************************/
    public RTPDynamicProtocolHandler handler;
    public PayloadContext dynamic_protocol_context;

    public RTPDemuxContext ff_rtp_parse_open (
        AVFormatContext s1,
        AVStream st,
        int payload_type,
        int queue_size
    );
    public void ff_rtp_parse_set_dynamic_protocol (
        RTPDemuxContext rtp_demux_context,
        PayloadContext payload_context,
        RTPDynamicProtocolHandler handler
    );
    public void ff_rtp_parse_set_crypto (
        RTPDemuxContext rtp_demux_context,
        string suite,
        string params
    );
    public int ff_rtp_parse_packet (
        RTPDemuxContext rtp_demux_context,
        LibAVCodec.Packet packet,
        out uint8[] buf,
        int len
    );
    public void ff_rtp_parse_close (
        RTPDemuxContext rtp_demux_context
    );
    public int64 ff_rtp_queued_packet_time (
        RTPDemuxContext rtp_demux_context
    );
    public void ff_rtp_reset_packet_queue (
        RTPDemuxContext rtp_demux_context
    );
}

/***********************************************************
Iterate over all registered rtp dynamic protocol handlers.

@param opaque a pointer where libavformat will store the iteration state. Must
              point to NULL to start the iteration.

@return the next registered rtp dynamic protocol handler or NULL when the iteration is
        finished
***********************************************************/
public RTPDynamicProtocolHandler ff_rtp_handler_iterate (
    out void *opaque
);

/***********************************************************
Find a registered rtp dynamic protocol handler with the specified name.

@param name name of the requested rtp dynamic protocol handler
@return A rtp dynamic protocol handler if one was found, NULL otherwise.
***********************************************************/
public RTPDynamicProtocolHandler ff_rtp_handler_find_by_name (
    string name,
    LibAVUtil.MediaType codec_type
);

/***********************************************************
Find a registered rtp dynamic protocol handler with a matching codec ID.

@param id LibAVCodec.CodecID of the requested rtp dynamic protocol handler.
@return A rtp dynamic protocol handler if one was found, NULL otherwise.
***********************************************************/
public RTPDynamicProtocolHandler ff_rtp_handler_find_by_id (
    int id,
    LibAVUtil.MediaType codec_type
);

/***********************************************************
from rtsp.c, but used by rtp dynamic protocol handlers.
***********************************************************/
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

public int ff_parse_fmtp (
    AVFormatContext format_context,
    AVStream stream,
    PayloadContext data,
    string p,
    ParseFMTPDelegate parse_fmtp
);

/***********************************************************
Close the dynamic buffer and make a packet from it.
***********************************************************/
public int ff_rtp_finalize_packet (
    LibAVCodec.Packet packet,
    out AVIOContext dyn_buf,
    int stream_idx
);

} // namespace LibAVFormat
