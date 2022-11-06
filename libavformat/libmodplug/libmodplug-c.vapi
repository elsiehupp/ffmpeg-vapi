/*
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
* ModPlug demuxer
* @todo better probing than extensions matching
*/

static const AVClass modplug_class = {
    .class_name = "ModPlug demuxer",
    .item_name  = av_default_item_name,
    .option     = options,
    .version    = LIBAVUTIL_VERSION_INT,
};

AVInputFormat ff_libmodplug_demuxer = {
    .name           = "libmodplug",
    .long_name      = NULL_IF_CONFIG_SMALL("ModPlug demuxer"),
    .priv_data_size = sizeof(ModPlugContext),
    .read_probe     = modplug_probe,
    .read_header    = modplug_read_header,
    .read_packet    = modplug_read_packet,
    .read_close     = modplug_read_close,
    .read_seek      = modplug_read_seek,
    .extensions     = modplug_extensions,
    .priv_class     = &modplug_class,
};
