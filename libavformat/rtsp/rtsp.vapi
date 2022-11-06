/***********************************************************
RTSP definitions
@copyright 2002 Fabrice Bellard

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

/***********************************************************
Network layer over which RTP/etc packet data will be transported.
***********************************************************/
public enum RTSPLowerTransport {
    /***********************************************************
    UDP/unicast
    ***********************************************************/
    RTSP_LOWER_TRANSPORT_UDP,
    /***********************************************************
    TCP; interleaved in RTSP
    ***********************************************************/
    RTSP_LOWER_TRANSPORT_TCP,
    /***********************************************************
    UDP/multicast
    ***********************************************************/
    RTSP_LOWER_TRANSPORT_UDP_MULTICAST,
    RTSP_LOWER_TRANSPORT_NB,
    /***********************************************************
    HTTP tunneled - not a proper
    transport mode as such,
    only for use via AVOptions
    ***********************************************************/
    RTSP_LOWER_TRANSPORT_HTTP,
    /***********************************************************
    HTTPS tunneled
    ***********************************************************/
    RTSP_LOWER_TRANSPORT_HTTPS,
    /***********************************************************
    Custom IO - not a public
    option for lower_transport_mask,
    but set in the SDP demuxer based
    on a flag.
    ***********************************************************/
    RTSP_LOWER_TRANSPORT_CUSTOM,
}

/***********************************************************
Packet profile of the data that we will be receiving. Real servers
commonly send RDT (although they can sometimes send RTP as well),
whereas most others will send RTP.
***********************************************************/
public enum RTSPTransport {
    /***********************************************************
    Standards-compliant RTP
    ***********************************************************/
    RTSP_TRANSPORT_RTP,
    /***********************************************************
    Realmedia Data Transport
    ***********************************************************/
    RTSP_TRANSPORT_RDT,
    /***********************************************************
    Raw data (over UDP)
    ***********************************************************/
    RTSP_TRANSPORT_RAW,
    RTSP_TRANSPORT_NB
}

/***********************************************************
Transport mode for the RTSP data. This may be plain, or
tunneled, which is done over HTTP.
***********************************************************/
public enum RTSPControlTransport {
    /***********************************************************
    Normal RTSP
    ***********************************************************/
    RTSP_MODE_PLAIN,
    /***********************************************************
    RTSP over HTTP (tunneling)
    ***********************************************************/
    RTSP_MODE_TUNNEL
}

public const int RTSP_DEFAULT_PORT; // 554
public const int RTSPS_DEFAULT_PORT; // 322
public const int RTSP_MAX_TRANSPORTS; // 8
public const size_t RTSP_TCP_MAX_PACKET_SIZE; // 1472
public const int RTSP_DEFAULT_NB_AUDIO_CHANNELS; // 1
public const int RTSP_DEFAULT_AUDIO_SAMPLERATE; // 44100
public const int RTSP_RTP_PORT_MIN; // 5000
public const int RTSP_RTP_PORT_MAX; // 65000

/***********************************************************
This describes a single item in the "Transport:" line of one stream as
negotiated by the SETUP RTSP command. Multiple transports are comma-
separated ("Transport: x-read-rdt/tcp;interleaved=0-1,rtp/avp/udp;
client_port=1000-1001;server_port=1800-1801") and described in separate
RTSPTransportFields.
***********************************************************/
public struct RTSPTransportField {
    /***********************************************************
    interleave ids, if TCP transport; each TCP/RTSP data packet starts
    with a '$', stream length and stream ID. If the stream ID is within
    the range of this interleaved_min-max, then the packet belongs to
    this stream.
    ***********************************************************/
    public int interleaved_min;
    public int interleaved_max;

    /***********************************************************
    UDP multicast port range; the ports to which we should connect to
    receive multicast UDP data.
    ***********************************************************/
    public int port_min;
    public int port_max;

    /***********************************************************
    UDP client ports; these should be the local ports of the UDP RTP
    (and RTCP) sockets over which we receive RTP/RTCP data.
    ***********************************************************/
    public int client_port_min;
    public int client_port_max;

    /***********************************************************
    UDP unicast server port range; the ports to which we should connect
    to receive unicast UDP RTP/RTCP data.
    ***********************************************************/
    public int server_port_min;
    public int server_port_max;

    /***********************************************************
    time-to-live value (required for multicast); the amount of HOPs that
    packets will be allowed to make before being discarded.
    ***********************************************************/
    public int ttl;

