/***********************************************************
Copyright (c) 2017 Ronald S. Bultje <rsbultje@gmail.com>
Copyright (c) 2017 Ashish Pratap Singh <ashk43712@gmail.com>

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
namespace LibAVFilter {

[CCode (cname="struct VMAFMotionDSPContext",cheader_filename="subprojects/ffmpeg/libavfilter/vmaf_motion.h")]
[Compact]
public class VMAFMotionDSPContext {
    public delegate uint64 SadDelegate (
        uint16[] img1,
        uint16[] img2,
        int w,
        int h,
        ptrdiff_t img1_stride,
        ptrdiff_t img2_stride
    );

    [CCode (cname="sad")]
    public SadDelegate sad;

    public delegate void ConvolutionXDelegate (
        uint16[] filter,
        int filt_w,
        uint16[] src,
        uint16[] dst,
        int w,
        int h,
        ptrdiff_t src_stride,
        ptrdiff_t dst_stride
    );

    [CCode (cname="convolution_x")]
    public ConvolutionXDelegate convolution_x;

    public delegate void ConvolutionYDelegate (
        uint16[] filter,
        int filt_w,
        uint8[] src,
        uint16[] dst,
        int w,
        int h,
        ptrdiff_t src_stride,
        ptrdiff_t dst_stride
    );

    [CCode (cname="convolution_y")]
    public ConvolutionYDelegate convolution_y;

}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/vmaf_motion.h")]
public void ff_vmafmotion_init_x86 (
    VMAFMotionDSPContext? dsp
);

[CCode (cname="struct VMAFMotionData",cheader_filename="subprojects/ffmpeg/libavfilter/vmaf_motion.h")]
[Compact]
public class VMAFMotionData {
    [CCode (cname="")]
    public uint16 filter[5];

    [CCode (cname="")]
    public int width;

    [CCode (cname="")]
    public int height;

    [CCode (cname="")]
    public ptrdiff_t stride;

    [CCode (cname="")]
    public uint16[] blur_data[2 /*cur, prev */];

    [CCode (cname="")]
    public uint16[] temp_data;

    [CCode (cname="")]
    public double motion_sum;

    [CCode (cname="")]
    public uint64 nb_frames;

    [CCode (cname="")]
    public VMAFMotionDSPContext vmafdsp;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/vmaf_motion.h")]
public int ff_vmafmotion_init (
    VMAFMotionData? data,
    int w,
    int h,
    LibAVUtil.PixelFormat fmt
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/vmaf_motion.h")]
public double ff_vmafmotion_process (
    VMAFMotionData? data,
    LibAVFormat.Frame? frame
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/vmaf_motion.h")]
public double ff_vmafmotion_uninit (
    VMAFMotionData? data
);

} // namespace LibAVFilter
