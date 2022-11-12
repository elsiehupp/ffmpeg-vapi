/***********************************************************
"NUT" Container Format (de)muxer
@copyright 2006 Michael Niedermayer
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

[CCode (cname="", cheader_filename="")]
public const uint64 MAIN_STARTCODE;

[CCode (cname="", cheader_filename="")]
public const uint64 STREAM_STARTCODE;

[CCode (cname="", cheader_filename="")]
public const uint64 SYNCPOINT_STARTCODE;

[CCode (cname="", cheader_filename="")]
public const uint64 INDEX_STARTCODE;

[CCode (cname="", cheader_filename="")]
public const uint64 INFO_STARTCODE;

[CCode (cname="ID_STRING", cheader_filename="")]
public const string NUT_ID_STRING; // "nut/multimedia container\0"

[CCode (cname="", cheader_filename="")]
public const size_t MAX_DISTANCE; // (1024*32-1)

[CCode (cname="", cheader_filename="")]
public const int NUT_MAX_VERSION; // 4
[CCode (cname="", cheader_filename="")]
public const int NUT_STABLE_VERSION; // 3
[CCode (cname="", cheader_filename="")]
public const int NUT_MIN_VERSION; // 2

[CCode (cname="", cheader_filename="")]
public enum Flag {
    /***********************************************************
    @brief If set, frame is keyframe
    ***********************************************************/
    FLAG_KEY,
    /***********************************************************
    @brief If set, stream has no relevance on presentation. (EOR)
    ***********************************************************/
    FLAG_EOR,
    /***********************************************************
    @brief If set, coded_pts is in the frame header
    ***********************************************************/
    FLAG_CODED_PTS,
    /***********************************************************
    @brief If set, stream_id is coded in the frame header
    ***********************************************************/
    FLAG_STREAM_ID,
    /***********************************************************
    @brief If set, data_size_msb is at frame header, otherwise data_size_msb is 0
    ***********************************************************/
    FLAG_SIZE_MSB,
    /***********************************************************
    @brief If set, the frame header contains a checksum
    ***********************************************************/
    FLAG_CHECKSUM,
    /***********************************************************
    @brief If set, reserved_count is coded in the frame header
    ***********************************************************/
    FLAG_RESERVED,
    /***********************************************************
    @brief If set, side / meta data is stored in the frame header.
    ***********************************************************/
    FLAG_SM_DATA,
    /***********************************************************
    @brief If set, header_idx is coded in the frame header.
    ***********************************************************/
    FLAG_HEADER_IDX,
    /***********************************************************
    @brief If set, match_time_delta is coded in the frame header
    ***********************************************************/
    FLAG_MATCH_TIME,
    /***********************************************************
    @brief If set, coded_flags are stored in the frame header
    ***********************************************************/
    FLAG_CODED,
    /***********************************************************
    @brief If set, frame_code is invalid
    ***********************************************************/
    FLAG_INVALID,
}

[CCode (cname="struct Syncpoint", cheader_filename="")]
public struct Syncpoint {
    [CCode (cname="", cheader_filename="")]
    public uint64 pos;

    [CCode (cname="", cheader_filename="")]
    public uint64 back_ptr;
    //  public uint64 global_key_pts;

    [CCode (cname="", cheader_filename="")]
    public int64 ts;
}

[CCode (cname="struct FrameCode", cheader_filename="")]
public struct FrameCode {
    [CCode (cname="", cheader_filename="")]
    public uint16 flags;

    [CCode (cname="", cheader_filename="")]
    public uint8 stream_id;

    [CCode (cname="", cheader_filename="")]
    public uint16 size_mul;

    [CCode (cname="", cheader_filename="")]
    public uint16 size_lsb;

    [CCode (cname="", cheader_filename="")]
    public int16 pts_delta;

    [CCode (cname="", cheader_filename="")]
    public uint8 reserved_count;

    [CCode (cname="", cheader_filename="")]
    public uint8 header_idx;
}

[CCode (cname="struct StreamContext", cheader_filename="")]
public struct StreamContext {
    [CCode (cname="", cheader_filename="")]
    public int last_flags;

    [CCode (cname="", cheader_filename="")]
    public int skip_until_key_frame;

    [CCode (cname="", cheader_filename="")]
    public int64 last_pts;

    [CCode (cname="", cheader_filename="")]
    public int time_base_id;

    [CCode (cname="", cheader_filename="")]
    public LibAVUtil.Rational time_base;

