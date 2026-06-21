/***********************************************************
@brief MOV, 3GP, MP4 muxer
@copyright 2003 Thomas Raivio
@copyright 2004 Gildas Bazin <gbazin at videolan dot org>
@copyright 2009 Baptiste Coudurier <baptiste dot coudurier at gmail dot com>
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

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
public const size_t MOV_FRAG_INFO_ALLOC_INCREMENT;

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
public const size_t MOV_INDEX_CLUSTER_SIZE;

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
public const int MOV_TIMESCALE;

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
public const size_t RTP_MAX_PACKET_SIZE;

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
public enum Mode {
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    MODE_MP4,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    MODE_MOV,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    MODE_3GP,

    /***********************************************************
    example working PSP command line:
    ffmpeg -i testinput.avi -f psp -r 14.985 -s 320x240 -b 768 -ar 24000 -ab 32 M4V00001.MP4
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    MODE_PSP,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    MODE_3G2,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    MODE_IPOD,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    MODE_ISM,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    MODE_F4V;
}

[CCode (cname="struct MOVIentry",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
[Compact]
public class MOVIentry {
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public uint64 pos;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int64 dts;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int64 pts;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public uint size;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public uint samples_in_chunk;

    /***********************************************************
    @brief Chunk number if the current entry is a chunk start otherwise 0
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public uint chunkNum;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public uint entries;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int cts;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public MOVSampleFlags flags;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
[Flags]
public enum MOVSampleFlags {
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    MOV_SYNC_SAMPLE,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    MOV_PARTIAL_SYNC_SAMPLE,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    MOV_DISPOSABLE_SAMPLE;
}

[CCode (cname="struct HintSample",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
[Compact]
public class HintSample {
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public uint8[] data;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int size;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int sample_number;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int offset;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int own_data;
}

[CCode (cname="struct HintSampleQueue",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
[Compact]
public class HintSampleQueue {
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int size;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int len;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public HintSample samples;
}

[CCode (cname="struct MOVFragmentInfo",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
[Compact]
public class MOVFragmentInfo {
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int64 offset;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int64 time;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int64 duration;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int64 tfrf_offset;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int size;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
[Flags]
public enum MOVTrackFlags {
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    MOV_TRACK_CTTS,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    MOV_TRACK_STPS,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    MOV_TRACK_ENABLED;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
[Flags]
public enum MOVETimeCodeFlags {
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    MOV_TIMECODE_FLAG_DROPFRAME,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    MOV_TIMECODE_FLAG_24HOURSMAX,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    MOV_TIMECODE_FLAG_ALLOWNEGATIVE;
}

[CCode (cname="struct MOVTrack",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
[Compact]
public class MOVTrack {
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int mode;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int entry;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public uint timescale;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public uint64 time;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int64 track_duration;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int last_sample_is_subtitle_end;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public long sample_count;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public long sample_size;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public long chunkCount;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int has_keyframes;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int has_disposable;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public MOVTrackFlags flags;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public MOVETimeCodeFlags timecode_flags;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int language;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int track_id;

    /***********************************************************
    @brief Stsd fourcc
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int tag;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public AVStream st;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public LibAVCodec.CodecParameters par;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int multichannel_as_mono;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int vos_len;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public uint8[] vos_data;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public MOVIentry cluster;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public uint cluster_capacity;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int audio_vbr;

    /***********************************************************
    @brief Active picture (w/o VBI) height for D-10/IMX
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int height;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public uint32 tref_tag;

    /***********************************************************
    @brief TrackID of the referenced track
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int tref_id;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int64 start_dts;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int64 start_cts;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int64 end_pts;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int end_reliable;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int64 dts_shift;

    /***********************************************************
    @brief The track that hints this track, -1 if no hint track is set
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int hint_track;

    /***********************************************************
    @brief The track that this hint (or tmcd) track describes
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int src_track;

    /***********************************************************
    @brief The format context for the hinting rtp muxer
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public AVFormatContext rtp_ctx;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public uint32 prev_rtp_ts;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int64 cur_rtp_ts_unwrapped;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public uint32 max_packet_size;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int64 default_duration;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public uint32 default_sample_flags;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public uint32 default_size;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public HintSampleQueue sample_queue;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public LibAVCodec.Packet cover_image;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public AVIOContext mdat_buf;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int64 data_offset;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int64 frag_start;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int frag_discont;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int entries_flushed;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int nb_frag_info;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public MOVFragmentInfo frag_info;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public uint frag_info_capacity;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public VC1Info vc1_info;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public void *eac3_priv;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public MOVMuxCencContext cenc;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public uint32 palette[LibAVUtil.AVPALETTE_COUNT];

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int pal_done;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int is_unaligned_qt_rgb;
}

[CCode (cname="struct VC1Info",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
[Compact]
public class VC1Info {
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int first_packet_seq;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int first_packet_entry;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int first_packet_seen;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int first_frag_written;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int packet_seq;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int packet_entry;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int slices;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
public enum MOVEncryptionScheme {
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    MOV_ENC_NONE,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    MOV_ENC_CENC_AES_CTR;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
public enum MOVPrftBox {
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    MOV_PRFT_NONE,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    MOV_PRFT_SRC_WALLCLOCK,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    MOV_PRFT_SRC_PTS,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    MOV_PRFT_NB
}

[CCode (cname="struct MOVMuxContext",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
[Compact]
public class MOVMuxContext {
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public LibAVUtil.Class av_class;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int mode;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int64 time;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int nb_streams;

    /***********************************************************\
    number of new created tmcd track based on metadata (aka not data copy)
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int nb_meta_tmcd;

    /***********************************************************
    @brief Qt chapter track number
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int chapter_track;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int64 mdat_pos;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public uint64 mdat_size;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public MOVTrack tracks;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int flags;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int rtp_flags;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int iods_skip;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int iods_video_profile;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int iods_audio_profile;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int moov_written;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int fragments;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int max_fragment_duration;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int min_fragment_duration;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int max_fragment_size;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int ism_lookahead;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public AVIOContext mdat_buf;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int first_trun;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int video_track_timescale;

    /***********************************************************
    0 for disabled, -1 for automatic, size otherwise
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int reserved_moov_size;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int64 reserved_header_pos;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public string major_brand;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int per_stream_grouping;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public AVFormatContext fc;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int use_editlist;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public float gamma;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int frag_interleave;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int missing_duration_warned;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public string encryption_scheme_str;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public MOVEncryptionScheme encryption_scheme;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public uint8[] encryption_key;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int encryption_key_len;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public uint8[] encryption_kid;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int encryption_kid_len;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int need_rewrite_extradata;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int use_stream_ids_as_track_ids;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int track_ids_ok;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int write_tmcd;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public MOVPrftBox write_prft;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    public int empty_hdlr_name;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
[Flags]
public enum MOVFlags {
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    FF_MOV_FLAG_RTP_HINT,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    FF_MOV_FLAG_FRAGMENT,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    FF_MOV_FLAG_EMPTY_MOOV,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    FF_MOV_FLAG_FRAG_KEYFRAME,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    FF_MOV_FLAG_SEPARATE_MOOF,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    FF_MOV_FLAG_FRAG_CUSTOM,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    FF_MOV_FLAG_ISML,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    FF_MOV_FLAG_FASTSTART,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    FF_MOV_FLAG_OMIT_TFHD_OFFSET,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    FF_MOV_FLAG_DISABLE_CHPL,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    FF_MOV_FLAG_DEFAULT_BASE_MOOF,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    FF_MOV_FLAG_DASH,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    FF_MOV_FLAG_FRAG_DISCONT,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    FF_MOV_FLAG_DELAY_MOOV,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    FF_MOV_FLAG_GLOBAL_SIDX,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    FF_MOV_FLAG_WRITE_COLR,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    FF_MOV_FLAG_WRITE_GAMA,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    FF_MOV_FLAG_USE_MDTA,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    FF_MOV_FLAG_SKIP_TRAILER,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    FF_MOV_FLAG_NEGATIVE_CTS_OFFSETS,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    FF_MOV_FLAG_FRAG_EVERY_FRAME,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
    FF_MOV_FLAG_SKIP_SIDX;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
public int ff_mov_write_packet (
    AVFormatContext format_context,
    LibAVCodec.Packet packet
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
public int ff_mov_init_hinting (
    AVFormatContext format_context,
    int index,
    int src_index
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
public int ff_mov_add_hinted_packet (
    AVFormatContext format_context,
    LibAVCodec.Packet packet,
    int track_index,
    int sample,
    uint8[] sample_data,
    int sample_size
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/movenc.h")]
public void ff_mov_close_hinting (
    MOVTrack track
);

} // namespace LibAVFormat
