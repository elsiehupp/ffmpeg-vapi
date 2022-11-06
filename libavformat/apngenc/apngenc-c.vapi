/*
 * APNG muxer
 * Copyright (c) 2015 Donny Yang
 *
 * first version by Donny Yang <work@kota.moe>
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

#define OFFSET(x) offsetof(APNGMuxContext, x)
#define ENC AV_OPT_FLAG_ENCODING_PARAM
static const AVOption options[] = {
    { "plays", "Number of times to play the output: 0 - infinite loop, 1 - no loop", OFFSET(plays),
      AV_OPT_TYPE_INT, { .i64 = 1 }, 0, UINT_MAX, ENC },
    { "final_delay", "Force delay after the last frame", OFFSET(last_delay),
      AV_OPT_TYPE_RATIONAL, { .dbl = 0 }, 0, USHRT_MAX, ENC },
    { NULL },
};

static const AVClass apng_muxer_class = {
    //  .class_name = "APNG muxer",
    //  .item_name  = av_default_item_name,
    //  .version    = LIBAVUTIL_VERSION_INT,
    //  .option     = options,
};

[CCode (cname="", cheader="")]
public class OutputFormat : AVOutputFormat ff_apng_muxer = {
    //  .name           = "apng",
    //  .long_name      = "Animated Portable Network Graphics",
    //  .mime_type      = "image/png",
    //  .extensions     = "apng",
    //  .priv_data_size = sizeof(APNGMuxContext),
    //  .audio_codec    = AV_CODEC_ID_NONE,
    //  .video_codec    = AV_CODEC_ID_APNG,
    [CCode (cname="apng_write_header", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );
    [CCode (cname="apng_write_packet", cheader="")]
    public abstract int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );
    [CCode (cname="", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    );  = apng_write_trailer,
    [CCode (cname="", cheader="")]
    public override void deinit (
        AVFormatContext format_context
    );         = apng_deinit,
    //  .priv_class     = &apng_muxer_class,
    //  .flags          = AVFMT_VARIABLE_FPS,
};
