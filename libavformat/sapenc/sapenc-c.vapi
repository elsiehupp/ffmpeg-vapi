/*
 * Session Announcement Protocol (RFC 2974) muxer
 * Copyright (c) 2010 Martin Storsjo
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

AVOutputFormat ff_sap_muxer = {
    .name              = "sap",
    .long_name         = NULL_IF_CONFIG_SMALL("SAP output"),
    .priv_data_size    = sizeof(struct SAPState),
    .audio_codec       = AV_CODEC_ID_AAC,
    .video_codec       = AV_CODEC_ID_MPEG4,
    .write_header      = sap_write_header,
    .write_packet      = sap_write_packet,
    .write_trailer     = sap_write_close,
    .flags             = AVFMT_NOFILE | AVFMT_GLOBALHEADER,
};
