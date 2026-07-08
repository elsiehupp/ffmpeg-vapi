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
/***********************************************************
@copyright 2001 Fabrice Bellard
***********************************************************/
namespace LibAVCodec {
using LibAVUtil;

/***********************************************************
@file @ingroup libavc
LibAVCodec external API header
***********************************************************/

/***********************************************************
@brief Identify the syntax and semantics of the bitstream.
The principle is roughly:
Two decoders with the same ID can decode the same streams.
Two encoders with the same ID can encode compatible streams.
There may be slight deviations from the principle due to implementation
details.

If you add a codec ID to this list, add it so that
1. no value of an existing codec ID changes (that would break ABI),
2. it is as close as possible to similar codecs

After adding new codec IDs, do not forget to add an entry to the codec
descriptor list and bump LibAVCodec minor version.
***********************************************************/
[CCode (cname="enum AVCodecID",cheader_filename="subprojects/ffmpeg/libavcodec/codec_id.h")]
public enum LibAVCodec.CodecID {
    [CCode (cname="AV_CODEC_ID_NONE")]
    NONE,

    /***********************************************************
    @brief Video codecs
    ***********************************************************/

    [CCode (cname="AV_CODEC_ID_MPEG1VIDEO")]
    MPEG1VIDEO,

    /***********************************************************
    @brief Preferred ID for MPEG-1/2 video decoding
    ***********************************************************/
    [CCode (cname="AV_CODEC_ID_MPEG2VIDEO")]
    MPEG2VIDEO,

    [CCode (cname="AV_CODEC_ID_H261")]
    H261,

    [CCode (cname="AV_CODEC_ID_H263")]
    H263,

    [CCode (cname="AV_CODEC_ID_RV10")]
    RV10,

    [CCode (cname="AV_CODEC_ID_RV20")]
    RV20,

    [CCode (cname="AV_CODEC_ID_MJPEG")]
    MJPEG,

    [CCode (cname="AV_CODEC_ID_MJPEGB")]
    MJPEGB,

    [CCode (cname="AV_CODEC_ID_LJPEG")]
    LJPEG,

    [CCode (cname="AV_CODEC_ID_SP5X")]
    SP5X,

    [CCode (cname="AV_CODEC_ID_JPEGLS")]
    JPEGLS,

    [CCode (cname="AV_CODEC_ID_MPEG4")]
    MPEG4,

    [CCode (cname="AV_CODEC_ID_RAWVIDEO")]
    RAWVIDEO,

    [CCode (cname="AV_CODEC_ID_MSMPEG4V1")]
    MSMPEG4V1,

    [CCode (cname="AV_CODEC_ID_MSMPEG4V2")]
    MSMPEG4V2,

    [CCode (cname="AV_CODEC_ID_MSMPEG4V3")]
    MSMPEG4V3,

    [CCode (cname="AV_CODEC_ID_WMV2")]
    WMV2,

    [CCode (cname="AV_CODEC_ID_H263P")]
    H263P,

    [CCode (cname="AV_CODEC_ID_H263I")]
    H263I,

    [CCode (cname="AV_CODEC_ID_FLV1")]
    FLV1,

    [CCode (cname="AV_CODEC_ID_SVQ1")]
    SVQ1,

    [CCode (cname="AV_CODEC_ID_SVQ3")]
    SVQ3,

    [CCode (cname="AV_CODEC_ID_DVVIDEO")]
    DVVIDEO,

    [CCode (cname="AV_CODEC_ID_HUFFYUV")]
    HUFFYUV,

    [CCode (cname="AV_CODEC_ID_CYUV")]
    CYUV,

    [CCode (cname="AV_CODEC_ID_H264")]
    H264,

    [CCode (cname="AV_CODEC_ID_INDEO3")]
    INDEO3,

    [CCode (cname="AV_CODEC_ID_VP3")]
    VP3,

    [CCode (cname="AV_CODEC_ID_THEORA")]
    THEORA,

    [CCode (cname="AV_CODEC_ID_ASV1")]
    ASV1,

    [CCode (cname="AV_CODEC_ID_ASV2")]
    ASV2,

    [CCode (cname="AV_CODEC_ID_FFV1")]
    FFV1,

    [CCode (cname="AV_CODEC_ID_@4XM")]
    @4XM,

    [CCode (cname="AV_CODEC_ID_VCR1")]
    VCR1,

    [CCode (cname="AV_CODEC_ID_CLJR")]
    CLJR,

    [CCode (cname="AV_CODEC_ID_MDEC")]
    MDEC,

    [CCode (cname="AV_CODEC_ID_ROQ")]
    ROQ,

    [CCode (cname="AV_CODEC_ID_INTERPLAY_VIDEO")]
    INTERPLAY_VIDEO,

    [CCode (cname="AV_CODEC_ID_XAN_WC3")]
    XAN_WC3,

    [CCode (cname="AV_CODEC_ID_XAN_WC4")]
    XAN_WC4,

    [CCode (cname="AV_CODEC_ID_RPZA")]
    RPZA,

    [CCode (cname="AV_CODEC_ID_CINEPAK")]
    CINEPAK,

    [CCode (cname="AV_CODEC_ID_WS_VQA")]
    WS_VQA,

    [CCode (cname="AV_CODEC_ID_MSRLE")]
    MSRLE,

    [CCode (cname="AV_CODEC_ID_MSVIDEO1")]
    MSVIDEO1,

    [CCode (cname="AV_CODEC_ID_IDCIN")]
    IDCIN,

    [CCode (cname="AV_CODEC_ID_@8BPS")]
    @8BPS,

    [CCode (cname="AV_CODEC_ID_SMC")]
    SMC,

    [CCode (cname="AV_CODEC_ID_FLIC")]
    FLIC,

    [CCode (cname="AV_CODEC_ID_TRUEMOTION1")]
    TRUEMOTION1,

    [CCode (cname="AV_CODEC_ID_VMDVIDEO")]
    VMDVIDEO,

    [CCode (cname="AV_CODEC_ID_MSZH")]
    MSZH,

    [CCode (cname="AV_CODEC_ID_ZLIB")]
    ZLIB,

    [CCode (cname="AV_CODEC_ID_QTRLE")]
    QTRLE,

