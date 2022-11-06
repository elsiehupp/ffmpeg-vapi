/*
 * raw FLAC muxer
 * Copyright (c) 2006-2009 Justin Ruggles
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

static const AVOption flacenc_options[] = {
    { "write_header", "Write the file header", offsetof(FlacMuxerContext, write_header), AV_OPT_TYPE_BOOL, {.i64 = 1}, 0, 1, AV_OPT_FLAG_ENCODING_PARAM },
    { NULL },
};

static const AVClass flac_muxer_class = {
    .class_name = "flac muxer",
    .item_name  = av_default_item_name,
    .option     = flacenc_options,
    .version    = LIBAVUTIL_VERSION_INT,
};

AVOutputFormat ff_flac_muxer = {
    .name              = "flac",
    .long_name         = NULL_IF_CONFIG_SMALL("raw FLAC"),
    .priv_data_size    = sizeof(FlacMuxerContext),
    .mime_type         = "audio/x-flac",
    .extensions        = "flac",
    .audio_codec       = AV_CODEC_ID_FLAC,
    .video_codec       = AV_CODEC_ID_PNG,
    .init              = flac_init,
    .write_header      = flac_write_header,
    .write_packet      = flac_write_packet,
    .write_trailer     = flac_write_trailer,
    .flags             = AVFMT_NOTIMESTAMPS,
    .priv_class        = &flac_muxer_class,
};
