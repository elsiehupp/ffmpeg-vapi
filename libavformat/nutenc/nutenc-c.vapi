/*
 * nut muxer
 * Copyright (c) 2004-2007 Michael Niedermayer
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

#define OFFSET(x) offsetof(NUTContext, x)
#define E AV_OPT_FLAG_ENCODING_PARAM
static const AVOption options[] = {
    { "syncpoints",  "NUT syncpoint behaviour",                         OFFSET(flags), AV_OPT_TYPE_FLAGS, {.i64 = 0},             INT_MIN, INT_MAX, E, "syncpoints" },
    { "default",     "",                                                0,             AV_OPT_TYPE_CONST, {.i64 = 0},             INT_MIN, INT_MAX, E, "syncpoints" },
    { "none",        "Disable syncpoints, low overhead and unseekable", 0,             AV_OPT_TYPE_CONST, {.i64 = NUT_PIPE},      INT_MIN, INT_MAX, E, "syncpoints" },
    { "timestamped", "Extend syncpoints with a wallclock timestamp",    0,             AV_OPT_TYPE_CONST, {.i64 = NUT_BROADCAST}, INT_MIN, INT_MAX, E, "syncpoints" },
    { "write_index", "Write index",                               OFFSET(write_index), AV_OPT_TYPE_BOOL,  {.i64 = 1},                   0,       1, E, },
    { NULL },
};

static const AVClass class = {
    .class_name = "nutenc",
    .item_name  = av_default_item_name,
    .option     = options,
    .version    = LIBAVUTIL_VERSION_INT,
};

AVOutputFormat ff_nut_muxer = {
    .name           = "nut",
    .long_name      = NULL_IF_CONFIG_SMALL("NUT"),
    .mime_type      = "video/x-nut",
    .extensions     = "nut",
    .priv_data_size = sizeof(NUTContext),
    .audio_codec    = CONFIG_LIBVORBIS ? AV_CODEC_ID_VORBIS :
                      CONFIG_LIBMP3LAME ? AV_CODEC_ID_MP3 : AV_CODEC_ID_MP2,
    .video_codec    = AV_CODEC_ID_MPEG4,
    .write_header   = nut_write_header,
    .write_packet   = nut_write_packet,
    .write_trailer  = nut_write_trailer,
    .deinit         = nut_write_deinit,
    .flags          = AVFMT_GLOBALHEADER | AVFMT_VARIABLE_FPS,
    .codec_tag      = ff_nut_codec_tags,
    .priv_class     = &class,
};
