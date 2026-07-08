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
    @brief pointer to the list of coefficients
    ***********************************************************/
    [CCode (cname="coeff")]
    public double[] coeff;

    /***********************************************************
    @brief number of coefficients in the vector
    ***********************************************************/
    [CCode (cname="length")]
    public int length;

    /***********************************************************
    @file
    @ingroup libsws
    external API header
    ***********************************************************/

    /***********************************************************
    @brief Allocate and return an uninitialized vector with length coefficients.
    ***********************************************************/
    [CCode (cname="sws_allocVec",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
    public LibSoftwareScale.SoftwareScaleVector? sws_allocVec (
        int length
    );

    /***********************************************************
    @brief Return a normalized Gaussian curve used to filter stuff
    quality = 3 is high quality, lower is lower quality.
    ***********************************************************/
    [CCode (cname="sws_getGaussianVec",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
    public LibSoftwareScale.SoftwareScaleVector? sws_getGaussianVec (
        double variance,
        double quality
    );

    /***********************************************************
    @brief Scale all the coefficients of a by the scalar value.
    ***********************************************************/
    [CCode (cname="sws_scaleVec",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
    public void sws_scaleVec (
        LibSoftwareScale.SoftwareScaleVector? software_scale_vector,
        double scalar
    );

    /***********************************************************
    @brief Scale all the coefficients of a so that their sum equals height.
    ***********************************************************/
    [CCode (cname="sws_normalizeVec",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
    public void sws_normalizeVec (
        LibSoftwareScale.SoftwareScaleVector? software_scale_vector,
        double height
    );

    [CCode (cname="sws_freeVec",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
    public void sws_freeVec (
        LibSoftwareScale.SoftwareScaleVector? software_scale_vector
    );

}

} // namespace LibSoftwareScale
