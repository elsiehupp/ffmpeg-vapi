/***********************************************************
@copyright 2013 Reimar Döffinger <Reimar.Doeffinger@gmx.de>

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
@ingroup lavu_murmur3
Public header for MurmurHash3 hash function implementation.
***********************************************************/

/***********************************************************
@defgroup lavu_murmur3 Murmur3
@ingroup lavu_hash
MurmurHash3 hash function implementation.

MurmurHash3 is a non-cryptographic hash function, of which three
incompatible versions were created by its inventor Austin Appleby:

- 32-bit output
- 128-bit output for 32-bit platforms
- 128-bit output for 64-bit platforms

FFmpeg only implements the last variant: 128-bit output designed for 64-bit
platforms. Even though the hash function was designed for 64-bit platforms,
the function in reality works on 32-bit systems too, only with reduced
performance.

@anchor lavu_murmur3_seedinfo
By design, MurmurHash3 requires a seed to operate. In response to this,
libavutil provides two functions for hash initiation, one that requires a
seed (av_murmur3_init_seeded ()) and one that uses a fixed arbitrary integer
as the seed, and therefore does not (av_murmur3_init ()).

To make hashes comparable, you should provide the same seed for all calls to
this hash function -- if you are supplying one yourself, that is.
***********************************************************/
[CCode (cname="AVMurMur3", cheader_filename="ffmpeg/libavutil/murmur3.h")]
public struct MurMur3Context {
    /***********************************************************
    @brief Allocate an LibAVUtil.MurMur3Context hash context.

    @return Uninitialized hash context or `null` in case of error
    ***********************************************************/
    [CCode (cname="av_murmur3_alloc", cheader_filename="ffmpeg/libavutil/murmur3.h")]
    public LibAVUtil.MurMur3Context av_murmur3_alloc ();

    /***********************************************************
    @brief Initialize or reinitialize an LibAVUtil.MurMur3Context hash context with a seed.

    @param[out] hash_context Hash context
    @param[in] seed Random seed

    @see @link av_murmur3_init ()
    @see @link lavu_murmur3_seedinfo "Detailed description" on a discussion of
    seeds for MurmurHash3.
    ***********************************************************/
    [CCode (cname="av_murmur3_init_seeded", cheader_filename="ffmpeg/libavutil/murmur3.h")]
    public void av_murmur3_init_seeded (
        LibAVUtil.MurMur3Context hash_context,
        uint64 seed
    );

    /***********************************************************
    @brief Initialize or reinitialize an LibAVUtil.MurMur3Context hash context.

    Equivalent to av_murmur3_init_seeded () with a built-in seed.

    @param[out] hash_context Hash context

    @see @link av_murmur3_init_seeded ()
    @see @link lavu_murmur3_seedinfo "Detailed description" on a discussion of
    seeds for MurmurHash3.
    ***********************************************************/
    [CCode (cname="av_murmur3_init", cheader_filename="ffmpeg/libavutil/murmur3.h")]
    public void av_murmur3_init (
        LibAVUtil.MurMur3Context hash_context
    );

    /***********************************************************
    @brief Update hash context with new data.

    @param[out] hash_context Hash context
    @param[in] input_buffer Input data to update hash with
    @param[in] len Number of bytes to read from `input_buffer`
    ***********************************************************/
    #if FF_API_CRYPTO_SIZE_T
    [CCode (cname="av_murmur3_update", cheader_filename="ffmpeg/libavutil/murmur3.h")]
    public void av_murmur3_update (
        LibAVUtil.MurMur3Context hash_context,
        uint8[] input_buffer,
        int len
    );
    #else
    [CCode (cname="av_murmur3_update", cheader_filename="ffmpeg/libavutil/murmur3.h")]
    public void av_murmur3_update (
        LibAVUtil.MurMur3Context hash_context,
        uint8[] input_buffer,
        size_t len
    );
    #endif

    /***********************************************************
    @brief Finish hashing and output digest value.

    @param[in,out] hash_context Hash context
    @param[out] output_buffer Buffer where output digest value is stored
    ***********************************************************/
    [CCode (cname="av_murmur3_final", cheader_filename="ffmpeg/libavutil/murmur3.h")]
    public void av_murmur3_final (
        LibAVUtil.MurMur3Context hash_context,
        out uint8 output_buffer[16]
    );

}

} // namespace LibAVUtil