    [CCode (cname="AV_CODEC_ID_TSCC")]
    TSCC,

    [CCode (cname="AV_CODEC_ID_ULTI")]
    ULTI,

    [CCode (cname="AV_CODEC_ID_QDRAW")]
    QDRAW,

    [CCode (cname="AV_CODEC_ID_VIXL")]
    VIXL,

    [CCode (cname="AV_CODEC_ID_QPEG")]
    QPEG,

    [CCode (cname="AV_CODEC_ID_PNG")]
    PNG,

    [CCode (cname="AV_CODEC_ID_PPM")]
    PPM,

    [CCode (cname="AV_CODEC_ID_PBM")]
    PBM,

    [CCode (cname="AV_CODEC_ID_PGM")]
    PGM,

    [CCode (cname="AV_CODEC_ID_PGMYUV")]
    PGMYUV,

    [CCode (cname="AV_CODEC_ID_PAM")]
    PAM,

    [CCode (cname="AV_CODEC_ID_FFVHUFF")]
    FFVHUFF,

    [CCode (cname="AV_CODEC_ID_RV30")]
    RV30,

    [CCode (cname="AV_CODEC_ID_RV40")]
    RV40,

    [CCode (cname="AV_CODEC_ID_VC1")]
    VC1,

    [CCode (cname="AV_CODEC_ID_WMV3")]
    WMV3,

    [CCode (cname="AV_CODEC_ID_LOCO")]
    LOCO,

    [CCode (cname="AV_CODEC_ID_WNV1")]
    WNV1,

    [CCode (cname="AV_CODEC_ID_AASC")]
    AASC,

    [CCode (cname="AV_CODEC_ID_INDEO2")]
    INDEO2,

    [CCode (cname="AV_CODEC_ID_FRAPS")]
    FRAPS,

    [CCode (cname="AV_CODEC_ID_TRUEMOTION2")]
    TRUEMOTION2,

    [CCode (cname="AV_CODEC_ID_BMP")]
    BMP,

    [CCode (cname="AV_CODEC_ID_CSCD")]
    CSCD,

    [CCode (cname="AV_CODEC_ID_MMVIDEO")]
    MMVIDEO,

    [CCode (cname="AV_CODEC_ID_ZMBV")]
    ZMBV,

    [CCode (cname="AV_CODEC_ID_AVS")]
    AVS,

    [CCode (cname="AV_CODEC_ID_SMACKVIDEO")]
    SMACKVIDEO,

    [CCode (cname="AV_CODEC_ID_NUV")]
    NUV,

    [CCode (cname="AV_CODEC_ID_KMVC")]
    KMVC,

    [CCode (cname="AV_CODEC_ID_FLASHSV")]
    FLASHSV,

    [CCode (cname="AV_CODEC_ID_CAVS")]
    CAVS,

    [CCode (cname="AV_CODEC_ID_JPEG2000")]
    JPEG2000,

    [CCode (cname="AV_CODEC_ID_VMNC")]
    VMNC,

    [CCode (cname="AV_CODEC_ID_VP5")]
    VP5,

    [CCode (cname="AV_CODEC_ID_VP6")]
    VP6,

    [CCode (cname="AV_CODEC_ID_VP6F")]
    VP6F,

    [CCode (cname="AV_CODEC_ID_TARGA")]
    TARGA,

    [CCode (cname="AV_CODEC_ID_DSICINVIDEO")]
    DSICINVIDEO,

    [CCode (cname="AV_CODEC_ID_TIERTEXSEQVIDEO")]
    TIERTEXSEQVIDEO,

    [CCode (cname="AV_CODEC_ID_TIFF")]
    TIFF,

    [CCode (cname="AV_CODEC_ID_GIF")]
    GIF,

    [CCode (cname="AV_CODEC_ID_DXA")]
    DXA,

    [CCode (cname="AV_CODEC_ID_DNXHD")]
    DNXHD,

    [CCode (cname="AV_CODEC_ID_THP")]
    THP,

    [CCode (cname="AV_CODEC_ID_SGI")]
    SGI,

    [CCode (cname="AV_CODEC_ID_C93")]
    C93,

    [CCode (cname="AV_CODEC_ID_BETHSOFTVID")]
    BETHSOFTVID,

    [CCode (cname="AV_CODEC_ID_PTX")]
    PTX,

    [CCode (cname="AV_CODEC_ID_TXD")]
    TXD,

    [CCode (cname="AV_CODEC_ID_VP6A")]
    VP6A,

    [CCode (cname="AV_CODEC_ID_AMV")]
    AMV,

    [CCode (cname="AV_CODEC_ID_VB")]
    VB,

    [CCode (cname="AV_CODEC_ID_PCX")]
    PCX,

    [CCode (cname="AV_CODEC_ID_SUNRAST")]
    SUNRAST,

    [CCode (cname="AV_CODEC_ID_INDEO4")]
    INDEO4,

    [CCode (cname="AV_CODEC_ID_INDEO5")]
    INDEO5,

    [CCode (cname="AV_CODEC_ID_MIMIC")]
    MIMIC,

    [CCode (cname="AV_CODEC_ID_RL2")]
    RL2,

    [CCode (cname="AV_CODEC_ID_ESCAPE124")]
    ESCAPE124,

    [CCode (cname="AV_CODEC_ID_DIRAC")]
    DIRAC,

    [CCode (cname="AV_CODEC_ID_BFI")]
    BFI,

    [CCode (cname="AV_CODEC_ID_CMV")]
    CMV,

    [CCode (cname="AV_CODEC_ID_MOTIONPIXELS")]
    MOTIONPIXELS,

    [CCode (cname="AV_CODEC_ID_TGV")]
    TGV,

    [CCode (cname="AV_CODEC_ID_TGQ")]
    TGQ,

    [CCode (cname="AV_CODEC_ID_TQI")]
    TQI,

    [CCode (cname="AV_CODEC_ID_AURA")]
    AURA,

    [CCode (cname="AV_CODEC_ID_AURA2")]
    AURA2,

    [CCode (cname="AV_CODEC_ID_V210X")]
    V210X,

    [CCode (cname="AV_CODEC_ID_TMV")]
    TMV,

    [CCode (cname="AV_CODEC_ID_V210")]
    V210,

