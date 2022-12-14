/***********************************************************
@brief Apple HTTP Live Streaming Protocol Handler
@copyright 2010 Martin Storsjo
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
@file Apple HTTP Live Streaming Protocol Handler
http://tools.ietf.org/html/draft-pantos-http-live-streaming
***********************************************************/

[CCode (cname="struct HLSContext", cheader_filename="")]
public struct HLSPrivateData { }

[CCode (cname="ff_hls_protocol", cheader_filename="")]
public class HLSURLProtocol : URLProtocol {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "hls";
        }
    }

    [CCode (cname="hls_open", cheader_filename="")]
    public override int url_open (
        URLContext url_context,
        string url,
        int flags
    );

    [CCode (cname="hls_read", cheader_filename="")]
    public override int url_read (
        URLContext url_context,
        uchar[] buffer,
        int size
    );

    [CCode (cname="hls_close", cheader_filename="")]
    public override int url_close (
        URLContext url_context
    );

    [CCode (cname="flags", cheader_filename="")]
    public override URLProtocolFlags flags {
        public get {
            return URL_PROTOCOL_FLAG_NESTED_SCHEME;
        }
    }

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (HLSPrivateData);
        }
    }
}

} // namespace LibAVFormat
