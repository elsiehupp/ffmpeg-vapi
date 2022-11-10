/***********************************************************
@copyright 2006 Mans Rullgard
***********************************************************/
/***********************************************************
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
namespace Adler32 {

/***********************************************************
@file @ingroup lavu_adler32
Public header for Adler-32 hash function implementation.
***********************************************************/

/***********************************************************
@defgroup lavu_adler32 Adler-32
@ingroup lavu_hash
Adler-32 hash function implementation.
***********************************************************/

/***********************************************************
@brief Calculate the Adler32 checksum of a buffer.

Passing the return value to a subsequent av_adler32_update () call
allows the checksum of multiple buffers to be calculated as though
they were concatenated.

@param adler initial checksum value
@param buffer pointer to input buffer
@param len size of input buffer
@return updated checksum
***********************************************************/
[CCode (cname="av_adler32_update", cheader_filename="ffmpeg/libavutil/adler32.h")]
public ulong av_adler32_update (
    ulong adler,
    uint8[] buffer,
    uint len
); // av_pure;

}
} // namespace LibAVUtil
