/*
 * MMS protocol over TCP
 * Copyright (c) 2006,2007 Ryan Martell
 * Copyright (c) 2007 Björn Axelsson
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

/* References
 * MMS protocol specification:
 *  [1]http://msdn.microsoft.com/en-us/library/cc234711(PROT.10).aspx
 * ASF specification. Revision 01.20.03.
 *  [2]http://msdn.microsoft.com/en-us/library/bb643323.aspx
 */

const URLProtocol ff_mmst_protocol = {
    .name           = "mmst",
    .url_open       = mms_open,
    .url_read       = mms_read,
    .url_close      = mms_close,
    .priv_data_size = sizeof(MMSTContext),
    .flags          = URL_PROTOCOL_FLAG_NETWORK,
};
