/*
 * General DV demuxer
 * Copyright (c) 2003 Roman Shaposhnik
 *
 * Many thanks to Dan Dennedy <dan@dennedy.org> for providing wealth
 * of DV technical info.
 *
 * Raw DV format
 * Copyright (c) 2002 Fabrice Bellard
 *
 * 50 Mbps (DVCPRO50) and 100 Mbps (DVCPRO HD) support
 * Copyright (c) 2006 Daniel Maas <dmaas@maasdigital.com>
 * Funded by BBC Research & Development
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

AVInputFormat ff_dv_demuxer = {
    .name           = "dv",
    .long_name      = NULL_IF_CONFIG_SMALL("DV (Digital Video)"),
    .priv_data_size = sizeof(RawDVContext),
    .read_probe     = dv_probe,
    .read_header    = dv_read_header,
    .read_packet    = dv_read_packet,
    .read_close     = dv_read_close,
    .read_seek      = dv_read_seek,
    .extensions     = "dv,dif",
};
