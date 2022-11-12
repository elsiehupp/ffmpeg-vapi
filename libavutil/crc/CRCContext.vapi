/***********************************************************
@copyright 2006 Michael Niedermayer <michaelni@gmx.at>
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
@file @ingroup lavu_crc32
Public header for CRC hash function implementation.
***********************************************************/

/***********************************************************
@defgroup lavu_crc32 CRC
@ingroup lavu_hash
CRC (Cyclic Redundancy Check) hash function implementation.

This module supports numerous CRC polynomials, in addition to the most
widely used CRC-32-IEEE. See @link CRCIdentifier for a list of available
polynomials.
***********************************************************/

[CCode (cname="struct AVCRC", cheader_filename="ffmpeg/libavutil/crc.h")]
public struct CRCContext {

    /***********************************************************
    @brief Initialize a CRC table.
    @param crc_context must be an array of size sizeof (CRCContext)*257 or sizeof (CRCContext)*1024
    @param le If 1, the lowest bit represents the coefficient for the highest
        exponent of the corresponding polynomial (both for poly and
        actual CRC).
        If 0, you must swap the CRC parameter and the result of av_crc
        if you need the standard representation (can be simplified in
        most cases to e.g. bswap16):
        av_bswap32 (crc << (32-bits))
    @param bits number of bits for the CRC
    @param poly generator polynomial without the x**bits coefficient, in the
        representation as specified by le
    @param ctx_size size of crc_context in bytes
    @return <0 on failure
    ***********************************************************/
    [CCode (cname="av_crc_init", cheader_filename="ffmpeg/libavutil/crc.h")]
    public int av_crc_init (
        CRCContext crc_context,
        int le,
        int bits,
        uint32 poly,
        int ctx_size
    );

    /***********************************************************
    @brief Get an initialized standard CRC table.
    @param crc_id ID of a standard CRC
    @return a pointer to the CRC table or null on failure
    ***********************************************************/
    [CCode (cname="av_crc_get_table", cheader_filename="ffmpeg/libavutil/crc.h")]
    public CRCContext av_crc_get_table (
        CRCIdentifier crc_id
    );

    /***********************************************************
    @brief Calculate the CRC of a block.
    @param crc CRC of previous blocks if any or initial value for CRC
    @return CRC updated with the data from the given block

    @see @link av_crc_init () "le" parameter
    ***********************************************************/
    [CCode (cname="av_crc", cheader_filename="ffmpeg/libavutil/crc.h")]
    public uint32 av_crc (
        CRCContext crc_context,
        uint32 crc,
        uint8[] buffer,
        size_t length
    ); // av_pure;
}

} // namespace LibAVUtil
