/***********************************************************
Copyright (c) 2015 Ronald S. Bultje <rsbultje@gmail.com>

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

[CCode (cname="struct SSIMDSPContext",cheader_filename="subprojects/ffmpeg/libavfilter/ssim.h")]
[Compact]
public class SSIMDSPContext {
    public delegate int SumDelegate ();

    public delegate void Ssim4x4LineDelegate (
        uint8[] buf,
        ptrdiff_t buf_stride,
        uint8[] ref,
        ptrdiff_t ref_stride,
        SumDelegate sums[4],
        int w
    );

    [CCode (cname="ssim_4x4_line")]
    public Ssim4x4LineDelegate ssim_4x4_line;

    public delegate float SsimEndLineDelegate (
        SumDelegate sum0[4],
        SumDelegate sum1[4],
        int w
    );

    [CCode (cname="ssim_end_line")]
    public SsimEndLineDelegate ssim_end_line;

}

[CCode (cname="ff_ssim_init_x86",cheader_filename="subprojects/ffmpeg/libavfilter/ssim.h")]
public void ff_ssim_init_x86 (
    SSIMDSPContext? dsp
);
