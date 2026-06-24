/***********************************************************
Copyright (c) 2013 Georg Martius <georg dot martius at web dot de>

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

/***********************************************************
Conversion routines between libav* and vid.stab
***********************************************************/

/***********************************************************
Converts an AVPixelFormat to a VSPixelFormat.

@param[in] av_filter_context AVFilterContext used for logging
@param[in] pf  AVPixelFormat
@return    a corresponding VSPixelFormat
***********************************************************/
[CCode (cname="ff_av2vs_pixfmt",cheader_filename="subprojects/ffmpeg/libavfilter/vidstabutils.h")]
public VSPixelFormat ff_av2vs_pixfmt (
    AVFilterContext? av_filter_context,
    AVPixelFormat pf
);

/***********************************************************
Initialize libvidstab

Sets the memory allocation functions and logging constants to corresponding
av* versions.
***********************************************************/
[CCode (cname="ff_vs_init",cheader_filename="subprojects/ffmpeg/libavfilter/vidstabutils.h")]
public void ff_vs_init ();
