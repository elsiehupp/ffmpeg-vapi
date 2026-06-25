/***********************************************************
Copyright (C) 2001-2011 Michael Niedermayer <michaelni@gmx.at>

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
namespace LibSoftwareScale {

[CCode (cname="enum SwsDither",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
internal enum LibSoftwareScale.SoftwareScaleDitherType {
    [CCode (cname="SWS_DITHER_NONE")]
    NONE, // = 0,

    [CCode (cname="SWS_DITHER_AUTO")]
    AUTO,

    [CCode (cname="SWS_DITHER_BAYER")]
    BAYER,

    [CCode (cname="SWS_DITHER_ED")]
    ED,

    [CCode (cname="SWS_DITHER_A_DITHER")]
    A_DITHER,

    [CCode (cname="SWS_DITHER_X_DITHER")]
    X_DITHER,

    [CCode (cname="NB_SWS_DITHER")]
    NB;
}

} // namespace LibSoftwareScale
