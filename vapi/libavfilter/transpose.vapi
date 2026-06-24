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
namespace LibAVFilter {

[CCode (cname="enum PassthroughType",cprefix="TRANSPOSE_PT_TYPE_",cheader_filename="subprojects/ffmpeg/libavfilter/transpose.h")]
public enum PassthroughType {
    NONE,
    LANDSCAPE,
    PORTRAIT;
}

[CCode (cname="enum TransposeDir",cheader_filename="subprojects/ffmpeg/libavfilter/transpose.h")]
public enum TransposeDirection {
    [CCode (cname="TRANSPOSE_CCLOCK_FLIP")]
    COUNTER_CLOCKWISE_FLIP,

    [CCode (cname="TRANSPOSE_CLOCK")]
    CLOCKWISE,

    [CCode (cname="TRANSPOSE_CCLOCK")]
    COUNTER_CLOCKWISE,

    [CCode (cname="TRANSPOSE_CLOCK_FLIP")]
    CLOCKWISE_FLIP,

    /***********************************************************
    rotate by half-turn
    ***********************************************************/
    [CCode (cname="TRANSPOSE_REVERSAL")]
    REVERSAL,

    [CCode (cname="TRANSPOSE_HFLIP")]
    HORIZONTAL_FLIP,

    [CCode (cname="TRANSPOSE_VFLIP")]
    VERTICAL_FLIP;
}

} // namespace LibAVFilter