    /***********************************************************
    transport set to record data
    ***********************************************************/
    public int mode_record;

    /***********************************************************
    destination IP address
    ***********************************************************/
    public sockaddr_storage destination;
    /***********************************************************
    source IP address
    ***********************************************************/
    public char source[INET6_ADDRSTRLEN + 1];

    /***********************************************************
    data/packet transport protocol; e.g. RTP or RDT
    ***********************************************************/
    public RTSPTransport transport;

    /***********************************************************
    network layer transport protocol; e.g. TCP or UDP uni-/multicast
    ***********************************************************/
    public RTSPLowerTransport lower_transport;
}

/***********************************************************
This describes the server response to each RTSP command.
***********************************************************/
public struct RTSPMessageHeader {
    /***********************************************************
    length of the data following this header
    ***********************************************************/
    public int content_length;

    /***********************************************************
    response code from server
    ***********************************************************/
    public RTSPStatusCode status_code;

    /***********************************************************
    number of items in the 'transports' variable below
    ***********************************************************/
    public int nb_transports;

    /***********************************************************
    Time range of the streams that the server will stream. In
    AV_TIME_BASE unit, AV_NOPTS_VALUE if not used
    ***********************************************************/
    public int64 range_start;
    public int64 range_end;

    /***********************************************************
    describes the complete "Transport:" line of the server in response
    to a SETUP RTSP command by the client
    ***********************************************************/
    public RTSPTransportField transports[RTSP_MAX_TRANSPORTS];

    /***********************************************************
    sequence number
    ***********************************************************/
    public int seq;

    /***********************************************************
    the "Session:" field. This value is initially set by the server and
    should be re-transmitted by the client in every RTSP command.
    ***********************************************************/
    public char session_id[512];

    /***********************************************************
    the "Location:" field. This value is used to handle redirection.
    ***********************************************************/
    public char location[4096];

    /***********************************************************
    the "RealChallenge1:" field from the server
    ***********************************************************/
    public char real_challenge[64];

    /***********************************************************
    the "Server: field, which can be used to identify some special-case
    servers that are not 100% standards-compliant. We use this to identify
    Windows Media Server, which has a value "WMServer/v.e.r.sion", where
    version is a sequence of digits (e.g. 9.0.0.3372). Helix/Real servers
    use something like "Helix [..] Server Version v.e.r.sion (platform)
    (RealServer compatible)" or "RealServer Version v.e.r.sion (platform)",
    where platform is the output of $uname -msr | sed 's/ /-/g'.
    ***********************************************************/
    public char server[64];

    /***********************************************************
    The "timeout" comes as part of the server response to the "SETUP"
    command, in the "Session: <xyz>[;timeout=<value>]" line. It is the
    time, in seconds, that the server will go without traffic over the
    RTSP/TCP connection before it closes the connection. To prevent
    this, sent dummy requests (e.g. OPTIONS) with intervals smaller
    than this value.
    ***********************************************************/
    public int timeout;

    /***********************************************************
    The "Notice" or "X-Notice" field value. See
    http://tools.ietf.org/html/draft-stiemerling-rtsp-announce-00
    for a complete list of supported values.
    ***********************************************************/
    public int notice;

    /***********************************************************
    The "reason" is meant to specify better the meaning of the error code
    returned
    ***********************************************************/
    public char reason[256];

    /***********************************************************
    Content type header
    ***********************************************************/
    public char content_type[64];
}

/***********************************************************
Client state, i.e. whether we are currently receiving data (PLAYING) or
setup-but-not-receiving (PAUSED). State can be changed in applications
by calling av_read_play/pause ().
***********************************************************/
public enum RTSPClientState {
    /***********************************************************
    not initialized
    ***********************************************************/
    RTSP_STATE_IDLE,
    /***********************************************************
    initialized and sending/receiving data
    ***********************************************************/
    RTSP_STATE_STREAMING,
    /***********************************************************
    initialized, but not receiving data
    ***********************************************************/
    RTSP_STATE_PAUSED,
    /***********************************************************
    initialized, requesting a seek
    ***********************************************************/
    RTSP_STATE_SEEKING,
}

/***********************************************************
Identify particular servers that require special handling, such as
standards-incompliant "Transport:" lines in the SETUP request.
***********************************************************/
public enum RTSPServerType {
    /***********************************************************
    Standards-compliant RTP-server
    ***********************************************************/
    RTSP_SERVER_RTP,
    /***********************************************************
    Realmedia-style server
    ***********************************************************/
    RTSP_SERVER_REAL,
    /***********************************************************
    Windows Media server
    ***********************************************************/
    RTSP_SERVER_WMS,
    RTSP_SERVER_NB
}

