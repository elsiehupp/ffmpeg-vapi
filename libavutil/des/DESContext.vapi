/***********************************************************
@brief DES encryption/decryption
@copyright 2007 Reimar Doeffinger
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
@defgroup lavu_des DES
***********************************************************/

[CCode (cname="struct AVDES", cheader_filename="ffmpeg/libavutil/des.h")]
public struct DESContext {
    [CCode (cname="round_keys")]
    public uint64 round_keys[3 * 16];

    [CCode (cname="triple_des")]
    public int triple_des;

    /***********************************************************
    @brief Allocate an DESContext context.
    ***********************************************************/
    [CCode (cname="av_des_alloc", cheader_filename="ffmpeg/libavutil/des.h")]
    public DESContext av_des_alloc ();

    /***********************************************************
    @brief Initializes an DESContext context.

    @param key_bits must be 64 or 192
    @param decrypt 0 for encryption/CBC-MAC, 1 for decryption
    @return zero on success, negative value otherwise
    ***********************************************************/
    [CCode (cname="av_des_init", cheader_filename="ffmpeg/libavutil/des.h")]
    public int av_des_init (
        DESContext des_context,
        uint8[] key,
        int key_bits,
        int decrypt
    );

    /***********************************************************
    @brief Encrypts / decrypts using the DES algorithm.

    @param count number of 8 byte blocks
    @param output_buffer destination array, can be equal to input_buffer, must be 8-byte aligned
    @param input_buffer source array, can be equal to output_buffer, must be 8-byte aligned, may be null
    @param initialization_vector initialization vector for CBC mode, if null then ECB will be used,
        must be 8-byte aligned
    @param decrypt 0 for encryption, 1 for decryption
    ***********************************************************/
    [CCode (cname="av_des_crypt", cheader_filename="ffmpeg/libavutil/des.h")]
    public void av_des_crypt (
        DESContext des_context,
        out uint8[] output_buffer,
        uint8[] input_buffer,
        int count,
        uint8[] initialization_vector,
        int decrypt
    );

    /***********************************************************
    @brief Calculates CBC-MAC using the DES algorithm.

    @param count number of 8 byte blocks
    @param output_buffer destination array, can be equal to input_buffer, must be 8-byte aligned
    @param input_buffer source array, can be equal to output_buffer, must be 8-byte aligned, may be null
    ***********************************************************/
    [CCode (cname="av_des_mac", cheader_filename="ffmpeg/libavutil/des.h")]
    public void av_des_mac (
        DESContext des_context,
        out uint8[] output_buffer,
        uint8[] input_buffer,
        int count
    );
}

} // namespace LibAVUtil.Crypto
