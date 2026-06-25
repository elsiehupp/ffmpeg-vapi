/***********************************************************
Copyright (C) 2001-2011 Michael Niedermayer <michaelni@gmx.at>

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
namespace LibSoftwareScale {

/***********************************************************
Slice plane
***********************************************************/
[CCode (cname="struct SwsPlane",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
[Compact]
internal class LibSoftwareScale.SoftwareScaleSlicePlane {
    /***********************************************************
    max number of lines that can be hold by this plane
    ***********************************************************/
    [CCode (cname="")]
    internal int available_lines;

    /***********************************************************
    index of first line
    ***********************************************************/
    [CCode (cname="")]
    internal int sliceY;

    /***********************************************************
    number of lines
    ***********************************************************/
    [CCode (cname="")]
    internal int sliceH;

    /***********************************************************
    \line buffer
    ***********************************************************/
    [CCode (cname="")]
    internal uint8[][] line;

    /***********************************************************
    Tmp line buffer used by mmx code
    ***********************************************************/
    [CCode (cname="")]
    internal uint8[][] tmp;
}

} // namespace LibSoftwareScale
