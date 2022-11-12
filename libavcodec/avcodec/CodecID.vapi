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
[CCode (cname="AVCodecID", cprefix="AV_CODEC_ID_", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public enum CodecID {
    NONE,

    /***********************************************************
    @brief Video codecs
    ***********************************************************/

    MPEG1VIDEO,
    /***********************************************************
    @brief Preferred ID for MPEG-1/2 video decoding
    ***********************************************************/
    MPEG2VIDEO,
    H261,
    H263,
    RV10,
    RV20,
    MJPEG,
    MJPEGB,
    LJPEG,
    SP5X,
    JPEGLS,
    MPEG4,
    RAWVIDEO,
    MSMPEG4V1,
    MSMPEG4V2,
    MSMPEG4V3,
    WMV1,
    WMV2,
    H263P,
    H263I,
    FLV1,
    SVQ1,
    SVQ3,
    DVVIDEO,
    HUFFYUV,
    CYUV,
    H264,
    INDEO3,
    VP3,
    THEORA,
    ASV1,
    ASV2,
    FFV1,
    AV_CODEC_ID_4XM,
    VCR1,
    CLJR,
    MDEC,
    ROQ,
    INTERPLAY_VIDEO,
    XAN_WC3,
    XAN_WC4,
    RPZA,
    CINEPAK,
    WS_VQA,
    MSRLE,
    MSVIDEO1,
    IDCIN,
    AV_CODEC_ID_8BPS,
    SMC,
    FLIC,
    TRUEMOTION1,
    VMDVIDEO,
    MSZH,
    ZLIB,
    QTRLE,
    TSCC,
    ULTI,
    QDRAW,
    VIXL,
    QPEG,
    PNG,
    PPM,
    PBM,
    PGM,
    PGMYUV,
    PAM,
    FFVHUFF,
    RV30,
    RV40,
    VC1,
    WMV3,
    LOCO,
    WNV1,
    AASC,
    INDEO2,
    FRAPS,
    TRUEMOTION2,
    BMP,
    CSCD,
    MMVIDEO,
    ZMBV,
    AVS,
    SMACKVIDEO,
    NUV,
    KMVC,
    FLASHSV,
    CAVS,
    JPEG2000,
    VMNC,
    VP5,
    VP6,
    VP6F,
    TARGA,
    DSICINVIDEO,
    TIERTEXSEQVIDEO,
    TIFF,
    GIF,
    DXA,
    DNXHD,
    THP,
    SGI,
    C93,
    BETHSOFTVID,
    PTX,
    TXD,
    VP6A,
    AMV,
    VB,
    PCX,
    SUNRAST,
    INDEO4,
    INDEO5,
    MIMIC,
    RL2,
    ESCAPE124,
    DIRAC,
    BFI,
    CMV,
    MOTIONPIXELS,
    TGV,
    TGQ,
    TQI,
    AURA,
    AURA2,
    V210X,
    TMV,
    V210,
    DPX,
    MAD,
    FRWU,
    FLASHSV2,
    CDGRAPHICS,
    R210,
    ANM,
    BINKVIDEO,
    IFF_ILBM,
    IFF_BYTERUN1,
    KGV1,
    YOP,
    VP8,
    PICTOR,
    ANSI,
    A64_MULTI,
    A64_MULTI5,
    R10K,
    MXPEG,
    LAGARITH,
    PRORES,
    JV,
    DFA,
    WMV3IMAGE,
    VC1IMAGE,
    UTVIDEO,
    BMV_VIDEO,
    VBLE,
    DXTORY,
    V410,
    XWD,
    CDXL,
    XBM,
    ZEROCODEC,
    MSS1,
    MSA1,
    TSCC2,
    MTS2,
    CLLC,
    MSS2,
    VP9,
    AIC,
    ESCAPE130,
    G2M,
    WEBP,
    HNM4_VIDEO,
    HEVC,
    H265,
    FIC,
    ALIAS_PIX,
    BRENDER_PIX,
    PAF_VIDEO,
    EXR,
    VP7,
    SANM,
    SGIRLE,
    MVC1,
    MVC2,
    HQX,
    TDSC,
    HQ_HQA,
    HAP,
    DDS,
    DXV,
    SCREENPRESSO,
    RSCC,
    AVS2,

    Y41P,
    AVRP,
    AV_CODEC_ID_012V,
    AVUI,
    AYUV,
    TARGA_Y216,
    V308,
    V408,
    YUV4,
    AVRN,
    CPIA,
    XFACE,
    SNOW,
    SMVJPEG,
    APNG,
    DAALA,
    CFHD,
    TRUEMOTION2RT,
    M101,
    MAGICYUV,
    SHEERVIDEO,
    YLC,
    PSD,
    PIXLET,
    SPEEDHQ,
    FMVC,
    SCPR,
    CLEARVIDEO,
    XPM,
    AV1,
    BITPACKED,
    MSCC,
    SRGC,
    SVG,
    GDV,
    FITS,
    IMM4,
    PROSUMER,
    MWSC,
    WCMV,
    RASC,
    HYMT,
    ARBC,
    AGM,
    LSCR,
    VP4,

    /***********************************************************
    @brief Various PCM "codecs"
    ***********************************************************/

    /***********************************************************
    @brief A dummy id pointing at the start of audio codecs
    ***********************************************************/
    //  LibAVCodec.CodecID.FIRST_AUDIO,
    PCM_S16LE,
    PCM_S16BE,
    PCM_U16LE,
    PCM_U16BE,
    PCM_S8,
    PCM_U8,
    PCM_MULAW,
    PCM_ALAW,
    PCM_S32LE,
    PCM_S32BE,
    PCM_U32LE,
    PCM_U32BE,
    PCM_S24LE,
    PCM_S24BE,
    PCM_U24LE,
    PCM_U24BE,
    PCM_S24DAUD,
    PCM_ZORK,
    PCM_S16LE_PLANAR,
    PCM_DVD,
    PCM_F32BE,
    PCM_F32LE,
    PCM_F64BE,
    PCM_F64LE,
    PCM_BLURAY,
    PCM_LXF,
    S302M,
    PCM_S8_PLANAR,
    PCM_S24LE_PLANAR,
    PCM_S32LE_PLANAR,
    PCM_S16BE_PLANAR,

    PCM_S64LE,
    PCM_S64BE,
    PCM_F16LE,
    PCM_F24LE,
    PCM_VIDC,

    /***********************************************************
    @brief Various ADPCM codecs
    ***********************************************************/
    ADPCM_IMA_QT,
    ADPCM_IMA_WAV,
    ADPCM_IMA_DK3,
    ADPCM_IMA_DK4,
    ADPCM_IMA_WS,
    ADPCM_IMA_SMJPEG,
    ADPCM_MS,
    ADPCM_4XM,
    ADPCM_XA,
    ADPCM_ADX,
    ADPCM_EA,
    ADPCM_G726,
    ADPCM_CT,
    ADPCM_SWF,
    ADPCM_YAMAHA,
    ADPCM_SBPRO_4,
    ADPCM_SBPRO_3,
    ADPCM_SBPRO_2,
    ADPCM_THP,
    ADPCM_IMA_AMV,
    ADPCM_EA_R1,
    ADPCM_EA_R3,
    ADPCM_EA_R2,
    ADPCM_IMA_EA_SEAD,
    ADPCM_IMA_EA_EACS,
    ADPCM_EA_XAS,
    ADPCM_EA_MAXIS_XA,
    ADPCM_IMA_ISS,
    ADPCM_G722,
    ADPCM_IMA_APC,
    ADPCM_VIMA,

    ADPCM_AFC,
    ADPCM_IMA_OKI,
    ADPCM_DTK,
    ADPCM_IMA_RAD,
    ADPCM_G726LE,
    ADPCM_THP_LE,
    ADPCM_PSX,
    ADPCM_AICA,
    ADPCM_IMA_DAT4,
    ADPCM_MTAF,
    ADPCM_AGM,

    /***********************************************************
    @brief AMR
    ***********************************************************/
    AMR_NB,
    AMR_WB,

    /***********************************************************
    @brief RealAudio codecs*/
    RA_144,
    RA_288,

    /***********************************************************
    @brief Various DPCM codecs
    ***********************************************************/
    ROQ_DPCM,
    INTERPLAY_DPCM,
    XAN_DPCM,
    SOL_DPCM,

    SDX2_DPCM,
    GREMLIN_DPCM,

    /***********************************************************
    @brief Audio codecs
    ***********************************************************/

    MP2,
    /***********************************************************
    @brief Preferred ID for decoding MPEG audio layer 1, 2 or 3
    ***********************************************************/
    MP3,
    AAC,
    AC3,
    DTS,
    VORBIS,
    DVAUDIO,
    WMAV1,
    WMAV2,
    MACE3,
    MACE6,
    VMDAUDIO,
    FLAC,
    MP3ADU,
    MP3ON4,
    SHORTEN,
    ALAC,
    WESTWOOD_SND1,
    /***********************************************************
    @brief As in Berlin toast format
    ***********************************************************/
    GSM,
    QDM2,
    COOK,
    TRUESPEECH,
    TTA,
    SMACKAUDIO,
    QCELP,
    WAVPACK,
    DSICINAUDIO,
    IMC,
    MUSEPACK7,
    MLP,
    /***********************************************************
    @brief As found in WAV
    ***********************************************************/
    GSM_MS,
    ATRAC3,
    APE,
    NELLYMOSER,
    MUSEPACK8,
    SPEEX,
    WMAVOICE,
    WMAPRO,
    WMALOSSLESS,
    ATRAC3P,
    EAC3,
    SIPR,
    MP1,
    TWINVQ,
    TRUEHD,
    MP4ALS,
    ATRAC1,
    BINKAUDIO_RDFT,
    BINKAUDIO_DCT,
    AAC_LATM,
    QDMC,
    CELT,
    G723_1,
    G729,
    AV_CODEC_ID_8SVX_EXP,
    AV_CODEC_ID_8SVX_FIB,
    BMV_AUDIO,
    RALF,
    IAC,
    ILBC,
    OPUS,
    COMFORT_NOISE,
    TAK,
    METASOUND,
    PAF_AUDIO,
    ON2AVC,
    DSS_SP,
    CODEC2,

    FFWAVESYNTH,
    SONIC,
    SONIC_LS,
    EVRC,
    SMV,
    DSD_LSBF,
    DSD_MSBF,
    DSD_LSBF_PLANAR,
    DSD_MSBF_PLANAR,
    AV_CODEC_ID_4GV,
    INTERPLAY_ACM,
    XMA1,
    XMA2,
    DST,
    ATRAC3AL,
    ATRAC3PAL,
    DOLBY_E,
    APTX,
    APTX_HD,
    SBC,
    ATRAC9,
    HCOM,

    /***********************************************************
    @brief Subtitle codecs
***********************************************************/

    /***********************************************************
    @brief A dummy ID pointing at the start of subtitle codecs.
    ***********************************************************/
    FIRST_SUBTITLE,
    DVD_SUBTITLE,
    DVB_SUBTITLE,
    /***********************************************************
    @brief Raw UTF-8 text
    ***********************************************************/
    TEXT,
    XSUB,
    SSA,
    MOV_TEXT,
    HDMV_PGS_SUBTITLE,
    DVB_TELETEXT,
    SRT,

    MICRODVD,
    EIA_608,
    JACOSUB,
    SAMI,
    REALTEXT,
    STL,
    SUBVIEWER1,
    SUBVIEWER,
    SUBRIP,
    WEBVTT,
    MPL2,
    VPLAYER,
    PJS,
    ASS,
    HDMV_TEXT_SUBTITLE,
    TTML,
    ARIB_CAPTION,

    /***********************************************************
    @brief Other specific kind of codecs (generally used for attachments)
    ***********************************************************/

    /***********************************************************
    @brief A dummy ID pointing at the start of various fake codecs.
    ***********************************************************/
    FIRST_UNKNOWN,
    TTF,

    /***********************************************************
    @brief Contain timestamp estimated through PCR of program stream.
    ***********************************************************/
    SCTE_35,
    BINTEXT,
    XBIN,
    IDF,
    OTF,
    SMPTE_KLV,
    DVD_NAV,
    TIMED_ID3,
    BIN_DATA,

    /***********************************************************
    @brief CodecID is not known (like LibAVCodec.CodecID.NONE) but lavf should attempt to identify it
    ***********************************************************/
    PROBE,

    /***********************************************************
    @brief _FAKE_ codec to indicate a raw MPEG-2 TS stream (only used by libavformat)
    ***********************************************************/
    MPEG2TS,
    /***********************************************************
    @brief _FAKE_ codec to indicate a MPEG-4 Systems stream (only used by libavformat)
    ***********************************************************/
    MPEG4SYSTEMS,
    /***********************************************************
    @brief Dummy codec for streams containing only metadata information.
    ***********************************************************/
    FFMETADATA,
    /***********************************************************
    @brief Passthrough codec, AVFrames wrapped in Packet
    ***********************************************************/
    WRAPPED_AVFRAME;

    /***********************************************************
    @brief Get the type of the given codec.
    ***********************************************************/
    [CCode (cname="avcodec_get_type", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public static LibAVUtil.MediaType avcodec_get_type (
        CodecID codec_id
    );

    /***********************************************************
    @brief Get the name of a codec.
    @return a static string identifying the codec; never null
    ***********************************************************/
    [CCode (cname="avcodec_get_name", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public static string avcodec_get_name (
        CodecID id
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
    [CCode (cname="avcodec_profile_name", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public static string avcodec_profile_name (
        CodecID codec_id,
        int profile
    );

    /***********************************************************
    @brief Return codec bits per sample.

    @param[in] codec_id the codec
    @return Number of bits per sample or zero if unknown for the given codec.
    ***********************************************************/
    [CCode (cname="av_get_bits_per_sample", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public static int av_get_bits_per_sample (
        CodecID codec_id
    );

    /***********************************************************
    @brief Return codec bits per sample.
    Only return non-zero if the bits per sample is exactly correct, not an
    approximation.

    @param[in] codec_id the codec
    @return Number of bits per sample or zero if unknown for the given codec.
    ***********************************************************/
    [CCode (cname="av_get_exact_bits_per_sample", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public static int av_get_exact_bits_per_sample (
        CodecID codec_id
    );

}

} // namespace LibAVCodec
