/*
 * IEC 61937 muxer
 * Copyright (c) 2009 Bartlomiej Wolowiec
 * Copyright (c) 2010 Anssi Hannula
 * Copyright (c) 2010 Carl Eugen Hoyos
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
 * IEC-61937 encapsulation of various formats, used by S/PDIF
 * @author Bartlomiej Wolowiec
 * @author Anssi Hannula
 * @author Carl Eugen Hoyos
 */

/*
 * Terminology used in specification:
 * data-burst - IEC61937 frame, contains header and encapsuled frame
 * burst-preamble - IEC61937 frame header, contains 16-bit words named Pa, Pb, Pc and Pd
 * burst-payload - encapsuled frame
 * Pa, Pb - syncword - 0xF872, 0x4E1F
 * Pc - burst-info, contains data-type (bits 0-6), error flag (bit 7), data-type-dependent info (bits 8-12)
 *      and bitstream number (bits 13-15)
 * data-type - determines type of encapsuled frames
 * Pd - length code (number of bits or bytes of encapsuled frame - according to data_type)
 *
 * IEC 61937 frames at normal usage start every specific count of bytes,
 *      dependent from data-type (spaces between packets are filled by zeros)
 */

static const AVOption options[] = {
{ "spdif_flags", "IEC 61937 encapsulation flags", offsetof(IEC61937Context, spdif_flags), AV_OPT_TYPE_FLAGS, {.i64 = 0}, 0, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM, "spdif_flags" },
{ "be", "output in big-endian format (for use as s16be)", 0, AV_OPT_TYPE_CONST, {.i64 = SPDIF_FLAG_BIGENDIAN},  0, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM, "spdif_flags" },
{ "dtshd_rate", "mux complete DTS frames in HD mode at the specified IEC958 rate (in Hz, default 0=disabled)", offsetof(IEC61937Context, dtshd_rate), AV_OPT_TYPE_INT, {.i64 = 0}, 0, 768000, AV_OPT_FLAG_ENCODING_PARAM },
{ "dtshd_fallback_time", "min secs to strip HD for after an overflow (-1: till the end, default 60)", offsetof(IEC61937Context, dtshd_fallback), AV_OPT_TYPE_INT, {.i64 = 60}, -1, INT_MAX, AV_OPT_FLAG_ENCODING_PARAM },
{ NULL },
};

static const AVClass spdif_class = {
    .class_name     = "spdif",
    .item_name      = av_default_item_name,
    .option         = options,
    .version        = LIBAVUTIL_VERSION_INT,
};

AVOutputFormat ff_spdif_muxer = {
    .name              = "spdif",
    .long_name         = NULL_IF_CONFIG_SMALL("IEC 61937 (used on S/PDIF - IEC958)"),
    .extensions        = "spdif",
    .priv_data_size    = sizeof(IEC61937Context),
    .audio_codec       = AV_CODEC_ID_AC3,
    .video_codec       = AV_CODEC_ID_NONE,
    .write_header      = spdif_write_header,
    .write_packet      = spdif_write_packet,
    .write_trailer     = spdif_write_trailer,
    .flags             = AVFMT_NOTIMESTAMPS,
    .priv_class        = &spdif_class,
};
