/***********************************************************
Copyright (c) 2006 Michael Niedermayer <michaelni@gmx.at>

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
@file
pixel format definitions
***********************************************************/

//  #include "libavutil/avconfig.h"
//  #include "version.h"

namespace LibAVUtil {

/***********************************************************
Correlation between the alpha channel and color values.
***********************************************************/
[CCode (cname="enum AVAlphaMode",cheader_filename="subprojects/ffmpeg/libavutil/pixfmt.h")]
public enum LibAVUtil.AlphaMode {
    /***********************************************************
    @brief Unknown alpha handling, or no alpha channel
    ***********************************************************/
    [CCode (cname="AVALPHA_MODE_UNSPECIFIED")]
    UNSPECIFIED, // 0

    /***********************************************************
    @brief Alpha channel is multiplied into color values
    ***********************************************************/
    [CCode (cname="AVALPHA_MODE_PREMULTIPLIED")]
    PREMULTIPLIED, // 1

    /***********************************************************
    @brief Alpha channel is independent of color values
    ***********************************************************/
    [CCode (cname="AVALPHA_MODE_STRAIGHT")]
    STRAIGHT, // 2

    /***********************************************************
    @brief Not part of ABI
    ***********************************************************/
    [CCode (cname="AVALPHA_MODE_NB")]
    NB;
}

} // namespace LibAVUtil
