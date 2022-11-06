/*
 * MMS protocol over HTTP
 * Copyright (c) 2010 Zhentan Feng <spyfeng at gmail dot com>
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
 * Reference
 * Windows Media HTTP Streaming Protocol.
 * http://msdn.microsoft.com/en-us/library/cc251059(PROT.10).aspx
 */

const URLProtocol ff_mmsh_protocol = {
    .name           = "mmsh",
    .url_open       = mmsh_open,
    .url_read       = mmsh_read,
    .url_seek       = mmsh_seek,
    .url_close      = mmsh_close,
    .url_read_seek  = mmsh_read_seek,
    .priv_data_size = sizeof(MMSHContext),
    .flags          = URL_PROTOCOL_FLAG_NETWORK,
    .default_whitelist = "http,tcp",
};
