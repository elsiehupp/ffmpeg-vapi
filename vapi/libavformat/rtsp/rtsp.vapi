/***********************************************************
@brief RTSP definitions
@copyright 2002 Fabrice Bellard
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

/***********************************************************
@brief Network layer over which RTP/etc packet data will be transported.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public enum RTSPLowerTransport {
    /***********************************************************
    UDP/unicast
        ***********************************************************/
    RTSP_LOWER_TRANSPORT_UDP,
    /***********************************************************
    @brief TCP; interleaved in RTSP
        ***********************************************************/
    RTSP_LOWER_TRANSPORT_TCP,
    /***********************************************************
    UDP/multicast
        ***********************************************************/
    RTSP_LOWER_TRANSPORT_UDP_MULTICAST,
    RTSP_LOWER_TRANSPORT_NB,
    /***********************************************************
    @brief HTTP tunneled - not a proper
    transport mode as such,
    only for use via AVOptions
        ***********************************************************/
    RTSP_LOWER_TRANSPORT_HTTP,
    /***********************************************************
    @brief HTTPS tunneled
        ***********************************************************/
    RTSP_LOWER_TRANSPORT_HTTPS,
    /***********************************************************
    @brief Custom IO - not a public
    option for lower_transport_mask,
    but set in the SDP demuxer based
    on a flag.
        ***********************************************************/
    RTSP_LOWER_TRANSPORT_CUSTOM,
}

/***********************************************************
@brief Packet profile of the data that we will be receiving. Real servers
commonly send RDT (although they can sometimes send RTP as well),
whereas most others will send RTP.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public enum RTSPTransport {
    /***********************************************************
    @brief Standards-compliant RTP
        ***********************************************************/
    RTSP_TRANSPORT_RTP,
    /***********************************************************
    @brief Realmedia Data Transport
        ***********************************************************/
    RTSP_TRANSPORT_RDT,
    /***********************************************************
    @brief Raw data (over UDP)
        ***********************************************************/
    RTSP_TRANSPORT_RAW,
    RTSP_TRANSPORT_NB
}

/***********************************************************
@brief Transport mode for the RTSP data. This may be plain, or
tunneled, which is done over HTTP.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public enum RTSPControlTransport {
    /***********************************************************
    @brief Normal RTSP
        ***********************************************************/
    RTSP_MODE_PLAIN,
    /***********************************************************
    @brief RTSP over HTTP (tunneling)
        ***********************************************************/
    RTSP_MODE_TUNNEL
}

[CCode (cname="", cheader_filename="")]
public const int RTSP_DEFAULT_PORT; // 554
[CCode (cname="", cheader_filename="")]
public const int RTSPS_DEFAULT_PORT; // 322
[CCode (cname="", cheader_filename="")]
public const int RTSP_MAX_TRANSPORTS; // 8
[CCode (cname="", cheader_filename="")]
public const size_t RTSP_TCP_MAX_PACKET_SIZE; // 1472
[CCode (cname="", cheader_filename="")]
public const int RTSP_DEFAULT_NB_AUDIO_CHANNELS; // 1
[CCode (cname="", cheader_filename="")]
public const int RTSP_DEFAULT_AUDIO_SAMPLERATE; // 44100
[CCode (cname="", cheader_filename="")]
public const int RTSP_RTP_PORT_MIN; // 5000
[CCode (cname="", cheader_filename="")]
public const int RTSP_RTP_PORT_MAX; // 65000

