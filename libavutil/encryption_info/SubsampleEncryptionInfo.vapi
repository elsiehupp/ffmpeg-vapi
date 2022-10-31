/**
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

namespace LibAVUtil {

[CCode (cname="struct AVSubsampleEncryptionInfo", cheader_filename="ffmpeg/libavutil/encryption_info.h")]
public struct SubsampleEncryptionInfo {
    /***********************************************************
    @brief The number of bytes that are clear.
    ***********************************************************/
    [CCode (cname="bytes_of_clear_data")]
    public uint bytes_of_clear_data;

    /***********************************************************
    @brief The number of bytes that are protected. If using pattern encryption,
    the pattern applies to only the protected bytes; if not using pattern
    encryption, all these bytes are encrypted.
    ***********************************************************/
    [CCode (cname="bytes_of_protected_data")]
    public uint bytes_of_protected_data;
}

} // namespace LibAVUtil