/***********************************************************
Private data for the RTSP demuxer.

@todo Use AVIOContext instead of URLContext
***********************************************************/
public struct RTSPState {
    /***********************************************************
    Class for private options.
    ***********************************************************/
    public LibAVUtil.Class class;
    /***********************************************************
    RTSP TCP connection handle
    ***********************************************************/
    public URLContext rtsp_hd;

    /***********************************************************
    streams in this session
    ***********************************************************/
    public RTSPStream[] rtsp_streams;

    /***********************************************************
    number of items in the 'rtsp_streams' variable
    ***********************************************************/
    public int nb_rtsp_streams;

    /***********************************************************
    indicator of whether we are currently receiving data from the
    server. Basically this isn't more than a simple cache of the
    last PLAY/PAUSE command sent to the server, to make sure we don't
    send 2x the same unexpectedly or commands in the wrong state.
    ***********************************************************/
    public RTSPClientState state;

    /***********************************************************
    the seek value requested when calling av_seek_frame (). This value
    is subsequently used as part of the "Range" parameter when emitting
    the RTSP PLAY command. If we are currently playing, this command is
    called instantly. If we are currently paused, this command is called
    whenever we resume playback. Either way, the value is only used once,
    see rtsp_read_play () and rtsp_read_seek ().
    ***********************************************************/
    public int64 seek_timestamp;

    /***********************************************************
    RTSP command sequence number
    ***********************************************************/
    public int seq;

    /***********************************************************
    copy of RTSPMessageHeader.session_id, i.e. the server-provided session
    identifier that the client should re-transmit in each RTSP command
    ***********************************************************/
    public char session_id[512];

    /***********************************************************
    copy of RTSPMessageHeader.timeout, i.e. the time (in seconds) that
    the server will go without traffic on the RTSP/TCP line before it
    closes the connection.
    ***********************************************************/
    public int timeout;

    /***********************************************************
    timestamp of the last RTSP command that we sent to the RTSP server.
    This is used to calculate when to send dummy commands to keep the
    connection alive, in conjunction with timeout.
    ***********************************************************/
    public int64 last_cmd_time;

    /***********************************************************
    the negotiated data/packet transport protocol; e.g. RTP or RDT
    ***********************************************************/
    public RTSPTransport transport;

    /***********************************************************
    the negotiated network layer transport protocol; e.g. TCP or UDP
    uni-/multicast
    ***********************************************************/
    public RTSPLowerTransport lower_transport;

    /***********************************************************
    brand of server that we're talking to; e.g. WMS, REAL or other.
    Detected based on the value of RTSPMessageHeader.server or the presence
    of RTSPMessageHeader.real_challenge
    ***********************************************************/
    public RTSPServerType server_type;

    /***********************************************************
    the "RealChallenge1:" field from the server
    ***********************************************************/
    public char real_challenge[64];

    /***********************************************************
    plaintext authorization line (username:password)
    ***********************************************************/
    public char auth[128];

    /***********************************************************
    authentication state
    ***********************************************************/
    public HTTPAuthState auth_state;

    /***********************************************************
    The last reply of the server to a RTSP command
    XXX: allocate ?
    ***********************************************************/
    public char last_reply[2048];

    /***********************************************************
    RTSPStream.transport_priv of the last stream that we read a
    packet from
    ***********************************************************/
    public void *cur_transport_priv;

    /***********************************************************
    The following are used for Real stream selection
    ***********************************************************/
    //@{
    /***********************************************************
    whether we need to send a "SET_PARAMETER Subscribe:" command
    ***********************************************************/
    public int need_subscription;

    /***********************************************************
    stream setup during the last frame read. This is used to detect if
    we need to subscribe or unsubscribe to any new streams.
    ***********************************************************/
    public LibAVCodec.Discard *real_setup_cache;

    /***********************************************************
    current stream setup. This is a temporary buffer used to compare
    current setup to previous frame setup.
    ***********************************************************/
    public LibAVCodec.Discard *real_setup;

    /***********************************************************
    the last value of the "SET_PARAMETER Subscribe:" RTSP command.
    this is used to send the same "Unsubscribe:" if stream setup changed,
    before sending a new "Subscribe:" command.
    ***********************************************************/
    public char last_subscription[1024];
    //@}

