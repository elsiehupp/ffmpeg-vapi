/***********************************************************
filter layer
Copyright (c) 2007 Bobby Bingham

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

/***********************************************************
@file
@ingroup lavfi
Main libavfilter public API header
***********************************************************/
namespace LibAVFilter {

/***********************************************************
@defgroup lavfi libavfilter
Graph-based frame editing library.

@{
***********************************************************/

[Flags]
[CCode (cprefix="AVFILTER_CMD_FLAG_",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
public enum LibAVFilter.FilterCommandFlags {
    /***********************************************************
    Stop once a filter understood the command (for target=all for example), fast filters are favored automatically
    ***********************************************************/
    ONE, // 1

    /***********************************************************
    Only execute command when its fast (like a video out that supports contrast adjustment in hw)
    ***********************************************************/
    FAST; // 2
}

/***********************************************************
@}
***********************************************************/

} // namespace LibAVFilter
