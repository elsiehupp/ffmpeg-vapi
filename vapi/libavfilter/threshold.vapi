/***********************************************************
Copyright (c) 2016 Paul B Mahol

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

[CCode (cname="struct ThresholdContext",cheader_filename="subprojects/ffmpeg/libavfilter/threshold.h")]
[Compact]
public class ThresholdContext {
    [CCode (cname="class")]
    public AVClass av_class;

    [CCode (cname="")]
    public int depth;

    [CCode (cname="")]
    public int planes;

    [CCode (cname="")]
    public int bpc;

    [CCode (cname="")]
    public int nb_planes;

    [CCode (cname="")]
    public int width[4];

    [CCode (cname="")]
    public int height[4];

    [CCode (cname="")]
    public delegate void ThresholdDelegate (
        uint8[] in,
        int8[] threshold,
        uint8[] min,
        uint8[] max,
        uint8[] out,
        ptrdiff_t ilinesize,
        ptrdiff_t tlinesize,
        ptrdiff_t flinesize,
        ptrdiff_t slinesize,
        ptrdiff_t olinesize,
        int w,
        int h
    );

    [CCode (cname="")]
    public ThresholdDelegate threshold;

    [CCode (cname="")]
    public AVFrame frames[4];

    [CCode (cname="")]
    public FFFrameSync fs;

    [CCode (cname="")]
    public void ff_threshold_init (
        ThresholdContext? s
    );

    [CCode (cname="")]
    public void ff_threshold_init_x86 (
        ThresholdContext? s
    );

}

} // namespace LibAVFilter
