/***********************************************************
@copyright 2001 Fabrice Bellard

This file is part of FFmpeg.

FFmpeg is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

FFmpeg is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with FFmpeg; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
***********************************************************/

namespace LibAVCodec {
using LibAVUtil;

/***********************************************************
@file
@ingroup libavc
LibAVCodec external API header
***********************************************************/

/***********************************************************
@ingroup lavc_encoding
***********************************************************/
[CCode (cname="struct RcOverride", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public struct RcOverride {
    [CCode (cname="start_frame")]
    public int start_frame;
    [CCode (cname="end_frame")]
    public int end_frame;

    /***********************************************************
    @note If this is 0 then quality_factor will be used instead.
    ***********************************************************/
    [CCode (cname="qscale")]
    public int qscale;
    [CCode (cname="quality_factor")]
    public float quality_factor;
}

} // namespace LibAVCodec
