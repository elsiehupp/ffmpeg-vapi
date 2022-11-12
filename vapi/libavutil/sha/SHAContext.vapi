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

namespace LibAVUtil {

/***********************************************************
@file @ingroup lavu_sha
Public header for SHA-1 & SHA-256 hash function implementations.
***********************************************************/

/***********************************************************
@defgroup lavu_sha SHA
@ingroup lavu_hash
SHA-1 and SHA-256 (Secure Hash Algorithm) hash function implementations.

This module supports the following SHA hash functions:

- SHA-1: 160 bits
- SHA-224: 224 bits, as a variant of SHA-2
- SHA-256: 256 bits, as a variant of SHA-2

@note For SHA-384, SHA-512, and variants thereof, see
    @link lavu_sha512.
***********************************************************/

[CCode (cname="struct AVSHA", cheader_filename="ffmpeg/libavutil/sha.h")]
public struct SHAContext {
    [CCode (cname="av_sha_size", cheader_filename="ffmpeg/libavutil/sha.h")]
    public const size_t SIZE;

    /***********************************************************
    @brief Allocate an SHAContext context.
        ***********************************************************/
    [CCode (cname="av_sha_alloc", cheader_filename="ffmpeg/libavutil/sha.h")]
    public SHAContext av_sha_alloc ();

    /***********************************************************
    @brief Initialize SHA-1 or SHA-2 hashing.

    @param context pointer to the function context (of size av_sha_size)
    @param bits number of bits in digest (SHA-1 - 160 bits, SHA-2 224 or 256 bits)
    @return zero if initialization succeeded, -1 otherwise
        ***********************************************************/
    [CCode (cname="av_sha_init", cheader_filename="ffmpeg/libavutil/sha.h")]
    public int av_sha_init (
        SHAContext context,
        int bits
    );

    /***********************************************************
    @brief Update hash value.

    @param sha_context hash function context
    @param data input data to update hash with
    @param len input data length
        ***********************************************************/
    #if FF_API_CRYPTO_SIZE_T
    [CCode (cname="av_sha_update", cheader_filename="ffmpeg/libavutil/sha.h")]
    public void av_sha_update (
        SHAContext sha_context,
        uint8[] data,
        uint len
    );
    #else
    [CCode (cname="av_sha_update", cheader_filename="ffmpeg/libavutil/sha.h")]
    public void av_sha_update (
        SHAContext sha_context,
        uint8[] data,
        size_t len
    );
    #endif

    /***********************************************************
    @brief Finish hashing and output digest value.

    @param context hash function context
    @param digest buffer where output digest value is stored
        ***********************************************************/
    [CCode (cname="av_sha_final", cheader_filename="ffmpeg/libavutil/sha.h")]
    public void av_sha_final (
        SHAContext context,
        uint8[] digest
    );
}

} // namespace LibAVUtil
