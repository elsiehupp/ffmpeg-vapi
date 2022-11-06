/*
 * Binary text demuxer
 * eXtended BINary text (XBIN) demuxer
 * Artworx Data Format demuxer
 * iCEDraw File demuxer
 * Copyright (c) 2010 Peter Ross <pross@xvid.org>
 *
 * This file is part of FFmpeg.
 *
 * FFmpeg is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * FFmpeg is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with FFmpeg; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 */

/**
 * @file
 * Binary text demuxer
 * eXtended BINary text (XBIN) demuxer
 * Artworx Data Format demuxer
 * iCEDraw File demuxer
 */

#define OFFSET(x) offsetof(BinDemuxContext, x)
static const AVOption options[] = {
    { "linespeed", "set simulated line speed (bytes per second)", OFFSET(chars_per_frame), AV_OPT_TYPE_INT, {.i64 = 6000}, 1, INT_MAX, AV_OPT_FLAG_DECODING_PARAM},
    { "video_size", "set video size, such as 640x480 or hd720.", OFFSET(width), AV_OPT_TYPE_IMAGE_SIZE, {.str = NULL}, 0, 0, AV_OPT_FLAG_DECODING_PARAM },
    { "framerate", "set framerate (frames per second)", OFFSET(framerate), AV_OPT_TYPE_VIDEO_RATE, {.str = "25"}, 0, INT_MAX, AV_OPT_FLAG_DECODING_PARAM },
    { NULL },
};

#define CLASS(name) \
(const AVClass[1]){{ \
    //  .class_name     = name, \
    //  .item_name      = av_default_item_name, \
    //  .option         = options, \
    //  .version        = LIBAVUTIL_VERSION_INT, \
}}

#if CONFIG_BINTEXT_DEMUXER
AVInputFormat ff_bintext_demuxer = {
    //  .name           = "bin",
    //  .long_name      = "Binary text",
    //  .priv_data_size = sizeof(BinDemuxContext),
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );     = bin_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = bintext_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = read_packet,
    //  .priv_class     = CLASS("Binary text demuxer",
};
#endif

#if CONFIG_XBIN_DEMUXER
AVInputFormat ff_xbin_demuxer = {
    //  .name           = "xbin",
    //  .long_name      = "eXtended BINary text (XBIN)",
    //  .priv_data_size = sizeof(BinDemuxContext),
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );     = xbin_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = xbin_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = read_packet,
    //  .priv_class     = CLASS("eXtended BINary text (XBIN) demuxer",
};
#endif

#if CONFIG_ADF_DEMUXER
AVInputFormat ff_adf_demuxer = {
    //  .name           = "adf",
    //  .long_name      = "Artworx Data Format",
    //  .priv_data_size = sizeof(BinDemuxContext),
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = adf_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = read_packet,
    //  .extensions     = "adf",
    //  .priv_class     = CLASS("Artworx Data Format demuxer",
};
#endif

#if CONFIG_IDF_DEMUXER
AVInputFormat ff_idf_demuxer = {
    //  .name           = "idf",
    //  .long_name      = "iCE Draw File",
    //  .priv_data_size = sizeof(BinDemuxContext),
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );     = idf_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = idf_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = read_packet,
    //  .extensions     = "idf",
    //  .priv_class     = CLASS("iCE Draw File demuxer",
};
#endif
