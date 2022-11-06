/*
 * Animated GIF muxer
 * Copyright (c) 2000 Fabrice Bellard
 *
 * first version by Francois Revol <revol@free.fr>
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

#define OFFSET(x) offsetof(GIFContext, x)
#define ENC AV_OPT_FLAG_ENCODING_PARAM
static const AVOption options[] = {
    { "loop", "Number of times to loop the output: -1 - no loop, 0 - infinite loop", OFFSET(loop),
      AV_OPT_TYPE_INT, { .i64 = 0 }, -1, 65535, ENC },
    { "final_delay", "Force delay (in centiseconds) after the last frame", OFFSET(last_delay),
      AV_OPT_TYPE_INT, { .i64 = -1 }, -1, 65535, ENC },
    { NULL },
};

static const AVClass gif_muxer_class = {
    //  .class_name = "GIF muxer",
    //  .item_name  = av_default_item_name,
    //  .version    = LIBAVUTIL_VERSION_INT,
    //  .option     = options,
};

[CCode (cname="", cheader="")]
public class OutputFormat : AVOutputFormat ff_gif_muxer = {
    //  .name           = "gif",
    //  .long_name      = "CompuServe Graphics Interchange Format (GIF)",
    //  .mime_type      = "image/gif",
    //  .extensions     = "gif",
    //  .priv_data_size = sizeof(GIFContext),
    //  .audio_codec    = AV_CODEC_ID_NONE,
    //  .video_codec    = AV_CODEC_ID_GIF,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );   = gif_write_header,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );   = gif_write_packet,
    [CCode (cname="", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    );  = gif_write_trailer,
    //  .priv_class     = &gif_muxer_class,
    //  .flags          = AVFMT_VARIABLE_FPS,
};
