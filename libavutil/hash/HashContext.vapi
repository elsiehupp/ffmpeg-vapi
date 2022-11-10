/***********************************************************
@copyright 2013 Reimar Döffinger <Reimar.Doeffinger@gmx.de>
***********************************************************/
/***********************************************************
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
@file @ingroup lavu_hash_generic
Generic hashing API
***********************************************************/

/***********************************************************
@defgroup lavu_hash Hash Functions
Hash functions useful in multimedia.

Hash functions are widely used in multimedia, from error checking and
concealment to internal regression testing. libavutil has efficient
implementations of a variety of hash functions that may be useful for
FFmpeg and other multimedia applications.


@defgroup lavu_hash_generic Generic Hashing API
An abstraction layer for all hash functions supported by libavutil.

If your application needs to support a wide range of different hash
functions, then the Generic Hashing API is for you. It provides a generic,
reusable API for @link lavu_hash "all hash functions" implemented in libavutil.
If you just need to use one particular hash function, use the @link lavu_hash
"individual hash" directly.

@section Sample Code

A basic template for using the Generic Hashing API follows:

@code
public struct HashContext hash_context = null;
const string hash_name = null;
uint8[] output_buf = null;

// Select from a string returned by av_hash_names ()
hash_name = ...;

// Allocate a hash context
ret = av_hash_alloc (&hash_context, hash_name);
if (ret < 0)
    return ret;

// Initialize the hash context
av_hash_init (hash_context);

// Update the hash context with data
while (data_left) {
    av_hash_update (hash_context, data, size);
}

// Now we have no more data, so it is time to finalize the hash and get the
// output. But we need to first allocate an output buffer. Note that you can
// use any memory allocation function, including malloc (), not just
// av_malloc ().
output_buf = av_malloc (av_hash_get_size (hash_context));
if (!output_buf)
    return LibAVUtil.ErrorCode (ENOMEM);

// Finalize the hash context.
// You can use any of the av_hash_final*() functions provided, for other
// output formats. If you do so, be sure to adjust the memory allocation
// above. See the function documentation below for the exact amount of extra
// memory needed.
av_hash_final (hash_context, output_buffer);

// Free the context
av_hash_freep (&hash_context);
@endcode

@section Hash Function-Specific Information
If the CRC32 hash is selected, the #AV_CRC_32_IEEE polynomial will be
used.

If the Murmur3 hash is selected, the default seed will be used. See @ref
lavu_murmur3_seedinfo "Murmur3" for more information.
***********************************************************/

/***********************************************************
@example ffhash.c
This example is a simple command line application that takes one or more
arguments. It demonstrates a typical use of the hashing API with allocation,
initialization, updating, and finalizing.
***********************************************************/

[CCode (cname="struct AVHashContext", cheader_filename="ffmpeg/libavutil/hash.h")]
public struct HashContext {

    /***********************************************************
    @brief Allocate a hash context for the algorithm specified by name.

    @return  >= 0 for success, a negative error code for failure

    @note The context is not initialized after a call to this function; you must
    call av_hash_init () to do so.
    ***********************************************************/
    [CCode (cname="av_hash_alloc", cheader_filename="ffmpeg/libavutil/hash.h")]
    public int av_hash_alloc (
        HashContext hash_context,
        string name
    );

    /***********************************************************
    @brief Get the names of available hash algorithms.

    This function can be used to enumerate the algorithms.

    @param[in] i Index of the hash algorithm, starting from 0
    @return Pointer to a static string or `null` if `i` is out of range
    ***********************************************************/
    [CCode (cname="av_hash_names", cheader_filename="ffmpeg/libavutil/hash.h")]
    public string av_hash_names (
        int i
    );

    /***********************************************************
    @brief Get the name of the algorithm corresponding to the given hash context.
    ***********************************************************/
    [CCode (cname="av_hash_get_name", cheader_filename="ffmpeg/libavutil/hash.h")]
    public string av_hash_get_name (
        HashContext hash_context
    );

    /***********************************************************
    @brief Maximum value that av_hash_get_size () will currently return.

    You can use this if you absolutely want or need to use static allocation for
    the output buffer and are fine with not supporting hashes newly added to
    libavutil without recompilation.

    @warning
    Adding new hashes with larger sizes, and increasing the macro while doing
    so, will not be considered an ABI change. To prevent your code from
    overflowing a buffer, either dynamically allocate the output buffer with
    av_hash_get_size (), or limit your use of the Hashing API to hashes that are
    already in FFmpeg during the time of compilation.
    ***********************************************************/
    [CCode (cname="AV_HASH_MAX_SIZE", cheader_filename="ffmpeg/libavutil/hash.h")]
    public const size_t AV_HASH_MAX_SIZE;

