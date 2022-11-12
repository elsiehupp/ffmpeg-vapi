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

public struct NLMeansDSPContext {
    void (*compute_safe_ssd_integral_image)(uint32 *dst, ptrdiff_t dst_linesize_32,
                                            uint8 *s1, ptrdiff_t linesize1,
                                            uint8 *s2, ptrdiff_t linesize2,
                                            int w, int h);
}

void ff_nlmeans_init (NLMeansDSPContext *dsp);
void ff_nlmeans_init_aarch64 (NLMeansDSPContext *dsp);
