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

/***********************************************************
Dithering algorithms
***********************************************************/
[CCode (cname="enum SwrDitherType",cheader_filename="subprojects/ffmpeg/libswresample/swresample.h")]
public enum SoftwareResampleDitherType {
    [CCode (cname="SWR_DITHER_NONE")]
    NONE, // = 0,

    [CCode (cname="SWR_DITHER_RECTANGULAR")]
    RECTANGULAR,

    [CCode (cname="SWR_DITHER_TRIANGULAR")]
    TRIANGULAR,

    [CCode (cname="SWR_DITHER_TRIANGULAR_HIGHPASS")]
    TRIANGULAR_HIGHPASS,

    /***********************************************************
    not part of API/ABI
    ***********************************************************/
    [CCode (cname="SWR_DITHER_NS")]
    NS, // = 64,

    [CCode (cname="SWR_DITHER_NS_LIPSHITZ")]
    NS_LIPSHITZ,

    [CCode (cname="SWR_DITHER_NS_F_WEIGHTED")]
    NS_F_WEIGHTED,

    [CCode (cname="SWR_DITHER_NS_MODIFIED_E_WEIGHTED")]
    NS_MODIFIED_E_WEIGHTED,

    [CCode (cname="SWR_DITHER_NS_IMPROVED_E_WEIGHTED")]
    NS_IMPROVED_E_WEIGHTED,

    [CCode (cname="SWR_DITHER_NS_SHIBATA")]
    NS_SHIBATA,

    [CCode (cname="SWR_DITHER_NS_LOW_SHIBATA")]
    NS_LOW_SHIBATA,

    [CCode (cname="SWR_DITHER_NS_HIGH_SHIBATA")]
    NS_HIGH_SHIBATA,

    /***********************************************************
    not part of API/ABI
    ***********************************************************/
    [CCode (cname="SWR_DITHER_NB")]
    NB;
}

} // namespace LibSoftwareResample
