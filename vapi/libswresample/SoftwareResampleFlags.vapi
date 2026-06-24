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
@name Option constants
These constants are used for the @ref avoptions interface for lswr.
@{

***********************************************************/

[CCode (cheader_filename="subprojects/ffmpeg/libswresample/swresample.h")]
public enum SoftwareResampleFlags {
    /***********************************************************
    Force resampling even if equal sample rate
    TODO use int resample ?
    long term TODO can we enable this dynamically?
    ***********************************************************/
    [CCode (cname="SWR_FLAG_RESAMPLE")]
    FORCE_RESAMPLE; // 1
}

} // namespace LibSoftwareResample
