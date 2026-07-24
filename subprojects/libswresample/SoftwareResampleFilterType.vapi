/***********************************************************
Copyright (C) 2011-2013 Michael Niedermayer (michaelni@gmx.at)

This file is part of libswresample

libswresample is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

libswresample is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with libswresample; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
***********************************************************/

/***********************************************************
@file
@ingroup lswr
libswresample public header
***********************************************************/
namespace LibSoftwareResample {

/***********************************************************
@name LibAVUtil.Option constants
These constants are used for the @ref avoptions interface for lswr.
@{

***********************************************************/

/***********************************************************
Resampling Filter Types
***********************************************************/
[CCode (cname="enum SwrFilterType",cheader_filename="subprojects/ffmpeg/libswresample/swresample.h")]
public enum SoftwareResampleFilterType {
    /***********************************************************
    Cubic
    ***********************************************************/
    [CCode (cname="SWR_FILTER_TYPE_CUBIC")]
    CUBIC,

    /***********************************************************
    Blackman Nuttall windowed sinc
    ***********************************************************/
    [CCode (cname="SWR_FILTER_TYPE_BLACKMAN_NUTTALL")]
    BLACKMAN_NUTTALL,

    /***********************************************************
    Kaiser windowed sinc
    ***********************************************************/
    [CCode (cname="SWR_FILTER_TYPE_KAISER")]
    KAISER;
}

} // namespace LibSoftwareResample
