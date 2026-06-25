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
Struct which holds all necessary data for processing a slice.
A processing step can be a color conversion or horizontal/vertical scaling.
***********************************************************/
[CCode (cname="struct SwsFilterDescriptor",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
[Compact]
internal class LibSoftwareScale.SoftwareScaleFilterDescriptor {
    /***********************************************************
    Source slice
    ***********************************************************/
    [CCode (cname="")]
    internal LibSoftwareScale.SoftwareScaleSlice? src;

    /***********************************************************
    Output slice
    ***********************************************************/
    [CCode (cname="")]
    internal LibSoftwareScale.SoftwareScaleSlice? dst;

    /***********************************************************
    Flag for processing alpha channel
    ***********************************************************/
    [CCode (cname="")]
    internal int alpha;

    /***********************************************************
    Filter instance data
    ***********************************************************/
    [CCode (cname="")]
    internal void *instance;

    internal delegate int ProcessDelegate (
        LibSoftwareScale.SoftwareScaleContext? c,
        LibSoftwareScale.SoftwareScaleFilterDescriptor? desc,
        int sliceY,
        int sliceH
    );

    /***********************************************************
    Function for processing input slice sliceH lines starting from line sliceY
    ***********************************************************/
    [CCode (cname="process")]
    internal ProcessDelegate process;

    /***********************************************************
    initializes gamma conversion descriptor
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal int ff_init_gamma_convert (
        LibSoftwareScale.SoftwareScaleFilterDescriptor? desc,
        LibSoftwareScale.SoftwareScaleSlice * src,
        uint16[] table
    );

    /***********************************************************
    initializes lum pixel format conversion descriptor
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal int ff_init_desc_fmt_convert (
        LibSoftwareScale.SoftwareScaleFilterDescriptor? desc,
        LibSoftwareScale.SoftwareScaleSlice * src,
        LibSoftwareScale.SoftwareScaleSlice? dst,
        uint32[] pal
    );

    /***********************************************************
    initializes lum horizontal scaling descriptor
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal int ff_init_desc_hscale (
        LibSoftwareScale.SoftwareScaleFilterDescriptor? desc,
        LibSoftwareScale.SoftwareScaleSlice? src,
        LibSoftwareScale.SoftwareScaleSlice? dst,
        uint16[] filter,
        int * filter_pos,
        int filter_size,
        int xInc
    );

    /***********************************************************
    initializes chr pixel format conversion descriptor
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal int ff_init_desc_cfmt_convert (
        LibSoftwareScale.SoftwareScaleFilterDescriptor? desc,
        LibSoftwareScale.SoftwareScaleSlice * src,
        LibSoftwareScale.SoftwareScaleSlice? dst,
        uint32[] pal
    );

    /***********************************************************
    initializes chr horizontal scaling descriptor
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal int ff_init_desc_chscale (
        LibSoftwareScale.SoftwareScaleFilterDescriptor? desc,
        LibSoftwareScale.SoftwareScaleSlice? src,
        LibSoftwareScale.SoftwareScaleSlice? dst,
        uint16[] filter,
        int * filter_pos,
        int filter_size,
        int xInc
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
    internal int ff_init_desc_no_chr (
        LibSoftwareScale.SoftwareScaleFilterDescriptor? desc,
        LibSoftwareScale.SoftwareScaleSlice * src,
        LibSoftwareScale.SoftwareScaleSlice? dst
    );

}

} // namespace LibSoftwareScale
