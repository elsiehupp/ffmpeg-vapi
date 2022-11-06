/*
 * Copyright (c) 2010 Reimar Döffinger
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

static const AVCodecTag codec_ivf_tags[] = {
    { AV_CODEC_ID_VP8,  MKTAG('V', 'P', '8', '0') },
    { AV_CODEC_ID_VP9,  MKTAG('V', 'P', '9', '0') },
    { AV_CODEC_ID_AV1,  MKTAG('A', 'V', '0', '1') },
    { AV_CODEC_ID_NONE, 0 }
};

AVOutputFormat ff_ivf_muxer = {
    .priv_data_size = sizeof(IVFEncContext),
    .name         = "ivf",
    .long_name    = NULL_IF_CONFIG_SMALL("On2 IVF"),
    .extensions   = "ivf",
    .audio_codec  = AV_CODEC_ID_NONE,
    .video_codec  = AV_CODEC_ID_VP8,
    .write_header = ivf_write_header,
    .write_packet = ivf_write_packet,
    .write_trailer = ivf_write_trailer,
    .check_bitstream = ivf_check_bitstream,
    .codec_tag    = (const AVCodecTag* const []){ codec_ivf_tags, 0 },
};
