/***********************************************************
SCTP protocol
@copyright 2012 Luca Barbato
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

/***********************************************************
@file 
sctp url_protocol

url syntax: sctp://host:port[?option=val...]
option: 'listen'        : listen for an incoming connection
        'max_streams=n' : set the maximum number of streams
        'reuse=1'       : enable reusing the socket [TBD]

by setting the maximum number of streams the protocol will use the
first two bytes of the incoming/outgoing buffer to store the
stream number of the packet being read/written.
@see sctp_read
@see sctp_write
***********************************************************/

[CCode (cname="struct SCTPContext", cheader_filename="")]
public struct TCTPPrivateData { }

[CCode (cname="ff_sctp_protocol", cheader_filename="")]
public class TCTPURLProtocol : URLProtocol {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "sctp";
        }
    }
    [CCode (cname="sctp_open", cheader_filename="")]
    public override int url_open (
        URLContext url_context,
        string url,
        int flags
    );
    [CCode (cname="sctp_read", cheader_filename="")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );
    [CCode (cname="sctp_write", cheader_filename="")]
    public override int url_write (
        URLContext url_context,
        uchar[] buffer,
        int size
    );
    [CCode (cname="sctp_close", cheader_filename="")]
    public override int url_close (
        URLContext url_context
    );
    [CCode (cname="sctp_get_file_handle", cheader_filename="")]
    public override int url_get_file_handle (
        URLContext url_context
    );
    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (TCTPPrivateData);
        }
    }
    [CCode (cname="flags", cheader_filename="")]
    public override URLProtocolFlags flags {
        public get {
            return URL_PROTOCOL_FLAG_NETWORK;
        }
    }
    //  .priv_data_class = sctp_class,
}

} // namespace LibAVFormat
