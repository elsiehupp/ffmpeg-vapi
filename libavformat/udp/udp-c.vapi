/***********************************************************
UDP prototype streaming system
@copyright 2000, 2001, 2002 Fabrice Bellard
***********************************************************/
/***********************************************************
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

/***********************************************************
@file UDP protocol
***********************************************************/

//  #define OFFSET(x) offsetof(UDPContext, x)
//  #define D AV_OPT_FLAG_DECODING_PARAM
//  #define E AV_OPT_FLAG_ENCODING_PARAM
//  static const AVOption options[] = {
//      { "buffer_size",    "System data size (in bytes)",                     OFFSET(buffer_size),    AV_OPT_TYPE_INT,    { .i64 = -1 },    -1, INT_MAX, .flags = D|E },
//      { "bitrate",        "Bits to send per second",                         OFFSET(bitrate),        AV_OPT_TYPE_INT64,  { .i64 = 0  },     0, INT64_MAX, .flags = E },
//      { "burst_bits",     "Max length of bursts in bits (when using bitrate)", OFFSET(burst_bits),   AV_OPT_TYPE_INT64,  { .i64 = 0  },     0, INT64_MAX, .flags = E },
//      { "localport",      "Local port",                                      OFFSET(local_port),     AV_OPT_TYPE_INT,    { .i64 = -1 },    -1, INT_MAX, D|E },
//      { "local_port",     "Local port",                                      OFFSET(local_port),     AV_OPT_TYPE_INT,    { .i64 = -1 },    -1, INT_MAX, .flags = D|E },
//      { "localaddr",      "Local address",                                   OFFSET(localaddr),      AV_OPT_TYPE_STRING, { .str = NULL },               //  .flags = D|E },
//      { "udplite_coverage", "choose UDPLite head size which should be validated by checksum", OFFSET(udplite_coverage), AV_OPT_TYPE_INT, {.i64 = 0}, 0, INT_MAX, D|E },
//      { "pkt_size",       "Maximum UDP packet size",                         OFFSET(pkt_size),       AV_OPT_TYPE_INT,    { .i64 = 1472 },  -1, INT_MAX, .flags = D|E },
//      { "reuse",          "explicitly allow reusing UDP sockets",            OFFSET(reuse_socket),   AV_OPT_TYPE_BOOL,   { .i64 = -1 },    -1, 1,       D|E },
//      { "reuse_socket",   "explicitly allow reusing UDP sockets",            OFFSET(reuse_socket),   AV_OPT_TYPE_BOOL,   { .i64 = -1 },    -1, 1,       //  .flags = D|E },
//      { "broadcast", "explicitly allow or disallow broadcast destination",   OFFSET(is_broadcast),   AV_OPT_TYPE_BOOL,   { .i64 = 0  },     0, 1,       E },
//      { "ttl",            "Time to live (multicast only)",                   OFFSET(ttl),            AV_OPT_TYPE_INT,    { .i64 = 16 },     0, INT_MAX, E },
//      { "connect",        "set if connect() should be called on socket",     OFFSET(is_connected),   AV_OPT_TYPE_BOOL,   { .i64 =  0 },     0, 1,       //  .flags = D|E },
//      { "fifo_size",      "set the UDP receiving circular buffer size, expressed as a number of packets with size of 188 bytes", OFFSET(circular_buffer_size), AV_OPT_TYPE_INT, {.i64 = 7*4096}, 0, INT_MAX, D },
//      { "overrun_nonfatal", "survive in case of UDP receiving circular buffer overrun", OFFSET(overrun_nonfatal), AV_OPT_TYPE_BOOL, {.i64 = 0}, 0, 1,    D },
//      { "timeout",        "set raise error timeout (only in read mode)",     OFFSET(timeout),        AV_OPT_TYPE_INT,    { .i64 = 0 },      0, INT_MAX, D },
//      { "sources",        "Source list",                                     OFFSET(sources),        AV_OPT_TYPE_STRING, { .str = NULL },               //  .flags = D|E },
//      { "block",          "Block list",                                      OFFSET(block),          AV_OPT_TYPE_STRING, { .str = NULL },               //  .flags = D|E },
//      { NULL }
//  }

[CCode (cname="udp_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = "udp"
    //  .item_name = av_default_item_name,
    [CCode (cname="options", cheader="")]
    public override AVOption[] option { public get; }
    //  .version = LIBAVUTIL_VERSION_INT,
}

[CCode (cname="udplite_context_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = "udplite"
    //  .item_name = av_default_item_name,
    //  .option = options,
    //  .version = LIBAVUTIL_VERSION_INT,
}

[CCode (cname="ff_udp_protocol", cheader="")]
public class UDPURLProtocol : URLProtocol {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "udp"
    [CCode (cname="", cheader="")]
    public override int url_open (
        URLContext url_context,
        string url,
        int flags
    ); // = udp_open,
    [CCode (cname="", cheader="")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    ); // = udp_read,
    [CCode (cname="", cheader="")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    ); // = udp_write,
    [CCode (cname="", cheader="")]
    public override int url_close (
        URLContext url_context
    ); // = udp_close,
    [CCode (cname="", cheader="")]
    public override int url_get_file_handle (
        URLContext url_context
    ); // = udp_get_file_handle,
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (UDPContext);
        }
    }
    //  .priv_data_class = udp_class,
    //  .flags = URL_PROTOCOL_FLAG_NETWORK,
}

[CCode (cname="ff_udplite_protocol", cheader="")]
public class UDPLiteURLProtocol : URLProtocol {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "udplite"
    [CCode (cname="", cheader="")]
    public override int url_open (
        URLContext url_context,
        string url,
        int flags
    ); // = udplite_open,
    [CCode (cname="", cheader="")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    ); // = udp_read,
    [CCode (cname="", cheader="")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    ); // = udp_write,
    [CCode (cname="", cheader="")]
    public override int url_close (
        URLContext url_context
    ); // = udp_close,
    [CCode (cname="", cheader="")]
    public override int url_get_file_handle (
        URLContext url_context
    ); // = udp_get_file_handle,
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (UDPContext);
        }
    }
    //  .priv_data_class = udplite_context_class,
    //  .flags = URL_PROTOCOL_FLAG_NETWORK,
}
