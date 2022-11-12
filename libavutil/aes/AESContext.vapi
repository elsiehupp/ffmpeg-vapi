/***********************************************************
@copyright 2007 Michael Niedermayer <michaelni@gmx.at>
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
@defgroup lavu_aes AES
***********************************************************/

[CCode (cname="struct AVAES", cheader_filename="ffmpeg/libavutil/aes.h")]
public struct AESContext {

    [CCode (cname="av_aes_size", cheader_filename="ffmpeg/libavutil/aes.h")]
    public const size_t SIZE;

    /***********************************************************
    @brief Allocate an AESContext context.
    ***********************************************************/
    [CCode (cname="av_aes_alloc", cheader_filename="ffmpeg/libavutil/aes.h")]
    public AESContext av_aes_alloc ();

    /***********************************************************
    @brief Initialize an AESContext context.
    @param key_bits 128, 192 or 256
    @param decrypt 0 for encryption, 1 for decryption
    ***********************************************************/
    [CCode (cname="av_aes_init", cheader_filename="ffmpeg/libavutil/aes.h")]
    public int av_aes_init (
        AESContext a,
        uint8[] key,
        int key_bits,
        int decrypt
    );

    /***********************************************************
    @brief Encrypt or decrypt a buffer using a previously initialized context.

    @param output_buffer destination array, can be equal to input_buffer
    @param input_buffer source array, can be equal to output_buffer
    @param count number of 16 byte blocks
    @param initialization_vector initialization vector for CBC mode, if null then ECB will be used
    @param decrypt 0 for encryption, 1 for decryption
    ***********************************************************/
    [CCode (cname="av_aes_crypt", cheader_filename="ffmpeg/libavutil/aes.h")]
    public void av_aes_crypt (
        AESContext a,
        out uint8[] output_buffer,
        uint8[] input_buffer,
        int count,
        uint8[] initialization_vector,
        int decrypt
    );
}

} // namespace LibAVUtil.Crypto
