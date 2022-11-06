/***********************************************************
GXF muxer.
@copyright 2006 SmartJog S.A., Baptiste Coudurier <baptiste dot coudurier at smartjog dot com>

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
public class OutputFormat : AVOutputFormat ff_gxf_muxer = {
    //  .name              = "gxf",
    //  .long_name         = "GXF (General eXchange Format)",
    //  .extensions        = "gxf",
    //  .priv_data_size    = sizeof(GXFContext),
    //  .audio_codec       = AV_CODEC_ID_PCM_S16LE,
    //  .video_codec       = AV_CODEC_ID_MPEG2VIDEO,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );      = gxf_write_header,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );      = gxf_write_packet,
    [CCode (cname="", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    );     = gxf_write_trailer,
    [CCode (cname="", cheader="")]
    public override int interleave_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet output,
        LibAVCodec.Packet input,
        int flush
    ); = gxf_interleave_packet,
}
