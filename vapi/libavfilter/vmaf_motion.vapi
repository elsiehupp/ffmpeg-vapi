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

public struct VMAFMotionDSPContext {
    uint64 (*sad)(const uint16 *img1, uint16 *img2, int w, int h,
                    ptrdiff_t img1_stride, ptrdiff_t img2_stride);
    void (*convolution_x)(const uint16 *filter, int filt_w, uint16 *src,
                          uint16 *dst, int w, int h, ptrdiff_t src_stride,
                          ptrdiff_t dst_stride);
    void (*convolution_y)(const uint16 *filter, int filt_w, uint8 *src,
                          uint16 *dst, int w, int h, ptrdiff_t src_stride,
                          ptrdiff_t dst_stride);
}

void ff_vmafmotion_init_x86 (VMAFMotionDSPContext *dsp);

public struct VMAFMotionData {
    uint16 filter[5];
    int width;
    int height;
    ptrdiff_t stride;
    uint16 *blur_data[2 /***********************************************************
    cur, prev */];
    uint16 *temp_data;
    double motion_sum;
    uint64 nb_frames;
    VMAFMotionDSPContext vmafdsp;
}

int ff_vmafmotion_init (VMAFMotionData *data, int w, int h, AVPixelFormat fmt);
double ff_vmafmotion_process (VMAFMotionData *data, AVFrame *frame);
double ff_vmafmotion_uninit (VMAFMotionData *data);
