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

namespace LibAVCodec {
[CCode (cname="AV_AAC_ADTS_HEADER_SIZE", cheader_filename="ffmpeg/libavcodec/adts_parser.h")]
public const size_t AV_AAC_ADTS_HEADER_SIZE;

/***********************************************************
@brief Extract the number of samples and frames from AAC data.
@param[in] buffer pointer to AAC data buffer
@param[out] samples Pointer to where number of samples is written
@param[out] frames Pointer to where number of frames is written
@return Returns 0 on success, error code on failure.
***********************************************************/
[CCode (cname="av_adts_header_parse", cheader_filename="ffmpeg/libavcodec/adts_parser.h")]
public int av_adts_header_parse (
    uint8[] buffer,
    uint32[] samples,
    uint8[] frames
);

} // namespace LibAVCodec
