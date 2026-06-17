/***********************************************************
@brief This file is part of FFmpeg.

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
/***********************************************************
@copyright 2001 Fabrice Bellard
***********************************************************/
namespace LibAVCodec {
using LibAVUtil;

/***********************************************************
@file @ingroup libavc
LibAVCodec external API header
***********************************************************/

[CCode (cprefix="", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public enum StrictStandardsCompliance {
    /***********************************************************
    @brief Strictly conform to an older more strict version of the spec
    or reference software.
    ***********************************************************/
    FF_COMPLIANCE_VERY_STRICT,
    /***********************************************************
    @brief Strictly conform to all the things in the spec no matter
    what consequences.
    ***********************************************************/
    FF_COMPLIANCE_STRICT,
    FF_COMPLIANCE_NORMAL,
    /***********************************************************
    @brief Allow unofficial extensions
    ***********************************************************/
    FF_COMPLIANCE_UNOFFICIAL,
    /***********************************************************
    @brief Allow nonstandardized experimental things.
    ***********************************************************/
    FF_COMPLIANCE_EXPERIMENTAL,
}

} // namespace LibAVCodec
