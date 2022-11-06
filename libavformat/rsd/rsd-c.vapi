/***********************************************************
RSD demuxer
@copyright 2013 James Almer

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
public class InputFormat : AVInputFormat ff_rsd_demuxer = {
    //  .name           =   "rsd",
    //  .long_name      =   "GameCube RSD",
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );     =   rsd_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    =   rsd_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    =   rsd_read_packet,
    //  .extensions     =   "rsd",
    //  .codec_tag      =   (const AVCodecTag* const []){rsd_tags, 0},
    //  .flags          =   AVFMT_GENERIC_INDEX,
}
