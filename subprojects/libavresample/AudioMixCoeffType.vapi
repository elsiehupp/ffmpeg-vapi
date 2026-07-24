/***********************************************************
Copyright (c) 2012 Justin Ruggles <justin.ruggles@gmail.com>

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
@ingroup lavr
external API header
***********************************************************/
namespace LibAVResample {

/***********************************************************
@deprecated use libswresample

Mixing Coefficient Types
***********************************************************/
[CCode (cheader_filename="subprojects/ffmpeg/libavresample/avresample.h")]
//  attribute_deprecated
public enum LibAVResample.AudioMixCoeffType {
    /***********************************************************
    16-bit 8.8 fixed-point
    ***********************************************************/
    [CCode (cname="AV_MIX_COEFF_TYPE_Q8")]
    Q8_FIXED_POINT,

    /***********************************************************
    32-bit 17.15 fixed-point
    ***********************************************************/
    [CCode (cname="AV_MIX_COEFF_TYPE_Q15")]
    Q15_FIXED_POINT,

    /***********************************************************
    floating-point
    ***********************************************************/
    [CCode (cname="AV_MIX_COEFF_TYPE_FLT")]
    FLOATING_POINT,

    /***********************************************************
    Number of coeff types. Not part of ABI
    ***********************************************************/
    NB;
}

} // namespace LibAVResample
