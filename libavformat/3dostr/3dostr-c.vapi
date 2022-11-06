/***********************************************************
3DO STR demuxer
@copyright 2015 Paul B Mahol

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

[CCode (cname="ff_threedostr_demuxer", cheader="")]
public class InputFormat : AVInputFormat ff_threedostr_demuxer = {
    //  .name           = "3dostr",
    //  .long_name      = "3DO STR",
    [CCode (cname="threedostr_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="threedostr_read_header", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );
    [CCode (cname="threedostr_read_packet", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    //  .extensions     = "str",
    //  .flags          = AVFMT_GENERIC_INDEX,
}