    [CCode (cname="AV_CODEC_ID_DPX")]
    DPX,

    [CCode (cname="AV_CODEC_ID_MAD")]
    MAD,

    [CCode (cname="AV_CODEC_ID_FRWU")]
    FRWU,

    [CCode (cname="AV_CODEC_ID_FLASHSV2")]
    FLASHSV2,

    [CCode (cname="AV_CODEC_ID_CDGRAPHICS")]
    CDGRAPHICS,

    [CCode (cname="AV_CODEC_ID_R210")]
    R210,

    [CCode (cname="AV_CODEC_ID_ANM")]
    ANM,

    [CCode (cname="AV_CODEC_ID_BINKVIDEO")]
    BINKVIDEO,

    [CCode (cname="AV_CODEC_ID_IFF_ILBM")]
    IFF_ILBM,

    [CCode (cname="AV_CODEC_ID_IFF_BYTERUN1")]
    IFF_BYTERUN1,

    [CCode (cname="AV_CODEC_ID_KGV1")]
    KGV1,

    [CCode (cname="AV_CODEC_ID_YOP")]
    YOP,

    [CCode (cname="AV_CODEC_ID_VP8")]
    VP8,

    [CCode (cname="AV_CODEC_ID_PICTOR")]
    PICTOR,

    [CCode (cname="AV_CODEC_ID_ANSI")]
    ANSI,

    [CCode (cname="AV_CODEC_ID_A64_MULTI")]
    A64_MULTI,

    [CCode (cname="AV_CODEC_ID_A64_MULTI5")]
    A64_MULTI5,

    [CCode (cname="AV_CODEC_ID_R10K")]
    R10K,

    [CCode (cname="AV_CODEC_ID_MXPEG")]
    MXPEG,

    [CCode (cname="AV_CODEC_ID_LAGARITH")]
    LAGARITH,

    [CCode (cname="AV_CODEC_ID_PRORES")]
    PRORES,

    [CCode (cname="AV_CODEC_ID_JV")]
    JV,

    [CCode (cname="AV_CODEC_ID_DFA")]
    DFA,

    [CCode (cname="AV_CODEC_ID_WMV3IMAGE")]
    WMV3IMAGE,

    [CCode (cname="AV_CODEC_ID_VC1IMAGE")]
    VC1IMAGE,

    [CCode (cname="AV_CODEC_ID_UTVIDEO")]
    UTVIDEO,

    [CCode (cname="AV_CODEC_ID_BMV_VIDEO")]
    BMV_VIDEO,

    [CCode (cname="AV_CODEC_ID_VBLE")]
    VBLE,

    [CCode (cname="AV_CODEC_ID_DXTORY")]
    DXTORY,

    [CCode (cname="AV_CODEC_ID_V410")]
    V410,

    [CCode (cname="AV_CODEC_ID_XWD")]
    XWD,

    [CCode (cname="AV_CODEC_ID_CDXL")]
    CDXL,

    [CCode (cname="AV_CODEC_ID_XBM")]
    XBM,

    [CCode (cname="AV_CODEC_ID_ZEROCODEC")]
    ZEROCODEC,

    [CCode (cname="AV_CODEC_ID_MSS1")]
    MSS1,

    [CCode (cname="AV_CODEC_ID_MSA1")]
    MSA1,

    [CCode (cname="AV_CODEC_ID_TSCC2")]
    TSCC2,

    [CCode (cname="AV_CODEC_ID_MTS2")]
    MTS2,

    [CCode (cname="AV_CODEC_ID_CLLC")]
    CLLC,

    [CCode (cname="AV_CODEC_ID_MSS2")]
    MSS2,

    [CCode (cname="AV_CODEC_ID_VP9")]
    VP9,

    [CCode (cname="AV_CODEC_ID_AIC")]
    AIC,

    [CCode (cname="AV_CODEC_ID_ESCAPE130")]
    ESCAPE130,

    [CCode (cname="AV_CODEC_ID_G2M")]
    G2M,

    [CCode (cname="AV_CODEC_ID_WEBP")]
    WEBP,

    [CCode (cname="AV_CODEC_ID_HNM4_VIDEO")]
    HNM4_VIDEO,

    [CCode (cname="AV_CODEC_ID_HEVC")]
    HEVC,

    [CCode (cname="AV_CODEC_ID_H265")]
    H265,

    [CCode (cname="AV_CODEC_ID_FIC")]
    FIC,

    [CCode (cname="AV_CODEC_ID_ALIAS_PIX")]
    ALIAS_PIX,

    [CCode (cname="AV_CODEC_ID_BRENDER_PIX")]
    BRENDER_PIX,

    [CCode (cname="AV_CODEC_ID_PAF_VIDEO")]
    PAF_VIDEO,

    [CCode (cname="AV_CODEC_ID_EXR")]
    EXR,

    [CCode (cname="AV_CODEC_ID_VP7")]
    VP7,

    [CCode (cname="AV_CODEC_ID_SANM")]
    SANM,

    [CCode (cname="AV_CODEC_ID_SGIRLE")]
    SGIRLE,

    [CCode (cname="AV_CODEC_ID_MVC1")]
    MVC1,

    [CCode (cname="AV_CODEC_ID_MVC2")]
    MVC2,

    [CCode (cname="AV_CODEC_ID_HQX")]
    HQX,

    [CCode (cname="AV_CODEC_ID_TDSC")]
    TDSC,

    [CCode (cname="AV_CODEC_ID_HQ_HQA")]
    HQ_HQA,

    [CCode (cname="AV_CODEC_ID_HAP")]
    HAP,

    [CCode (cname="AV_CODEC_ID_DDS")]
    DDS,

    [CCode (cname="AV_CODEC_ID_DXV")]
    DXV,

    [CCode (cname="AV_CODEC_ID_SCREENPRESSO")]
    SCREENPRESSO,

    [CCode (cname="AV_CODEC_ID_RSCC")]
    RSCC,

    [CCode (cname="AV_CODEC_ID_AVS2")]
    AVS2,

    [CCode (cname="AV_CODEC_ID_Y41P")]
    Y41P,

    [CCode (cname="AV_CODEC_ID_AVRP")]
    AVRP,

