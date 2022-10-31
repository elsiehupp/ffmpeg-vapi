/***********************************************************
@brief Blowfish algorithm
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
@defgroup lavu_blowfish Blowfish
***********************************************************/

[CCode (cname="struct AVBlowfish", cheader_filename="ffmpeg/libavutil/blowfish.h")]
public struct BlowfishContext {

    [CCode (cname="AV_BF_ROUNDS", cheader_filename="ffmpeg/libavutil/blowfish.h")]
    public const int AV_BF_ROUNDS;

    [CCode (cname="p")]
    public uint32 p[AV_BF_ROUNDS + 2];
    [CCode (cname="s")]
    public uint32 s[4 * 256];

    /***********************************************************
    @brief Allocate an BlowfishContext context.
    ***********************************************************/
    [CCode (cname="av_blowfish_alloc", cheader_filename="ffmpeg/libavutil/blowfish.h")]
    public BlowfishContext av_blowfish_alloc ();

    /***********************************************************
    @brief Initialize an BlowfishContext context.

    @param blowfish an BlowfishContext context
    @param key a key
    @param key_len length of the key
    ***********************************************************/
    [CCode (cname="av_blowfish_init", cheader_filename="ffmpeg/libavutil/blowfish.h")]
    public void av_blowfish_init (
        BlowfishContext blowfish,
        uint8[] key,
        int key_len
    );

    /***********************************************************
    @brief Encrypt or decrypt a buffer using a previously initialized context.

    @param blowfish an BlowfishContext context
    @param xl left four bytes halves of input to be encrypted
    @param xr right four bytes halves of input to be encrypted
    @param decrypt 0 for encryption, 1 for decryption
    ***********************************************************/
    [CCode (cname="av_blowfish_crypt_ecb", cheader_filename="ffmpeg/libavutil/blowfish.h")]
    public void av_blowfish_crypt_ecb (
        BlowfishContext blowfish,
        uint32[] xl,
        uint32[] xr,
        int decrypt
    );

    /***********************************************************
    @brief Encrypt or decrypt a buffer using a previously initialized context.

    @param blowfish an BlowfishContext context
    @param output_buffer destination array, can be equal to input_buffer
    @param input_buffer source array, can be equal to output_buffer
    @param count number of 8 byte blocks
    @param initialization_vector initialization vector for CBC mode, if null ECB will be used
    @param decrypt 0 for encryption, 1 for decryption
    ***********************************************************/
    [CCode (cname="av_blowfish_crypt", cheader_filename="ffmpeg/libavutil/blowfish.h")]
    public void av_blowfish_crypt (
        BlowfishContext blowfish,
        out uint8[] output_buffer,
        uint8[] input_buffer,
        int count,
        uint8[] initialization_vector,
        int decrypt
    );

}

} // namespace LibAVUtil.Crypto
