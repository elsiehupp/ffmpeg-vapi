/***********************************************************
Copyright (C) 2011-2013 Michael Niedermayer (michaelni@gmx.at)

This file is part of libswresample

libswresample is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

libswresample is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with libswresample; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
***********************************************************/
namespace LibSoftwareResample {

[CCode (cname="struct DitherContext",cheader_filename="subprojects/ffmpeg/libswresample/swresample_internal.h")]
[Compact]
internal class LibSoftwareResample.DitherContext {
    [CCode (cname="")]
    internal int method;

    [CCode (cname="")]
    internal int noise_pos;

    [CCode (cname="")]
    internal float scale;

    /***********************************************************
    Noise scale
    ***********************************************************/
    [CCode (cname="")]
    internal float noise_scale;

    /***********************************************************
    Noise shaping dither taps
    ***********************************************************/
    [CCode (cname="")]
    internal int ns_taps;

    /***********************************************************
    Noise shaping dither scale
    ***********************************************************/
    [CCode (cname="")]
    internal float ns_scale;

    /***********************************************************
    Noise shaping dither scale^-1
    ***********************************************************/
    [CCode (cname="")]
    internal float ns_scale_1;

    /***********************************************************
    Noise shaping dither position
    ***********************************************************/
    [CCode (cname="")]
    internal int ns_pos;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/swresample_internal.h")]
    internal const size_t NS_TAPS; // 20

    /***********************************************************
    Noise shaping filter coefficients
    ***********************************************************/
    [CCode (cname="")]
    internal float ns_coeffs[NS_TAPS];

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/swresample_internal.h")]
    internal const size_t SWR_CH_MAX; // 64

    [CCode (cname="")]
    internal float ns_errors[SWR_CH_MAX][2*NS_TAPS];

    /***********************************************************
    noise used for dithering
    ***********************************************************/
    [CCode (cname="")]
    internal LibSoftwareResample.AudioData noise;

    /***********************************************************
    temporary storage when writing into the input buffer isn't possible
    ***********************************************************/
    [CCode (cname="")]
    internal LibSoftwareResample.AudioData temp;

    /***********************************************************
    the number of used output bits, needed to scale dither correctly
    ***********************************************************/
    [CCode (cname="")]
    internal int output_sample_bits;
}

} // namespace LibSoftwareResample
