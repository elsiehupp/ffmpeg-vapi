/***********************************************************
"NUT" Container Format (de)muxer
@copyright 2006 Michael Niedermayer
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

public const uint64 MAIN_STARTCODE;
public const uint64 STREAM_STARTCODE;
public const uint64 SYNCPOINT_STARTCODE;
public const uint64 INDEX_STARTCODE;
public const uint64 INFO_STARTCODE;

[CCode (cname="ID_STRING", cheader="")]
public const string NUT_ID_STRING; // "nut/multimedia container\0"

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
    public uint64 pos;
    public uint64 back_ptr;
    //  public uint64 global_key_pts;
    public int64 ts;
}

public struct FrameCode {
    public uint16 flags;
    public uint8 stream_id;
    public uint16 size_mul;
    public uint16 size_lsb;
    public int16 pts_delta;
    public uint8 reserved_count;
    public uint8 header_idx;
}

public struct StreamContext {
    public int last_flags;
    public int skip_until_key_frame;
    public int64 last_pts;
    public int time_base_id;
    public LibAVUtil.Rational time_base;
    public int msb_pts_shift;
    public int max_pts_distance;
    /***********************************************************
    FIXME duplicate of has_b_frames
    ***********************************************************/
    public int decode_delay;
    public int64[] keyframe_pts;
}

public struct ChapterContext {
    public LibAVUtil.Rational time_base;
}

public struct NUTContext {
    public LibAVUtil.Class av_class;
    public AVFormatContext avf;
    //  public int written_packet_size;
    //  public int64 packet_start;
    public FrameCode frame_code[256];
    public uint8 header_len[128];
    public uint8 *header[128];
    /***********************************************************
    Stores the next startcode if it has already been parsed but the stream is not seekable
    ***********************************************************/
    public uint64 next_startcode;
    public StreamContext stream;
    public ChapterContext chapter;
    public uint max_distance;
    public uint time_base_count;
    public int64 last_syncpoint_pos;
    public int64 last_resync_pos;
    public int header_count;
    public LibAVUtil.Rational time_base;
    public LibAVUtil.TreeNode syncpoints;
    public int sp_count;
    public int write_index;
    public int64 max_pts;
    public LibAVUtil.Rational max_pts_tb;
    public NUTFlags flags;
    /***********************************************************
    Version currently in use
    ***********************************************************/
    public int version;
    public int minor_version;
}

[Flags]
public enum NUTFlags {
    /***********************************************************
    Use extended syncpoints.
    ***********************************************************/
    NUT_BROADCAST,
    /***********************************************************
    Do not write syncpoints.
    ***********************************************************/
    NUT_PIPE,
}

//  extern const AVCodecTag ff_nut_subtitle_tags[];
//  extern const AVCodecTag ff_nut_video_tags[];
//  extern const AVCodecTag ff_nut_audio_tags[];
//  extern const AVCodecTag ff_nut_audio_extra_tags[];
//  extern const AVCodecTag ff_nut_data_tags[];

//  extern const AVCodecTag ff_nut_codec_tags[];

public struct Dispositions {
    public char str[9];
    public int flag;
}

public void ff_nut_reset_ts (
    NUTContext nut,
    LibAVUtil.Rational time_base,
    int64 val
);

public int64 ff_lsb2full (
    StreamContext stream,
    int64 lsb
);

public int ff_nut_sp_pos_cmp (
    void *a,
    void *b
);

public int ff_nut_sp_pts_cmp (
    void *a,
    void *b
);

public int ff_nut_add_sp (
    NUTContext nut,
    int64 pos,
    int64 back_ptr,
    int64 ts
);

public void ff_nut_free_sp (
    NUTContext nut
);

//  extern const Dispositions ff_nut_dispositions[];

//  extern const AVMetadataConv ff_nut_metadata_conv[];

} // namespace LibAVFormat
