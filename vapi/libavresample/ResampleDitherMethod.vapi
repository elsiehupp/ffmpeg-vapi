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
***********************************************************/
[CCode (cprefix="AV_RESAMPLE_DITHER_",cheader_filename="subprojects/ffmpeg/libavresample/avresample.h")]
//  attribute_deprecated
public enum LibAVResample.ResampleDitherMethod {
    /***********************************************************
    Do not use dithering
    ***********************************************************/
    NONE,

    /***********************************************************
    Rectangular Dither
    ***********************************************************/
    RECTANGULAR,

    /***********************************************************
    Triangular Dither
    ***********************************************************/
    TRIANGULAR,

    /***********************************************************
    Triangular Dither with High Pass
    ***********************************************************/
    [CCode (cname="AV_RESAMPLE_DITHER_TRIANGULAR_HP")]
    TRIANGULAR_HIGH_PASS,

    /***********************************************************
    Triangular Dither with Noise Shaping
    ***********************************************************/
    [CCode (cname="AV_RESAMPLE_DITHER_TRIANGULAR_NS")]
    TRIANGULAR_NOISE_SHAPING,

    /***********************************************************
    Number of dither types. Not part of ABI.
    ***********************************************************/
    NB;
}

} // namespace LibAVResample
