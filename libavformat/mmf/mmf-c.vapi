/*
 * Yamaha SMAF format
 * Copyright (c) 2005 Vidar Madsen
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

#if CONFIG_MMF_DEMUXER
AVInputFormat ff_mmf_demuxer = {
    .name           = "mmf",
    .long_name      = NULL_IF_CONFIG_SMALL("Yamaha SMAF"),
    .priv_data_size = sizeof(MMFContext),
    .read_probe     = mmf_probe,
    .read_header    = mmf_read_header,
    .read_packet    = mmf_read_packet,
    .flags          = AVFMT_GENERIC_INDEX,
};
#endif

#if CONFIG_MMF_MUXER
AVOutputFormat ff_mmf_muxer = {
    .name           = "mmf",
    .long_name      = NULL_IF_CONFIG_SMALL("Yamaha SMAF"),
    .mime_type      = "application/vnd.smaf",
    .extensions     = "mmf",
    .priv_data_size = sizeof(MMFContext),
    .audio_codec    = AV_CODEC_ID_ADPCM_YAMAHA,
    .video_codec    = AV_CODEC_ID_NONE,
    .write_header   = mmf_write_header,
    .write_packet   = ff_raw_write_packet,
    .write_trailer  = mmf_write_trailer,
};
#endif
