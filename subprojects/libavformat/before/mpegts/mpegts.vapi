/***********************************************************
@brief MPEG-2 transport stream defines
@copyright 2003 Fabrice Bellard
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

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/mpegts.h")]
public const size_t TS_FEC_PACKET_SIZE;

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/mpegts.h")]
public const size_t TS_DVHS_PACKET_SIZE;

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/mpegts.h")]
public const size_t TS_PACKET_SIZE;

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/mpegts.h")]
public const size_t TS_MAX_PACKET_SIZE;

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/mpegts.h")]
public const size_t NB_PID_MAX;

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/mpegts.h")]
public const size_t MAX_SECTION_SIZE;

/***********************************************************
@brief Pids
***********************************************************/
[CCode (cheader_filename="subprojects/ffmpeg/libavformat/mpegts.h")]
public enum MpegTransportStreamPID {
    [CCode (cname="PAT_PID")]
    PAT,

    [CCode (cname="SDT_PID")]
    SDT;
}

/***********************************************************
@brief Table ids
***********************************************************/
[CCode (cheader_filename="subprojects/ffmpeg/libavformat/mpegts.h")]
public enum MpegTransportStreamTableID {
    [CCode (cname="PAT_TID")]
    PAT,

    [CCode (cname="PMT_TID")]
    PMT,

    [CCode (cname="M4OD_TID")]
    M4OD,

    [CCode (cname="SDT_TID")]
    SDT;
}

[CCode (cheader_filename="subprojects/ffmpeg/libavformat/mpegts.h")]
public enum MpegTransportStreamType {
    [CCode (cname="STREAM_TYPE_VIDEO_MPEG1")]
    VIDEO_MPEG1,

    [CCode (cname="STREAM_TYPE_VIDEO_MPEG2")]
    VIDEO_MPEG2,

    [CCode (cname="STREAM_TYPE_AUDIO_MPEG1")]
    AUDIO_MPEG1,

    [CCode (cname="STREAM_TYPE_AUDIO_MPEG2")]
    AUDIO_MPEG2,

    [CCode (cname="STREAM_TYPE_PRIVATE_SECTION")]
    PRIVATE_SECTION,

    [CCode (cname="STREAM_TYPE_PRIVATE_DATA")]
    PRIVATE_DATA,

    [CCode (cname="STREAM_TYPE_AUDIO_AAC")]
    AUDIO_AAC,

    [CCode (cname="STREAM_TYPE_AUDIO_AAC_LATM")]
    AUDIO_AAC_LATM,

    [CCode (cname="STREAM_TYPE_VIDEO_MPEG4")]
    VIDEO_MPEG4,

    [CCode (cname="STREAM_TYPE_METADATA")]
    METADATA,

    [CCode (cname="STREAM_TYPE_VIDEO_H264")]
    VIDEO_H264,

    [CCode (cname="STREAM_TYPE_VIDEO_HEVC")]
    VIDEO_HEVC,

    [CCode (cname="STREAM_TYPE_VIDEO_CAVS")]
    VIDEO_CAVS,

    [CCode (cname="STREAM_TYPE_VIDEO_VC1")]
    VIDEO_VC1,

    [CCode (cname="STREAM_TYPE_VIDEO_DIRAC")]
    VIDEO_DIRAC,

    [CCode (cname="STREAM_TYPE_AUDIO_AC3")]
    AUDIO_AC3,

    [CCode (cname="STREAM_TYPE_AUDIO_DTS")]
    AUDIO_DTS,

    [CCode (cname="STREAM_TYPE_AUDIO_TRUEHD")]
    AUDIO_TRUEHD,

    [CCode (cname="STREAM_TYPE_AUDIO_EAC3")]
    AUDIO_EAC3;
}

[CCode (cname="struct MpegTSContext",cheader_filename="subprojects/ffmpeg/libavformat/mpegts.h")]
[Compact]
public class MpegTSContext {
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/mpegts.h")]
    public MpegTSContext avpriv_mpegts_parse_open (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/mpegts.h")]
    public int avpriv_mpegts_parse_packet (
        MpegTSContext ts,
        LibAVCodec.Packet packet,
        uint8[] buffer,
        int len
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/mpegts.h")]
    public void avpriv_mpegts_parse_close (
        MpegTSContext ts
    );

}

[CCode (cname="struct SLConfigDescr",cheader_filename="subprojects/ffmpeg/libavformat/mpegts.h")]
[Compact]
public class SLConfigDescr {
    [CCode (cname="")]
    public int use_au_start;

    [CCode (cname="")]
    public int use_au_end;

    [CCode (cname="")]
    public int use_rand_acc_pt;

    [CCode (cname="")]
    public int use_padding;

    [CCode (cname="")]
    public int use_timestamps;

    [CCode (cname="")]
    public int use_idle;

    [CCode (cname="")]
    public int timestamp_res;

    [CCode (cname="")]
    public int timestamp_len;

    [CCode (cname="")]
    public int ocr_len;

    [CCode (cname="")]
    public int au_len;

    [CCode (cname="")]
    public int inst_bitrate_len;

    [CCode (cname="")]
    public int degr_prior_len;

    [CCode (cname="")]
    public int au_seq_num_len;

    [CCode (cname="")]
    public int packet_seq_num_len;
}

[CCode (cname="struct Mp4Descr",cheader_filename="subprojects/ffmpeg/libavformat/mpegts.h")]
[Compact]
public class Mp4Descr {
    [CCode (cname="")]
    public int es_id;

    [CCode (cname="")]
    public int dec_config_descr_len;

    [CCode (cname="")]
    public uint8[] dec_config_descr;

    [CCode (cname="")]
    public SLConfigDescr sl;
}

/***********************************************************
@brief Parse an MPEG-2 descriptor
@param[in] fc Format context (used for logging only)
@param stream Stream
@param stream_type MpegTransportStreamType
@param pp Descriptor buffer pointer
@param desc_list_end End of buffer
@return <0 to stop processing
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/mpegts.h")]
public int ff_parse_mpeg2_descriptor (
    LibAVFormat.FormatContext fc,
    LibAVFormat.Stream stream,
    MpegTransportStreamType stream_type,
    out uint8[] pp,
    out uint8 desc_list_end,
    Mp4Descr mp4_descr,
    int mp4_descr_count,
    int pid,
    MpegTSContext ts
);

/***********************************************************
@brief Check presence of H264 startcode
@return <0 to stop processing
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/mpegts.h")]
public int ff_check_h264_startcode (
    LibAVFormat.FormatContext format_context,
    LibAVFormat.Stream stream,
    LibAVCodec.Packet packet
);

} // namespace LibAVFormat
