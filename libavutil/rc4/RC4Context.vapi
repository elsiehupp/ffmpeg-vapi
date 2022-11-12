/***********************************************************
@brief RC4 encryption/decryption/pseudo-random number generator
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
@defgroup lavu_rc4 RC4
***********************************************************/

[CCode (cname="struct AVRC4", cheader_filename="ffmpeg/libavutil/rc4.h")]
public struct RC4Context {
    [CCode (cname="state")]
    public uint8 state[256];

    [CCode (cname="x")]
    public int x;

    [CCode (cname="y")]
    public int y;

    /***********************************************************
    @brief Allocate an RC4Context context.
    ***********************************************************/
    [CCode (cname="av_rc4_alloc", cheader_filename="ffmpeg/libavutil/rc4.h")]
    public RC4Context av_rc4_alloc ();

    /***********************************************************
    @brief Initializes an RC4Context context.

    @param key_bits must be a multiple of 8
    @param decrypt 0 for encryption, 1 for decryption, currently has no effect
    @return zero on success, negative value otherwise
    ***********************************************************/
    [CCode (cname="av_rc4_init", cheader_filename="ffmpeg/libavutil/rc4.h")]
    public int av_rc4_init (
        RC4Context d,
        uint8[] key,
        int key_bits,
        int decrypt
    );

    /***********************************************************
    @brief Encrypts / decrypts using the RC4 algorithm.

    @param count number of bytes
    @param output_buffer destination array, can be equal to input_buffer
    @param input_buffer source array, can be equal to output_buffer, may be null
    @param initialization_vector not (yet) used for RC4, should be null
    @param decrypt 0 for encryption, 1 for decryption, not (yet) used
    ***********************************************************/
    [CCode (cname="av_rc4_crypt", cheader_filename="ffmpeg/libavutil/rc4.h")]
    public void av_rc4_crypt (
        RC4Context d,
        out uint8[] output_buffer,
        uint8[] input_buffer,
        int count,
        uint8[] initialization_vector,
        int decrypt
    );
}

} // namespace LibAVUtil.Crypto