    [CCode (cname="AV_CODEC_ID_012V")]
    @012V,

    [CCode (cname="AV_CODEC_ID_AVUI")]
    AVUI,

    [CCode (cname="AV_CODEC_ID_AYUV")]
    AYUV,

    [CCode (cname="AV_CODEC_ID_TARGA_Y216")]
    TARGA_Y216,

    [CCode (cname="AV_CODEC_ID_V308")]
    V308,

    [CCode (cname="AV_CODEC_ID_V408")]
    V408,

    [CCode (cname="AV_CODEC_ID_YUV4")]
    YUV4,

    [CCode (cname="AV_CODEC_ID_AVRN")]
    AVRN,

    [CCode (cname="AV_CODEC_ID_CPIA")]
    CPIA,

    [CCode (cname="AV_CODEC_ID_XFACE")]
    XFACE,

    [CCode (cname="AV_CODEC_ID_SNOW")]
    SNOW,

    [CCode (cname="AV_CODEC_ID_SMVJPEG")]
    SMVJPEG,

    [CCode (cname="AV_CODEC_ID_APNG")]
    APNG,

    [CCode (cname="AV_CODEC_ID_DAALA")]
    DAALA,

    [CCode (cname="AV_CODEC_ID_CFHD")]
    CFHD,

    [CCode (cname="AV_CODEC_ID_TRUEMOTION2RT")]
    TRUEMOTION2RT,

    [CCode (cname="AV_CODEC_ID_M101")]
    M101,

    [CCode (cname="AV_CODEC_ID_MAGICYUV")]
    MAGICYUV,

    [CCode (cname="AV_CODEC_ID_SHEERVIDEO")]
    SHEERVIDEO,

    [CCode (cname="AV_CODEC_ID_YLC")]
    YLC,

    [CCode (cname="AV_CODEC_ID_PSD")]
    PSD,

    [CCode (cname="AV_CODEC_ID_PIXLET")]
    PIXLET,

    [CCode (cname="AV_CODEC_ID_SPEEDHQ")]
    SPEEDHQ,

    [CCode (cname="AV_CODEC_ID_FMVC")]
    FMVC,

    [CCode (cname="AV_CODEC_ID_SCPR")]
    SCPR,

    [CCode (cname="AV_CODEC_ID_CLEARVIDEO")]
    CLEARVIDEO,

    [CCode (cname="AV_CODEC_ID_XPM")]
    XPM,

    [CCode (cname="AV_CODEC_ID_AV1")]
    AV1,

    [CCode (cname="AV_CODEC_ID_BITPACKED")]
    BITPACKED,

    [CCode (cname="AV_CODEC_ID_MSCC")]
    MSCC,

    [CCode (cname="AV_CODEC_ID_SRGC")]
    SRGC,

    [CCode (cname="AV_CODEC_ID_SVG")]
    SVG,

    [CCode (cname="AV_CODEC_ID_GDV")]
    GDV,

    [CCode (cname="AV_CODEC_ID_FITS")]
    FITS,

    [CCode (cname="AV_CODEC_ID_IMM4")]
    IMM4,

    [CCode (cname="AV_CODEC_ID_PROSUMER")]
    PROSUMER,

    [CCode (cname="AV_CODEC_ID_MWSC")]
    MWSC,

    [CCode (cname="AV_CODEC_ID_WCMV")]
    WCMV,

    [CCode (cname="AV_CODEC_ID_RASC")]
    RASC,

    [CCode (cname="AV_CODEC_ID_HYMT")]
    HYMT,

    [CCode (cname="AV_CODEC_ID_ARBC")]
    ARBC,

    [CCode (cname="AV_CODEC_ID_AGM")]
    AGM,

    [CCode (cname="AV_CODEC_ID_LSCR")]
    LSCR,

    [CCode (cname="AV_CODEC_ID_VP4")]
    VP4,

    /***********************************************************
    @brief Various PCM "codecs"
    ***********************************************************/

    /***********************************************************
    @brief A dummy id pointing at the start of audio codecs
    ***********************************************************/
    //  LibAVCodec.CodecID.FIRST_AUDIO,

    [CCode (cname="AV_CODEC_ID_PCM_S16LE")]
    PCM_S16LE,

    [CCode (cname="AV_CODEC_ID_PCM_S16BE")]
    PCM_S16BE,

    [CCode (cname="AV_CODEC_ID_PCM_U16LE")]
    PCM_U16LE,

    [CCode (cname="AV_CODEC_ID_PCM_U16BE")]
    PCM_U16BE,

    [CCode (cname="AV_CODEC_ID_PCM_S8")]
    PCM_S8,

    [CCode (cname="AV_CODEC_ID_PCM_U8")]
    PCM_U8,

    [CCode (cname="AV_CODEC_ID_PCM_MULAW")]
    PCM_MULAW,

    [CCode (cname="AV_CODEC_ID_PCM_ALAW")]
    PCM_ALAW,

    [CCode (cname="AV_CODEC_ID_PCM_S32LE")]
    PCM_S32LE,

    [CCode (cname="AV_CODEC_ID_PCM_S32BE")]
    PCM_S32BE,

    [CCode (cname="AV_CODEC_ID_PCM_U32LE")]
    PCM_U32LE,

    [CCode (cname="AV_CODEC_ID_PCM_U32BE")]
    PCM_U32BE,

    [CCode (cname="AV_CODEC_ID_PCM_S24LE")]
    PCM_S24LE,

    [CCode (cname="AV_CODEC_ID_PCM_S24BE")]
    PCM_S24BE,

    [CCode (cname="AV_CODEC_ID_PCM_U24LE")]
    PCM_U24LE,

    [CCode (cname="AV_CODEC_ID_PCM_U24BE")]
    PCM_U24BE,

    [CCode (cname="AV_CODEC_ID_PCM_S24DAUD")]
    PCM_S24DAUD,

    [CCode (cname="AV_CODEC_ID_PCM_ZORK")]
    PCM_ZORK,

    [CCode (cname="AV_CODEC_ID_PCM_S16LE_PLANAR")]
    PCM_S16LE_PLANAR,

    [CCode (cname="AV_CODEC_ID_PCM_DVD")]
    PCM_DVD,

