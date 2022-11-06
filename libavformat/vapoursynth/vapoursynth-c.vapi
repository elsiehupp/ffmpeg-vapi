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

/**
* @file
* VapourSynth demuxer
*
* Synthesizes vapour (?)
*/

static const AVClass class_vs = {
    //  .class_name = "VapourSynth demuxer",
    //  .item_name  = av_default_item_name,
    //  .option     = options,
    //  .version    = LIBAVUTIL_VERSION_INT,
}

[CCode (cname="", cheader="")]
public class InputFormat : AVInputFormat ff_vapoursynth_demuxer = {
    //  .name           = "vapoursynth",
    //  .long_name      = "VapourSynth demuxer",
    //  .priv_data_size = sizeof(VSContext),
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );     = probe_vs,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = read_header_vs,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = read_packet_vs,
    [CCode (cname="", cheader="")]
    public override int read_close (
        AVFormatContext format_context
    );     = read_close_vs,
    [CCode (cname="", cheader="")]
    public override int read_seek (
        AVFormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );      = read_seek_vs,
    //  .priv_class     = &class_vs,
}
