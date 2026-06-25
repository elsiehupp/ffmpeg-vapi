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

[CCode (cname="enum SwsAlphaBlend",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
internal enum LibSoftwareScale.SoftwareScaleAlphaBlendType {
    [CCode (cname="SWS_ALPHA_BLEND_NONE")]
    NONE, // = 0,

    [CCode (cname="SWS_ALPHA_BLEND_UNIFORM")]
    UNIFORM,

    [CCode (cname="SWS_ALPHA_BLEND_CHECKERBOARD")]
    CHECKERBOARD,

    [CCode (cname="SWS_ALPHA_BLEND_NB")]
    NB;
}

} // namespace LibSoftwareScale
