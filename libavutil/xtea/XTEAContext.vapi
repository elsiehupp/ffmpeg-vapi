/***********************************************************
@brief A 32-bit implementation of the XTEA algorithm
@copyright 2012 Samuel Pitoiset

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
@file
@brief Public header for libavutil XTEA algorithm
@defgroup lavu_xtea XTEA
***********************************************************/

[CCode (cname="public struct AVXTEA", cheader_filename="libavcodec/xtea.h")]
public struct XTEAContext {
    [CCode (cname="key")]
    public uint32 key[16];

    /***********************************************************
    @brief Allocate an XTEAContext context.
    ***********************************************************/
    [CCode (cname="av_xtea_alloc", cheader_filename="libavcodec/xtea.h")]
    public XTEAContext av_xtea_alloc ();

    /***********************************************************
    @brief Initialize an XTEAContext context.

    @param xtea_context an XTEAContext context
    @param key a key of 16 bytes used for encryption/decryption,
        interpreted as big endian 32 bit numbers
    ***********************************************************/
    [CCode (cname="av_xtea_init", cheader_filename="libavcodec/xtea.h")]
    public void av_xtea_init (
        XTEAContext xtea_context,
        uint8 key[16]
    );

    /***********************************************************
    @brief Initialize an XTEAContext context.

    @param xtea_context an XTEAContext context
    @param key a key of 16 bytes used for encryption/decryption,
        interpreted as little endian 32 bit numbers
    ***********************************************************/
    [CCode (cname="av_xtea_le_init", cheader_filename="libavcodec/xtea.h")]
    public void av_xtea_le_init (
        XTEAContext xtea_context,
        uint8 key[16]
    );

    /***********************************************************
    @brief Encrypt or decrypt a buffer using a previously initialized context,
    in big endian format.

    @param xtea_context an XTEAContext context
    @param output_buffer destination array, can be equal to input_buffer
    @param input_buffer source array, can be equal to output_buffer
    @param count number of 8 byte blocks
    @param initialization_vector initialization vector for CBC mode, if null then ECB will be used
    @param decrypt 0 for encryption, 1 for decryption
    ***********************************************************/
    [CCode (cname="av_xtea_crypt", cheader_filename="libavcodec/xtea.h")]
    public void av_xtea_crypt (
        XTEAContext xtea_context,
        out uint8[] output_buffer,
        uint8[] input_buffer,
        int count,
        uint8[] initialization_vector,
        int decrypt
    );

    /***********************************************************
    @brief Encrypt or decrypt a buffer using a previously initialized context,
    in little endian format.

    @param xtea_context an XTEAContext context
    @param output_buffer destination array, can be equal to input_buffer
    @param input_buffer source array, can be equal to output_buffer
    @param count number of 8 byte blocks
    @param initialization_vector initialization vector for CBC mode, if null then ECB will be used
    @param decrypt 0 for encryption, 1 for decryption
    ***********************************************************/
    [CCode (cname="av_xtea_le_crypt", cheader_filename="libavcodec/xtea.h")]
    public void av_xtea_le_crypt (
        XTEAContext xtea_context,
        out uint8[] output_buffer,
        uint8[] input_buffer,
        int count,
        uint8[] initialization_vector,
        int decrypt
    );
}

} // namespace LibAVUtil.Crypto
