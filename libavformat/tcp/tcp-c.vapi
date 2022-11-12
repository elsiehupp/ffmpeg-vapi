/***********************************************************
TCP protocol
@copyright 2002 Fabrice Bellard
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

namespace LibAVFormat {

//  #define OFFSET(x) offsetof(TCPContext, x)
//  #define D AV_OPT_FLAG_DECODING_PARAM
//  #define E AV_OPT_FLAG_ENCODING_PARAM
//  static const LibAVUtil.Option options[] = {
//      { "listen",          "Listen for incoming connections",  OFFSET(listen),         AV_OPT_TYPE_INT, { .i64 = 0 },     0,       2,       //  .flags = D|E },
//      { "timeout",     "set timeout (in microseconds) of socket I/O operations", OFFSET(rw_timeout),     AV_OPT_TYPE_INT, { .i64 = -1 },         -1, INT_MAX, .flags = D|E },
//      { "listen_timeout",  "Connection awaiting timeout (in milliseconds)",      OFFSET(listen_timeout), AV_OPT_TYPE_INT, { .i64 = -1 },         -1, INT_MAX, .flags = D|E },
//      { "send_buffer_size", "Socket send buffer size (in bytes)",                OFFSET(send_buffer_size), AV_OPT_TYPE_INT, { .i64 = -1 },         -1, INT_MAX, .flags = D|E },
//      { "recv_buffer_size", "Socket receive buffer size (in bytes)",             OFFSET(recv_buffer_size), AV_OPT_TYPE_INT, { .i64 = -1 },         -1, INT_MAX, .flags = D|E },
//      { "tcp_nodelay", "Use TCP_NODELAY to disable nagle's algorithm",           OFFSET(tcp_nodelay), AV_OPT_TYPE_BOOL, { .i64 = 0 },             0, 1, .flags = D|E },
//  #if !HAVE_WINSOCK2_H
//      { "tcp_mss",     "Maximum segment size for outgoing TCP packets",          OFFSET(tcp_mss),     AV_OPT_TYPE_INT, { .i64 = -1 },         -1, INT_MAX, .flags = D|E },
//  #endif /* !HAVE_WINSOCK2_H */
//      { NULL }
//  }

[CCode (cname="tcp_class", cheader_filename="")]
public class TCPURLProtocolClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "tcp";
        }
    }
    [CCode (cname="item_name", cheader_filename="")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }
    [CCode (cname="options", cheader_filename="")]
    public override LibAVUtil.Option[] option { public get; }
    [CCode (cname="version", cheader_filename="")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;
        }
    }
}

[CCode (cname="struct TCPContext", cheader_filename="")]
public struct TCPPrivateData { }

[CCode (cname="ff_tcp_protocol", cheader_filename="")]
public class TCPURLProtocol : URLProtocol {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "tcp";
        }
    }
    [CCode (cname="tcp_open", cheader_filename="")]
    public override int url_open (
        URLContext url_context,
        string url,
        int flags
    );
    [CCode (cname="tcp_accept", cheader_filename="")]
    public override int url_accept (
        URLContext server_url_context,
        out URLContext client_url_context
    );
    [CCode (cname="tcp_read", cheader_filename="")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );
    [CCode (cname="tcp_write", cheader_filename="")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );
    [CCode (cname="tcp_close", cheader_filename="")]
    public override int url_close (
        URLContext url_context
    );
    [CCode (cname="tcp_get_file_handle", cheader_filename="")]
    public override int url_get_file_handle (
        URLContext url_context
    );
    [CCode (cname="tcp_get_window_size", cheader_filename="")]
    public override int url_get_short_seek (
        URLContext url_context
    );
    [CCode (cname="tcp_shutdown", cheader_filename="")]
    public override int url_shutdown (
        URLContext url_context,
        int flags
    );
    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (TCPPrivateData);
        }
    }
    [CCode (cname="flags", cheader_filename="")]
    public override URLProtocolFlags flags {
        public get {
            return URL_PROTOCOL_FLAG_NETWORK;
        }
    }
    //  .priv_data_class = tcp_class,
}

} // namespace LibAVFormat
