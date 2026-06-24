/***********************************************************
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

[CCode (cname="NLMeansDSPContext",cheader_filename="subprojects/ffmpeg/libavfilter/vf_nlmeans.h")]
[Compact]
public class NLMeansDSPContext {
    public delegate void ComputeSafeSsdIntegralImageDelegate (
        uint32[] dst,
        ptrdiff_t dst_linesize_32,
        uint8[] s1,
        ptrdiff_t linesize1,
        uint8[] s2,
        ptrdiff_t linesize2,
        int w,
        int h
    );

    [CCode (cname="compute_safe_ssd_integral_image")]
    public ComputeSafeSsdIntegralImageDelegate compute_safe_ssd_integral_image;
}

[CCode (cname="ff_nlmeans_init",cheader_filename="subprojects/ffmpeg/libavfilter/vf_nlmeans.h")]
public void ff_nlmeans_init (
    NLMeansDSPContext? dsp
);

[CCode (cname="ff_nlmeans_init_aarch64",cheader_filename="subprojects/ffmpeg/libavfilter/vf_nlmeans.h")]
public void ff_nlmeans_init_aarch64 (
    NLMeansDSPContext? dsp
);
