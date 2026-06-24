/***********************************************************
Copyright (c) 2016 Ronald S. Bultje <rsbultje@gmail.com>
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

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/colorspace.h")]
public const float REFERENCE_WHITE; // 100.0f

[CCode (cname="struct LumaCoefficients",cheader_filename="subprojects/ffmpeg/libavfilter/colorspace.h")]
[Compact]
public class LumaCoefficients {
    [CCode (cname="")]
    public double cr;

    [CCode (cname="")]
    public double cg;

    [CCode (cname="")]
    public double cb;
}

[CCode (cname="struct PrimaryCoefficients",cheader_filename="subprojects/ffmpeg/libavfilter/colorspace.h")]
[Compact]
public class PrimaryCoefficients {
    [CCode (cname="")]
    public double xr;

    [CCode (cname="")]
    public double yr;

    [CCode (cname="")]
    public double xg;

    [CCode (cname="")]
    public double yg;

    [CCode (cname="")]
    public double x;

    [CCode (cname="")]
    public double yb;
}

[CCode (cname="struct WhitepointCoefficients",cheader_filename="subprojects/ffmpeg/libavfilter/colorspace.h")]
[Compact]
public class WhitepointCoefficients {
    [CCode (cname="")]
    public double xw;

    [CCode (cname="")]
    public double yw;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/colorspace.h")]
public void ff_matrix_invert_3x3 (
    double in[3][3],
    double out[3][3]
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/colorspace.h")]
public void ff_matrix_mul_3x3 (
    double dst[3][3],
    double src1[3][3],
    double src2[3][3]
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/colorspace.h")]
public void ff_fill_rgb2xyz_table (
    PrimaryCoefficients? coeffs,
    WhitepointCoefficients? wp,
    double rgb2xyz[3][3]
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/colorspace.h")]
public LumaCoefficients? ff_get_luma_coefficients (
    AVColorSpace csp
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/colorspace.h")]
public void ff_fill_rgb2yuv_table (
    LumaCoefficients? coeffs,
    double rgb2yuv[3][3]
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/colorspace.h")]
public double ff_determine_signal_peak (
    AVFrame? in
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/colorspace.h")]
public void ff_update_hdr_metadata (
    AVFrame? in,
    double peak
);