    [CCode (cname="", cheader_filename="")]
    public int msb_pts_shift;

    [CCode (cname="", cheader_filename="")]
    public int max_pts_distance;

    /***********************************************************
    @brief FIXME duplicate of has_b_frames
    ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int decode_delay;

    [CCode (cname="", cheader_filename="")]
    public int64[] keyframe_pts;
}

[CCode (cname="struct ChapterContext", cheader_filename="")]
public struct ChapterContext {
    [CCode (cname="", cheader_filename="")]
    public LibAVUtil.Rational time_base;
}

[CCode (cname="struct NUTContext", cheader_filename="")]
public struct NUTContext {
    [CCode (cname="", cheader_filename="")]
    public LibAVUtil.Class av_class;

    [CCode (cname="", cheader_filename="")]
    public AVFormatContext avf;
    //  public int written_packet_size;
    //  public int64 packet_start;

    [CCode (cname="", cheader_filename="")]
    public FrameCode frame_code[256];

    [CCode (cname="", cheader_filename="")]
    public uint8 header_len[128];

    [CCode (cname="", cheader_filename="")]
    public uint8 *header[128];

    /***********************************************************
    @brief Stores the next startcode if it has already been parsed but the stream is not seekable
    ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public uint64 next_startcode;

    [CCode (cname="", cheader_filename="")]
    public StreamContext stream;

    [CCode (cname="", cheader_filename="")]
    public ChapterContext chapter;

    [CCode (cname="", cheader_filename="")]
    public uint max_distance;

    [CCode (cname="", cheader_filename="")]
    public uint time_base_count;

    [CCode (cname="", cheader_filename="")]
    public int64 last_syncpoint_pos;

    [CCode (cname="", cheader_filename="")]
    public int64 last_resync_pos;

    [CCode (cname="", cheader_filename="")]
    public int header_count;

    [CCode (cname="", cheader_filename="")]
    public LibAVUtil.Rational time_base;

    [CCode (cname="", cheader_filename="")]
    public LibAVUtil.TreeNode syncpoints;

    [CCode (cname="", cheader_filename="")]
    public int sp_count;

    [CCode (cname="", cheader_filename="")]
    public int write_index;

    [CCode (cname="", cheader_filename="")]
    public int64 max_pts;

    [CCode (cname="", cheader_filename="")]
    public LibAVUtil.Rational max_pts_tb;

    [CCode (cname="", cheader_filename="")]
    public NUTFlags flags;

    /***********************************************************
    @brief Version currently in use
    ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int version;

    [CCode (cname="", cheader_filename="")]
    public int minor_version;
}

[Flags]
public enum NUTFlags {
    /***********************************************************
    Use extended syncpoints.
    ***********************************************************/
    NUT_BROADCAST,
    /***********************************************************
    @brief Do not write syncpoints.
    ***********************************************************/
    NUT_PIPE,
}

//  extern const AVCodecTag ff_nut_subtitle_tags[];
//  extern const AVCodecTag ff_nut_video_tags[];
//  extern const AVCodecTag ff_nut_audio_tags[];
//  extern const AVCodecTag ff_nut_audio_extra_tags[];
//  extern const AVCodecTag ff_nut_data_tags[];

//  extern const AVCodecTag ff_nut_codec_tags[];

[CCode (cname="struct Dispositions", cheader_filename="")]
public struct Dispositions {
    [CCode (cname="", cheader_filename="")]
    public char str[9];

    [CCode (cname="", cheader_filename="")]
    public int flag;
}

[CCode (cname="", cheader_filename="")]
public void ff_nut_reset_ts (
    NUTContext nut,
    LibAVUtil.Rational time_base,
    int64 val
);

[CCode (cname="", cheader_filename="")]
public int64 ff_lsb2full (
    StreamContext stream,
    int64 lsb
);

[CCode (cname="", cheader_filename="")]
public int ff_nut_sp_pos_cmp (
    void *a,
    void *b
);

[CCode (cname="", cheader_filename="")]
public int ff_nut_sp_pts_cmp (
    void *a,
    void *b
);

[CCode (cname="", cheader_filename="")]
public int ff_nut_add_sp (
    NUTContext nut,
    int64 pos,
    int64 back_ptr,
    int64 ts
);

[CCode (cname="", cheader_filename="")]
public void ff_nut_free_sp (
    NUTContext nut
);

//  extern const Dispositions ff_nut_dispositions[];

//  extern const AVMetadataConv ff_nut_metadata_conv[];

} // namespace LibAVFormat
