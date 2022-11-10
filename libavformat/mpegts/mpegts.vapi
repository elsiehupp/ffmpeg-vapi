/***********************************************************
MPEG-2 transport stream defines
@copyright 2003 Fabrice Bellard
***********************************************************/
/***********************************************************
This file is part of FFmpeg.

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

public const size_t TS_FEC_PACKET_SIZE;
public const size_t TS_DVHS_PACKET_SIZE;
public const size_t TS_PACKET_SIZE;
public const size_t TS_MAX_PACKET_SIZE;

public const size_t NB_PID_MAX;
public const size_t MAX_SECTION_SIZE;

/***********************************************************
pids
***********************************************************/
public enum MpegTransportStreamPID {
    PAT_PID,
    SDT_PID,
}

/***********************************************************
table ids
***********************************************************/
public enum MpegTransportStreamTableID {
    PAT_TID,
    PMT_TID,
    M4OD_TID,
    SDT_TID,
}

public enum MpegTransportStreamType {
    STREAM_TYPE_VIDEO_MPEG1,
    STREAM_TYPE_VIDEO_MPEG2,
    STREAM_TYPE_AUDIO_MPEG1,
    STREAM_TYPE_AUDIO_MPEG2,
    STREAM_TYPE_PRIVATE_SECTION,
    STREAM_TYPE_PRIVATE_DATA,
    STREAM_TYPE_AUDIO_AAC,
    STREAM_TYPE_AUDIO_AAC_LATM,
    STREAM_TYPE_VIDEO_MPEG4,
    STREAM_TYPE_METADATA,
    STREAM_TYPE_VIDEO_H264,
    STREAM_TYPE_VIDEO_HEVC,
    STREAM_TYPE_VIDEO_CAVS,
    STREAM_TYPE_VIDEO_VC1,
    STREAM_TYPE_VIDEO_DIRAC,

    STREAM_TYPE_AUDIO_AC3,
    STREAM_TYPE_AUDIO_DTS,
    STREAM_TYPE_AUDIO_TRUEHD,
    STREAM_TYPE_AUDIO_EAC3,
}

public struct MpegTSContext {
    public MpegTSContext avpriv_mpegts_parse_open (
        AVFormatContext format_context
    );
    public int avpriv_mpegts_parse_packet (
        MpegTSContext ts,
        LibAVCodec.Packet packet,
        uint8[] buffer,
        int len
    );
    public void avpriv_mpegts_parse_close (
        MpegTSContext ts
    );
}

public struct SLConfigDescr {
    public int use_au_start;
    public int use_au_end;
    public int use_rand_acc_pt;
    public int use_padding;
    public int use_timestamps;
    public int use_idle;
    public int timestamp_res;
    public int timestamp_len;
    public int ocr_len;
    public int au_len;
    public int inst_bitrate_len;
    public int degr_prior_len;
    public int au_seq_num_len;
    public int packet_seq_num_len;
}

public struct Mp4Descr {
    public int es_id;
    public int dec_config_descr_len;
    public uint8[] dec_config_descr;
    public SLConfigDescr sl;
}

/***********************************************************
Parse an MPEG-2 descriptor
@param[in] fc Format context (used for logging only)
@param st Stream
@param stream_type STREAM_TYPE_xxx
@param pp Descriptor buffer pointer
@param desc_list_end End of buffer
@return <0 to stop processing
***********************************************************/
public int ff_parse_mpeg2_descriptor (
    AVFormatContext fc,
    AVStream st,
    int stream_type,
    out uint8[] pp,
    out uint8 desc_list_end,
    Mp4Descr mp4_descr,
    int mp4_descr_count,
    int pid,
    MpegTSContext ts
);

/***********************************************************
Check presence of H264 startcode
@return <0 to stop processing
***********************************************************/
public int ff_check_h264_startcode (
    AVFormatContext format_context,
    AVStream st,
    LibAVCodec.Packet packet
);

} // namespace LibAVFormat