/***********************************************************
@brief This describes a single item in the "Transport:" line of one stream as
negotiated by the SETUP RTSP command. Multiple transports are comma-
separated ("Transport: x-read-rdt/tcp;interleaved=0-1,rtp/avp/udp;
client_port=1000-1001;server_port=1800-1801") and described in separate
RTSPTransportFields.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public struct RTSPTransportField {
    /***********************************************************
    @brief Interleave ids, if TCP transport; each TCP/RTSP data packet starts
    with a '$', stream length and stream ID. If the stream ID is within
    the range of this interleaved_min-max, then the packet belongs to
    this stream.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int interleaved_min;

    [CCode (cname="", cheader_filename="")]
    public int interleaved_max;

    /***********************************************************
    UDP multicast port range; the ports to which we should connect to
    receive multicast UDP data.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int port_min;

    [CCode (cname="", cheader_filename="")]
    public int port_max;

    /***********************************************************
    UDP client ports; these should be the local ports of the UDP RTP
    (and RTCP) sockets over which we receive RTP/RTCP data.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int client_port_min;

    [CCode (cname="", cheader_filename="")]
    public int client_port_max;

    /***********************************************************
    UDP unicast server port range; the ports to which we should connect
    to receive unicast UDP RTP/RTCP data.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int server_port_min;

    [CCode (cname="", cheader_filename="")]
    public int server_port_max;

    /***********************************************************
    @brief Time-to-live value (required for multicast); the amount of HOPs that
    packets will be allowed to make before being discarded.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int ttl;

    /***********************************************************
    @brief Transport set to record data
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int mode_record;

    /***********************************************************
    @brief Destination IP address
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public sockaddr_storage destination;

    /***********************************************************
    @brief Source IP address
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public char source[INET6_ADDRSTRLEN + 1];

    /***********************************************************
    @brief Data/packet transport protocol; e.g. RTP or RDT
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public RTSPTransport transport;

    /***********************************************************
    @brief Network layer transport protocol; e.g. TCP or UDP uni-/multicast
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public RTSPLowerTransport lower_transport;
}

/***********************************************************
@brief This describes the server response to each RTSP command.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public struct RTSPMessageHeader {
    /***********************************************************
    @brief Length of the data following this header
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int content_length;

    /***********************************************************
    @brief Response code from server
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public RTSPStatusCode status_code;

    /***********************************************************
    @brief Number of items in the 'transports' variable below
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int nb_transports;

    /***********************************************************
    @brief Time range of the streams that the server will stream. In
    AV_TIME_BASE unit, AV_NOPTS_VALUE if not used
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int64 range_start;

    [CCode (cname="", cheader_filename="")]
    public int64 range_end;

    /***********************************************************
    @brief Describes the complete "Transport:" line of the server in response
    to a SETUP RTSP command by the client
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public RTSPTransportField transports[RTSP_MAX_TRANSPORTS];

    /***********************************************************
    @brief Sequence number
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int seq;

    /***********************************************************
    @brief The "Session:" field. This value is initially set by the server and
    should be re-transmitted by the client in every RTSP command.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public char session_id[512];

    /***********************************************************
    @brief The "Location:" field. This value is used to handle redirection.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public char location[4096];

    /***********************************************************
    @brief The "RealChallenge1:" field from the server
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public char real_challenge[64];

    /***********************************************************
    @brief The "Server: field, which can be used to identify some special-case
    servers that are not 100% standards-compliant. We use this to identify
    Windows Media Server, which has a value "WMServer/v.e.r.sion", where
    version is a sequence of digits (e.g. 9.0.0.3372). Helix/Real servers
    use something like "Helix [..] Server Version v.e.r.sion (platform)
    (RealServer compatible)" or "RealServer Version v.e.r.sion (platform)"
    where platform is the output of $uname -msr | sed 's/ /-/g'.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public char server[64];

    /***********************************************************
    @brief The "timeout" comes as part of the server response to the "SETUP"
    command, in the "Session: <xyz>[;timeout=<value>]" line. It is the
    time, in seconds, that the server will go without traffic over the
    RTSP/TCP connection before it closes the connection. To prevent
    this, sent dummy requests (e.g. OPTIONS) with intervals smaller
    than this value.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int timeout;

    /***********************************************************
    @brief The "Notice" or "X-Notice" field value. See
    http://tools.ietf.org/html/draft-stiemerling-rtsp-announce-00
    for a complete list of supported values.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int notice;

    /***********************************************************
    @brief The "reason" is meant to specify better the meaning of the error code
    returned
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public char reason[256];

    /***********************************************************
    @brief Content type header
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public char content_type[64];
}

/***********************************************************
@brief Client state, i.e. whether we are currently receiving data (PLAYING) or
setup-but-not-receiving (PAUSED). State can be changed in applications
by calling av_read_play/pause ().
***********************************************************/
[CCode (cname="", cheader_filename="")]
public enum RTSPClientState {
    /***********************************************************
    @brief Not initialized
        ***********************************************************/
    RTSP_STATE_IDLE,
    /***********************************************************
    @brief Initialized and sending/receiving data
        ***********************************************************/
    RTSP_STATE_STREAMING,
    /***********************************************************
    @brief Initialized, but not receiving data
        ***********************************************************/
    RTSP_STATE_PAUSED,
    /***********************************************************
    @brief Initialized, requesting a seek
        ***********************************************************/
    RTSP_STATE_SEEKING,
}

