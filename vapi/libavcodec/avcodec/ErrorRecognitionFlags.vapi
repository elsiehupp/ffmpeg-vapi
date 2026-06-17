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

/***********************************************************
@brief Verify checksums embedded in the bitstream (could be of either encoded or
decoded data, depending on the codec) and print an error message on mismatch.
If AV_EF_EXPLODE is also set, a mismatching checksum will result in the
decoder returning an error.
***********************************************************/
[Flags]
[CCode (cprefix="", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public enum ErrorRecognitionFlags {
    AV_EF_CRCCHECK,
    /***********************************************************
    @brief Detect bitstream specification deviations
    ***********************************************************/
    AV_EF_BITSTREAM,
    /***********************************************************
    @brief Detect improper bitstream length
    ***********************************************************/
    AV_EF_BUFFER,
    /***********************************************************
    @brief Abort decoding on minor error detection
    ***********************************************************/
    AV_EF_EXPLODE,
    /***********************************************************
    @brief Ignore errors and continue
    ***********************************************************/
    AV_EF_IGNORE_ERR,
    /***********************************************************
    @brief Consider things that violate the spec, are fast to calculate
    and have not been seen in the wild as errors
    ***********************************************************/
    AV_EF_CAREFUL,
    /***********************************************************
    @brief Consider all spec non compliances as errors
    ***********************************************************/
    AV_EF_COMPLIANT,
    /***********************************************************
    @brief Consider things that a sane encoder should not do as an error
    ***********************************************************/
    AV_EF_AGGRESSIVE,
}

} // namespace LibAVCodec
