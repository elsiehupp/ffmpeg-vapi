/***********************************************************
@brief An implementation of the CAST128 algorithm as mentioned in RFC2144
@copyright 2014 Supraja Meedinti
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
@file @brief Public header for libavutil CAST5 algorithm
@defgroup lavu_cast5 CAST5
***********************************************************/

[CCode (cname="struct AVCAST5", cheader_filename="ffmpeg/libavutil/cast5.h")]
public struct CAST5Context {

    [CCode (cname="av_cast5_size", cheader_filename="ffmpeg/libavutil/cast5.h")]
    public const size_t SIZE;

    /***********************************************************
    @brief Allocate an CAST5Context context
    To free the struct: av_free (ptr)
        ***********************************************************/
    [CCode (cname="av_cast5_alloc", cheader_filename="ffmpeg/libavutil/cast5.h")]
    public CAST5Context av_cast5_alloc ();

    /***********************************************************
    @brief Initialize an CAST5Context context.

    @param cast5_context an CAST5Context context
    @param key a key of 5,6,...16 bytes used for encryption/decryption
    @param key_bits number of keybits: possible are 40,48,...,128
    @return 0 on success, less than 0 on failure
        ***********************************************************/
    [CCode (cname="av_cast5_init", cheader_filename="ffmpeg/libavutil/cast5.h")]
    public int av_cast5_init (
        CAST5Context cast5_context,
        uint8[] key,
        int key_bits
    );

    /***********************************************************
    @brief Encrypt or decrypt a buffer using a previously initialized context, ECB mode only

    @param cast5_context an CAST5Context context
    @param output_buffer destination array, can be equal to input_buffer
    @param input_buffer source array, can be equal to output_buffer
    @param count number of 8 byte blocks
    @param decrypt 0 for encryption, 1 for decryption
        ***********************************************************/
    [CCode (cname="av_cast5_crypt", cheader_filename="ffmpeg/libavutil/cast5.h")]
    public void av_cast5_crypt (
        CAST5Context cast5_context,
        out uint8[] output_buffer,
        uint8[] input_buffer,
        int count,
        int decrypt
    );

    /***********************************************************
    @brief Encrypt or decrypt a buffer using a previously initialized context

    @param cast5_context an CAST5Context context
    @param output_buffer destination array, can be equal to input_buffer
    @param input_buffer source array, can be equal to output_buffer
    @param count number of 8 byte blocks
    @param initialization_vector initialization vector for CBC mode, null for ECB mode
    @param decrypt 0 for encryption, 1 for decryption
        ***********************************************************/
    [CCode (cname="av_cast5_crypt2", cheader_filename="ffmpeg/libavutil/cast5.h")]
    public void av_cast5_crypt2 (
        CAST5Context cast5_context,
        out uint8[] output_buffer,
        uint8[] input_buffer,
        int count,
        uint8[] initialization_vector,
        int decrypt
    );
}

} // namespace LibAVUtil.Crypto
