/***********************************************************
 TLS/SSL Protocol
 @copyright 2011 Martin Storsjo
 @copyright 2017 sfan5 <sfan5@live.de>

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

static const AVOption options[] = {
    TLS_COMMON_OPTIONS(TLSContext, tls_shared),
    { NULL }
}

static const AVClass tls_class = {
    //  .class_name = "tls",
    //  .item_name  = av_default_item_name,
    //  .option     = options,
    //  .version    = LIBAVUTIL_VERSION_INT,
}

[CCode (cname="ff_tls_protocol", cheader="")]
public class TLSURLProtocol : URLProtocol {
    //  .name           = "tls",
    [CCode (cname="", cheader="")]
    public override int url_open2 (
        URLContext h,
        string url,
        int flags,
        out LibAVUtil.Dictionary options
    );      = ff_tls_open,
    [CCode (cname="", cheader="")]
    public override int url_read (
        URLContext h,
        uchar[] buf,
        int size
    );       = ff_tls_read,
    [CCode (cname="", cheader="")]
    public override int url_write (
        URLContext h,
        uchar[] buf,
        int size
    );      = ff_tls_write,
    [CCode (cname="", cheader="")]
    public override int url_close (
        URLContext h
    );      = ff_tls_close,
    [CCode (cname="", cheader="")]
    public override int url_get_file_handle (
        URLContext h
    ); = tls_get_file_handle,
    //  .priv_data_size = sizeof(TLSContext),
    //  .flags          = URL_PROTOCOL_FLAG_NETWORK,
    //  .priv_data_class = &tls_class,
}
