/*
 * MPEG-1/2 muxer
 * Copyright (c) 2000, 2001, 2002 Fabrice Bellard
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

#define OFFSET(x) offsetof(MpegMuxContext, x)
#define E AV_OPT_FLAG_ENCODING_PARAM
static const AVOption options[] = {
    { "muxrate", NULL,                                          OFFSET(user_mux_rate), AV_OPT_TYPE_INT, { .i64 = 0 }, 0, ((1<<22) - 1) * (8 * 50), E },
    { "preload", "Initial demux-decode delay in microseconds.", OFFSET(preload),  AV_OPT_TYPE_INT, { .i64 = 500000 }, 0, INT_MAX, E },
    { NULL },
};

#define MPEGENC_CLASS(flavor)                   \
static const AVClass flavor ## _class = {       \
    //  .class_name = #flavor " muxer",             \
    //  .item_name  = av_default_item_name,         \
    //  .version    = LIBAVUTIL_VERSION_INT,        \
    //  .option     = options,                      \
};

#if CONFIG_MPEG1SYSTEM_MUXER
MPEGENC_CLASS(mpeg)
public class OutputFormat : AVOutputFormat ff_mpeg1system_muxer = {
    //  .name              = "mpeg",
    //  .long_name         = "MPEG-1 Systems / MPEG program stream",
    //  .mime_type         = "video/mpeg",
    //  .extensions        = "mpg,mpeg",
    //  .priv_data_size    = sizeof(MpegMuxContext),
    //  .audio_codec       = AV_CODEC_ID_MP2,
    //  .video_codec       = AV_CODEC_ID_MPEG1VIDEO,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );      = mpeg_mux_init,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );      = mpeg_mux_write_packet,
    [CCode (cname="", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    );     = mpeg_mux_end,
    //  .priv_class        = &mpeg_class,
};
#endif

#if CONFIG_MPEG1VCD_MUXER
MPEGENC_CLASS(vcd)
public class OutputFormat : AVOutputFormat ff_mpeg1vcd_muxer = {
    //  .name              = "vcd",
    //  .long_name         = "MPEG-1 Systems / MPEG program stream (VCD)",
    //  .mime_type         = "video/mpeg",
    //  .priv_data_size    = sizeof(MpegMuxContext),
    //  .audio_codec       = AV_CODEC_ID_MP2,
    //  .video_codec       = AV_CODEC_ID_MPEG1VIDEO,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );      = mpeg_mux_init,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );      = mpeg_mux_write_packet,
    [CCode (cname="", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    );     = mpeg_mux_end,
    //  .priv_class        = &vcd_class,
};
#endif

#if CONFIG_MPEG2VOB_MUXER
MPEGENC_CLASS(vob)
public class OutputFormat : AVOutputFormat ff_mpeg2vob_muxer = {
    //  .name              = "vob",
    //  .long_name         = "MPEG-2 PS (VOB)",
    //  .mime_type         = "video/mpeg",
    //  .extensions        = "vob",
    //  .priv_data_size    = sizeof(MpegMuxContext),
    //  .audio_codec       = AV_CODEC_ID_MP2,
    //  .video_codec       = AV_CODEC_ID_MPEG2VIDEO,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );      = mpeg_mux_init,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );      = mpeg_mux_write_packet,
    [CCode (cname="", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    );     = mpeg_mux_end,
    //  .priv_class        = &vob_class,
};
#endif

/* Same as mpeg2vob_mux except that the pack size is 2324 */
#if CONFIG_MPEG2SVCD_MUXER
MPEGENC_CLASS(svcd)
public class OutputFormat : AVOutputFormat ff_mpeg2svcd_muxer = {
    //  .name              = "svcd",
    //  .long_name         = "MPEG-2 PS (SVCD)",
    //  .mime_type         = "video/mpeg",
    //  .extensions        = "vob",
    //  .priv_data_size    = sizeof(MpegMuxContext),
    //  .audio_codec       = AV_CODEC_ID_MP2,
    //  .video_codec       = AV_CODEC_ID_MPEG2VIDEO,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );      = mpeg_mux_init,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );      = mpeg_mux_write_packet,
    [CCode (cname="", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    );     = mpeg_mux_end,
    //  .priv_class        = &svcd_class,
};
#endif

/*  Same as mpeg2vob_mux except the 'is_dvd' flag is set to produce NAV pkts */
#if CONFIG_MPEG2DVD_MUXER
MPEGENC_CLASS(dvd)
public class OutputFormat : AVOutputFormat ff_mpeg2dvd_muxer = {
    //  .name              = "dvd",
    //  .long_name         = "MPEG-2 PS (DVD VOB)",
    //  .mime_type         = "video/mpeg",
    //  .extensions        = "dvd",
    //  .priv_data_size    = sizeof(MpegMuxContext),
    //  .audio_codec       = AV_CODEC_ID_MP2,
    //  .video_codec       = AV_CODEC_ID_MPEG2VIDEO,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );      = mpeg_mux_init,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );      = mpeg_mux_write_packet,
    [CCode (cname="", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    );     = mpeg_mux_end,
    //  .priv_class        = &dvd_class,
};
#endif
