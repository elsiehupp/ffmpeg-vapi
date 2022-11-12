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
@file @ingroup lavu_frame
reference-counted frame API
***********************************************************/

/***********************************************************
@defgroup lavu_frame Frame
@ingroup LibAVUtil.Data

Frame is an abstraction for reference-counted raw multimedia data.
***********************************************************/

[CCode (cprefix="", cheader_filename="ffmpeg/libavutil/frame.h")]
public enum FrameSideDataType {
    /***********************************************************
    @brief The data is the LibAVCodec.PanScanArea struct defined in LibAVCodec.
        ***********************************************************/
    AV_FRAME_DATA_PANSCAN,
    /***********************************************************
    @brief ATSC A53 Part 4 Closed Captions.
    A53 CC bitstream is stored as uint8 in FrameSideData.data.
    The number of bytes of CC data is FrameSideData.size.
        ***********************************************************/
    AV_FRAME_DATA_A53_CC,
    /***********************************************************
    @brief Stereoscopic 3d metadata.
    The data is the Stereo3D struct defined in libavutil/stereo3d.h.
        ***********************************************************/
    AV_FRAME_DATA_STEREO3D,
    /***********************************************************
    @brief The data is the MatrixEncoding enum defined in libavutil/channel_layout.h.
        ***********************************************************/
    AV_FRAME_DATA_MATRIXENCODING,
    /***********************************************************
    @brief Metadata relevant to a downmix procedure.
    The data is the DownMixInfo struct defined in libavutil/downmix_info.h.
        ***********************************************************/
    AV_FRAME_DATA_DOWNMIX_INFO,
    /***********************************************************
    @brief ReplayGain information in the form of the ReplayGain struct.
        ***********************************************************/
    AV_FRAME_DATA_REPLAYGAIN,
    /***********************************************************
    @brief This side data contains a 3x3 transformation matrix describing an affine
    transformation that needs to be applied to the frame for correct
    presentation.

    See libavutil/display.h for a detailed description of the data.
        ***********************************************************/
    AV_FRAME_DATA_DISPLAYMATRIX,
    /***********************************************************
    @brief Active Format Description data consisting of a single byte as specified
    in ETSI TS 101 154 using ActiveFormatDescription enum.
        ***********************************************************/
    AV_FRAME_DATA_AFD,
    /***********************************************************
    @brief Motion vectors exported by some codecs (on demand through the export_mvs
    flag set in the LibAVCodec LibAVCodec.CodecContext flags2 option).
    The data is the MotionVector struct defined in
    libavutil/motion_vector.h.
        ***********************************************************/
    AV_FRAME_DATA_MOTION_VECTORS,
    /***********************************************************
    @brief Recommmends skipping the specified number of samples. This is exported
    only if the "skip_manual" Option is set in LibAVCodec.
    This has the same format as AV_PKT_DATA_SKIP_SAMPLES.
    @code
    u32le number of samples to skip from start of this packet
    u32le number of samples to skip from end of this packet
    u8 reason for start skip
    u8 reason for end skip (0=padding silence, 1=convergence)
    @endcode
        ***********************************************************/
    AV_FRAME_DATA_SKIP_SAMPLES,
    /***********************************************************
    @brief This side data must be associated with an audio frame and corresponds to
    enum LibAVCodec.AudioServiceType defined in avcodec.h.
        ***********************************************************/
    AV_FRAME_DATA_AUDIO_SERVICE_TYPE,
    /***********************************************************
    @brief Mastering display metadata associated with a video frame. The payload is
    an MasteringDisplayMetadata type and contains information about the
    mastering display color volume.
        ***********************************************************/
    AV_FRAME_DATA_MASTERING_DISPLAY_METADATA,
    /***********************************************************
    @brief The GOP timecode in 25 bit timecode format. Data format is 64-bit integer.
    This is set on the first frame of a GOP that has a temporal reference of 0.
        ***********************************************************/
    AV_FRAME_DATA_GOP_TIMECODE,

    /***********************************************************
    @brief The data represents the SphericalMapping structure defined in
    libavutil/spherical.h.
        ***********************************************************/
    AV_FRAME_DATA_SPHERICAL,

    /***********************************************************
    @brief Content light level (based on CTA-861.3). This payload contains data in
    the form of the ContentLightMetadata struct.
        ***********************************************************/
    AV_FRAME_DATA_CONTENT_LIGHT_LEVEL,

    /***********************************************************
    @brief The data contains an ICC profile as an opaque octet buffer following the
    format described by ISO 15076-1 with an optional name defined in the
    metadata key entry "name".
        ***********************************************************/
    AV_FRAME_DATA_ICC_PROFILE,

#if FF_API_FRAME_QP
    /***********************************************************
    @brief Implementation-specific description of the format of AV_FRAME_QP_TABLE_DATA.
    The contents of this side data are undocumented and internal; use
    av_frame_set_qp_table () and av_frame_get_qp_table () to access this in a
    meaningful way instead.
        ***********************************************************/
    AV_FRAME_DATA_QP_TABLE_PROPERTIES,

    /***********************************************************
    @brief Raw QP table data. Its format is described by
    AV_FRAME_DATA_QP_TABLE_PROPERTIES. Use av_frame_set_qp_table () and
    av_frame_get_qp_table () to access this instead.
        ***********************************************************/
    AV_FRAME_DATA_QP_TABLE_DATA,
#endif

    /***********************************************************
    @brief Timecode which conforms to SMPTE ST 12-1. The data is an array of 4 uint32
    where the first uint32 describes how many (1-3) of the other timecodes are used.
    The timecode format is described in the av_timecode_get_smpte_from_framenum ()
    function in libavutil/timecode.c.
        ***********************************************************/
    AV_FRAME_DATA_S12M_TIMECODE,

    /***********************************************************
    @brief HDR dynamic metadata associated with a video frame. The payload is
    an HDRPlusDynamicMetadata type and contains information for color
    volume transform - application 4 of SMPTE 2094-40:2016 standard.
        ***********************************************************/
    AV_FRAME_DATA_DYNAMIC_HDR_PLUS,

    /***********************************************************
    @brief Regions Of Interest, the data is an array of RegionOfInterest type, the number of
    array element is implied by FrameSideData.size / RegionOfInterest.self_size.
        ***********************************************************/
    AV_FRAME_DATA_REGIONS_OF_INTEREST;

    /***********************************************************
    @return a string identifying the side data type
        ***********************************************************/
    [CCode (cname="av_frame_side_data_name", cheader_filename="ffmpeg/libavutil/frame.h")]
    public string av_frame_side_data_name (
        FrameSideDataType type
    );

}

} // namespace LibAVUtil
