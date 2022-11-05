/***********************************************************
"NUT" Container Format (de)muxer
Copyright (c) 2006 Michael Niedermayer

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

public const uint64 MAIN_STARTCODE;
public const uint64 STREAM_STARTCODE;
public const uint64 SYNCPOINT_STARTCODE;
public const uint64 INDEX_STARTCODE;
public const uint64 INFO_STARTCODE;

public const string ID_STRING; // "nut/multimedia container\0"

public const size_t MAX_DISTANCE; // (1024*32-1)

public const int NUT_MAX_VERSION; // 4
public const int NUT_STABLE_VERSION; // 3
public const int NUT_MIN_VERSION; // 2

public enum Flag {
    /***********************************************************
    If set, frame is keyframe
    ***********************************************************/
    FLAG_KEY,
    /***********************************************************
    If set, stream has no relevance on presentation. (EOR)
    ***********************************************************/
    FLAG_EOR,
    /***********************************************************
    If set, coded_pts is in the frame header
    ***********************************************************/
    FLAG_CODED_PTS,
    /***********************************************************
    If set, stream_id is coded in the frame header
    ***********************************************************/
    FLAG_STREAM_ID,
    /***********************************************************
    If set, data_size_msb is at frame header, otherwise data_size_msb is 0
    ***********************************************************/
    FLAG_SIZE_MSB,
    /***********************************************************
    If set, the frame header contains a checksum
    ***********************************************************/
    FLAG_CHECKSUM,
    /***********************************************************
    If set, reserved_count is coded in the frame header
    ***********************************************************/
    FLAG_RESERVED,
    /***********************************************************
    If set, side / meta data is stored in the frame header.
    ***********************************************************/
    FLAG_SM_DATA,
    /***********************************************************
    If set, header_idx is coded in the frame header.
    ***********************************************************/
    FLAG_HEADER_IDX,
    /***********************************************************
    If set, match_time_delta is coded in the frame header
    ***********************************************************/
    FLAG_MATCH_TIME,
    /***********************************************************
    If set, coded_flags are stored in the frame header
    ***********************************************************/
    FLAG_CODED,
    /***********************************************************
    If set, frame_code is invalid
    ***********************************************************/
    FLAG_INVALID,
}

public struct Syncpoint {
    uint64 pos;
    uint64 back_ptr;
//    uint64 global_key_pts;
    int64 ts;
}

public struct FrameCode {
    uint16 flags;
    uint8 stream_id;
    uint16 size_mul;
    uint16 size_lsb;
    int16 pts_delta;
    uint8 reserved_count;
    uint8 header_idx;
}

public struct StreamContext {
    int last_flags;
    int skip_until_key_frame;
    int64 last_pts;
    int time_base_id;
    LibAVUtil.Rational *time_base;
    int msb_pts_shift;
    int max_pts_distance;
    int decode_delay; //FIXME duplicate of has_b_frames
    int64[] keyframe_pts;
}

public struct ChapterContext {
    LibAVUtil.Rational *time_base;
}

public struct NUTContext {
    LibAVUtil.Class *av_class;
    AVFormatContext *avf;
//    int written_packet_size;
//    int64 packet_start;
    FrameCode frame_code[256];
    uint8 header_len[128];
    uint8 *header[128];
    uint64 next_startcode; // stores the next startcode if it has already been parsed but the stream is not seekable
    StreamContext *stream;
    ChapterContext *chapter;
    uint max_distance;
    uint time_base_count;
    int64 last_syncpoint_pos;
    int64 last_resync_pos;
    int header_count;
    LibAVUtil.Rational *time_base;
    LibAVUtil.TreeNode *syncpoints;
    int sp_count;
    int write_index;
    int64 max_pts;
    LibAVUtil.Rational *max_pts_tb;
    NUTFlags flags;
    int version; // version currently in use
    int minor_version;
}

[Flags]
public enum NUTFlags {
    NUT_BROADCAST, // use extended syncpoints
    NUT_PIPE, // do not write syncpoints
}

//  extern const AVCodecTag ff_nut_subtitle_tags[];
//  extern const AVCodecTag ff_nut_video_tags[];
//  extern const AVCodecTag ff_nut_audio_tags[];
//  extern const AVCodecTag ff_nut_audio_extra_tags[];
//  extern const AVCodecTag ff_nut_data_tags[];

//  extern const AVCodecTag * const ff_nut_codec_tags[];

public struct Dispositions {
    char str[9];
    int flag;
}

void ff_nut_reset_ts (
    NUTContext *nut,
    LibAVUtil.Rational time_base,
    int64 val
);
int64 ff_lsb2full (
    StreamContext *stream,
    int64 lsb
);
int ff_nut_sp_pos_cmp (
    void *a,
    void *b
);
int ff_nut_sp_pts_cmp (
    void *a,
    void *b
);
int ff_nut_add_sp (
    NUTContext *nut,
    int64 pos,
    int64 back_ptr,
    int64 ts
);
void ff_nut_free_sp (
    NUTContext *nut
);

//  extern const Dispositions ff_nut_dispositions[];

//  extern const AVMetadataConv ff_nut_metadata_conv[];
