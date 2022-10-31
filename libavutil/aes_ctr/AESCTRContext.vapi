/***********************************************************
@brief AES-CTR cipher
@copyright 2015 Eran Kornblau <erankor at gmail dot com>

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

[CCode (cname="struct AVAESCTR", cheader_filename="libavcodec/aes_ctr.h")]
public struct AESCTRContext {

    [CCode (cname="AES_CTR_KEY_SIZE", cheader_filename="libavcodec/aes_ctr.h")]
    public const size_t AES_CTR_KEY_SIZE;
    [CCode (cname="AES_CTR_IV_SIZE", cheader_filename="libavcodec/aes_ctr.h")]
    public const size_t AES_CTR_IV_SIZE;

    /***********************************************************
    @brief Allocate an AESCTRContext context.
    ***********************************************************/
    [CCode (cname="av_aes_ctr_alloc", cheader_filename="libavcodec/aes_ctr.h")]
    public AESCTRContext av_aes_ctr_alloc ();

    /***********************************************************
    @brief Initialize an AESCTRContext context.
    @param key encryption key, must have a length of AES_CTR_KEY_SIZE
    ***********************************************************/
    [CCode (cname="av_aes_ctr_init", cheader_filename="libavcodec/aes_ctr.h")]
    public int av_aes_ctr_init (
        AESCTRContext a,
        uint8[] key
    );

    /***********************************************************
    @brief Release an AESCTRContext context.
    ***********************************************************/
    [CCode (cname="av_aes_ctr_free", cheader_filename="libavcodec/aes_ctr.h")]
    public void av_aes_ctr_free (
        AESCTRContext a
    );

    /***********************************************************
    @brief Process a buffer using a previously initialized context.
    @param output_buffer destination array, can be equal to input_buffer
    @param input_buffer source array, can be equal to output_buffer
    @param size the size of input_buffer and output_buffer
    ***********************************************************/
    [CCode (cname="av_aes_ctr_crypt", cheader_filename="libavcodec/aes_ctr.h")]
    public void av_aes_ctr_crypt (
        AESCTRContext a,
        out uint8[] output_buffer,
        uint8[] input_buffer,
        int size
    );

    /***********************************************************
    @brief Get the current initialization vector
    ***********************************************************/
    [CCode (cname="av_aes_ctr_get_iv", cheader_filename="libavcodec/aes_ctr.h")]
    public uint8[] av_aes_ctr_get_iv (
        AESCTRContext a
    );

    /***********************************************************
    @brief Generate a random initialization vector
    ***********************************************************/
    [CCode (cname="av_aes_ctr_set_random_iv", cheader_filename="libavcodec/aes_ctr.h")]
    public void av_aes_ctr_set_random_iv (
        AESCTRContext a
    );

    /***********************************************************
    @brief Forcefully change the 8-byte initialization vector
    ***********************************************************/
    [CCode (cname="av_aes_ctr_set_iv", cheader_filename="libavcodec/aes_ctr.h")]
    public void av_aes_ctr_set_iv (
        AESCTRContext a,
        uint8[] initialization_vector
    );

    /***********************************************************
    @brief Forcefully change the "full" 16-byte initialization vector, including the counter
    ***********************************************************/
    [CCode (cname="av_aes_ctr_set_full_iv", cheader_filename="libavcodec/aes_ctr.h")]
    public void av_aes_ctr_set_full_iv (
        AESCTRContext a,
        uint8[] initialization_vector
    );

    /***********************************************************
    @brief Increment the top 64 bit of the initialization vector (performed after each frame)
    ***********************************************************/
    [CCode (cname="av_aes_ctr_increment_iv", cheader_filename="libavcodec/aes_ctr.h")]
    public void av_aes_ctr_increment_iv (
        AESCTRContext a
    );

}

} // namespace LibAVUtil
