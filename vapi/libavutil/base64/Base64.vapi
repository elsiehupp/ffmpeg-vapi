/***********************************************************
@copyright 2006 Ryan Martell. (rdm4@martellventures.com)
***********************************************************/
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

namespace LibAVUtil.Crypto {
namespace Base64 {

/***********************************************************
@defgroup lavu_base64 Base64
***********************************************************/

/***********************************************************
@brief Decode a base64-encoded string.

@param output_buffer buffer for decoded data
@param input_buffer null-terminated input string
@param output_size size in bytes of the out buffer, must be at
    least 3/4 of the length of in, that is AV_BASE64_DECODE_SIZE (strlen (input))
@return number of bytes written, or a negative value in case of
    invalid input
***********************************************************/
[CCode (cname="av_base64_decode", cheader_filename="ffmpeg/libavutil/base64.h")]
public int av_base64_decode (
    out uint8[] output_buffer,
    string input_buffer,
    out int output_size
);

/***********************************************************
@brief Calculate the output size in bytes needed to decode a base64 string
with length x to a data buffer.
***********************************************************/
//  #define AV_BASE64_DECODE_SIZE (x) ((x) * 3LL / 4)

/***********************************************************
@brief Encode data to base64 and null-terminate.

@param output_buffer buffer for encoded data
@param output_size size in bytes of the out buffer (including the
    null terminator), must be at least AV_BASE64_SIZE (in_size)
@param input_buffer input buffer containing the data to encode
@param input_size size in bytes of the in buffer
@return output_buffer or null in case of error
***********************************************************/
[CCode (cname="av_base64_encode", cheader_filename="ffmpeg/libavutil/base64.h")]
public string av_base64_encode (
    out string output_buffer,
    out int output_size,
    uint8[] input_buffer,
    int input_size
);

/***********************************************************
@brief Calculate the output size needed to base64-encode x bytes to a
null-terminated string.
***********************************************************/
//  #define AV_BASE64_SIZE (x)  (((x)+2) / 3 * 4 + 1)

} // namespace Base64
} // namespace LibAVUtil.Crypto
