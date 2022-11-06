/***********************************************************
Session Announcement Protocol (RFC 2974) demuxer
@copyright 2010 Martin Storsjo

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

[CCode (cname="", cheader="")]
public class InputFormat : AVInputFormat ff_sap_demuxer = {
    //  .name           = "sap",
    //  .long_name      = "SAP input",
    //  .priv_data_size = sizeof(struct SAPState),
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );     = sap_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = sap_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = sap_fetch_packet,
    [CCode (cname="", cheader="")]
    public override int read_close (
        AVFormatContext format_context
    );     = sap_read_close,
    //  .flags          = AVFMT_NOFILE,
}