    [CCode (cname="AV_CODEC_ID_PCM_F32BE")]
    PCM_F32BE,

    [CCode (cname="AV_CODEC_ID_PCM_F32LE")]
    PCM_F32LE,

    [CCode (cname="AV_CODEC_ID_PCM_F64BE")]
    PCM_F64BE,

    [CCode (cname="AV_CODEC_ID_PCM_F64LE")]
    PCM_F64LE,

    [CCode (cname="AV_CODEC_ID_PCM_BLURAY")]
    PCM_BLURAY,

    [CCode (cname="AV_CODEC_ID_PCM_LXF")]
    PCM_LXF,

    [CCode (cname="AV_CODEC_ID_S302M")]
    S302M,

    [CCode (cname="AV_CODEC_ID_PCM_S8_PLANAR")]
    PCM_S8_PLANAR,

    [CCode (cname="AV_CODEC_ID_PCM_S24LE_PLANAR")]
    PCM_S24LE_PLANAR,

    [CCode (cname="AV_CODEC_ID_PCM_S32LE_PLANAR")]
    PCM_S32LE_PLANAR,

    [CCode (cname="AV_CODEC_ID_PCM_S16BE_PLANAR")]
    PCM_S16BE_PLANAR,

    [CCode (cname="AV_CODEC_ID_PCM_S64LE")]
    PCM_S64LE,

    [CCode (cname="AV_CODEC_ID_PCM_S64BE")]
    PCM_S64BE,

    [CCode (cname="AV_CODEC_ID_PCM_F16LE")]
    PCM_F16LE,

    [CCode (cname="AV_CODEC_ID_PCM_F24LE")]
    PCM_F24LE,

    [CCode (cname="AV_CODEC_ID_PCM_VIDC")]
    PCM_VIDC,

    /***********************************************************
    @brief Various ADPCM codecs
    ***********************************************************/
    [CCode (cname="AV_CODEC_ID_ADPCM_IMA_QT")]
    ADPCM_IMA_QT,

    [CCode (cname="AV_CODEC_ID_ADPCM_IMA_WAV")]
    ADPCM_IMA_WAV,

    [CCode (cname="AV_CODEC_ID_ADPCM_IMA_DK3")]
    ADPCM_IMA_DK3,

    [CCode (cname="AV_CODEC_ID_ADPCM_IMA_DK4")]
    ADPCM_IMA_DK4,

    [CCode (cname="AV_CODEC_ID_ADPCM_IMA_WS")]
    ADPCM_IMA_WS,

    [CCode (cname="AV_CODEC_ID_ADPCM_IMA_SMJPEG")]
    ADPCM_IMA_SMJPEG,

    [CCode (cname="AV_CODEC_ID_ADPCM_MS")]
    ADPCM_MS,

    [CCode (cname="AV_CODEC_ID_ADPCM_4XM")]
    ADPCM_4XM,

    [CCode (cname="AV_CODEC_ID_ADPCM_XA")]
    ADPCM_XA,

    [CCode (cname="AV_CODEC_ID_ADPCM_ADX")]
    ADPCM_ADX,

    [CCode (cname="AV_CODEC_ID_ADPCM_EA")]
    ADPCM_EA,

    [CCode (cname="AV_CODEC_ID_ADPCM_G726")]
    ADPCM_G726,

    [CCode (cname="AV_CODEC_ID_ADPCM_CT")]
    ADPCM_CT,

    [CCode (cname="AV_CODEC_ID_ADPCM_SWF")]
    ADPCM_SWF,

    [CCode (cname="AV_CODEC_ID_ADPCM_YAMAHA")]
    ADPCM_YAMAHA,

    [CCode (cname="AV_CODEC_ID_ADPCM_SBPRO_4")]
    ADPCM_SBPRO_4,

    [CCode (cname="AV_CODEC_ID_ADPCM_SBPRO_3")]
    ADPCM_SBPRO_3,

    [CCode (cname="AV_CODEC_ID_ADPCM_SBPRO_2")]
    ADPCM_SBPRO_2,

    [CCode (cname="AV_CODEC_ID_ADPCM_THP")]
    ADPCM_THP,

    [CCode (cname="AV_CODEC_ID_ADPCM_IMA_AMV")]
    ADPCM_IMA_AMV,

    [CCode (cname="AV_CODEC_ID_ADPCM_EA_R1")]
    ADPCM_EA_R1,

    [CCode (cname="AV_CODEC_ID_ADPCM_EA_R3")]
    ADPCM_EA_R3,

    [CCode (cname="AV_CODEC_ID_ADPCM_EA_R2")]
    ADPCM_EA_R2,

    [CCode (cname="AV_CODEC_ID_ADPCM_IMA_EA_SEAD")]
    ADPCM_IMA_EA_SEAD,

    [CCode (cname="AV_CODEC_ID_ADPCM_IMA_EA_EACS")]
    ADPCM_IMA_EA_EACS,

    [CCode (cname="AV_CODEC_ID_ADPCM_EA_XAS")]
    ADPCM_EA_XAS,

    [CCode (cname="AV_CODEC_ID_ADPCM_EA_MAXIS_XA")]
    ADPCM_EA_MAXIS_XA,

    [CCode (cname="AV_CODEC_ID_ADPCM_IMA_ISS")]
    ADPCM_IMA_ISS,

    [CCode (cname="AV_CODEC_ID_ADPCM_G722")]
    ADPCM_G722,

    [CCode (cname="AV_CODEC_ID_ADPCM_IMA_APC")]
    ADPCM_IMA_APC,

    [CCode (cname="AV_CODEC_ID_ADPCM_VIMA")]
    ADPCM_VIMA,

    [CCode (cname="AV_CODEC_ADPCM_AFC")]
    ADPCM_AFC,

    [CCode (cname="AV_CODEC_ID_ADPCM_IMA_OKI")]
    ADPCM_IMA_OKI,

    [CCode (cname="AV_CODEC_ID_ADPCM_DTK")]
    ADPCM_DTK,

    [CCode (cname="AV_CODEC_ID_ADPCM_IMA_RAD")]
    ADPCM_IMA_RAD,

    [CCode (cname="AV_CODEC_ID_ADPCM_G726LE")]
    ADPCM_G726LE,

