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

[CCode (cname="",cheader_filename="")]
[Compact]
public class LimiterDSPContext {
    public delegate void LimiterDelegate (
        uint8[] src,
        uint8[] dst,
        ptrdiff_t slinesize,
        ptrdiff_t dlinesize,
        int w,
        int h,
        int min,
        int max
    );

    [CCode (cname="limiter")]
    public LimiterDelegate limiter;

}

[CCode (cname="",cheader_filename="")]
public void ff_limiter_init_x86 (
    LimiterDSPContext *dsp,
    int bpp
);
