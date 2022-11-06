/*
 * WAV demuxer
 * Copyright (c) 2001, 2002 Fabrice Bellard
 *
 * Sony Wave64 demuxer
 * RF64 demuxer
 * Copyright (c) 2009 Daniel Verkamp
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

#if CONFIG_WAV_DEMUXER
#define OFFSET(x) offsetof(WAVDemuxContext, x)
#define DEC AV_OPT_FLAG_DECODING_PARAM
static const AVOption demux_options[] = {
    { "ignore_length", "Ignore length", OFFSET(ignore_length), AV_OPT_TYPE_BOOL, { .i64 = 0 }, 0, 1, DEC },
    { NULL },
};

static const AVClass wav_demuxer_class = {
    .class_name = "WAV demuxer",
    .item_name  = av_default_item_name,
    .option     = demux_options,
    .version    = LIBAVUTIL_VERSION_INT,
};
AVInputFormat ff_wav_demuxer = {
    .name           = "wav",
    .long_name      = NULL_IF_CONFIG_SMALL("WAV / WAVE (Waveform Audio)"),
    .priv_data_size = sizeof(WAVDemuxContext),
    .read_probe     = wav_probe,
    .read_header    = wav_read_header,
    .read_packet    = wav_read_packet,
    .read_seek      = wav_read_seek,
    .flags          = AVFMT_GENERIC_INDEX,
    .codec_tag      = (const AVCodecTag * const []) { ff_codec_wav_tags,  0 },
    .priv_class     = &wav_demuxer_class,
};
#endif /* CONFIG_WAV_DEMUXER */

#if CONFIG_W64_DEMUXER
AVInputFormat ff_w64_demuxer = {
    .name           = "w64",
    .long_name      = NULL_IF_CONFIG_SMALL("Sony Wave64"),
    .priv_data_size = sizeof(WAVDemuxContext),
    .read_probe     = w64_probe,
    .read_header    = w64_read_header,
    .read_packet    = wav_read_packet,
    .read_seek      = wav_read_seek,
    .flags          = AVFMT_GENERIC_INDEX,
    .codec_tag      = (const AVCodecTag * const []) { ff_codec_wav_tags, 0 },
};
#endif /* CONFIG_W64_DEMUXER */
