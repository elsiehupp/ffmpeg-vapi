/*
 * Flash Compatible Streaming Format muxer
 * Copyright (c) 2000 Fabrice Bellard
 * Copyright (c) 2003 Tinic Uro
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

#if CONFIG_SWF_MUXER
AVOutputFormat ff_swf_muxer = {
    .name              = "swf",
    .long_name         = NULL_IF_CONFIG_SMALL("SWF (ShockWave Flash)"),
    .mime_type         = "application/x-shockwave-flash",
    .extensions        = "swf",
    .priv_data_size    = sizeof(SWFContext),
    .audio_codec       = AV_CODEC_ID_MP3,
    .video_codec       = AV_CODEC_ID_FLV1,
    .write_header      = swf_write_header,
    .write_packet      = swf_write_packet,
    .write_trailer     = swf_write_trailer,
    .flags             = AVFMT_TS_NONSTRICT,
};
#endif
#if CONFIG_AVM2_MUXER
AVOutputFormat ff_avm2_muxer = {
    .name              = "avm2",
    .long_name         = NULL_IF_CONFIG_SMALL("SWF (ShockWave Flash) (AVM2)"),
    .mime_type         = "application/x-shockwave-flash",
    .priv_data_size    = sizeof(SWFContext),
    .audio_codec       = AV_CODEC_ID_MP3,
    .video_codec       = AV_CODEC_ID_FLV1,
    .write_header      = swf_write_header,
    .write_packet      = swf_write_packet,
    .write_trailer     = swf_write_trailer,
    .flags             = AVFMT_TS_NONSTRICT,
};
#endif
