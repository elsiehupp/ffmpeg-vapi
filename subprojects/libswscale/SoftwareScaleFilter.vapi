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
vectors can be shared
***********************************************************/
[CCode (cname="struct SwsFilter",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
[Compact]
public class LibSoftwareScale.SoftwareScaleFilter {
    [CCode (cname="lumH")]
    public LibSoftwareScale.SoftwareScaleVector? lumH;

    [CCode (cname="lumV")]
    public LibSoftwareScale.SoftwareScaleVector? lumV;

    [CCode (cname="chrH")]
    public LibSoftwareScale.SoftwareScaleVector? chrH;

    [CCode (cname="chrV")]
    public LibSoftwareScale.SoftwareScaleVector? chrV;

    /***********************************************************
    @file
    @ingroup libsws
    external API header
    ***********************************************************/
    [CCode (cname="sws_getDefaultFilter",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
    public LibSoftwareScale.SoftwareScaleFilter? sws_getDefaultFilter (
        float lumaGBlur,
        float chromaGBlur,
        float lumaSharpen,
        float chromaSharpen,
        float chromaHShift,
        float chromaVShift,
        int verbose
    );

    [CCode (cname="sws_freeFilter",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
    public void sws_freeFilter (
        LibSoftwareScale.SoftwareScaleFilter? filter
    );

    /***********************************************************
    Check if context can be reused, otherwise reallocate a new one.

    If context is NULL, just calls sws_getContext () to get a new
    context. Otherwise, checks if the parameters are the ones already
    saved in context. If that is the case, returns the current
    context. Otherwise, frees context and gets a new context with
    the new parameters.

    Be warned that srcFilter and dstFilter are not checked, they
    are assumed to remain the same.
    ***********************************************************/
    [CCode (cname="sws_getCachedContext",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
    public LibSoftwareScale.SoftwareScaleContext? sws_getCachedContext (
        LibSoftwareScale.SoftwareScaleContext? context,
        int srcW,
        int srcH,
        LibAVUtil.PixelFormat srcFormat,
        int dstW,
        int dstH,
        LibAVUtil.PixelFormat dstFormat,
        int flags,
        LibSoftwareScale.SoftwareScaleFilter? srcFilter,
        LibSoftwareScale.SoftwareScaleFilter? dstFilter,
        double[] param
    );

    /***********************************************************
    Convert an 8-bit paletted frame into a frame with a color depth of 32 bits.

    The output frame will have the same packed format as the palette.

    @param src        source frame buffer
    @param dst        destination frame buffer
    @param num_pixels number of pixels to convert
    @param palette    array with [256] entries, which must match color arrangement (RGB or BGR) of src
    ***********************************************************/
    [CCode (cname="sws_convertPalette8ToPacked32",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
    public static void sws_convertPalette8ToPacked32 (
        uint8[] src,
        uint8[] dst,
        int num_pixels,
        uint8[] palette
    );

    /***********************************************************
    Convert an 8-bit paletted frame into a frame with a color depth of 24 bits.

    With the palette format "ABCD", the destination frame ends up with the format "ABC".

    @param src        source frame buffer
    @param dst        destination frame buffer
    @param num_pixels number of pixels to convert
    @param palette    array with [256] entries, which must match color arrangement (RGB or BGR) of src
    ***********************************************************/
    [CCode (cname="sws_convertPalette8ToPacked24",cheader_filename="subprojects/ffmpeg/libswscale/swscale.h")]
    public static void sws_convertPalette8ToPacked24 (
        uint8[] src,
        uint8[] dst,
        int num_pixels,
        uint8[] palette
    );

}

} // namespace LibSoftwareScale
