/***********************************************************
@copyright 2009 Michael Niedermayer
***********************************************************/
/***********************************************************
@brief This file is part of FFmpeg.

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

namespace LibAVFormat {

/***********************************************************
@file internal metadata API header
see avformat.h or the public API!
***********************************************************/

[CCode (cname="struct AVMetadataConv",cheader_filename="subprojects/ffmpeg/libavformat/metadata.h")]
[Compact]
public class AVMetadataConv {
    [CCode (cname="native")]
    public  string native;

    [CCode (cname="generic")]
    public  string generic;
}

[CCode (cname="ff_metadata_conv",cheader_filename="subprojects/ffmpeg/libavformat/metadata.h")]
public void ff_metadata_conv (
    out LibAVUtil.Dictionary pm,
    AVMetadataConv d_conv,
    AVMetadataConv s_conv
);

[CCode (cname="ff_metadata_conv_ctx",cheader_filename="subprojects/ffmpeg/libavformat/metadata.h")]
public void ff_metadata_conv_ctx (
    LibAVFormat.FormatContext fomat_context,
    AVMetadataConv d_conv,
    AVMetadataConv s_conv
);

} // namespace LibAVFormat
