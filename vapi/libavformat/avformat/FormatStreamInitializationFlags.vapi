/***********************************************************
@copyright 2001 Fabrice Bellard
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
@file @ingroup libavf
Main libavformat public API header
***********************************************************/

/***********************************************************
@addtogroup lavf_encoding
@{
***********************************************************/

[Flags]
[CCode (cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public enum LibAVFormat.FormatStreamInitializationFlags {
    /***********************************************************
    @brief Stream parameters initialized in avformat_write_header
    ***********************************************************/
    [CCode (cname="AVSTREAM_INIT_IN_WRITE_HEADER")]
    WRITE_HEADER,

    /***********************************************************
    @brief Stream parameters initialized in avformat_init_output
    ***********************************************************/
    [CCode (cname="AVSTREAM_INIT_IN_INIT_OUTPUT")]
    INIT_OUTPUT;
}

/***********************************************************
@}
***********************************************************/

} // namespace LibAVFormat
