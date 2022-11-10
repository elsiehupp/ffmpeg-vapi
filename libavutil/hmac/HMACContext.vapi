/***********************************************************
@copyright 2012 Martin Storsjo
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
@defgroup lavu_hmac HMAC
***********************************************************/

[CCode (cname="struct AVHMAC", cheader_filename="ffmpeg/libavutil/hmac.h")]
public struct HMACContext {

    /***********************************************************
    @brief Allocate an HMACContext context.
    @param type The hash function used for the HMAC.
    ***********************************************************/
    [CCode (cname="av_hmac_alloc", cheader_filename="ffmpeg/libavutil/hmac.h")]
    public HMACContext av_hmac_alloc (
        HMACType type
    );

    /***********************************************************
    @brief Free an HMACContext context.
    @param hmac_context The context to free, may be null
    ***********************************************************/
    [CCode (cname="av_hmac_free", cheader_filename="ffmpeg/libavutil/hmac.h")]
    public void av_hmac_free (
        HMACContext hmac_context
    );

    /***********************************************************
    @brief Initialize an HMACContext context with an authentication key.
    @param hmac_context The HMAC context
    @param key The authentication key
    @param keylen The length of the key, in bytes
    ***********************************************************/
    [CCode (cname="av_hmac_init", cheader_filename="ffmpeg/libavutil/hmac.h")]
    public void av_hmac_init (
        HMACContext hmac_context,
        uint8[] key,
        uint keylen
    );

    /***********************************************************
    @brief Hash data with the HMAC.
    @param hmac_context The HMAC context
    @param data The data to hash
    @param len The length of the data, in bytes
    ***********************************************************/
    [CCode (cname="av_hmac_update", cheader_filename="ffmpeg/libavutil/hmac.h")]
    public void av_hmac_update (
        HMACContext hmac_context,
        uint8[] data,
        uint len
    );

    /***********************************************************
    @brief Finish hashing and output the HMAC digest.
    @param hmac_context The HMAC context
    @param output_buffer The output buffer to write the digest into
    @param output_length The length of the out buffer, in bytes
    @return The number of bytes written to output_buffer, or a negative error code.
    ***********************************************************/
    [CCode (cname="av_hmac_final", cheader_filename="ffmpeg/libavutil/hmac.h")]
    public int av_hmac_final (
        HMACContext hmac_context,
        out uint8[] output_buffer,
        out uint output_length
    );

    /***********************************************************
    @brief Hash an array of data with a key.
    @param hmac_context The HMAC context
    @param data The data to hash
    @param len The length of the data, in bytes
    @param key The authentication key
    @param keylen The length of the key, in bytes
    @param output_buffer The output buffer to write the digest into
    @param output_length The length of the out buffer, in bytes
    @return The number of bytes written to output_buffer, or a negative error code.
    ***********************************************************/
    [CCode (cname="av_hmac_calc", cheader_filename="ffmpeg/libavutil/hmac.h")]
    public int av_hmac_calc (
        HMACContext hmac_context,
        uint8[] data,
        uint len,
        uint8[] key,
        uint keylen,
        out uint8[] output_buffer,
        out uint output_length
    );
}

} // namespace LibAVUtil.Crypto
