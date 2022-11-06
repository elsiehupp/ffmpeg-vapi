/*
 * WAV muxer
 * Copyright (c) 2001, 2002 Fabrice Bellard
 *
 * Sony Wave64 muxer
 * Copyright (c) 2012 Paul B Mahol
 *
 * WAV muxer RF64 support
 * Copyright (c) 2013 Daniel Verkamp <daniel@drv.nu>
 *
 * EBU Tech 3285 - Supplement 3 - Peak Envelope Chunk encoder
 * Copyright (c) 2014 Georg Lippitsch <georg.lippitsch@gmx.at>
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

#if CONFIG_WAV_MUXER
#define OFFSET(x) offsetof(WAVMuxContext, x)
#define ENC AV_OPT_FLAG_ENCODING_PARAM
static const AVOption options[] = {
    { "write_bext", "Write BEXT chunk.", OFFSET(write_bext), AV_OPT_TYPE_BOOL, { .i64 = 0 }, 0, 1, ENC },
    { "write_peak", "Write Peak Envelope chunk.",            OFFSET(write_peak), AV_OPT_TYPE_INT, { .i64 = 0 }, 0, 2, ENC, "peak" },
    { "off",        "Do not write peak chunk.",              0,                  AV_OPT_TYPE_CONST, { .i64 = PEAK_OFF  }, 0, 0, ENC, "peak" },
    { "on",         "Append peak chunk after wav data.",     0,                  AV_OPT_TYPE_CONST, { .i64 = PEAK_ON   }, 0, 0, ENC, "peak" },
    { "only",       "Write only peak chunk, omit wav data.", 0,                  AV_OPT_TYPE_CONST, { .i64 = PEAK_ONLY }, 0, 0, ENC, "peak" },
    { "rf64",       "Use RF64 header rather than RIFF for large files.",    OFFSET(rf64), AV_OPT_TYPE_INT,   { .i64 = RF64_NEVER  },-1, 1, ENC, "rf64" },
    { "auto",       "Write RF64 header if file grows large enough.",        0,            AV_OPT_TYPE_CONST, { .i64 = RF64_AUTO   }, 0, 0, ENC, "rf64" },
    { "always",     "Always write RF64 header regardless of file size.",    0,            AV_OPT_TYPE_CONST, { .i64 = RF64_ALWAYS }, 0, 0, ENC, "rf64" },
    { "never",      "Never write RF64 header regardless of file size.",     0,            AV_OPT_TYPE_CONST, { .i64 = RF64_NEVER  }, 0, 0, ENC, "rf64" },
    { "peak_block_size", "Number of audio samples used to generate each peak frame.",   OFFSET(peak_block_size), AV_OPT_TYPE_INT, { .i64 = 256 }, 0, 65536, ENC },
    { "peak_format",     "The format of the peak envelope data (1: uint8, 2: uint16).", OFFSET(peak_format), AV_OPT_TYPE_INT,     { .i64 = PEAK_FORMAT_UINT16 }, PEAK_FORMAT_UINT8, PEAK_FORMAT_UINT16, ENC },
    { "peak_ppv",        "Number of peak points per peak value (1 or 2).",              OFFSET(peak_ppv), AV_OPT_TYPE_INT, { .i64 = 2 }, 1, 2, ENC },
    { NULL },
};

static const AVClass wav_muxer_class = {
    .class_name = "WAV muxer",
    .item_name  = av_default_item_name,
    .option     = options,
    .version    = LIBAVUTIL_VERSION_INT,
};

AVOutputFormat ff_wav_muxer = {
    .name              = "wav",
    .long_name         = NULL_IF_CONFIG_SMALL("WAV / WAVE (Waveform Audio)"),
    .mime_type         = "audio/x-wav",
    .extensions        = "wav",
    .priv_data_size    = sizeof(WAVMuxContext),
    .audio_codec       = AV_CODEC_ID_PCM_S16LE,
    .video_codec       = AV_CODEC_ID_NONE,
    .write_header      = wav_write_header,
    .write_packet      = wav_write_packet,
    .write_trailer     = wav_write_trailer,
    .flags             = AVFMT_TS_NONSTRICT,
    .codec_tag         = (const AVCodecTag* const []){ ff_codec_wav_tags, 0 },
    .priv_class        = &wav_muxer_class,
};
#endif /* CONFIG_WAV_MUXER */

#if CONFIG_W64_MUXER
AVOutputFormat ff_w64_muxer = {
    .name              = "w64",
    .long_name         = NULL_IF_CONFIG_SMALL("Sony Wave64"),
    .extensions        = "w64",
    .priv_data_size    = sizeof(WAVMuxContext),
    .audio_codec       = AV_CODEC_ID_PCM_S16LE,
    .video_codec       = AV_CODEC_ID_NONE,
    .write_header      = w64_write_header,
    .write_packet      = wav_write_packet,
    .write_trailer     = w64_write_trailer,
    .flags             = AVFMT_TS_NONSTRICT,
    .codec_tag         = (const AVCodecTag* const []){ ff_codec_wav_tags, 0 },
};
#endif /* CONFIG_W64_MUXER */
