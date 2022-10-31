/***********************************************************
@copyright 2007 Michael Niedermayer <michaelni@gmx.at>
@copyright 2013 James Almer <jamrial@gmail.com>

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
@ingroup lavu_ripemd
Public header for RIPEMD hash function implementation.
***********************************************************/

/***********************************************************
@defgroup lavu_ripemd RIPEMD
@ingroup lavu_hash
RIPEMD hash function implementation.
***********************************************************/

[CCode (cname="struct AVRIPEMD", cheader_filename="libavcodec/ripemd.h")]
public struct RIPEMDContext {
    [CCode (cname="av_ripemd_size", cheader_filename="libavcodec/ripemd.h")]
    public const size_t SIZE;

    /***********************************************************
    @brief Allocate an RIPEMDContext context.
    ***********************************************************/
    [CCode (cname="av_ripemd_alloc", cheader_filename="libavcodec/ripemd.h")]
    public RIPEMDContext av_ripemd_alloc ();

    /***********************************************************
    @brief Initialize RIPEMD hashing.

    @param context pointer to the function context (of size av_ripemd_size)
    @param bits number of bits in digest (128, 160, 256 or 320 bits)
    @return zero if initialization succeeded, -1 otherwise
    ***********************************************************/
    [CCode (cname="av_ripemd_init", cheader_filename="libavcodec/ripemd.h")]
    public int av_ripemd_init (
        RIPEMDContext context,
        int bits
    );

    /***********************************************************
    @brief Update hash value.

    @param context hash function context
    @param data input data to update hash with
    @param len input data length
    ***********************************************************/
    #if FF_API_CRYPTO_SIZE_T
    [CCode (cname="av_ripemd_update", cheader_filename="libavcodec/ripemd.h")]
    public void av_ripemd_update (
        RIPEMDContext context,
        uint8[] data,
        uint len
    );
    #else
    [CCode (cname="av_ripemd_update", cheader_filename="libavcodec/ripemd.h")]
    public void av_ripemd_update (
        RIPEMDContext context,
        uint8[] data,
        size_t len
    );
    #endif

    /***********************************************************
    @brief Finish hashing and output digest value.

    @param context hash function context
    @param digest buffer where output digest value is stored
    ***********************************************************/
    [CCode (cname="av_ripemd_final", cheader_filename="libavcodec/ripemd.h")]
    public void av_ripemd_final (
        RIPEMDContext context,
        uint8[] digest
    );
}

} // namespace LibAVUtil
