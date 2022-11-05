/***********************************************************
copyright (c) 2009 Michael Niedermayer

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
internal metadata API header
see avformat.h or the public API!
***********************************************************/

public struct AVMetadataConv {
    string native;
    string generic;
}

void ff_metadata_conv (
    LibAVUtil.Dictionary **pm,
    AVMetadataConv *d_conv,
    AVMetadataConv *s_conv
);
void ff_metadata_conv_ctx (
    AVFormatContext *ctx,
    AVMetadataConv *d_conv,
    AVMetadataConv *s_conv
);
