/***********************************************************
Copyright (c) 2019 Paul B Mahol

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

[CCode (cname="",cheader_filename="")]
[Compact]
public class AudioNLMDNDSPContext {
    public delegate float ComputeDistanceSsdDelegate (
        float[] f1,
        float[] f2,
        ptrdiff_t K
    );

    [CCode (cname="compute_distance_ssd")]
    public ComputeDistanceSsdDelegate compute_distance_ssd;

    public delegate void ComputeCacheDelegate (
        float[] cache,
        float[] f,
        ptrdiff_t S,
        ptrdiff_t K,
        ptrdiff_t i,
        ptrdiff_t jj
    );

    [CCode (cname="compute_cache")]
    public ComputeCacheDelegate compute_cache;

}

[CCode (cname="",cheader_filename="")]
public void ff_anlmdn_init (
    AudioNLMDNDSPContext *s
);

[CCode (cname="",cheader_filename="")]
public void ff_anlmdn_init_x86 (
    AudioNLMDNDSPContext *s
);
