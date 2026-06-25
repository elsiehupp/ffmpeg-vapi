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

Resampling Filter Types
***********************************************************/
[CCode (cname="enum AVResampleFilterType",cheader_filename="subprojects/ffmpeg/libavresample/avresample.h")]
//  attribute_deprecated
public enum LibAVResample.ResampleFilterType {
    /***********************************************************
    Cubic
    ***********************************************************/
    [CCode (cname="AV_RESAMPLE_FILTER_TYPE_CUBIC")]
    CUBIC,

    /***********************************************************
    Blackman Nuttall Windowed Sinc
    ***********************************************************/
    [CCode (cname="AV_RESAMPLE_FILTER_TYPE_BLACKMAN_NUTTALL")]
    BLACKMAN_NUTTALL_WINDOWED_SINC,

    /***********************************************************
    Kaiser Windowed Sinc
    ***********************************************************/
    [CCode (cname="AV_RESAMPLE_FILTER_TYPE_KAISER")]
    KAISER_WINDOWED_SINC;
}

} // namespace LibAVResample