    /***********************************************************
    @brief Get the size of the resulting hash value in bytes.

    The maximum value this function will currently return is available as macro
    #AV_HASH_MAX_SIZE.

    @param[in] hash_context Hash context
    @return Size of the hash value in bytes
    ***********************************************************/
    [CCode (cname="av_hash_get_size", cheader_filename="ffmpeg/libavutil/hash.h")]
    public int av_hash_get_size (
        HashContext hash_context
    );

    /***********************************************************
    @brief Initialize or reset a hash context.

    @param[in,out] hash_context Hash context
    ***********************************************************/
    [CCode (cname="av_hash_init", cheader_filename="ffmpeg/libavutil/hash.h")]
    public void av_hash_init (
        HashContext hash_context
    );

    /***********************************************************
    @brief Update a hash context with additional data.

    @param[in,out] hash_context Hash context
    @param[in] input_buffer Data to be added to the hash context
    @param[in] len Size of the additional data
    ***********************************************************/
    #if FF_API_CRYPTO_SIZE_T
    [CCode (cname="av_hash_update", cheader_filename="ffmpeg/libavutil/hash.h")]
    public void av_hash_update (
        HashContext hash_context,
        uint8[] input_buffer,
        int len
    );
    #else
    [CCode (cname="av_hash_update", cheader_filename="ffmpeg/libavutil/hash.h")]
    public void av_hash_update (
        HashContext hash_context,
        uint8[] input_buffer,
        size_t len
    );
    #endif

    /***********************************************************
    @brief Finalize a hash context and compute the actual hash value.

    The minimum size of `output_buffer` buffer is given by av_hash_get_size () or
    #AV_HASH_MAX_SIZE. The use of the latter macro is discouraged.

    It is not safe to update or finalize a hash context again, if it has already
    been finalized.

    @param[in,out] hash_context Hash context
    @param[out] output_buffer Where the final hash value will be stored

    @see @link av_hash_final_bin () provides an alternative API
    ***********************************************************/
    [CCode (cname="av_hash_final", cheader_filename="ffmpeg/libavutil/hash.h")]
    public void av_hash_final (
        HashContext hash_context,
        out uint8[] output_buffer
    );

    /***********************************************************
    @brief Finalize a hash context and store the actual hash value in a buffer.

    It is not safe to update or finalize a hash context again, if it has already
    been finalized.

    If `size` is smaller than the hash size (given by av_hash_get_size ()), the
    hash is truncated; if size is larger, the buffer is padded with 0.

    @param[in,out] hash_context Hash context
    @param[out] output_buffer Where the final hash value will be stored
    @param[in] size Number of bytes to write to `output_buffer`
    ***********************************************************/
    [CCode (cname="av_hash_final_bin", cheader_filename="ffmpeg/libavutil/hash.h")]
    public void av_hash_final_bin (
        HashContext hash_context,
        out uint8[] output_buffer,
        int size
    );

    /***********************************************************
    @brief Finalize a hash context and store the hexadecimal representation of the
    actual hash value as a string.

    It is not safe to update or finalize a hash context again, if it has already
    been finalized.

    The string is always 0-terminated.

    If `size` is smaller than `2 * hash_size + 1`, where `hash_size` is the
    value returned by av_hash_get_size (), the string will be truncated.

    @param[in,out] hash_context Hash context
    @param[out] output_buffer Where the string will be stored
    @param[in] size Maximum number of bytes to write to `output_buffer`
    ***********************************************************/
    [CCode (cname="av_hash_final_hex", cheader_filename="ffmpeg/libavutil/hash.h")]
    public void av_hash_final_hex (
        HashContext hash_context,
        out uint8[] output_buffer,
        int size
    );

    /***********************************************************
    @brief Finalize a hash context and store the Base64 representation of the
    actual hash value as a string.

    It is not safe to update or finalize a hash context again, if it has already
    been finalized.

    The string is always 0-terminated.

    If `size` is smaller than AV_BASE64_SIZE (hash_size), where `hash_size` is
    the value returned by av_hash_get_size (), the string will be truncated.

    @param[in,out] hash_context Hash context
    @param[out] output_buffer Where the final hash value will be stored
    @param[in] size Maximum number of bytes to write to `output_buffer`
    ***********************************************************/
    [CCode (cname="av_hash_final_b64", cheader_filename="ffmpeg/libavutil/hash.h")]
    public void av_hash_final_b64 (
        HashContext hash_context,
        out uint8[] output_buffer,
        int size
    );

    /***********************************************************
    @brief Free hash context and set hash context pointer to `null`.

    @param[in,out] hash_context Pointer to hash context
    ***********************************************************/
    [CCode (cname="av_hash_freep", cheader_filename="ffmpeg/libavutil/hash.h")]
    public void av_hash_freep (
        HashContext hash_context
    );

}

} // namespace LibAVUtil.Crypto
