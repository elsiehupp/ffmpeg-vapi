/*
 * MOV demuxer
 * Copyright (c) 2001 Fabrice Bellard
 * Copyright (c) 2009 Baptiste Coudurier <baptiste dot coudurier at gmail dot com>
 *
 * first version by Francois Revol <revol@free.fr>
 * seek function by Gael Chardon <gael.dev@4now.net>
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

#define OFFSET(x) offsetof(MOVContext, x)
#define FLAGS AV_OPT_FLAG_VIDEO_PARAM | AV_OPT_FLAG_DECODING_PARAM
static const AVOption mov_options[] = {
    {"use_absolute_path",
        "allow using absolute path when opening alias, this is a possible security issue",
        OFFSET(use_absolute_path), AV_OPT_TYPE_BOOL, {.i64 = 0},
        0, 1, FLAGS},
    {"seek_streams_individually",
        "Seek each stream individually to the to the closest point",
        OFFSET(seek_individually), AV_OPT_TYPE_BOOL, { .i64 = 1 },
        0, 1, FLAGS},
    {"ignore_editlist", "Ignore the edit list atom.", OFFSET(ignore_editlist), AV_OPT_TYPE_BOOL, {.i64 = 0},
        0, 1, FLAGS},
    {"advanced_editlist",
        "Modify the AVIndex according to the editlists. Use this option to decode in the order specified by the edits.",
        OFFSET(advanced_editlist), AV_OPT_TYPE_BOOL, {.i64 = 1},
        0, 1, FLAGS},
    {"ignore_chapters", "", OFFSET(ignore_chapters), AV_OPT_TYPE_BOOL, {.i64 = 0},
        0, 1, FLAGS},
    {"use_mfra_for",
        "use mfra for fragment timestamps",
        OFFSET(use_mfra_for), AV_OPT_TYPE_INT, {.i64 = FF_MOV_FLAG_MFRA_AUTO},
        -1, FF_MOV_FLAG_MFRA_PTS, FLAGS,
        "use_mfra_for"},
    {"auto", "auto", 0, AV_OPT_TYPE_CONST, {.i64 = FF_MOV_FLAG_MFRA_AUTO}, 0, 0,
        FLAGS, "use_mfra_for" },
    {"dts", "dts", 0, AV_OPT_TYPE_CONST, {.i64 = FF_MOV_FLAG_MFRA_DTS}, 0, 0,
        FLAGS, "use_mfra_for" },
    {"pts", "pts", 0, AV_OPT_TYPE_CONST, {.i64 = FF_MOV_FLAG_MFRA_PTS}, 0, 0,
        FLAGS, "use_mfra_for" },
    { "export_all", "Export unrecognized metadata entries", OFFSET(export_all),
        AV_OPT_TYPE_BOOL, { .i64 = 0 }, 0, 1, .flags = FLAGS },
    { "export_xmp", "Export full XMP metadata", OFFSET(export_xmp),
        AV_OPT_TYPE_BOOL, { .i64 = 0 }, 0, 1, .flags = FLAGS },
    { "activation_bytes", "Secret bytes for Audible AAX files", OFFSET(activation_bytes),
        AV_OPT_TYPE_BINARY, .flags = AV_OPT_FLAG_DECODING_PARAM },
    { "audible_fixed_key", // extracted from libAAX_SDK.so and AAXSDKWin.dll files!
        "Fixed key used for handling Audible AAX files", OFFSET(audible_fixed_key),
        AV_OPT_TYPE_BINARY, {.str="77214d4b196a87cd520045fd20a51d67"},
        .flags = AV_OPT_FLAG_DECODING_PARAM },
    { "decryption_key", "The media decryption key (hex)", OFFSET(decryption_key), AV_OPT_TYPE_BINARY, .flags = AV_OPT_FLAG_DECODING_PARAM },
    { "enable_drefs", "Enable external track support.", OFFSET(enable_drefs), AV_OPT_TYPE_BOOL,
        {.i64 = 0}, 0, 1, FLAGS },

    { NULL },
};

static const AVClass mov_class = {
    .class_name = "mov,mp4,m4a,3gp,3g2,mj2",
    .item_name  = av_default_item_name,
    .option     = mov_options,
    .version    = LIBAVUTIL_VERSION_INT,
};

AVInputFormat ff_mov_demuxer = {
    .name           = "mov,mp4,m4a,3gp,3g2,mj2",
    .long_name      = NULL_IF_CONFIG_SMALL("QuickTime / MOV"),
    .priv_class     = &mov_class,
    .priv_data_size = sizeof(MOVContext),
    .extensions     = "mov,mp4,m4a,3gp,3g2,mj2",
    .read_probe     = mov_probe,
    .read_header    = mov_read_header,
    .read_packet    = mov_read_packet,
    .read_close     = mov_read_close,
    .read_seek      = mov_read_seek,
    .flags          = AVFMT_NO_BYTE_SEEK | AVFMT_SEEK_TO_PTS,
};
