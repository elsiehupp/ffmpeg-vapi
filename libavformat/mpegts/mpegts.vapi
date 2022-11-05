/***********************************************************
MPEG-2 transport stream defines
Copyright (c) 2003 Fabrice Bellard

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

public const size_t TS_FEC_PACKET_SIZE;
public const size_t TS_DVHS_PACKET_SIZE;
public const size_t TS_PACKET_SIZE;
public const size_t TS_MAX_PACKET_SIZE;

public const size_t NB_PID_MAX 8192
public const size_t MAX_SECTION_SIZE 4096

/***********************************************************
pids
***********************************************************/
public enum MpegTransportStreamPID
#define PAT_PID 0x0000
#define SDT_PID 0x0011

/***********************************************************
table ids
***********************************************************/
public enum MpegTransportStreamTableID
#define PAT_TID 0x00
#define PMT_TID 0x02
#define M4OD_TID 0x05
#define SDT_TID 0x42

public enum MpegTransportStreamType {
    #define STREAM_TYPE_VIDEO_MPEG1 0x01
    #define STREAM_TYPE_VIDEO_MPEG2 0x02
    #define STREAM_TYPE_AUDIO_MPEG1 0x03
    #define STREAM_TYPE_AUDIO_MPEG2 0x04
    #define STREAM_TYPE_PRIVATE_SECTION 0x05
    #define STREAM_TYPE_PRIVATE_DATA 0x06
    #define STREAM_TYPE_AUDIO_AAC 0x0f
    #define STREAM_TYPE_AUDIO_AAC_LATM 0x11
    #define STREAM_TYPE_VIDEO_MPEG4 0x10
    #define STREAM_TYPE_METADATA 0x15
    #define STREAM_TYPE_VIDEO_H264 0x1b
    #define STREAM_TYPE_VIDEO_HEVC 0x24
    #define STREAM_TYPE_VIDEO_CAVS 0x42
    #define STREAM_TYPE_VIDEO_VC1 0xea
    #define STREAM_TYPE_VIDEO_DIRAC 0xd1

    #define STREAM_TYPE_AUDIO_AC3 0x81
    #define STREAM_TYPE_AUDIO_DTS 0x82
    #define STREAM_TYPE_AUDIO_TRUEHD 0x83
    #define STREAM_TYPE_AUDIO_EAC3 0x87
}

public struct MpegTSContext {
    MpegTSContext *avpriv_mpegts_parse_open (
        AVFormatContext *s
    );
    int avpriv_mpegts_parse_packet (
        MpegTSContext *ts,
        AVPacket *packet,
        uint8[] buf,
        int len
    );
    void avpriv_mpegts_parse_close (
        MpegTSContext *ts
    );
}

public struct SLConfigDescr {
    int use_au_start;
    int use_au_end;
    int use_rand_acc_pt;
    int use_padding;
    int use_timestamps;
    int use_idle;
    int timestamp_res;
    int timestamp_len;
    int ocr_len;
    int au_len;
    int inst_bitrate_len;
    int degr_prior_len;
    int au_seq_num_len;
    int packet_seq_num_len;
}

public struct Mp4Descr {
    int es_id;
    int dec_config_descr_len;
    uint8[] dec_config_descr;
    SLConfigDescr sl;
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
int ff_parse_mpeg2_descriptor (
    AVFormatContext *fc,
    AVStream *st,
    int stream_type,
    out uint8[] pp,
    out uint8 desc_list_end,
    Mp4Descr *mp4_descr,
    int mp4_descr_count,
    int pid,
    MpegTSContext *ts
);

/***********************************************************
Check presence of H264 startcode
@return <0 to stop processing
***********************************************************/
int ff_check_h264_startcode (
    AVFormatContext *s,
    AVStream *st,
    AVPacket *packet
);
