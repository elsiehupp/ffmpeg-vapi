/*
 * Image format
 * Copyright (c) 2000, 2001, 2002 Fabrice Bellard
 * Copyright (c) 2004 Michael Niedermayer
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

#define OFFSET(x) offsetof(VideoMuxData, x)
#define ENC AV_OPT_FLAG_ENCODING_PARAM
static const AVOption muxoptions[] = {
    { "update",       "continuously overwrite one file", OFFSET(update),  AV_OPT_TYPE_BOOL, { .i64 = 0 }, 0,       1, ENC },
    { "start_number", "set first number in the sequence", OFFSET(img_number), AV_OPT_TYPE_INT,  { .i64 = 1 }, 0, INT_MAX, ENC },
    { "strftime",     "use strftime for filename", OFFSET(use_strftime),  AV_OPT_TYPE_BOOL, { .i64 = 0 }, 0, 1, ENC },
    { "frame_pts",    "use current frame pts for filename", OFFSET(frame_pts),  AV_OPT_TYPE_BOOL, { .i64 = 0 }, 0, 1, ENC },
    { "atomic_writing", "write files atomically (using temporary files and renames)", OFFSET(use_rename), AV_OPT_TYPE_BOOL, { .i64 = 0 }, 0, 1, ENC },
    { NULL },
};

#if CONFIG_IMAGE2_MUXER
static const AVClass img2mux_class = {
    //  .class_name = "image2 muxer",
    //  .item_name  = av_default_item_name,
    //  .option     = muxoptions,
    //  .version    = LIBAVUTIL_VERSION_INT,
};

[CCode (cname="", cheader="")]
public class OutputFormat : AVOutputFormat ff_image2_muxer = {
    //  .name           = "image2",
    //  .long_name      = "image2 sequence",
    //  .extensions     = "bmp,dpx,jls,jpeg,jpg,ljpg,pam,pbm,pcx,pgm,pgmyuv,png,"
                      "ppm,sgi,tga,tif,tiff,jp2,j2c,j2k,xwd,sun,ras,rs,im1,im8,im24,"
                      "sunras,xbm,xface,pix,y",
    //  .priv_data_size = sizeof(VideoMuxData),
    //  .video_codec    = AV_CODEC_ID_MJPEG,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );   = write_header,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );   = write_packet,
    [CCode (cname="", cheader="")]
    public override int query_codec (
        LibAVCodec.CodecID id,
        int std_compliance
    );    = query_codec,
    //  .flags          = AVFMT_NOTIMESTAMPS | AVFMT_NODIMENSIONS | AVFMT_NOFILE,
    //  .priv_class     = &img2mux_class,
};
#endif
#if CONFIG_IMAGE2PIPE_MUXER
public class OutputFormat : AVOutputFormat ff_image2pipe_muxer = {
    //  .name           = "image2pipe",
    //  .long_name      = "piped image2 sequence",
    //  .priv_data_size = sizeof(VideoMuxData),
    //  .video_codec    = AV_CODEC_ID_MJPEG,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );   = write_header,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );   = write_packet,
    [CCode (cname="", cheader="")]
    public override int query_codec (
        LibAVCodec.CodecID id,
        int std_compliance
    );    = query_codec,
    //  .flags          = AVFMT_NOTIMESTAMPS | AVFMT_NODIMENSIONS
};
#endif
