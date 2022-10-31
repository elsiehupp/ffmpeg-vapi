/***********************************************************
@copyright 2006 Michael Niedermayer <michaelni@gmx.at>

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

/***********************************************************
@file
@ingroup lavu_md5
Public header for MD5 hash function implementation.
***********************************************************/

/***********************************************************
@defgroup lavu_md5 MD5
@ingroup lavu_hash
MD5 hash function implementation.
***********************************************************/

[CCode (cname="struct AVMD5", cheader_filename="libavcodec/md5.h")]
public struct MD5Context {
    [CCode (cname="av_md5_size", cheader_filename="libavcodec/md5.h")]
    public const size_t SIZE;

    /***********************************************************
    @brief Allocate an MD5Context context.
    ***********************************************************/
    [CCode (cname="av_md5_alloc", cheader_filename="libavcodec/md5.h")]
    public MD5Context av_md5_alloc ();

    /***********************************************************
    @brief Initialize MD5 hashing.

    @param md5_context pointer to the function context (of size av_md5_size)
    ***********************************************************/
    [CCode (cname="av_md5_init", cheader_filename="libavcodec/md5.h")]
    public void av_md5_init (
        MD5Context md5_context
    );

    /***********************************************************
    @brief Update hash value.

    @param md5_context hash function context
    @param input_buffer input data to update hash with
    @param len input data length
    ***********************************************************/
    #if FF_API_CRYPTO_SIZE_T
    [CCode (cname="av_md5_update", cheader_filename="libavcodec/md5.h")]
    public void av_md5_update (
        MD5Context md5_context,
        uint8[] input_buffer,
        int len
    );
    #else
    [CCode (cname="av_md5_update", cheader_filename="libavcodec/md5.h")]
    public void av_md5_update (
        MD5Context md5_context,
        uint8[] input_buffer,
        size_t len
    );
    #endif

    /***********************************************************
    @brief Finish hashing and output digest value.

    @param md5_context hash function context
    @param output_buffer buffer where output digest value is stored
    ***********************************************************/
    [CCode (cname="av_md5_final", cheader_filename="libavcodec/md5.h")]
    public void av_md5_final (
        MD5Context md5_context,
        out uint8[] output_buffer
    );

    /***********************************************************
    @brief Hash an array of data.

    @param output_buffer The output buffer to write the digest into
    @param input_buffer The data to hash
    @param len The length of the data, in bytes
    ***********************************************************/
    #if FF_API_CRYPTO_SIZE_T
    [CCode (cname="av_md5_sum", cheader_filename="libavcodec/md5.h")]
    public void av_md5_sum (
        out uint8[] output_buffer,
        uint8[] input_buffer,
        int len
    );
    #else
    [CCode (cname="av_md5_sum", cheader_filename="libavcodec/md5.h")]
    public void av_md5_sum (
        out uint8[] output_buffer,
        uint8[] input_buffer,
        size_t len
    );
    #endif
}

} // namespace LibAVUtil