    /***********************************************************
    The following are used for RTP/ASF streams
    ***********************************************************/
    //@{
    /***********************************************************
    ASF demuxer context for the embedded ASF stream from WMS servers
    ***********************************************************/
    public AVFormatContext asf_ctx;

    /***********************************************************
    cache for position of the asf demuxer, since we load a new
    data packet in the bytecontext for each incoming RTSP packet.
    ***********************************************************/
    public uint64 asf_pb_pos;
    //@}

    /***********************************************************
    some MS RTSP streams contain a URL in the SDP that we need to use
    for all subsequent RTSP requests, rather than the input URI; in
    other cases, this is a copy of AVFormatContext.filename.
    ***********************************************************/
    public char control_uri[1024];

    /***********************************************************
    The following are used for parsing raw mpegts in udp
    ***********************************************************/
    //@{
    public MpegTSContext ts;
    public int recvbuf_pos;
    public int recvbuf_len;
    //@}

    /***********************************************************
    Additional output handle, used when input and output are done
    separately, eg for HTTP tunneling.
    ***********************************************************/
    public URLContext rtsp_hd_out;

    /***********************************************************
    RTSP transport mode, such as plain or tunneled.
    ***********************************************************/
    public RTSPControlTransport control_transport;

    /***********************************************************
    Number of RTCP BYE packets the RTSP session has received.
    An EOF is propagated back if nb_byes == nb_streams.
    This is reset after a seek.
    ***********************************************************/
    public int nb_byes;

    /***********************************************************
    Reusable buffer for receiving packets
    ***********************************************************/
    public uint8[] recvbuf;

    /***********************************************************
    A mask with all requested transport methods
    ***********************************************************/
    public int lower_transport_mask;

    /***********************************************************
    The number of returned packets
    ***********************************************************/
    public uint64 packets;

    /***********************************************************
    Polling array for udp
    ***********************************************************/
    public GLib.PollFD p;
    public int max_p;

    /***********************************************************
    Whether the server supports the GET_PARAMETER method.
    ***********************************************************/
    public int get_parameter_supported;

    /***********************************************************
    Do not begin to play the stream immediately.
    ***********************************************************/
    public int initial_pause;

    /***********************************************************
    Option flags for the chained RTP muxer.
    ***********************************************************/
    public int rtp_muxer_flags;

    /***********************************************************
    Whether the server accepts the x-Dynamic-Rate header
    ***********************************************************/
    public int accept_dynamic_rate;

    /***********************************************************
    Various option flags for the RTSP muxer/demuxer.
    ***********************************************************/
    public int rtsp_flags;

    /***********************************************************
    Mask of all requested media types
    ***********************************************************/
    public int media_type_mask;

    /***********************************************************
    Minimum and maximum local UDP ports.
    ***********************************************************/
    public int rtp_port_min;
    public int rtp_port_max;

    /***********************************************************
    Timeout to wait for incoming connections.
    ***********************************************************/
    public int initial_timeout;

    /***********************************************************
    timeout of socket i/o operations.
    ***********************************************************/
    public int stimeout;

    /***********************************************************
    Size of RTP packet reordering queue.
    ***********************************************************/
    public int reordering_queue_size;

    /***********************************************************
    User-Agent string
    ***********************************************************/
    public string user_agent;

    public char default_lang[4];
    public int buffer_size;
    public int pkt_size;
}

[Flags]
public enum RTSPFlags {
    /***********************************************************
    Filter incoming UDP packets - receive packets only from the
    right source address and port.
    ***********************************************************/
    RTSP_FLAG_FILTER_SRC,
    /***********************************************************
    Wait for incoming connections.
    ***********************************************************/
    RTSP_FLAG_LISTEN,
    /***********************************************************
    Do all IO via the AVIOContext.
    ***********************************************************/
    RTSP_FLAG_CUSTOM_IO,
    /***********************************************************
    Send RTCP packets to the source address of received packets.
    ***********************************************************/
    RTSP_FLAG_RTCP_TO_SOURCE,
    /***********************************************************
    Try RTP via TCP first if possible.
    ***********************************************************/
    RTSP_FLAG_PREFER_TCP,
}

public struct RTSPSource {
    /***********************************************************
    Source-specific multicast include source IP address (from SDP content)
    ***********************************************************/
    public char addr[128];
}

