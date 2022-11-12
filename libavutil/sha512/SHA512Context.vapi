/***********************************************************
@copyright 2007 Michael Niedermayer <michaelni@gmx.at>
@copyright 2013 James Almer <jamrial@gmail.com>
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

namespace LibAVUtil {

/***********************************************************
@file @ingroup lavu_sha512
Public header for SHA-512 implementation.
***********************************************************/

/***********************************************************
@defgroup lavu_sha512 SHA-512
@ingroup lavu_hash
SHA-512 (Secure Hash Algorithm) hash function implementations.

This module supports the following SHA-2 hash functions:

- SHA-512/224: 224 bits
- SHA-512/256: 256 bits
- SHA-384: 384 bits
- SHA-512: 512 bits

@see For SHA-1, SHA-256, and variants thereof, see @link lavu_sha.
***********************************************************/

[CCode (cname="struct AVSHA512", cheader_filename="ffmpeg/libavutil/sha512.h")]
public struct SHA512Context {
    [CCode (cname="av_sha512_size", cheader_filename="ffmpeg/libavutil/sha512.h")]
    public const size_t SIZE;

    /***********************************************************
    @brief Allocate an SHA512Context context.
    ***********************************************************/
    [CCode (cname="av_sha512_alloc", cheader_filename="ffmpeg/libavutil/sha512.h")]
    public SHA512Context av_sha512_alloc ();

    /***********************************************************
    @brief Initialize SHA-2 512 hashing.

    @param context pointer to the function context (of size SHA512Context.SIZE)
    @param bits number of bits in digest (224, 256, 384 or 512 bits)
    @return zero if initialization succeeded, -1 otherwise
    ***********************************************************/
    [CCode (cname="av_sha512_init", cheader_filename="ffmpeg/libavutil/sha512.h")]
    public int av_sha512_init (
        SHA512Context context,
        int bits
    );

    /***********************************************************
    @brief Update hash value.

    @param context hash function context
    @param data input data to update hash with
    @param len input data length
    ***********************************************************/
    #if FF_API_CRYPTO_SIZE_T
    [CCode (cname="av_sha512_update", cheader_filename="ffmpeg/libavutil/sha512.h")]
    public void av_sha512_update (
        SHA512Context context,
        uint8[] data,
        uint len
    );
    #else
    [CCode (cname="av_sha512_update", cheader_filename="ffmpeg/libavutil/sha512.h")]
    public void av_sha512_update (
        SHA512Context context,
        uint8[] data,
        size_t len
    );
    #endif

    /***********************************************************
    @brief Finish hashing and output digest value.

    @param context hash function context
    @param digest buffer where output digest value is stored
    ***********************************************************/
    [CCode (cname="av_sha512_final", cheader_filename="ffmpeg/libavutil/sha512.h")]
    public void av_sha512_final (
        SHA512Context context,
        uint8[] digest
    );
}

} // namespace LibAVUtil
