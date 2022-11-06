/*
 * Copyright (c) 2013 Lukasz Marek <lukasz.m.luki@gmail.com>
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

const URLProtocol ff_ftp_protocol = {
    .name                = "ftp",
    .url_open            = ftp_open,
    .url_read            = ftp_read,
    .url_write           = ftp_write,
    .url_seek            = ftp_seek,
    .url_close           = ftp_close,
    .url_get_file_handle = ftp_get_file_handle,
    .url_shutdown        = ftp_shutdown,
    .priv_data_size      = sizeof(FTPContext),
    .priv_data_class     = &ftp_context_class,
    .url_open_dir        = ftp_open_dir,
    .url_read_dir        = ftp_read_dir,
    .url_close_dir       = ftp_close_dir,
    .url_delete          = ftp_delete,
    .url_move            = ftp_move,
    .flags               = URL_PROTOCOL_FLAG_NETWORK,
    .default_whitelist   = "tcp",
};
