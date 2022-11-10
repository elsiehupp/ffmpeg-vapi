/***********************************************************
@brief An implementation of the CAMELLIA algorithm as mentioned in RFC3713
@copyright 2014 Supraja Meedinti
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

namespace LibAVUtil.Crypto {

/***********************************************************
@file @brief Public header for libavutil CAMELLIA algorithm
@defgroup lavu_camellia CAMELLIA
***********************************************************/

[CCode (cname="struct AVCAMELLIA", cheader_filename="ffmpeg/libavutil/camellia.h")]
public struct CAMELLIAContext {

    [CCode (cname="av_camellia_size", cheader_filename="ffmpeg/libavutil/camellia.h")]
    public const size_t SIZE;

    /***********************************************************
    @brief Allocate an CAMELLIAContext context
    To free the struct: av_free (ptr)
    ***********************************************************/
    [CCode (cname="av_camellia_alloc", cheader_filename="ffmpeg/libavutil/camellia.h")]
    public CAMELLIAContext av_camellia_alloc ();

    /***********************************************************
    @brief Initialize an CAMELLIAContext context.

    @param camellia an CAMELLIAContext context
    @param key a key of 16, 24, 32 bytes used for encryption/decryption
    @param key_bits number of keybits: possible are 128, 192, 256
    ***********************************************************/
    [CCode (cname="av_camellia_init", cheader_filename="ffmpeg/libavutil/camellia.h")]
    public int av_camellia_init (
        CAMELLIAContext camellia,
        uint8[] key,
        int key_bits
    );

    /***********************************************************
    @brief Encrypt or decrypt a buffer using a previously initialized context

    @param camellia an CAMELLIAContext context
    @param output_buffer destination array, can be equal to input_buffer
    @param input_buffer source array, can be equal to output_buffer
    @param count number of 16 byte blocks
    @paran initialization_vector initialization vector for CBC mode, null for ECB mode
    @param decrypt 0 for encryption, 1 for decryption
    ***********************************************************/
    [CCode (cname="av_camellia_crypt", cheader_filename="ffmpeg/libavutil/camellia.h")]
    public void av_camellia_crypt (
        CAMELLIAContext camellia,
        out uint8[] output_buffer,
        uint8[] input_buffer,
        int count,
        uint8[] initialization_vector,
        int decrypt
    );

}

} // namespace LibAVUtil.Crypto
