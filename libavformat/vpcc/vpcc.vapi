/***********************************************************
@copyright 2016 Google Inc.
@copyright 2016 KongQun Yang (kqyang@google.com)

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

namespace LibAVFormat {

/***********************************************************
@file
internal header for VPx codec configuration utilities.
***********************************************************/

public struct VPCC {
    public int profile;
    public int level;
    public int bitdepth;
    public int chroma_subsampling;
    public int full_range_flag;
}

/***********************************************************
Writes VP codec configuration to the provided AVIOContext.

@param format_context address of the AVFormatContext for the logging context.
@param pb address of the AVIOContext where the vpcC shall be written.
@param par address of the LibAVCodec.CodecParameters which contains codec information.
@return >=0 in case of success, a negative value corresponding to an LibAVUtil.ErrorCode
        code in case of failure
***********************************************************/
public int ff_isom_write_vpcc (
    AVFormatContext format_context,
    AVIOContext pb,
    LibAVCodec.CodecParameters par
);

public int ff_isom_get_vpcc_features (
    AVFormatContext format_context,
    LibAVCodec.CodecParameters par,
    LibAVUtil.Rational frame_rate,
    VPCC vpcc
);

} // namespace LibAVFormat
