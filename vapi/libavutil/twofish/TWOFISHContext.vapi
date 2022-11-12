/***********************************************************
@brief An implementation of the TwoFish algorithm
@copyright 2015 Supraja Meedinti
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
@file @brief Public header for libavutil TWOFISH algorithm
@defgroup lavu_twofish TWOFISH
***********************************************************/

[CCode (cname="struct AVTWOFISH", cheader_filename="ffmpeg/libavutil/twofish.h")]
public struct TWOFISHContext {
    [CCode (cname="av_twofish_size", cheader_filename="ffmpeg/libavutil/twofish.h")]
    public const size_t SIZE;

    /***********************************************************
    @brief Allocate an TWOFISHContext context
    To free the struct: av_free (ptr)
        ***********************************************************/
    [CCode (cname="av_twofish_alloc", cheader_filename="ffmpeg/libavutil/twofish.h")]
    public TWOFISHContext av_twofish_alloc ();

    /***********************************************************
    @brief Initialize an TWOFISHContext context.

    @param twofish_context an TWOFISHContext context
    @param key a key of size ranging from 1 to 32 bytes used for encryption/decryption
    @param key_bits number of keybits: 128, 192, 256 If less than the required, padded with zeroes to nearest valid value; return value is 0 if key_bits is 128/192/256, -1 if less than 0, 1 otherwise
        ***********************************************************/
    [CCode (cname="av_twofish_init", cheader_filename="ffmpeg/libavutil/twofish.h")]
    public int av_twofish_init (
        TWOFISHContext twofish_context,
        uint8[] key,
        int key_bits
    );

    /***********************************************************
    @brief Encrypt or decrypt a buffer using a previously initialized context

    @param twofish_context an TWOFISHContext context
    @param output_buffer destination array, can be equal to input_buffer
    @param input_buffer source array, can be equal to output_buffer
    @param count number of 16 byte blocks
    @paran initialization_vector initialization vector for CBC mode, null for ECB mode
    @param decrypt 0 for encryption, 1 for decryption
        ***********************************************************/
    [CCode (cname="av_twofish_crypt", cheader_filename="ffmpeg/libavutil/twofish.h")]
    public void av_twofish_crypt (
        TWOFISHContext twofish_context,
        out uint8[] output_buffer,
        uint8[] input_buffer,
        int count,
        uint8[] initialization_vector,
        int decrypt
    );
}

} // namespace LibAVUtil.Crypto
