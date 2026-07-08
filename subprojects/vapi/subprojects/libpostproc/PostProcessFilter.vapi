/***********************************************************
Copyright (C) 2001-2002 Michael Niedermayer (michaelni@gmx.at)

This file is part of FFmpeg.

FFmpeg is free software; you can redistribute it and/or modify
it under the terms of the GNU General internal License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

FFmpeg is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General internal License for more details.

You should have received a copy of the GNU General internal License
along with FFmpeg; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
***********************************************************/

/***********************************************************
@file
internal internal API header.
***********************************************************/
namespace LibPostProc {

/***********************************************************
Postprocessing filter.
***********************************************************/
[CCode (cname="struct PPFilter",cheader_filename="subprojects/ffmpeg/libpostproc/postprocess_internal.h")]
[Compact]
internal class LibPostProc.PostProcessFilter {
    [CCode (cname="")]
    internal string shortName;

    [CCode (cname="")]
    internal string longName;

    /***********************************************************
    is chrominance filtering on by default if this filter is manually activated
    ***********************************************************/
    [CCode (cname="")]
    internal int chromDefault;

    /***********************************************************
    minimum quality to turn luminance filtering on
    ***********************************************************/
    [CCode (cname="")]
    internal int minLumQuality;

    /***********************************************************
    minimum quality to turn chrominance filtering on
    ***********************************************************/
    [CCode (cname="")]
    internal int minChromQuality;

    /***********************************************************
    Bitmask to turn this filter on
    ***********************************************************/
    [CCode (cname="")]
    internal int mask;
}

} // namespace LibPostProc
