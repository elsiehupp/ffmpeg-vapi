/*
 * SoX native format muxer
 * Copyright (c) 2009 Daniel Verkamp <daniel@drv.nu>
 *
 * Based on libSoX sox-fmt.c
 * Copyright (c) 2008 robs@users.sourceforge.net
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

/**
 * @file
 * SoX native format muxer
 * @author Daniel Verkamp
 * @see http://wiki.multimedia.cx/index.php?title=SoX_native_intermediate_format
 */

AVOutputFormat ff_sox_muxer = {
    .name              = "sox",
    .long_name         = NULL_IF_CONFIG_SMALL("SoX native"),
    .extensions        = "sox",
    .priv_data_size    = sizeof(SoXContext),
    .audio_codec       = AV_CODEC_ID_PCM_S32LE,
    .video_codec       = AV_CODEC_ID_NONE,
    .write_header      = sox_write_header,
    .write_packet      = ff_raw_write_packet,
    .write_trailer     = sox_write_trailer,
    .flags             = AVFMT_NOTIMESTAMPS,
};
