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

/***********************************************************
when used for filters they must have an odd number of elements
coeffs cannot be shared between vectors
***********************************************************/
[CCode (cname="struct SwsVector",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
[Compact]
public class LibSoftwareScale.SoftwareScaleVector {
    /***********************************************************
    pointer to the list of coefficients
    ***********************************************************/
    [CCode (cname="")]
    public double[] coeff;

    /***********************************************************
    number of coefficients in the vector
    ***********************************************************/
    [CCode (cname="")]
    public int length;

    /***********************************************************
    @file
    @ingroup libsws
    external API header
    ***********************************************************/

    /***********************************************************
    Allocate and return an uninitialized vector with length coefficients.
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
    public LibSoftwareScale.SoftwareScaleVector? sws_allocVec (
        int length
    );

    /***********************************************************
    Return a normalized Gaussian curve used to filter stuff
    quality = 3 is high quality, lower is lower quality.
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
    public LibSoftwareScale.SoftwareScaleVector? sws_getGaussianVec (
        double variance,
        double quality
    );

    /***********************************************************
    Scale all the coefficients of a by the scalar value.
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
    public void sws_scaleVec (
        LibSoftwareScale.SoftwareScaleVector? a,
        double scalar
    );

    /***********************************************************
    Scale all the coefficients of a so that their sum equals height.
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
    public void sws_normalizeVec (
        LibSoftwareScale.SoftwareScaleVector? a,
        double height
    );

    #if FF_API_SWS_VECTOR

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
    //  attribute_deprecated
    public LibSoftwareScale.SoftwareScaleVector? sws_getConstVec (
        double c,
        int length
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
    //  attribute_deprecated
    public LibSoftwareScale.SoftwareScaleVector? sws_getIdentityVec ();

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
    //  attribute_deprecated
    public void sws_convVec (
        LibSoftwareScale.SoftwareScaleVector? a,
        LibSoftwareScale.SoftwareScaleVector? b
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
    //  attribute_deprecated
    public void sws_addVec (
        LibSoftwareScale.SoftwareScaleVector? a,
        LibSoftwareScale.SoftwareScaleVector? b
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
    //  attribute_deprecated
    public void sws_subVec (
        LibSoftwareScale.SoftwareScaleVector? a,
        LibSoftwareScale.SoftwareScaleVector? b
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
    //  attribute_deprecated
    public void sws_shiftVec (
        LibSoftwareScale.SoftwareScaleVector? a,
        int shift
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
    //  attribute_deprecated
    public LibSoftwareScale.SoftwareScaleVector? sws_cloneVec (
        LibSoftwareScale.SoftwareScaleVector? a
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
    //  attribute_deprecated
    public void sws_printVec2 (
        LibSoftwareScale.SoftwareScaleVector? a,
        LibAVUtil.Class? log_ctx,
        int log_level
    );

    #endif

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
    public void sws_freeVec (
        LibSoftwareScale.SoftwareScaleVector? a
    );

}

} // namespace LibSoftwareScale
