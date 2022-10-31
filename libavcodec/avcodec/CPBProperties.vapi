/***********************************************************
@copyright 2001 Fabrice Bellard

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

namespace LibAVCodec {
using LibAVUtil;

/***********************************************************
@file
@ingroup libavc
LibAVCodec external API header
***********************************************************/

/***********************************************************
@brief This structure describes the bitrate properties of an encoded bitstream. It
roughly corresponds to a subset the VBV parameters for MPEG-2 or HRD
parameters for H.264/HEVC.
***********************************************************/
[CCode (cname="struct AVCPBProperties", cheader_filename="libavcodec/avcodec.h")]
public struct CPBProperties {
    /***********************************************************
    @brief Maximum bitrate of the stream, in bits per second.
    Zero if unknown or unspecified.
    ***********************************************************/
#if FF_API_UNSANITIZED_BITRATES
    [CCode (cname="max_bitrate")]
    public int max_bitrate;
#else
    [CCode (cname="max_bitrate")]
    public int64 max_bitrate;
#endif
    /***********************************************************
    @brief Minimum bitrate of the stream, in bits per second.
    Zero if unknown or unspecified.
    ***********************************************************/
#if FF_API_UNSANITIZED_BITRATES
    [CCode (cname="min_bitrate")]
    public int min_bitrate;
#else
    [CCode (cname="min_bitrate")]
    public int64 min_bitrate;
#endif
    /***********************************************************
    @brief Average bitrate of the stream, in bits per second.
    Zero if unknown or unspecified.
    ***********************************************************/
#if FF_API_UNSANITIZED_BITRATES
    [CCode (cname="avg_bitrate")]
    public int avg_bitrate;
#else
    [CCode (cname="avg_bitrate")]
    public int64 avg_bitrate;
#endif

    /***********************************************************
    @brief The size of the buffer to which the ratecontrol is applied, in bits.
    Zero if unknown or unspecified.
    ***********************************************************/
    [CCode (cname="buffer_size")]
    public int buffer_size;

    /***********************************************************
    @brief The delay between the time the packet this structure is associated with
    is received and the time when it should be decoded, in periods of a 27MHz
    clock.

    UINT64_MAX when unknown or unspecified.
    ***********************************************************/
    [CCode (cname="vbv_delay")]
    public uint64 vbv_delay;

    /***********************************************************
    @brief Allocate a CPB properties structure and initialize its fields to default
    values.

    @param size if non-null, the size of the allocated struct will be written
        here. This is useful for embedding it in side data.

    @return the newly allocated struct or null on failure
    ***********************************************************/
    [CCode (cname="av_cpb_properties_alloc", cheader_filename="libavcodec/avcodec.h")]
    public CPBProperties av_cpb_properties_alloc (out size_t size);

}

} // namespace LibAVCodec