/***********************************************************
@brief Identify particular servers that require special handling, such as
standards-incompliant "Transport:" lines in the SETUP request.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public enum RTSPServerType {
    /***********************************************************
    @brief Standards-compliant RTP-server
        ***********************************************************/
    RTSP_SERVER_RTP,
    /***********************************************************
    @brief Realmedia-style server
        ***********************************************************/
    RTSP_SERVER_REAL,
    /***********************************************************
    @brief Windows Media server
        ***********************************************************/
    RTSP_SERVER_WMS,
    RTSP_SERVER_NB
}

/***********************************************************
@brief Private data for the RTSP demuxer.

@todo Use AVIOContext instead of URLContext
***********************************************************/
[CCode (cname="", cheader_filename="")]
public struct RTSPState {
    /***********************************************************
    @brief Class for private options.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public LibAVUtil.Class class;

    /***********************************************************
    @brief RTSP TCP connection handle
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public URLContext rtsp_hd;

    /***********************************************************
    @brief Streams in this session
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public RTSPStream[] rtsp_streams;

    /***********************************************************
    @brief Number of items in the 'rtsp_streams' variable
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int nb_rtsp_streams;

    /***********************************************************
    @brief Indicator of whether we are currently receiving data from the
    server. Basically this isn't more than a simple cache of the
    last PLAY/PAUSE command sent to the server, to make sure we don't
    send 2x the same unexpectedly or commands in the wrong state.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public RTSPClientState state;

    /***********************************************************
    @brief The seek value requested when calling av_seek_frame (). This value
    is subsequently used as part of the "Range" parameter when emitting
    the RTSP PLAY command. If we are currently playing, this command is
    called instantly. If we are currently paused, this command is called
    whenever we resume playback. Either way, the value is only used once,
    see rtsp_read_play () and rtsp_read_seek ().
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int64 seek_timestamp;

    /***********************************************************
    @brief RTSP command sequence number
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int seq;

    /***********************************************************
    @brief Copy of RTSPMessageHeader.session_id, i.e. the server-provided session
    identifier that the client should re-transmit in each RTSP command
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public char session_id[512];

    /***********************************************************
    @brief Copy of RTSPMessageHeader.timeout, i.e. the time (in seconds) that
    the server will go without traffic on the RTSP/TCP line before it
    closes the connection.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int timeout;

    /***********************************************************
    @brief Timestamp of the last RTSP command that we sent to the RTSP server.
    This is used to calculate when to send dummy commands to keep the
    connection alive, in conjunction with timeout.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int64 last_cmd_time;

    /***********************************************************
    @brief The negotiated data/packet transport protocol; e.g. RTP or RDT
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public RTSPTransport transport;

    /***********************************************************
    @brief The negotiated network layer transport protocol; e.g. TCP or UDP
    uni-/multicast
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public RTSPLowerTransport lower_transport;

    /***********************************************************
    @brief Brand of server that we're talking to; e.g. WMS, REAL or other.
    Detected based on the value of RTSPMessageHeader.server or the presence
    of RTSPMessageHeader.real_challenge
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public RTSPServerType server_type;

    /***********************************************************
    @brief The "RealChallenge1:" field from the server
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public char real_challenge[64];

    /***********************************************************
    @brief Plaintext authorization line (username:password)
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public char auth[128];

    /***********************************************************
    @brief Authentication state
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public HTTPAuthState auth_state;

    /***********************************************************
    @brief The last reply of the server to a RTSP command
    XXX: allocate ?
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public char last_reply[2048];

    /***********************************************************
    @brief RTSPStream.transport_priv of the last stream that we read a
    packet from
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public void *cur_transport_priv;

    /***********************************************************
    @brief The following are used for Real stream selection
        ***********************************************************/
    //@{
    /***********************************************************
    @brief Whether we need to send a "SET_PARAMETER Subscribe:" command
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int need_subscription;

    /***********************************************************
    @brief Stream setup during the last frame read. This is used to detect if
    we need to subscribe or unsubscribe to any new streams.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public LibAVCodec.Discard *real_setup_cache;

    /***********************************************************
    @brief Current stream setup. This is a temporary buffer used to compare
    current setup to previous frame setup.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public LibAVCodec.Discard *real_setup;

    /***********************************************************
    @brief The last value of the "SET_PARAMETER Subscribe:" RTSP command.
    this is used to send the same "Unsubscribe:" if stream setup changed,
    before sending a new "Subscribe:" command.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public char last_subscription[1024];
    //@}

    /***********************************************************
    @brief The following are used for RTP/ASF streams
        ***********************************************************/
    //@{
    /***********************************************************
    @brief ASF demuxer context for the embedded ASF stream from WMS servers
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public AVFormatContext asf_ctx;

    /***********************************************************
    @brief Cache for position of the asf demuxer, since we load a new
    data packet in the bytecontext for each incoming RTSP packet.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public uint64 asf_pb_pos;
    //@}

    /***********************************************************
    @brief Some MS RTSP streams contain a URL in the SDP that we need to use
    for all subsequent RTSP requests, rather than the input URI; in
    other cases, this is a copy of AVFormatContext.filename.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public char control_uri[1024];

    /***********************************************************
    @brief The following are used for parsing raw mpegts in udp
        ***********************************************************/
    //@{
    [CCode (cname="", cheader_filename="")]
    public MpegTSContext ts;

