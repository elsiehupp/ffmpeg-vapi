/***********************************************************
Copyright (c) 2015 Paul B Mahol

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

[CCode (cname="struct MaskedMergeContext",cheader_filename="subprojects/ffmpeg/libavfilter/maskedmerge.h")]
[Compact]
public class MaskedMergeContext {
    [CCode (cname="class")]
    public AVClass av_class;

    [CCode (cname="")]
    public int width[4];

    [CCode (cname="")]
    public int height[4];

    [CCode (cname="")]
    public int linesize[4];

    [CCode (cname="")]
    public int nb_planes;

    [CCode (cname="")]
    public int planes;

    [CCode (cname="")]
    public int half;

    [CCode (cname="")]
    public int depth;

    [CCode (cname="")]
    public FFFrameSync fs;

    public delegate void MaskedMergeDelegate (
        uint8[] bsrc,
        uint8[] osrc,
        uint8[] msrc,
        uint8[] dst,
        ptrdiff_t blinesize,
        ptrdiff_t olinesize,
        ptrdiff_t mlinesize,
        ptrdiff_t dlinesize,
        int w,
        int h,
        int half,
        int shift
    );

    [CCode (cname="maskedmerge")]
    public MaskedMergeDelegate maskedmerge;

}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/maskedmerge.h")]
public void ff_maskedmerge_init_x86 (
    MaskedMergeContext? s
);

} // namespace LibAVFilter
