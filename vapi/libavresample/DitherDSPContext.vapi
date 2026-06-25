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
namespace LibAVResample {

[CCode (cname="struct DitherDSPContext",cheader_filename="subprojects/ffmpeg/libavresample/dither.h")]
[Compact]
internal class LibAVResample.DitherDSPContext {
    internal delegate void QuantizeDelegate (
        int16[] dst,
        float[] src,
        float[] dither,
        int len
    );

    /***********************************************************
    Convert samples from flt to s16 with added dither noise.

    @param dst    destination float array, range -0.5 to 0.5
    @param src    source int array, range int.MIN to int.MAX.
    @param dither float dither noise array
    @param len    number of samples
    ***********************************************************/
    [CCode (cname="quantize")]
    internal QuantizeDelegate quantize;

    /***********************************************************
    src and dst constraints for quantize ()
    ***********************************************************/
    [CCode (cname="")]
    internal int ptr_align;

    /***********************************************************
    len constraints for quantize ()
    ***********************************************************/
    [CCode (cname="")]
    internal int samples_align;

    /***********************************************************
    Convert dither noise from int to float with triangular distribution.

    @param dst  destination float array, range -0.5 to 0.5
                constraints: 32-byte aligned
    @param src0 source int array, range int.MIN to int.MAX.
                the array size is len * 2
                constraints: 32-byte aligned
    @param len  number of output noise samples
                constraints: multiple of 16
    ***********************************************************/
    [CCode (cname="")]
    internal delegate void DitherIntToFloatDelegate (
        out float[] dst,
        int[] src0,
        int len
    );

    [CCode (cname="dither_int_to_float")]
    internal DitherIntToFloatDelegate dither_int_to_float;

    /***********************************************************
    arch-specific initialization functions
    ***********************************************************/

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/dither.h")]
    internal void ff_dither_init_x86 (
        LibAVResample.DitherDSPContext? ddsp,
        LibAVResample.ResampleDitherMethod method
    );

}

} // namespace LibAVResample
