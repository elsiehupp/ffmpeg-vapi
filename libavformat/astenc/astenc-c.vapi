/*
 * AST muxer
 * Copyright (c) 2012 James Almer
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

#define OFFSET(obj) offsetof(ASTMuxContext, obj)
static const AVOption options[] = {
  { "loopstart", "Loopstart position in milliseconds.", OFFSET(loopstart), AV_OPT_TYPE_INT64, { .i64 = -1 }, -1, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM },
  { "loopend",   "Loopend position in milliseconds.",   OFFSET(loopend),   AV_OPT_TYPE_INT64, { .i64 = 0 }, 0, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM },
  { NULL },
};

static const AVClass ast_muxer_class = {
    //  .class_name = "AST muxer",
    //  .item_name  = av_default_item_name,
    //  .option     = options,
    //  .version    = LIBAVUTIL_VERSION_INT,
};

AVOutputFormat ff_ast_muxer = {
    //  .name              = "ast",
    //  .long_name         = "AST (Audio Stream)",
    //  .extensions        = "ast",
    //  .priv_data_size    = sizeof(ASTMuxContext),
    //  .audio_codec       = AV_CODEC_ID_PCM_S16BE_PLANAR,
    //  .video_codec       = AV_CODEC_ID_NONE,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );      = ast_write_header,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );      = ast_write_packet,
    [CCode (cname="", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    );     = ast_write_trailer,
    //  .priv_class        = &ast_muxer_class,
    //  .codec_tag         = (const AVCodecTag* const []){ff_codec_ast_tags, 0},
};
