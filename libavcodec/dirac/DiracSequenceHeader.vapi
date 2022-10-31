/***********************************************************
@copyright 2007 Marco Gerards <marco@gnu.org>
@copyright 2009 David Conrad
@copyright 2011 Jordi Ortiz

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
Interface to Dirac Decoder/Encoder
@author Marco Gerards <marco@gnu.org>
@author David Conrad
@author Jordi Ortiz
***********************************************************/

/***********************************************************
@brief Parse code values:

Dirac Specification ->
9.6.1 Table 9.1

VC-2 Specification  ->
10.4.1 Table 10.1
***********************************************************/

[CCode (cname="struct AVDiracSeqHeader", cheader_filename="ffmpeg/libavcodec/dirac.h")]
public struct DiracSequenceHeader {
    /***********************************************************
    @brief The spec limits the number of wavelet decompositions to 4 for both
    level 1 (VC-2) and 128 (long-gop default).
    5 decompositions is the maximum before >16-bit buffers are needed.
    Schroedinger allows this for DD 9,7 and 13,7 wavelets only, limiting
    the others to 4 decompositions (or 3 for the fidelity filter).

    We use this instead of MAX_DECOMPOSITIONS to save some memory.
    ***********************************************************/
    [CCode (cname="MAX_DWT_LEVELS", cheader_filename="ffmpeg/libavcodec/dirac.h")]
    public const int MAX_DWT_LEVELS;

    [CCode (cname="width")]
    public uint width;
    [CCode (cname="height")]
    public uint height;
    [CCode (cname="chroma_format")]
    public DiracChromaFormat chroma_format;

    [CCode (cname="interlaced")]
    public uint8 interlaced;
    [CCode (cname="top_field_first")]
    public uint8 top_field_first;

    /***********************************************************
    @brief Index into dirac_frame_rate[]
    ***********************************************************/
    [CCode (cname="frame_rate_index")]
    public uint8 frame_rate_index;

    /***********************************************************
    @brief Index into dirac_aspect_ratio[]
    ***********************************************************/
    [CCode (cname="aspect_ratio_index")]
    public uint8 aspect_ratio_index;

    [CCode (cname="clean_width")]
    public uint16 clean_width;
    [CCode (cname="clean_height")]
    public uint16 clean_height;
    [CCode (cname="clean_left_offset")]
    public uint16 clean_left_offset;
    [CCode (cname="clean_right_offset")]
    public uint16 clean_right_offset;

    /***********************************************************
    @brief Index into dirac_pixel_range_presets[]
    ***********************************************************/
    [CCode (cname="pixel_range_index")]
    public uint8 pixel_range_index;

    /***********************************************************
    @brief Index into dirac_color_spec_presets[]
    ***********************************************************/
    [CCode (cname="color_spec_index")]
    public uint8 color_spec_index;

    [CCode (cname="profile")]
    public int profile;
    [CCode (cname="level")]
    public int level;

    [CCode (cname="framerate")]
    public LibAVUtil.Rational framerate;
    [CCode (cname="sample_aspect_ratio")]
    public LibAVUtil.Rational sample_aspect_ratio;

    [CCode (cname="pix_fmt")]
    public LibAVUtil.PixelFormat pixel_format;
    [CCode (cname="color_range")]
    public LibAVUtil.ColorRange color_range;
    [CCode (cname="color_primaries")]
    public LibAVUtil.ColorPrimaries color_primaries;
    [CCode (cname="color_trc")]
    public LibAVUtil.ColorTransferCharacteristic color_trc;
    [CCode (cname="colorspace")]
    public LibAVUtil.ColorSpace colorspace;

    [CCode (cname="version")]
    public DiracVersionInfo version;
    [CCode (cname="bit_depth")]
    public int bit_depth;

    /***********************************************************
    @brief Parse a Dirac sequence header.

    @param dsh this function will allocate and fill an DiracSequenceHeader struct
        and write it into this pointer. The caller must free it with
        av_free ().
    @param buf the data buffer
    @param buf_size the size of the data buffer in bytes
    @param log_ctx if non-null, this function will log errors here
    @return 0 on success, a negative LibAVUtil.ErrorCode code on failure
    ***********************************************************/
    [CCode (cname="av_dirac_parse_sequence_header", cheader_filename="ffmpeg/libavcodec/dirac.h")]
    public int av_dirac_parse_sequence_header (
        out DiracSequenceHeader dsh,
        uint8[] buf, size_t buf_size,
        void *log_ctx
    );
}

} // namespace LibAVCodec