    [CCode (cname="", cheader_filename="")]
    public int recvbuf_pos;

    [CCode (cname="", cheader_filename="")]
    public int recvbuf_len;
    //@}

    /***********************************************************
    @brief Additional output handle, used when input and output are done
    separately, eg for HTTP tunneling.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public URLContext rtsp_hd_out;

    /***********************************************************
    @brief RTSP transport mode, such as plain or tunneled.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public RTSPControlTransport control_transport;

    /***********************************************************
    @brief Number of RTCP BYE packets the RTSP session has received.
    An EOF is propagated back if nb_byes == nb_streams.
    This is reset after a seek.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int nb_byes;

    /***********************************************************
    @brief Reusable buffer for receiving packets
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public uint8[] recvbuf;

    /***********************************************************
    @brief A mask with all requested transport methods
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int lower_transport_mask;

    /***********************************************************
    @brief The number of returned packets
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public uint64 packets;

    /***********************************************************
    @brief Polling array for udp
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public GLib.PollFD p;

    [CCode (cname="", cheader_filename="")]
    public int max_p;

    /***********************************************************
    @brief Whether the server supports the GET_PARAMETER method.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int get_parameter_supported;

    /***********************************************************
    @brief Do not begin to play the stream immediately.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int initial_pause;

    /***********************************************************
    @brief Option flags for the chained RTP muxer.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int rtp_muxer_flags;

    /***********************************************************
    @brief Whether the server accepts the x-Dynamic-Rate header
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int accept_dynamic_rate;

    /***********************************************************
    @brief Various option flags for the RTSP muxer/demuxer.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int rtsp_flags;

    /***********************************************************
    @brief Mask of all requested media types
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int media_type_mask;

    /***********************************************************
    @brief Minimum and maximum local UDP ports.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int rtp_port_min;

    [CCode (cname="", cheader_filename="")]
    public int rtp_port_max;

    /***********************************************************
    @brief Timeout to wait for incoming connections.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int initial_timeout;

    /***********************************************************
    @brief Timeout of socket i/o operations.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int stimeout;

    /***********************************************************
    @brief Size of RTP packet reordering queue.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int reordering_queue_size;

    /***********************************************************
    User-Agent string
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public string user_agent;

    [CCode (cname="", cheader_filename="")]
    public char default_lang[4];

    [CCode (cname="", cheader_filename="")]
    public int buffer_size;

    [CCode (cname="", cheader_filename="")]
    public int pkt_size;
}

[Flags]
public enum RTSPFlags {
    /***********************************************************
    @brief Filter incoming UDP packets - receive packets only from the
    right source address and port.
        ***********************************************************/
    RTSP_FLAG_FILTER_SRC,
    /***********************************************************
    @brief Wait for incoming connections.
        ***********************************************************/
    RTSP_FLAG_LISTEN,
    /***********************************************************
    @brief Do all IO via the AVIOContext.
        ***********************************************************/
    RTSP_FLAG_CUSTOM_IO,
    /***********************************************************
    @brief Send RTCP packets to the source address of received packets.
        ***********************************************************/
    RTSP_FLAG_RTCP_TO_SOURCE,
    /***********************************************************
    @brief Try RTP via TCP first if possible.
        ***********************************************************/
    RTSP_FLAG_PREFER_TCP,
}

