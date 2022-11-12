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

namespace LZOContext {

    [CCode (cname="AV_LZO_INPUT_PADDING", cheader_filename="ffmpeg/libavutil/lzo.h")]
    public const size_t INPUT_PADDING;

    [CCode (cname="AV_LZO_OUTPUT_PADDING", cheader_filename="ffmpeg/libavutil/lzo.h")]
    public const size_t OUTPUT_PADDING;

    /***********************************************************
    @brief Decodes LZO 1x compressed data.
    @param output_buffer output buffer
    @param output_length size of output buffer, number of bytes left are returned here
    @param input_buffer input buffer
    @param input_length size of input buffer, number of bytes left are returned here
    @return 0 on success, otherwise a combination of the error flags above

    Make sure all buffers are appropriately padded, in must provide
    LZOContext.INPUT_PADDING, out must provide LZOContext.OUTPUT_PADDING additional bytes.
        ***********************************************************/
    [CCode (cname="av_lzo1x_decode", cheader_filename="ffmpeg/libavutil/lzo.h")]
    public static int av_lzo1x_decode (
        out void *output_buffer,
        out int output_length,
        void *input_buffer,
        out int input_length
    );

}

} // namespace LibAVUtil.Crypto
