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

/***********************************************************
@file
@ingroup libsws
external API header
***********************************************************/
namespace LibSoftwareScale {

[CCode (cname="enum SwsColorSpace",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
public enum LibSoftwareScale.SoftwareScaleColorSpace {
    [CCode (cname="SWS_CS_ITU709")]
    ITU709, // 1

    [CCode (cname="SWS_CS_FCC")]
    FCC, // 4

    [CCode (cname="SWS_CS_ITU601")]
    ITU601, // 5

    [CCode (cname="SWS_CS_ITU624")]
    ITU624, // 5

    [CCode (cname="SWS_CS_SMPTE170M")]
    SMPTE170M, // 5

    [CCode (cname="SWS_CS_SMPTE240M")]
    SMPTE240M, // 7

    [CCode (cname="SWS_CS_DEFAULT")]
    DEFAULT, // 5

    [CCode (cname="SWS_CS_BT2020")]
    BT2020; // 9

    /***********************************************************
    Return a pointer to yuv<->rgb coefficients for the given colorspace
    suitable for sws_setColorspaceDetails ().

    @param colorspace One of the LibSoftwareScale.SoftwareScaleColorSpace.* macros. If invalid,
    LibSoftwareScale.SoftwareScaleColorSpace.DEFAULT is used.
    ***********************************************************/
    [CCode (cname="sws_getCoefficients",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
    public static int[] sws_getCoefficients (
        LibSoftwareScale.SoftwareScaleColorSpace colorspace
    );

}

} // namespace LibSoftwareScale
