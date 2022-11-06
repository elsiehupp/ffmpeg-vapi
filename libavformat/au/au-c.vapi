/*
 * AU muxer and demuxer
 * Copyright (c) 2001 Fabrice Bellard
 *
 * first version by Francois Revol <revol@free.fr>
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
 * Reference documents:
 * http://www.opengroup.org/public/pubs/external/auformat.html
 * http://www.goice.co.jp/member/mo/formats/au.html
 */

AVOutputFormat ff_au_muxer = {
    .name          = "au",
    .long_name     = NULL_IF_CONFIG_SMALL("Sun AU"),
    .mime_type     = "audio/basic",
    .extensions    = "au",
    .priv_data_size = sizeof(AUContext),
    .audio_codec   = AV_CODEC_ID_PCM_S16BE,
    .video_codec   = AV_CODEC_ID_NONE,
    .write_header  = au_write_header,
    .write_packet  = ff_raw_write_packet,
    .write_trailer = au_write_trailer,
    .codec_tag     = (const AVCodecTag* const []) { codec_au_tags, 0 },
    .flags         = AVFMT_NOTIMESTAMPS,
};

#endif /* CONFIG_AU_MUXER */
