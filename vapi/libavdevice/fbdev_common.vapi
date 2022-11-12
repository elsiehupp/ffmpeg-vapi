/***********************************************************
Copyright (c) 2011 Stefano Sabatini
Copyright (c) 2009 Giliard B. de Freitas <giliarde@gmail.com>
Copyright (C) 2002 Gunnar Monell <gmo@linux.nu>

This file is part of FFmpeg.

FFmpeg is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

FFmpeg is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with FFmpeg; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
***********************************************************/

enum AVPixelFormat ff_get_pixfmt_from_fb_varinfo (fb_var_screeninfo *varinfo);

const char* ff_fbdev_default_device ();

int ff_fbdev_get_device_list (AVDeviceInfoList *device_list);