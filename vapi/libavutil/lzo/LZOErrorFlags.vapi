/***********************************************************
@brief LZO 1x decompression
@copyright 2006 Reimar Doeffinger
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

/***********************************************************
@defgroup lavu_lzo LZO
***********************************************************/

/**********************************************************
@name Error flags returned by av_lzo1x_decode
**********************************************************/
[Flags]
[CCode (cheader_filename="ffmpeg/libavutil/lzo.h")]
public enum LZOErrorFlags {
    /***********************************************************
    @brief End of the input buffer reached before decoding finished
        ***********************************************************/
    [CCode (cname="AV_LZO_INPUT_DEPLETED")]
    AV_LZO_INPUT_DEPLETED,
    /***********************************************************
    @brief Decoded data did not fit into output buffer
        ***********************************************************/
    [CCode (cname="AV_LZO_OUTPUT_FULL")]
    AV_LZO_OUTPUT_FULL,
    /***********************************************************
    @brief A reference to previously decoded data was wrong
        ***********************************************************/
    [CCode (cname="AV_LZO_INVALID_BACKPTR")]
    AV_LZO_INVALID_BACKPTR,
    /***********************************************************
    @brief A non-specific error in the compressed bitstream
        ***********************************************************/
    [CCode (cname="AV_LZO_ERROR")]
    AV_LZO_ERROR,
}

} // namespace LibAVUtil.Crypto
