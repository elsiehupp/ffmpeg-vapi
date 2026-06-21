/***********************************************************
Copyright (c) 2003 Daniel Moreno <comac AT comac DOT darktech DOT org>
Copyright (c) 2010 Baptiste Coudurier
Copyright (c) 2012 Loren Merritt

This file is part of FFmpeg, ported from MPlayer.

FFmpeg is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

FFmpeg is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with FFmpeg; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
***********************************************************/

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/vf_hqdn3d.h")]
[Compact]
public class HQDN3DContext {
    [CCode (cname="")]
    public AVClass class;

    [CCode (cname="")]
    public int16[] coefs[4];

    [CCode (cname="")]
    public uint16[] line;

    [CCode (cname="")]
    public uint16[] frame_prev[3];

    [CCode (cname="")]
    public double strength[4];

    [CCode (cname="")]
    public int hsub;

    [CCode (cname="")]
    public int vsub;

    [CCode (cname="")]
    public int depth;

    public delegate void DenoiseRowDelegate (
        uint8[] src,
        uint8[] dst,
        uint16[] line_ant,
        uint16[] frame_ant,
        ptrdiff_t w,
        int16[] spatial,
        int16[] temporal
    );

    [CCode (cname="denoise_row")]
    public DenoiseRowDelegate denoise_row[17];

}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/vf_hqdn3d.h")]
public enum FooBar {
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/vf_hqdn3d.h")]
    LUMA_SPATIAL, // 0

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/vf_hqdn3d.h")]
    LUMA_TMP, // 1

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/vf_hqdn3d.h")]
    CHROMA_SPATIAL, // 2

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/vf_hqdn3d.h")]
    CHROMA_TMP; // 3
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/vf_hqdn3d.h")]
public void ff_hqdn3d_init_x86 (
    HQDN3DContext? hqdn3d
);
