/*
 * MicroDVD subtitle demuxer
 * Copyright (c) 2010  Aurelien Jacobs <aurel@gnuage.org>
 * Copyright (c) 2012  Clément Bœsch <u pkh me>
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

#define OFFSET(x) offsetof(MicroDVDContext, x)
#define SD AV_OPT_FLAG_SUBTITLE_PARAM|AV_OPT_FLAG_DECODING_PARAM
static const AVOption microdvd_options[] = {
    { "subfps", "set the movie frame rate fallback", OFFSET(frame_rate), AV_OPT_TYPE_RATIONAL, {.dbl=0}, 0, INT_MAX, SD },
    { NULL }
};

static const AVClass microdvd_class = {
    .class_name = "microdvddec",
    .item_name  = av_default_item_name,
    .option     = microdvd_options,
    .version    = LIBAVUTIL_VERSION_INT,
};

AVInputFormat ff_microdvd_demuxer = {
    .name           = "microdvd",
    .long_name      = NULL_IF_CONFIG_SMALL("MicroDVD subtitle format"),
    .priv_data_size = sizeof(MicroDVDContext),
    .read_probe     = microdvd_probe,
    .read_header    = microdvd_read_header,
    .read_packet    = microdvd_read_packet,
    .read_seek2     = microdvd_read_seek,
    .read_close     = microdvd_read_close,
    .priv_class     = &microdvd_class,
};
