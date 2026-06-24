/***********************************************************
Copyright (c) 2007 Benoit Fouet
Copyright (c) 2010 Stefano Sabatini

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

[CCode (cname="struct FlipContext",cheader_filename="subprojects/ffmpeg/libavfilter/hflip.h")]
[Compact]
public class FlipContext {
    [CCode (cname="class")]
    public AVClass av_class;

    /***********************************************************
    max pixel step for each plane, expressed as a number of bytes
    ***********************************************************/
    [CCode (cname="")]
    public int max_step[4];

    /***********************************************************
    width of each plane
    ***********************************************************/
    [CCode (cname="")]
    public int planewidth[4];

    /***********************************************************
    height of each plane
    ***********************************************************/
    [CCode (cname="")]
    public int planeheight[4];

    public delegate void FlipLineDelegate (
        uint8[] src,
        uint8[] dst,
        int w
    );

    [CCode (cname="flip_line")]
    public FlipLineDelegate flip_line[4];

}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/hflip.h")]
public int ff_hflip_init (
    FlipContext? s,
    int step[4],
    int nb_planes
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/hflip.h")]
public void ff_hflip_init_x86 (
    FlipContext? s,
    int step[4],
    int nb_planes
);
