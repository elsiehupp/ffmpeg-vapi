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
@defgroup lavc_packet Packet

Types and functions for working with Packet.
***********************************************************/
[CCode (cname="AVPacketSideDataType", cprefix="", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public enum PacketSideDataType {
    /***********************************************************
    @brief An AV_PKT_DATA_PALETTE side data packet contains exactly AVPALETTE_SIZE
    bytes worth of palette. This side data signals that a new palette is
    present.
        ***********************************************************/
    AV_PKT_DATA_PALETTE,

    /***********************************************************
    @brief The AV_PKT_DATA_NEW_EXTRADATA is used to notify the codec or the format
    that the extradata buffer was changed and the receiving side should
    act upon it appropriately. The new extradata is embedded in the side
    data buffer and should be immediately used for processing the current
    frame or packet.
        ***********************************************************/
    AV_PKT_DATA_NEW_EXTRADATA,

    /***********************************************************
    @brief An AV_PKT_DATA_PARAM_CHANGE side data packet is laid out as follows:
    @code
    u32le param_flags
    if (param_flags & SideDataParamChangeFlags.CHANNEL_COUNT)
        s32le channel_count
    if (param_flags & SideDataParamChangeFlags.CHANNEL_LAYOUT)
        u64le channel_layout
    if (param_flags & SideDataParamChangeFlags.SAMPLE_RATE)
        s32le sample_rate
    if (param_flags & SideDataParamChangeFlags.DIMENSIONS)
        s32le width
        s32le height
    @endcode
        ***********************************************************/
    AV_PKT_DATA_PARAM_CHANGE,

    /***********************************************************
    @brief An AV_PKT_DATA_H263_MB_INFO side data packet contains a number of
    structures with info about macroblocks relevant to splitting the
    packet into smaller packets on macroblock edges (e.g. as for RFC 2190).
    That is, it does not necessarily contain info about all macroblocks,
    as long as the distance between macroblocks in the info is smaller
    than the target payload size.
    Each MB info structure is 12 bytes, and is laid out as follows:
    @code
    u32le bit offset from the start of the packet
    u8 current quantizer at the start of the macroblock
    u8 GOB number
    u16le macroblock address within the GOB
    u8 horizontal MV predictor
    u8 vertical MV predictor
    u8 horizontal MV predictor for block number 3
    u8 vertical MV predictor for block number 3
    @endcode
        ***********************************************************/
    AV_PKT_DATA_H263_MB_INFO,

    /***********************************************************
    @brief This side data should be associated with an audio stream and contains
    ReplayGain information in form of the LibAVUtil.ReplayGain struct.
        ***********************************************************/
    AV_PKT_DATA_REPLAYGAIN,

    /***********************************************************
    @brief This side data contains a 3x3 transformation matrix describing an affine
    transformation that needs to be applied to the decoded video frames for
    correct presentation.

    See libavutil/display.h for a detailed description of the data.
        ***********************************************************/
    AV_PKT_DATA_DISPLAYMATRIX,

    /***********************************************************
    @brief This side data should be associated with a video stream and contains
    Stereoscopic 3D information in form of the LibAVUtil.Stereo3D struct.
        ***********************************************************/
    AV_PKT_DATA_STEREO3D,

    /***********************************************************
    @brief This side data should be associated with an audio stream and corresponds
    to enum AudioServiceType.
        ***********************************************************/
    AV_PKT_DATA_AUDIO_SERVICE_TYPE,

    /***********************************************************
    @brief This side data contains quality related information from the encoder.
    @code
    u32le quality factor of the compressed frame. Allowed range is between 1 (good) and FF_LAMBDA_MAX (bad).
    u8 picture type
    u8 error count
    u16 reserved
    u64le[error count] sum of squared differences between encoder in and output
    @endcode
        ***********************************************************/
    AV_PKT_DATA_QUALITY_STATS,

    /***********************************************************
    @brief This side data contains an integer value representing the stream index
    of a "fallback" track. A fallback track indicates an alternate
    track to use when the current track can not be decoded for some reason.
    e.g. no decoder available for codec.
        ***********************************************************/
    AV_PKT_DATA_FALLBACK_TRACK,

    /***********************************************************
    @brief This side data corresponds to the CPBProperties struct.
        ***********************************************************/
    AV_PKT_DATA_CPB_PROPERTIES,

    /***********************************************************
    @brief Recommmends skipping the specified number of samples
    @code
    u32le number of samples to skip from start of this packet
    u32le number of samples to skip from end of this packet
    u8 reason for start skip
    u8 reason for end skip (0=padding silence, 1=convergence)
    @endcode
        ***********************************************************/
    AV_PKT_DATA_SKIP_SAMPLES,

    /***********************************************************
    @brief An AV_PKT_DATA_JP_DUALMONO side data packet indicates that
    the packet may contain "dual mono" audio specific to Japanese DTV
    and if it is true, recommends only the selected channel to be used.
    @code
    u8 selected channels (0=mail/left, 1=sub/right, 2=both)
    @endcode
        ***********************************************************/
    AV_PKT_DATA_JP_DUALMONO,

    /***********************************************************
    @brief A list of zero terminated key/value strings. There is no end marker for
    the list, so it is required to rely on the side data size to stop.
        ***********************************************************/
    AV_PKT_DATA_STRINGS_METADATA,

    /***********************************************************
    @brief Subtitle event position
    @code
    u32le x1
    u32le y1
    u32le x2
    u32le y2
    @endcode
        ***********************************************************/
    AV_PKT_DATA_SUBTITLE_POSITION,

    /***********************************************************
    @brief Data found in BlockAdditional element of matroska container. There is
    no end marker for the data, so it is required to rely on the side data
    size to recognize the end. 8 byte id (as found in BlockAddId) followed
    by data.
        ***********************************************************/
    AV_PKT_DATA_MATROSKA_BLOCKADDITIONAL,

    /***********************************************************
    @brief The optional first identifier line of a WebVTT cue.
        ***********************************************************/
    AV_PKT_DATA_WEBVTT_IDENTIFIER,

    /***********************************************************
    @brief The optional settings (rendering instructions) that immediately
    follow the timestamp specifier of a WebVTT cue.
        ***********************************************************/
    AV_PKT_DATA_WEBVTT_SETTINGS,

    /***********************************************************
    @brief A list of zero terminated key/value strings. There is no end marker for
    the list, so it is required to rely on the side data size to stop. This
    side data includes updated metadata which appeared in the stream.
        ***********************************************************/
    AV_PKT_DATA_METADATA_UPDATE,

    /***********************************************************
    @brief MPEGTS stream ID as uint8, this is required to pass the stream ID
    information from the demuxer to the corresponding muxer.
        ***********************************************************/
    AV_PKT_DATA_MPEGTS_STREAM_ID,

    /***********************************************************
    @brief Mastering display metadata (based on SMPTE-2086:2014). This metadata
    should be associated with a video stream and contains data in the form
    of the LibAVUtil.MasteringDisplayMetadata struct.
        ***********************************************************/
    AV_PKT_DATA_MASTERING_DISPLAY_METADATA,

    /***********************************************************
    @brief This side data should be associated with a video stream and corresponds
    to the LibAVUtil.SphericalMapping structure.
        ***********************************************************/
    AV_PKT_DATA_SPHERICAL,

    /***********************************************************
    @brief Content light level (based on CTA-861.3). This metadata should be
    associated with a video stream and contains data in the form of the
    LibAVUtil.ContentLightMetadata struct.
        ***********************************************************/
    AV_PKT_DATA_CONTENT_LIGHT_LEVEL,

    /***********************************************************
    @brief ATSC A53 Part 4 Closed Captions. This metadata should be associated with
    a video stream. A53 CC bitstream is stored as uint8 in PacketSideData.data.
    The number of bytes of CC data is PacketSideData.size.
        ***********************************************************/
    AV_PKT_DATA_A53_CC,

    /***********************************************************
    @brief This side data is encryption initialization data.
    The format is not part of ABI, use av_encryption_init_info_* methods to
    access.
        ***********************************************************/
    AV_PKT_DATA_ENCRYPTION_INIT_INFO,

    /***********************************************************
    @brief This side data contains encryption info for how to decrypt the packet.
    The format is not part of ABI, use av_encryption_info_* methods to access.
        ***********************************************************/
    AV_PKT_DATA_ENCRYPTION_INFO,

    /***********************************************************
    @brief Active Format Description data consisting of a single byte as specified
    in ETSI TS 101 154 using LibAVUtil.ActiveFormatDescription enum.
        ***********************************************************/
    AV_PKT_DATA_AFD,

    /***********************************************************
    @brief The number of side data types.
    This is not part of the public API/ABI in the sense that it may
    change when new side data types are added.
    This must stay the last enum value.
    If its value becomes huge, some code using it
    needs to be updated as it assumes it to be smaller than other limits.
        ***********************************************************/
    AV_PKT_DATA_NB
}

} // namespace LibAVCodec