    [CCode (cname="AV_CODEC_ID_ADPCM_THP_LE")]
    ADPCM_THP_LE,

    [CCode (cname="AV_CODEC_ID_ADPCM_PSX")]
    ADPCM_PSX,

    [CCode (cname="AV_CODEC_ID_ADPCM_AICA")]
    ADPCM_AICA,

    [CCode (cname="AV_CODEC_ID_ADPCM_IMA_DAT4")]
    ADPCM_IMA_DAT4,

    [CCode (cname="AV_CODEC_ID_ADPCM_MTAF")]
    ADPCM_MTAF,

    [CCode (cname="AV_CODEC_ID_ADPCM_AGM")]
    ADPCM_AGM,

    /***********************************************************
    @brief AMR
    ***********************************************************/
    [CCode (cname="AV_CODEC_ID_AMR_NB")]
    AMR_NB,

    [CCode (cname="AV_CODEC_ID_AMR_WB")]
    AMR_WB,

    /***********************************************************
    @brief RealAudio codecs
    ***********************************************************/
    [CCode (cname="AV_CODEC_ID_RA_144")]
    RA_144,

    [CCode (cname="AV_CODEC_ID_RA_288")]
    RA_288,

    /***********************************************************
    @brief Various DPCM codecs
    ***********************************************************/
    [CCode (cname="AV_CODEC_ID_ROQ_DPCM")]
    ROQ_DPCM,

    [CCode (cname="AV_CODEC_ID_INTERPLAY_DPCM")]
    INTERPLAY_DPCM,

    [CCode (cname="AV_CODEC_ID_XAN_DPCM")]
    XAN_DPCM,

    [CCode (cname="AV_CODEC_ID_SOL_DPCM")]
    SOL_DPCM,

    [CCode (cname="AV_CODEC_ID_SDX2_DPCM")]
    SDX2_DPCM,

    [CCode (cname="AV_CODEC_ID_GREMLIN_DPCM")]
    GREMLIN_DPCM,

    /***********************************************************
    @brief Audio codecs
    ***********************************************************/

    [CCode (cname="AV_CODEC_ID_MP2")]
    MP2,

    /***********************************************************
    @brief Preferred ID for decoding MPEG audio layer 1, 2 or 3
    ***********************************************************/
    [CCode (cname="AV_CODEC_ID_MP3")]
    MP3,

    [CCode (cname="AV_CODEC_ID_AAC")]
    AAC,

    [CCode (cname="AV_CODEC_ID_AC3")]
    AC3,

    [CCode (cname="AV_CODEC_ID_DTS")]
    DTS,

    [CCode (cname="AV_CODEC_ID_VORBIS")]
    VORBIS,

    [CCode (cname="AV_CODEC_ID_DVAUDIO")]
    DVAUDIO,

    [CCode (cname="AV_CODEC_ID_WMAV1")]
    WMAV1,

    [CCode (cname="AV_CODEC_ID_WMAV2")]
    WMAV2,

    [CCode (cname="AV_CODEC_ID_MACE3")]
    MACE3,

    [CCode (cname="AV_CODEC_ID_MACE6")]
    MACE6,

    [CCode (cname="AV_CODEC_ID_VMDAUDIO")]
    VMDAUDIO,

    [CCode (cname="AV_CODEC_ID_FLAC")]
    FLAC,

    [CCode (cname="AV_CODEC_ID_MP3ADU")]
    MP3ADU,

    [CCode (cname="AV_CODEC_ID_MP3ON4")]
    MP3ON4,

    [CCode (cname="AV_CODEC_ID_SHORTEN")]
    SHORTEN,

    [CCode (cname="AV_CODEC_ID_ALAC")]
    ALAC,

    [CCode (cname="AV_CODEC_ID_WESTWOOD_SND1")]
    WESTWOOD_SND1,

    /***********************************************************
    @brief As in Berlin toast format
    ***********************************************************/
    [CCode (cname="AV_CODEC_ID_GSM")]
    GSM,

    [CCode (cname="AV_CODEC_ID_QDM2")]
    QDM2,

    [CCode (cname="AV_CODEC_ID_COOK")]
    COOK,

    [CCode (cname="AV_CODEC_ID_TRUESPEECH")]
    TRUESPEECH,

    [CCode (cname="AV_CODEC_ID_TTA")]
    TTA,

    [CCode (cname="AV_CODEC_ID_SMACKAUDIO")]
    SMACKAUDIO,

    [CCode (cname="AV_CODEC_ID_QCELP")]
    QCELP,

    [CCode (cname="AV_CODEC_ID_WAVPACK")]
    WAVPACK,

    [CCode (cname="AV_CODEC_ID_DSICINAUDIO")]
    DSICINAUDIO,

    [CCode (cname="AV_CODEC_ID_IMC")]
    IMC,

    [CCode (cname="AV_CODEC_ID_MUSEPACK7")]
    MUSEPACK7,

    [CCode (cname="AV_CODEC_ID_MLP")]
    MLP,

    /***********************************************************
    @brief As found in WAV
    ***********************************************************/
    [CCode (cname="AV_CODEC_ID_GSM_MS")]
    GSM_MS,

    [CCode (cname="AV_CODEC_ID_ATRAC3")]
    ATRAC3,

    [CCode (cname="AV_CODEC_ID_APE")]
    APE,

    [CCode (cname="AV_CODEC_ID_NELLYMOSER")]
    NELLYMOSER,

    [CCode (cname="AV_CODEC_ID_MUSEPACK8")]
    MUSEPACK8,

    [CCode (cname="AV_CODEC_ID_SPEEX")]
    SPEEX,

    [CCode (cname="AV_CODEC_ID_WMAVOICE")]
    WMAVOICE,

    [CCode (cname="AV_CODEC_ID_WMAPRO")]
    WMAPRO,

    [CCode (cname="AV_CODEC_ID_WMALOSSLESS")]
    WMALOSSLESS,

    [CCode (cname="AV_CODEC_ID_ATRAC3P")]
    ATRAC3P,

    [CCode (cname="AV_CODEC_ID_EAC3")]
    EAC3,

    [CCode (cname="AV_CODEC_ID_SIPR")]
    SIPR,

