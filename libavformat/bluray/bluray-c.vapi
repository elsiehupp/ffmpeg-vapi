/*
 * BluRay (libbluray) protocol
 *
 * Copyright (c) 2012 Petri Hintukainen <phintuka <at> users.sourceforge.net>
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

#define OFFSET(x) offsetof(BlurayContext, x)
static const AVOption options[] = {
{"playlist", "", OFFSET(playlist), AV_OPT_TYPE_INT, { .i64=-1 }, -1,  99999, AV_OPT_FLAG_DECODING_PARAM },
{"angle",    "", OFFSET(angle),    AV_OPT_TYPE_INT, { .i64=0 },   0,   0xfe, AV_OPT_FLAG_DECODING_PARAM },
{"chapter",  "", OFFSET(chapter),  AV_OPT_TYPE_INT, { .i64=1 },   1, 0xfffe, AV_OPT_FLAG_DECODING_PARAM },
/*{"region",   "bluray player region code (1 = region A, 2 = region B, 4 = region C)", OFFSET(region), AV_OPT_TYPE_INT, { .i64=0 }, 0, 3, AV_OPT_FLAG_DECODING_PARAM },*/
{NULL}
};

static const AVClass bluray_context_class = {
    .class_name     = "bluray",
    .item_name      = av_default_item_name,
    .option         = options,
    .version        = LIBAVUTIL_VERSION_INT,
};

const URLProtocol ff_bluray_protocol = {
    .name            = "bluray",
    .url_close       = bluray_close,
    .url_open        = bluray_open,
    .url_read        = bluray_read,
    .url_seek        = bluray_seek,
    .priv_data_size  = sizeof(BlurayContext),
    .priv_data_class = &bluray_context_class,
};
