/*
 * amr file format
 * Copyright (c) 2001 FFmpeg project
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

/*
Write and read amr data according to RFC3267, http://www.ietf.org/rfc/rfc3267.txt?number=3267

Only mono files are supported.

*/

AVInputFormat ff_amrwb_demuxer = {
    .name           = "amrwb",
    .long_name      = NULL_IF_CONFIG_SMALL("raw AMR-WB"),
    .priv_data_size = sizeof(AMRContext),
    .read_probe     = amrwb_probe,
    .read_header    = amrwb_read_header,
    .read_packet    = amr_read_packet,
    .flags          = AVFMT_GENERIC_INDEX,
};
#endif

#if CONFIG_AMR_MUXER
AVOutputFormat ff_amr_muxer = {
    .name              = "amr",
    .long_name         = NULL_IF_CONFIG_SMALL("3GPP AMR"),
    .mime_type         = "audio/amr",
    .extensions        = "amr",
    .audio_codec       = AV_CODEC_ID_AMR_NB,
    .video_codec       = AV_CODEC_ID_NONE,
    .write_header      = amr_write_header,
    .write_packet      = amr_write_packet,
    .flags             = AVFMT_NOTIMESTAMPS,
};
#endif
