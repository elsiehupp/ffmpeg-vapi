/***********************************************************
@brief IEC 61937 common header
@copyright 2009 Bartlomiej Wolowiec
***********************************************************/
/***********************************************************
@brief This file is part of FFmpeg.

FFmpeg is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

FFmpeg is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with FFmpeg; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
***********************************************************/

namespace LibAVFormat {

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/spdif.h")]
public const int SYNCWORD1;

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/spdif.h")]
public const int SYNCWORD2;

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/spdif.h")]
public const size_t BURST_HEADER_SIZE;

[CCode (cname="enum IEC61937DataType",cheader_filename="subprojects/ffmpeg/libformat/spdif.h")]
public enum IEC61937DataType {
    /***********************************************************
    @brief AC-3 data
    ***********************************************************/
    [CCode (cname="IEC61937_AC3")]
    AC3,

    /***********************************************************
    @brief MPEG-1 layer 1
    ***********************************************************/
    [CCode (cname="IEC61937_MPEG1_LAYER1")]
    MPEG1_LAYER1,

    /***********************************************************
    @brief MPEG-1 layer 2 or 3 data or MPEG-2 without extension
    ***********************************************************/
    [CCode (cname="IEC61937_MPEG1_LAYER23")]
    MPEG1_LAYER23,

    /***********************************************************
    @brief MPEG-2 data with extension
    ***********************************************************/
    [CCode (cname="IEC61937_MPEG2_EXT")]
    MPEG2_EXT,

    /***********************************************************
    @brief MPEG-2 AAC ADTS
    ***********************************************************/
    [CCode (cname="IEC61937_MPEG2_AAC")]
    MPEG2_AAC,

    /***********************************************************
    @brief MPEG-2, layer-1 low sampling frequency
    ***********************************************************/
    [CCode (cname="IEC61937_MPEG2_LAYER1_LSF")]
    MPEG2_LAYER1_LSF,

    /***********************************************************
    @brief MPEG-2, layer-2 low sampling frequency
    ***********************************************************/
    [CCode (cname="IEC61937_MPEG2_LAYER2_LSF")]
    MPEG2_LAYER2_LSF,

    /***********************************************************
    @brief MPEG-2, layer-3 low sampling frequency
    ***********************************************************/
    [CCode (cname="IEC61937_MPEG2_LAYER3_LSF")]
    MPEG2_LAYER3_LSF,

    /***********************************************************
    @brief DTS type I (512 samples)
    ***********************************************************/
    [CCode (cname="IEC61937_DTS1")]
    DTS_I,

    /***********************************************************
    @brief DTS type II (1024 samples)
    ***********************************************************/
    [CCode (cname="IEC61937_DTS2")]
    DTS_II,

    /***********************************************************
    @brief DTS type III (2048 samples)
    ***********************************************************/
    [CCode (cname="IEC61937_DTS3")]
    DTS_III,

    /***********************************************************
    @brief ATRAC data
    ***********************************************************/
    [CCode (cname="IEC61937_ATRAC")]
    ATRAC,

    /***********************************************************
    @brief ATRAC3 data
    ***********************************************************/
    [CCode (cname="IEC61937_ATRAC3")]
    ATRAC3,

    /***********************************************************
    @brief ATRAC3+ data
    ***********************************************************/
    [CCode (cname="IEC61937_ATRACX")]
    ATRACX,

    /***********************************************************
    @brief DTS HD data
    ***********************************************************/
    [CCode (cname="IEC61937_DTSHD")]
    DTSHD,

    /***********************************************************
    @brief WMA 9 Professional data
    ***********************************************************/
    [CCode (cname="IEC61937_WMAPRO")]
    WMA_PRO,

    /***********************************************************
    @brief MPEG-2 AAC ADTS half-rate low sampling frequency
    ***********************************************************/
    [CCode (cname="IEC61937_MPEG2_AAC_LSF_2048")]
    MPEG2_AAC_LSF_2048,

    /***********************************************************
    @brief MPEG-2 AAC ADTS quarter-rate low sampling frequency
    ***********************************************************/
    [CCode (cname="IEC61937_MPEG2_AAC_LSF_4096")]
    MPEG2_AAC_LSF_4096,

    /***********************************************************
    @brief E-AC-3 data
    ***********************************************************/
    [CCode (cname="IEC61937_EAC3")]
    EAC3,

    /***********************************************************
    @brief TrueHD data
    ***********************************************************/
    [CCode (cname="IEC61937_TRUEHD")]
    TRUE_HD;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/spdif.h")]
public const uint16 spdif_mpeg_pkt_offset[2][3] = {
    // LAYER1 LAYER2 LAYER3
    {
        3072,
        9216,
        4608
    }, // MPEG-2 LSF
    {
        1536,
        4608,
        4608
    }, // MPEG-1
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/spdif.h")]
public void ff_spdif_bswap_buf16 (
    out uint16 dst,
    out uint16 src,
    int w
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/spdif.h")]
public int ff_spdif_read_packet (
    LibAVFormat.FormatContext format_context,
    LibAVCodec.Packet packet
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/spdif.h")]
public int ff_spdif_probe (
    uint8[] probe_buf,
    int buf_size,
    LibAVCodec.CodecID codec
);

} // namespace LibAVFormat