/***********************************************************
Describe a single stream, as identified by a single m= line block in the
SDP content. In the case of RDT, one RTSPStream can represent multiple
AVStreams. In this case, each AVStream in this set has similar content
(but different codec/bitrate).
***********************************************************/
public struct RTSPStream {
    /***********************************************************
    RTP stream handle (if UDP)
    ***********************************************************/
    public URLContext rtp_handle;
    /***********************************************************
    RTP/RDT parse context if input, RTP AVFormatContext if output
    ***********************************************************/
    public void *transport_priv;

    /***********************************************************
    corresponding stream index, if any. -1 if none (MPEG2TS case)
    ***********************************************************/
    public int stream_index;

    /***********************************************************
    interleave IDs; copies of RTSPTransportField.interleaved_min/max
    for the selected transport. Only used for TCP.
    ***********************************************************/
    public int interleaved_min;
    public int interleaved_max;

    /***********************************************************
    url for this stream (from SDP)
    ***********************************************************/
    public char control_url[1024];

    /***********************************************************
    The following are used only in SDP, not RTSP
    ***********************************************************/
//@{
    /***********************************************************
    port (from SDP content)
    ***********************************************************/
    public int sdp_port;
    /***********************************************************
    IP address (from SDP content)
    ***********************************************************/
    public sockaddr_storage sdp_ip;
    /***********************************************************
    Source-specific multicast include source IP addresses (from SDP content)
    ***********************************************************/
    public RTSPSource[] include_source_addrs;
    /***********************************************************
    Number of source-specific multicast include source IP addresses (from SDP content)
    ***********************************************************/
    public int nb_include_source_addrs;
    /***********************************************************
    Source-specific multicast exclude source IP addresses (from SDP content)
    ***********************************************************/
    public RTSPSource[] exclude_source_addrs;
    /***********************************************************
    Number of source-specific multicast exclude source IP addresses (from SDP content)
    ***********************************************************/
    public int nb_exclude_source_addrs;
    /***********************************************************
    IP Time-To-Live (from SDP content)
    ***********************************************************/
    public int sdp_ttl;
    /***********************************************************
    payload type
    ***********************************************************/
    public int sdp_payload_type;
//@}

    /***********************************************************
    The following are used for dynamic protocols (rtpdec_*.c/rdt.c)
    ***********************************************************/
    //@{
    /***********************************************************
    handler structure
    ***********************************************************/
    public RTPDynamicProtocolHandler dynamic_handler;

    /***********************************************************
    private data associated with the dynamic protocol
    ***********************************************************/
    public PayloadContext dynamic_protocol_context;
//@}

    /***********************************************************
    Enable sending RTCP feedback messages according to RFC 4585
    ***********************************************************/
    public int feedback;

    /***********************************************************
    SSRC for this stream, to allow identifying RTCP packets before the first RTP packet
    ***********************************************************/
    public uint32 ssrc;

    public char crypto_suite[40];
    public char crypto_params[100];
}

public void ff_rtsp_parse_line (
    AVFormatContext format_context,
    RTSPMessageHeader reply,
    string buf,
    RTSPState rt,
    string method
);

/***********************************************************
Send a command to the RTSP server without waiting for the reply.

@see rtsp_send_cmd_with_content_async
***********************************************************/
public int ff_rtsp_send_cmd_async (
    AVFormatContext format_context,
    string method,
    string url,
    string headers
);

/***********************************************************
Send a command to the RTSP server and wait for the reply.

@param format_context RTSP (de)muxer context
@param method the method for the request
@param url the target url for the request
@param headers extra header lines to include in the request
@param reply pointer where the RTSP message header will be stored
@param content_ptr pointer where the RTSP message body, if any, will
                   be stored (length is in reply)
@param send_content if non-null, the data to send as request body content
@param send_content_length the length of the send_content data, or 0 if
                           send_content is null

@return zero if success, nonzero otherwise
***********************************************************/
public int ff_rtsp_send_cmd_with_content (
    AVFormatContext format_context,
    string method,
    string url,
    string headers,
    RTSPMessageHeader reply,
    out uchar[] content_ptr,
    uchar[] send_content,
    int send_content_length
);

/***********************************************************
Send a command to the RTSP server and wait for the reply.

@see rtsp_send_cmd_with_content
***********************************************************/
public int ff_rtsp_send_cmd (
    AVFormatContext format_context,
    string method,
    string url,
    string headers,
    RTSPMessageHeader reply,
    out uchar[] content_ptr
);

