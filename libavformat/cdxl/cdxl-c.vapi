/***********************************************************
CDXL demuxer
@copyright 2011-2012 Paul B Mahol

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

#define OFFSET(x) offsetof(CDXLDemuxContext, x)
static const AVOption cdxl_options[] = {
    { "sample_rate", "", OFFSET(sample_rate), AV_OPT_TYPE_INT,    { .i64 = 11025 }, 1, INT_MAX, AV_OPT_FLAG_DECODING_PARAM },
    { "framerate",   "", OFFSET(framerate),   AV_OPT_TYPE_STRING, { .str = NULL },  0, 0,       AV_OPT_FLAG_DECODING_PARAM },
    { NULL },
}

static const AVClass cdxl_demuxer_class = {
    //  .class_name = "CDXL demuxer",
    //  .item_name  = av_default_item_name,
    //  .option     = cdxl_options,
    //  .version    = LIBAVUTIL_VERSION_INT,
}

[CCode (cname="", cheader="")]
public class InputFormat : AVInputFormat ff_cdxl_demuxer = {
    //  .name           = "cdxl",
    //  .long_name      = "Commodore CDXL video",
    //  .priv_data_size = sizeof(CDXLDemuxContext),
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );     = cdxl_read_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = cdxl_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = cdxl_read_packet,
    //  .extensions     = "cdxl,xl",
    //  .flags          = AVFMT_GENERIC_INDEX,
    //  .priv_class     = &cdxl_demuxer_class,
}
