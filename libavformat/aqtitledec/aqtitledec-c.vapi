/*
 * Copyright (c) 2012 Clément Bœsch
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
 * AQTitle subtitles format demuxer
 *
 * @see http://web.archive.org/web/20070210095721/http://www.volny.cz/aberka/czech/aqt.html
 * @see https://trac.annodex.net/wiki/AQTitle
 */

#define OFFSET(x) offsetof(AQTitleContext, x)
#define SD AV_OPT_FLAG_SUBTITLE_PARAM|AV_OPT_FLAG_DECODING_PARAM
static const AVOption aqt_options[] = {
    { "subfps", "set the movie frame rate", OFFSET(frame_rate), AV_OPT_TYPE_RATIONAL, {.dbl=25}, 0, INT_MAX, SD },
    { NULL }
};

static const AVClass aqt_class = {
    .class_name = "aqtdec",
    .item_name  = av_default_item_name,
    .option     = aqt_options,
    .version    = LIBAVUTIL_VERSION_INT,
};

AVInputFormat ff_aqtitle_demuxer = {
    .name           = "aqtitle",
    .long_name      = NULL_IF_CONFIG_SMALL("AQTitle subtitles"),
    .priv_data_size = sizeof(AQTitleContext),
    .read_probe     = aqt_probe,
    .read_header    = aqt_read_header,
    .read_packet    = aqt_read_packet,
    .read_seek2     = aqt_read_seek,
    .read_close     = aqt_read_close,
    .extensions     = "aqt",
    .priv_class     = &aqt_class,
};