/***********************************************************
Read a RTSP message from the server, or prepare to read data
packets if we're reading data interleaved over the TCP/RTSP
connection as well.

@param format_context RTSP (de)muxer context
@param reply pointer where the RTSP message header will be stored
@param content_ptr pointer where the RTSP message body, if any, will
                   be stored (length is in reply)
@param return_on_interleaved_data whether the function may return if we
                  encounter a data marker ('$'), which precedes data
                  packets over interleaved TCP/RTSP connections. If this
                  is set, this function will return 1 after encountering
                  a '$'. If it is not set, the function will skip any
                  data packets (if they are encountered), until a reply
                  has been fully parsed. If no more data is available
                  without parsing a reply, it will return an error.
@param method the RTSP method this is a reply to. This affects how
              some response headers are acted upon. May be NULL.

@return 1 if a data packets is ready to be received, -1 on error,
         and 0 on success.
***********************************************************/
public int ff_rtsp_read_reply (
    AVFormatContext format_context,
    RTSPMessageHeader reply,
    out uchar[] content_ptr,
    int return_on_interleaved_data,
    string method
);

/***********************************************************
Skip a RTP/TCP interleaved packet.
***********************************************************/
public void ff_rtsp_skip_packet (
    AVFormatContext format_context
);

/***********************************************************
Connect to the RTSP server and set up the individual media streams.
This can be used for both muxers and demuxers.

@param format_context RTSP (de)muxer context

@return 0 on success, < 0 on error. Cleans up all allocations done
         within the function on error.
***********************************************************/
public int ff_rtsp_connect (
    AVFormatContext format_context
);

/***********************************************************
Close and free all streams within the RTSP (de)muxer

@param format_context RTSP (de)muxer context
***********************************************************/
public void ff_rtsp_close_streams (
    AVFormatContext format_context
);

/***********************************************************
Close all connection handles within the RTSP (de)muxer

@param format_context RTSP (de)muxer context
***********************************************************/
public void ff_rtsp_close_connections (
    AVFormatContext format_context
);

/***********************************************************
Get the description of the stream and set up the RTSPStream child
objects.
***********************************************************/
public int ff_rtsp_setup_input_streams (
    AVFormatContext format_context,
    RTSPMessageHeader reply
);

/***********************************************************
Announce the stream to the server and set up the RTSPStream child
objects for each media stream.
***********************************************************/
public int ff_rtsp_setup_output_streams (
    AVFormatContext format_context,
    string addr
);

/***********************************************************
Parse RTSP commands (OPTIONS, PAUSE and TEARDOWN) during streaming in
listen mode.
***********************************************************/
public int ff_rtsp_parse_streaming_commands (
    AVFormatContext format_context
);

/***********************************************************
Parse an SDP description of streams by populating an RTSPState struct
within the AVFormatContext; also allocate the RTP streams and the
GLib.PollFD array used for UDP streams.
***********************************************************/
public int ff_sdp_parse (
    AVFormatContext format_context,
    string content
);

/***********************************************************
Receive one RTP packet from an TCP interleaved RTSP stream.
***********************************************************/
public int ff_rtsp_tcp_read_packet (
    AVFormatContext format_context,
    out RTSPStream prtsp_st,
    uint8[] buf,
    int buf_size
);

/***********************************************************
Send buffered packets over TCP.
***********************************************************/
public int ff_rtsp_tcp_write_packet (
    AVFormatContext format_context,
    RTSPStream rtsp_st
);

/***********************************************************
Receive one packet from the RTSPStreams set up in the AVFormatContext
(which should contain a RTSPState struct as priv_data).
***********************************************************/
public int ff_rtsp_fetch_packet (
    AVFormatContext format_context,
    LibAVCodec.Packet packet
);

/***********************************************************
Do the SETUP requests for each stream for the chosen
lower transport mode.
@return 0 on success, <0 on error, 1 if protocol is unavailable
***********************************************************/
public int ff_rtsp_make_setup_request (
    AVFormatContext format_context,
    string host,
    int port,
    int lower_transport,
    string real_challenge
);

/***********************************************************
Undo the effect of ff_rtsp_make_setup_request, close the
transport_priv and rtp_handle fields.
***********************************************************/
public void ff_rtsp_undo_setup (
    AVFormatContext format_context,
    int send_packets
);

/***********************************************************
Open RTSP transport context.
***********************************************************/
public int ff_rtsp_open_transport_ctx (
    AVFormatContext format_context,
    RTSPStream rtsp_st
);

//  extern const LibAVUtil.Option ff_rtsp_options[];

} // namespace LibAVFormat
