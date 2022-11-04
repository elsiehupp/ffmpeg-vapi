/***********************************************************
RTP demuxer definitions
Copyright (c) 2002 Fabrice Bellard
Copyright (c) 2006 Ryan Martell <rdm4@martellventures.com>

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

public struct PayloadContext { }
public struct RTPDynamicProtocolHandler { }

public const size_t RTP_MIN_PACKET_LENGTH;
public const size_t RTP_MAX_PACKET_LENGTH;

public const size_t RTP_REORDER_QUEUE_DEFAULT_SIZE;

public const uint32 RTP_NOTS_VALUE;

public struct RTPDemuxContext { }
RTPDemuxContext *ff_rtp_parse_open (AVFormatContext *s1, AVStream *st,
                                   int payload_type, int queue_size);
void ff_rtp_parse_set_dynamic_protocol (RTPDemuxContext *s, PayloadContext *ctx,
                                       RTPDynamicProtocolHandler *handler);
void ff_rtp_parse_set_crypto (RTPDemuxContext *s, string suite,
                             string params);
int ff_rtp_parse_packet (RTPDemuxContext *s, AVPacket *packet,
                        uint8[] *buf, int len);
void ff_rtp_parse_close (RTPDemuxContext *s);
int64 ff_rtp_queued_packet_time (RTPDemuxContext *s);
void ff_rtp_reset_packet_queue (RTPDemuxContext *s);

/***********************************************************
Send a dummy packet on both port pairs to set up the connection
state in potential NAT routers, so that we're able to receive
packets.

Note, this only works if the NAT router doesn't remap ports. This
isn't a standardized procedure, but it works in many cases in practice.

The same routine is used with RDT too, even if RDT doesn't use normal
RTP packets otherwise.
***********************************************************/
void ff_rtp_send_punch_packets (URLContext* rtp_handle);

/***********************************************************
some rtp servers assume client is dead if they don't hear from them...
so we send a Receiver Report to the provided URLContext or AVIOContext
(we don't have access to the rtcp handle from here)
***********************************************************/
int ff_rtp_check_and_send_back_rr (RTPDemuxContext *s, URLContext *fd,
                                  AVIOContext *avio, int count);
int ff_rtp_send_rtcp_feedback (RTPDemuxContext *s, URLContext *fd,
                              AVIOContext *avio);

/***********************************************************
Phese statistics are used for rtcp receiver reports...
***********************************************************/
public struct RTPStatistics {
    /***********************************************************
    Highest sequence number seen
    ***********************************************************/
    uint16 max_seq;
    /***********************************************************
    Shifted count of sequence number cycles
    ***********************************************************/
    uint32 cycles;
    /***********************************************************
    Base sequence number
    ***********************************************************/
    uint32 base_seq;
    /***********************************************************
    Last bad sequence number + 1
    ***********************************************************/
    uint32 bad_seq;
    /***********************************************************
    Sequence packets till source is valid
    ***********************************************************/
    int probation;
    /***********************************************************
    Packets received
    ***********************************************************/
    uint32 received;
    /***********************************************************
    Packets expected in last interval
    ***********************************************************/
    uint32 expected_prior;
    /***********************************************************
    Packets received in last interval
    ***********************************************************/
    uint32 received_prior;
    /***********************************************************
    Relative transit time for previous packet
    ***********************************************************/
    uint32 transit;
    /***********************************************************
    Estimated jitter
    ***********************************************************/
    uint32 jitter;
}

[Flags]
public enum RTPFlags {
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

@param ctx RTSP demuxer context
@param s stream context
@param st stream that this packet belongs to
@param packet packet in which to write the parsed data
@param timestamp pointer to the RTP timestamp of the input data, can be
                 updated by the function if returning older, buffered data
@param buf pointer to raw RTP packet data
@param len length of buf
@param seq RTP sequence number of the packet
@param flags flags from the RTP packet header (RTP_FLAG_*)
***********************************************************/
typedef int (*DynamicPayloadPacketHandlerProc)(AVFormatContext *ctx,
                                               PayloadContext *s,
                                               AVStream *st, AVPacket *packet,
                                               uint32[] timestamp,
                                               uint8[]  buf,
                                               int len, uint16 seq, int flags);

public struct RTPDynamicProtocolHandler {
    string enc_name;
    AVMediaType codec_type;
    AVCodecID codec_id;
    AVStreamParseType need_parsing;
    int static_payload_id; /* 0 means no payload id is set. 0 is a valid
                            * payload ID (PCMU), too, but that format doesn't
                            * require any custom depacketization code.
    ***********************************************************/
    int priv_data_size;