[CCode (cname="struct RTSPSource", cheader_filename="")]
public struct RTSPSource {
    /***********************************************************
    @brief Source-specific multicast include source IP address (from SDP content)
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public char addr[128];
}

/***********************************************************
@brief Describe a single stream, as identified by a single m= line block in the
SDP content. In the case of RDT, one RTSPStream can represent multiple
AVStreams. In this case, each AVStream in this set has similar content
(but different codec/bitrate).
***********************************************************/
[CCode (cname="", cheader_filename="")]
public struct RTSPStream {
    /***********************************************************
    @brief RTP stream handle (if UDP)
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public URLContext rtp_handle;

    /***********************************************************
    @brief RTP/RDT parse context if input, RTP AVFormatContext if output
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public void *transport_priv;

    /***********************************************************
    @brief Corresponding stream index, if any. -1 if none (MPEG2TS case)
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int stream_index;

    /***********************************************************
    @brief Interleave IDs; copies of RTSPTransportField.interleaved_min/max
    for the selected transport. Only used for TCP.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int interleaved_min;

    [CCode (cname="", cheader_filename="")]
    public int interleaved_max;

    /***********************************************************
    url for this stream (from SDP)
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public char control_url[1024];

    /***********************************************************
    @brief The following are used only in SDP, not RTSP
    ***********************************************************/
//@{
    /***********************************************************
    @brief Port (from SDP content)
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int sdp_port;

    /***********************************************************
    @brief IP address (from SDP content)
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public sockaddr_storage sdp_ip;

    /***********************************************************
    @brief Source-specific multicast include source IP addresses (from SDP content)
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public RTSPSource[] include_source_addrs;

    /***********************************************************
    @brief Number of source-specific multicast include source IP addresses (from SDP content)
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int nb_include_source_addrs;

    /***********************************************************
    @brief Source-specific multicast exclude source IP addresses (from SDP content)
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public RTSPSource[] exclude_source_addrs;

    /***********************************************************
    @brief Number of source-specific multicast exclude source IP addresses (from SDP content)
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int nb_exclude_source_addrs;

    /***********************************************************
    @brief IP Time-To-Live (from SDP content)
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int sdp_ttl;

    /***********************************************************
    @brief Payload type
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int sdp_payload_type;
//@}

    /***********************************************************
    @brief The following are used for dynamic protocols (rtpdec_*.c/rdt.c)
        ***********************************************************/
    //@{
    /***********************************************************
    @brief Handler structure
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public RTPDynamicProtocolHandler dynamic_handler;

    /***********************************************************
    @brief Private data associated with the dynamic protocol
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public PayloadContext dynamic_protocol_context;
//@}

    /***********************************************************
    @brief Enable sending RTCP feedback messages according to RFC 4585
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int feedback;

    /***********************************************************
    @brief SSRC for this stream, to allow identifying RTCP packets before the first RTP packet
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public uint32 ssrc;

    [CCode (cname="", cheader_filename="")]
    public char crypto_suite[40];

    [CCode (cname="", cheader_filename="")]
    public char crypto_params[100];
}

[CCode (cname="", cheader_filename="")]
public void ff_rtsp_parse_line (
    AVFormatContext format_context,
    RTSPMessageHeader reply,
    string buffer,
    RTSPState rt,
    string method
);

/***********************************************************
@brief Send a command to the RTSP server without waiting for the reply.

@see rtsp_send_cmd_with_content_async
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ff_rtsp_send_cmd_async (
    AVFormatContext format_context,
    string method,
    string url,
    string headers
);

/***********************************************************
@brief Send a command to the RTSP server and wait for the reply.

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
[CCode (cname="", cheader_filename="")]
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
@brief Send a command to the RTSP server and wait for the reply.

@see rtsp_send_cmd_with_content
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ff_rtsp_send_cmd (
    AVFormatContext format_context,
    string method,
    string url,
    string headers,
    RTSPMessageHeader reply,
    out uchar[] content_ptr
);

/***********************************************************
@brief Read a RTSP message from the server, or prepare to read data
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
[CCode (cname="", cheader_filename="")]
public int ff_rtsp_read_reply (
    AVFormatContext format_context,
    RTSPMessageHeader reply,
    out uchar[] content_ptr,
    int return_on_interleaved_data,
    string method
);

/***********************************************************
@brief Skip a RTP/TCP interleaved packet.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public void ff_rtsp_skip_packet (
    AVFormatContext format_context
);

/***********************************************************
@brief Connect to the RTSP server and set up the individual media streams.
This can be used for both muxers and demuxers.

@param format_context RTSP (de)muxer context

@return 0 on success, < 0 on error. Cleans up all allocations done
         within the function on error.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ff_rtsp_connect (
    AVFormatContext format_context
);

/***********************************************************
@brief Close and free all streams within the RTSP (de)muxer

@param format_context RTSP (de)muxer context
***********************************************************/
[CCode (cname="", cheader_filename="")]
public void ff_rtsp_close_streams (
    AVFormatContext format_context
);

/***********************************************************
@brief Close all connection handles within the RTSP (de)muxer

@param format_context RTSP (de)muxer context
***********************************************************/
[CCode (cname="", cheader_filename="")]
public void ff_rtsp_close_connections (
    AVFormatContext format_context
);

/***********************************************************
@brief Get the description of the stream and set up the RTSPStream child
objects.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ff_rtsp_setup_input_streams (
    AVFormatContext format_context,
    RTSPMessageHeader reply
);

/***********************************************************
@brief Announce the stream to the server and set up the RTSPStream child
objects for each media stream.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ff_rtsp_setup_output_streams (
    AVFormatContext format_context,
    string addr
);

/***********************************************************
@brief Parse RTSP commands (OPTIONS, PAUSE and TEARDOWN) during streaming in
listen mode.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ff_rtsp_parse_streaming_commands (
    AVFormatContext format_context
);

/***********************************************************
@brief Parse an SDP description of streams by populating an RTSPState struct
within the AVFormatContext; also allocate the RTP streams and the
GLib.PollFD array used for UDP streams.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ff_sdp_parse (
    AVFormatContext format_context,
    string content
);

/***********************************************************
@brief Receive one RTP packet from an TCP interleaved RTSP stream.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ff_rtsp_tcp_read_packet (
    AVFormatContext format_context,
    out RTSPStream prtsp_st,
    uint8[] buffer,
    int buf_size
);

/***********************************************************
@brief Send buffered packets over TCP.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ff_rtsp_tcp_write_packet (
    AVFormatContext format_context,
    RTSPStream rtsp_st
);

/***********************************************************
@brief Receive one packet from the RTSPStreams set up in the AVFormatContext
(which should contain a RTSPState struct as priv_data).
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ff_rtsp_fetch_packet (
    AVFormatContext format_context,
    LibAVCodec.Packet packet
);

/***********************************************************
@brief Do the SETUP requests for each stream for the chosen
lower transport mode.
@return 0 on success, <0 on error, 1 if protocol is unavailable
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ff_rtsp_make_setup_request (
    AVFormatContext format_context,
    string host,
    int port,
    int lower_transport,
    string real_challenge
);

/***********************************************************
@brief Undo the effect of ff_rtsp_make_setup_request, close the
transport_priv and rtp_handle fields.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public void ff_rtsp_undo_setup (
    AVFormatContext format_context,
    int send_packets
);

/***********************************************************
@brief Open RTSP transport context.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ff_rtsp_open_transport_ctx (
    AVFormatContext format_context,
    RTSPStream rtsp_st
);

//  extern const LibAVUtil.Option ff_rtsp_options[];

} // namespace LibAVFormat
