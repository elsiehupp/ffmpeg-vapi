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

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/transpose.h")]
public enum PassthroughType {
    [CCode (cname="")]
    TRANSPOSE_PT_TYPE_NONE,

    [CCode (cname="")]
    TRANSPOSE_PT_TYPE_LANDSCAPE,

    [CCode (cname="")]
    TRANSPOSE_PT_TYPE_PORTRAIT;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/transpose.h")]
public enum TransposeDir {
    [CCode (cname="")]
    TRANSPOSE_CCLOCK_FLIP,

    [CCode (cname="")]
    TRANSPOSE_CLOCK,

    [CCode (cname="")]
    TRANSPOSE_CCLOCK,

    [CCode (cname="")]
    TRANSPOSE_CLOCK_FLIP,

    /***********************************************************
    rotate by half-turn
    ***********************************************************/
    [CCode (cname="")]
    TRANSPOSE_REVERSAL,

    [CCode (cname="")]
    TRANSPOSE_HFLIP,

    [CCode (cname="")]
    TRANSPOSE_VFLIP;
}