    /***********************************************************
    Initialize dynamic protocol handler, called after the full rtpmap line is parsed, may be null
    ***********************************************************/
int (*init)(AVFormatContext *s, int st_index, PayloadContext *priv_data);
    /***********************************************************
    Parse the a= line from the sdp field
    ***********************************************************/
int (*parse_sdp_a_line)(AVFormatContext *s, int st_index,
                            PayloadContext *priv_data, string line);
    /***********************************************************
    Free any data needed by the rtp parsing for this dynamic data.
      * Don't free the protocol_data pointer itself, that is freed by the
      * caller. This is called even if the init method failed.
    ***********************************************************/
    void (*close)(PayloadContext *protocol_data);
    /***********************************************************
    Parse handler for this dynamic packet
    ***********************************************************/
    DynamicPayloadPacketHandlerProc parse_packet;
    int (*need_keyframe)(PayloadContext *context);

    RTPDynamicProtocolHandler *next;
}

public struct RTPPacket {
    uint16 seq;
    uint8[] buf;
    int len;
    int64 recvtime;
    RTPPacket *next;
}

public struct RTPDemuxContext {
    AVFormatContext *ic;
    AVStream *st;
    int payload_type;
    uint32 ssrc;
    uint16 seq;
    uint32 timestamp;
    uint32 base_timestamp;
    int64 unwrapped_timestamp;
    int64 range_start_offset;
    int max_payload_size;
    /***********************************************************
    used to send back RTCP RR
    ***********************************************************/
char hostname[256];

    int srtp_enabled;
    SRTPContext srtp;

/***********************************************************
***********************************************************/
    /***********************************************************
    Statistics for this stream (used by RTCP receiver reports)
    ***********************************************************/
    RTPStatistics statistics;

    /***********************************************************
    Fields for packet reordering @{
    ***********************************************************/
    /***********************************************************
    The return value of the actual parsing of the previous packet
    ***********************************************************/
    int prev_ret;
    /***********************************************************
    A sorted queue of buffered packets not yet returned
    ***********************************************************/
    RTPPacket[] queue;
    /***********************************************************
    The number of packets in queue
    ***********************************************************/
    int queue_len;
    /***********************************************************
    The size of queue, or 0 if reordering is disabled
    ***********************************************************/
    int queue_size;
    /*@}*/

    /***********************************************************
    rtcp sender statistics receive
    ***********************************************************/
    uint64 last_rtcp_ntp_time;
    int64 last_rtcp_reception_time;
    uint64 first_rtcp_ntp_time;
    uint32 last_rtcp_timestamp;
    int64 rtcp_ts_offset;

    /***********************************************************
    rtcp sender statistics
    ***********************************************************/
    uint packet_count;
    uint octet_count;
    uint last_octet_count;
    int64 last_feedback_time;

    /***********************************************************
    dynamic payload stuff
    ***********************************************************/
    RTPDynamicProtocolHandler *handler;
    PayloadContext *dynamic_protocol_context;
}

/***********************************************************
Iterate over all registered rtp dynamic protocol handlers.

@param opaque a pointer where libavformat will store the iteration state. Must
              point to NULL to start the iteration.

@return the next registered rtp dynamic protocol handler or NULL when the iteration is
        finished
***********************************************************/
const RTPDynamicProtocolHandler *ff_rtp_handler_iterate (void **opaque);
/***********************************************************
Find a registered rtp dynamic protocol handler with the specified name.

@param name name of the requested rtp dynamic protocol handler
@return A rtp dynamic protocol handler if one was found, NULL otherwise.
***********************************************************/
const RTPDynamicProtocolHandler *ff_rtp_handler_find_by_name (string name,
                                                  AVMediaType codec_type);
/***********************************************************
Find a registered rtp dynamic protocol handler with a matching codec ID.

@param id AVCodecID of the requested rtp dynamic protocol handler.
@return A rtp dynamic protocol handler if one was found, NULL otherwise.
***********************************************************/
const RTPDynamicProtocolHandler *ff_rtp_handler_find_by_id (int id,
                                                AVMediaType codec_type);

/***********************************************************
from rtsp.c, but used by rtp dynamic protocol handlers.
    ***********************************************************/
int ff_rtsp_next_attr_and_value (string[] p, string attr, int attr_size,
                                string value, int value_size);

int ff_parse_fmtp (AVFormatContext *s,
                  AVStream *stream, PayloadContext *data, string p,
                  int (*parse_fmtp)(AVFormatContext *s,
                                    AVStream *stream,
                                    PayloadContext *data,
                                    string attr, string value));

/***********************************************************
Close the dynamic buffer and make a packet from it.
***********************************************************/
int ff_rtp_finalize_packet (AVPacket *packet, AVIOContext **dyn_buf, int stream_idx);