    [CCode (cname="AV_CODEC_ID_MP1")]
    MP1,

    [CCode (cname="AV_CODEC_ID_TWINVQ")]
    TWINVQ,

    [CCode (cname="AV_CODEC_ID_TRUEHD")]
    TRUEHD,

    [CCode (cname="AV_CODEC_ID_MP4ALS")]
    MP4ALS,

    [CCode (cname="AV_CODEC_ID_ATRAC1")]
    ATRAC1,

    [CCode (cname="AV_CODEC_ID_BINKAUDIO_RDFT")]
    BINKAUDIO_RDFT,

    [CCode (cname="AV_CODEC_ID_BINKAUDIO_DCT")]
    BINKAUDIO_DCT,

    [CCode (cname="AV_CODEC_ID_AAC_LATM")]
    AAC_LATM,

    [CCode (cname="AV_CODEC_ID_QDMC")]
    QDMC,

    [CCode (cname="AV_CODEC_ID_CELT")]
    CELT,

    [CCode (cname="AV_CODEC_ID_G723_1")]
    G723_1,

    [CCode (cname="AV_CODEC_ID_G729")]
    G729,

    [CCode (cname="AV_CODEC_ID_8SVX_EXP")]
    @8SVX_EXP,

    [CCode (cname="AV_CODEC_ID_8SVX_FIB")]
    @8SVX_FIB,

    [CCode (cname="AV_CODEC_ID_BMV_AUDIO")]
    BMV_AUDIO,

    [CCode (cname="AV_CODEC_ID_RALF")]
    RALF,

    [CCode (cname="AV_CODEC_ID_IAC")]
    IAC,

    [CCode (cname="AV_CODEC_ID_ILBC")]
    ILBC,

    [CCode (cname="AV_CODEC_ID_OPUS")]
    OPUS,

    [CCode (cname="AV_CODEC_ID_COMFORT_NOISE")]
    COMFORT_NOISE,

    [CCode (cname="AV_CODEC_ID_TAK")]
    TAK,

    [CCode (cname="AV_CODEC_ID_METASOUND")]
    METASOUND,

    [CCode (cname="AV_CODEC_ID_PAF_AUDIO")]
    PAF_AUDIO,

    [CCode (cname="AV_CODEC_ID_ON2AVC")]
    ON2AVC,

    [CCode (cname="AV_CODEC_ID_DSS_SP")]
    DSS_SP,

    [CCode (cname="AV_CODEC_ID_CODEC2")]
    CODEC2,

    [CCode (cname="AV_CODEC_ID_FFWAVESYNTH")]
    FFWAVESYNTH,

    [CCode (cname="AV_CODEC_ID_SONIC")]
    SONIC,

    [CCode (cname="AV_CODEC_ID_SONIC_LS")]
    SONIC_LS,

    [CCode (cname="AV_CODEC_ID_EVRC")]
    EVRC,

    [CCode (cname="AV_CODEC_ID_SMV")]
    SMV,

    [CCode (cname="AV_CODEC_ID_DSD_LSBF")]
    DSD_LSBF,

    [CCode (cname="AV_CODEC_ID_DSD_MSBF")]
    DSD_MSBF,

    [CCode (cname="AV_CODEC_ID_DSD_LSBF_PLANAR")]
    DSD_LSBF_PLANAR,

    [CCode (cname="AV_CODEC_ID_DSD_MSBF_PLANAR")]
    DSD_MSBF_PLANAR,

    [CCode (cname="AV_CODEC_ID_4GV")]
    @4GV,

    [CCode (cname="AV_CODEC_ID_INTERPLAY_ACM")]
    INTERPLAY_ACM,

    [CCode (cname="AV_CODEC_ID_XMA1")]
    XMA1,

    [CCode (cname="AV_CODEC_ID_XMA2")]
    XMA2,

    [CCode (cname="AV_CODEC_ID_DST")]
    DST,

    [CCode (cname="AV_CODEC_ID_ATRAC3AL")]
    ATRAC3AL,

    [CCode (cname="AV_CODEC_ID_ATRAC3PAL")]
    ATRAC3PAL,

    [CCode (cname="AV_CODEC_ID_DOLBY_E")]
    DOLBY_E,

    [CCode (cname="AV_CODEC_ID_APTX")]
    APTX,

    [CCode (cname="AV_CODEC_ID_APTX_HD")]
    APTX_HD,

    [CCode (cname="AV_CODEC_ID_SBC")]
    SBC,

    [CCode (cname="AV_CODEC_ID_ATRAC9")]
    ATRAC9,

    [CCode (cname="AV_CODEC_ID_HCOM")]
    HCOM,

    /***********************************************************
    @brief Subtitle codecs
    ***********************************************************/

    /***********************************************************
    @brief A dummy ID pointing at the start of subtitle codecs.
    ***********************************************************/
    [CCode (cname="AV_CODEC_ID_FIRST_SUBTITLE")]
    FIRST_SUBTITLE,

    [CCode (cname="AV_CODEC_ID_DVD_SUBTITLE")]
    DVD_SUBTITLE,

    [CCode (cname="AV_CODEC_ID_DVB_SUBTITLE")]
    DVB_SUBTITLE,

    /***********************************************************
    @brief Raw UTF-8 text
    ***********************************************************/
    [CCode (cname="AV_CODEC_ID_TEXT")]
    TEXT,

    [CCode (cname="AV_CODEC_ID_XSUB")]
    XSUB,

    [CCode (cname="AV_CODEC_ID_SSA")]
    SSA,

    [CCode (cname="AV_CODEC_ID_MOV_TEXT")]
    MOV_TEXT,

    [CCode (cname="AV_CODEC_ID_HDMV_PGS_SUBTITLE")]
    HDMV_PGS_SUBTITLE,

    [CCode (cname="AV_CODEC_ID_DVB_TELETEXT")]
    DVB_TELETEXT,

    [CCode (cname="AV_CODEC_ID_SRT")]
    SRT,

    [CCode (cname="AV_CODEC_ID_MICRODVD")]
    MICRODVD,

    [CCode (cname="AV_CODEC_ID_EIA_608")]
    EIA_608,

    [CCode (cname="AV_CODEC_ID_JACOSUB")]
    JACOSUB,

    [CCode (cname="AV_CODEC_ID_SAMI")]
    SAMI,

    [CCode (cname="AV_CODEC_ID_REALTEXT")]
    REALTEXT,

    [CCode (cname="AV_CODEC_ID_STL")]
    STL,

    [CCode (cname="AV_CODEC_ID_SUBVIEWER1")]
    SUBVIEWER1,

    [CCode (cname="AV_CODEC_ID_SUBVIEWER")]
    SUBVIEWER,

    [CCode (cname="AV_CODEC_ID_SUBRIP")]
    SUBRIP,

    [CCode (cname="AV_CODEC_ID_WEBVTT")]
    WEBVTT,

    [CCode (cname="AV_CODEC_ID_MPL2")]
    MPL2,

    [CCode (cname="AV_CODEC_ID_VPLAYER")]
    VPLAYER,

    [CCode (cname="AV_CODEC_ID_PJS")]
    PJS,

    [CCode (cname="AV_CODEC_ID_ASS")]
    ASS,

    [CCode (cname="AV_CODEC_ID_HDMV_TEXT_SUBTITLE")]
    HDMV_TEXT_SUBTITLE,

    [CCode (cname="AV_CODEC_ID_TTML")]
    TTML,

    [CCode (cname="AV_CODEC_ID_ARIB_CAPTION")]
    ARIB_CAPTION,

    /***********************************************************
    @brief Other specific kind of codecs (generally used for attachments)
    ***********************************************************/

    /***********************************************************
    @brief A dummy ID pointing at the start of various fake codecs.
    ***********************************************************/
    [CCode (cname="AV_CODEC_ID_FIRST_UNKNOWN")]
    FIRST_UNKNOWN,

    [CCode (cname="AV_CODEC_ID_TTF")]
    TTF,

    /***********************************************************
    @brief Contain timestamp estimated through PCR of program stream.
    ***********************************************************/
    [CCode (cname="AV_CODEC_ID_SCTE_35")]
    SCTE_35,

    [CCode (cname="AV_CODEC_ID_BINTEXT")]
    BINTEXT,

    [CCode (cname="AV_CODEC_ID_XBIN")]
    XBIN,

    [CCode (cname="AV_CODEC_ID_IDF")]
    IDF,

    [CCode (cname="AV_CODEC_ID_OTF")]
    OTF,

    [CCode (cname="AV_CODEC_ID_SMPTE_KLV")]
    SMPTE_KLV,

    [CCode (cname="AV_CODEC_ID_DVD_NAV")]
    DVD_NAV,

    [CCode (cname="AV_CODEC_ID_TIMED_ID3")]
    TIMED_ID3,

    [CCode (cname="AV_CODEC_ID_BIN_DATA")]
    BIN_DATA,

    /***********************************************************
    @brief LibAVCodec.CodecID is not known (like LibAVCodec.CodecID.NONE) but lavf should attempt to identify it
    ***********************************************************/
    [CCode (cname="AV_CODEC_ID_PROBE")]
    PROBE,

    /***********************************************************
    @brief _FAKE_ codec to indicate a raw MPEG-2 TS stream (only used by libavformat)
    ***********************************************************/
    [CCode (cname="AV_CODEC_ID_MPEG2TS")]
    MPEG2TS,

    /***********************************************************
    @brief _FAKE_ codec to indicate a MPEG-4 Systems stream (only used by libavformat)
    ***********************************************************/
    [CCode (cname="AV_CODEC_ID_MPEG4SYSTEMS")]
    MPEG4SYSTEMS,

    /***********************************************************
    @brief Dummy codec for streams containing only metadata information.
    ***********************************************************/
    [CCode (cname="AV_CODEC_ID_FFMETADATA")]
    FFMETADATA,

    /***********************************************************
    @brief Passthrough codec, AVFrames wrapped in Packet
    ***********************************************************/
    [CCode (cname="AV_CODEC_ID_WRAPPED_AVFRAME")]
    WRAPPED_AVFRAME;

    /***********************************************************
    @brief Get the type of the given codec.
    ***********************************************************/
    [CCode (cname="avcodec_get_type",cheader_filename="subprojects/ffmpeg/libavcodec/avcodec.h")]
    public static LibAVUtil.MediaType avcodec_get_type (
        LibAVCodec.CodecID codec_id
    );

    /***********************************************************
    @brief Get the name of a codec.
    @return a static string identifying the codec; never null
    ***********************************************************/
    [CCode (cname="avcodec_get_name",cheader_filename="subprojects/ffmpeg/libavcodec/avcodec.h")]
    public static string avcodec_get_name (
        LibAVCodec.CodecID id
    );

    /***********************************************************
    @brief Return a name for the specified profile, if available.

    @param codec_id the ID of the codec to which the requested profile belongs
    @param profile the profile value for which a name is requested
    @return A name for the profile if found, null otherwise.

    @note unlike av_get_profile_name (), which searches a list of profiles
        supported by a specific decoder or encoder implementation, this
        function searches the list of profiles from the CodecDescriptor
    ***********************************************************/
    [CCode (cname="avcodec_profile_name",cheader_filename="subprojects/ffmpeg/libavcodec/avcodec.h")]
    public static string avcodec_profile_name (
        LibAVCodec.CodecID codec_id,
        int profile
    );

    /***********************************************************
    @brief Return codec bits per sample.

    @param[in] codec_id the codec
    @return Number of bits per sample or zero if unknown for the given codec.
    ***********************************************************/
    [CCode (cname="av_get_bits_per_sample",cheader_filename="subprojects/ffmpeg/libavcodec/avcodec.h")]
    public static int av_get_bits_per_sample (
        LibAVCodec.CodecID codec_id
    );

    /***********************************************************
    @brief Return codec bits per sample.
    Only return non-zero if the bits per sample is exactly correct, not an
    approximation.

    @param[in] codec_id the codec
    @return Number of bits per sample or zero if unknown for the given codec.
    ***********************************************************/
    [CCode (cname="av_get_exact_bits_per_sample",cheader_filename="subprojects/ffmpeg/libavcodec/avcodec.h")]
    public static int av_get_exact_bits_per_sample (
        LibAVCodec.CodecID codec_id
    );

}

} // namespace LibAVCodec
