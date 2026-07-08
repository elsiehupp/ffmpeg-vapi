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

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/movenc.h")]
public const size_t MOV_FRAG_INFO_ALLOC_INCREMENT;

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/movenc.h")]
public const size_t MOV_INDEX_CLUSTER_SIZE;

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/movenc.h")]
public const int MOV_TIMESCALE;

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/movenc.h")]
public const size_t RTP_MAX_PACKET_SIZE;

[CCode (cheader_filename="subprojects/ffmpeg/libavformat/movenc.h")]
public enum MOVMode {
    [CCode (cname="MODE_MP4")]
    MP4,

    [CCode (cname="MODE_MOV")]
    MOV,

    [CCode (cname="MODE_3GP")]
    @3GP,

    /***********************************************************
    example working PSP command line:
    ffmpeg -i testinput.avi -f psp -r 14.985 -s 320x240 -b 768 -ar 24000 -ab 32 M4V00001.MP4
    ***********************************************************/
    [CCode (cname="MODE_PSP")]
    PSP,

    [CCode (cname="MODE_3G2")]
    @3G2,

    [CCode (cname="MODE_IPOD")]
    IPOD,

    [CCode (cname="MODE_ISM")]
    ISM,

    [CCode (cname="MODE_F4V")]
    F4V;
}

[CCode (cname="struct MOVIentry",cheader_filename="subprojects/ffmpeg/libavformat/movenc.h")]
[Compact]
public class MOVIentry {
    [CCode (cname="")]
    public uint64 pos;

    [CCode (cname="")]
    public int64 dts;

    [CCode (cname="")]
    public int64 pts;

    [CCode (cname="")]
    public uint size;

    [CCode (cname="")]
    public uint samples_in_chunk;

    /***********************************************************
    @brief Chunk number if the current entry is a chunk start otherwise 0
    ***********************************************************/
    [CCode (cname="")]
    public uint chunkNum;

    [CCode (cname="")]
    public uint entries;

    [CCode (cname="")]
    public int cts;

    [CCode (cname="")]
    public MOVSampleFlags flags;
}

[Flags]
[CCode (cheader_filename="subprojects/ffmpeg/libavformat/movenc.h")]
public enum MOVSampleFlags {
    [CCode (cname="MOV_SYNC_SAMPLE")]
    SYNC_SAMPLE,

    [CCode (cname="MOV_PARTIAL_SYNC_SAMPLE")]
    PARTIAL_SYNC_SAMPLE,

    [CCode (cname="MOV_DISPOSABLE_SAMPLE")]
    DISPOSABLE_SAMPLE;
}

[CCode (cname="struct HintSample",cheader_filename="subprojects/ffmpeg/libavformat/movenc.h")]
[Compact]
public class HintSample {
    [CCode (cname="")]
    public uint8[] data;

    [CCode (cname="")]
    public int size;

    [CCode (cname="")]
    public int sample_number;

    [CCode (cname="")]
    public int offset;

    [CCode (cname="")]
    public int own_data;
}

[CCode (cname="struct HintSampleQueue",cheader_filename="subprojects/ffmpeg/libavformat/movenc.h")]
[Compact]
public class HintSampleQueue {
    [CCode (cname="")]
    public int size;

    [CCode (cname="")]
    public int len;

    [CCode (cname="")]
    public HintSample samples;
}

[CCode (cname="struct MOVFragmentInfo",cheader_filename="subprojects/ffmpeg/libavformat/movenc.h")]
[Compact]
public class MOVFragmentInfo {
    [CCode (cname="")]
    public int64 offset;

    [CCode (cname="")]
    public int64 time;

    [CCode (cname="")]
    public int64 duration;

    [CCode (cname="")]
    public int64 tfrf_offset;

    [CCode (cname="")]
    public int size;
}

[Flags]
[CCode (cheader_filename="subprojects/ffmpeg/libavformat/movenc.h")]
public enum MOVTrackFlags {
    [CCode (cname="MOV_TRACK_CTTS")]
    CTTS,

    [CCode (cname="MOV_TRACK_STPS")]
    STPS,

    [CCode (cname="MOV_TRACK_ENABLED")]
    ENABLED;
}

[Flags]
[CCode (cheader_filename="subprojects/ffmpeg/libavformat/movenc.h")]
public enum MOVETimeCodeFlags {
    [CCode (cname="MOV_TIMECODE_FLAG_DROPFRAME")]
    DROP_FRAME,

    [CCode (cname="MOV_TIMECODE_FLAG_24HOURSMAX")]
    @24_HOURS_MAX,

    [CCode (cname="MOV_TIMECODE_FLAG_ALLOWNEGATIVE")]
    ALLOW_NEGATIVE;
}

[CCode (cname="struct MOVTrack",cheader_filename="subprojects/ffmpeg/libavformat/movenc.h")]
[Compact]
public class MOVTrack {
    [CCode (cname="")]
    public int mode;

    [CCode (cname="")]
    public int entry;

    [CCode (cname="")]
    public uint timescale;

    [CCode (cname="")]
    public uint64 time;

    [CCode (cname="")]
    public int64 track_duration;

    [CCode (cname="")]
    public int last_sample_is_subtitle_end;

    [CCode (cname="")]
    public long sample_count;

    [CCode (cname="")]
    public long sample_size;

    [CCode (cname="")]
    public long chunkCount;

    [CCode (cname="")]
    public int has_keyframes;

    [CCode (cname="")]
    public int has_disposable;

    [CCode (cname="")]
    public MOVTrackFlags flags;

    [CCode (cname="")]
    public MOVETimeCodeFlags timecode_flags;

    [CCode (cname="")]
    public int language;

    [CCode (cname="")]
    public int track_id;

    /***********************************************************
    @brief Stsd fourcc
    ***********************************************************/
    [CCode (cname="")]
    public int tag;

    [CCode (cname="st")]
    public LibAVFormat.Stream stream;

    [CCode (cname="")]
    public LibAVCodec.CodecParameters par;

    [CCode (cname="")]
    public int multichannel_as_mono;

    [CCode (cname="")]
    public int vos_len;

    [CCode (cname="")]
    public uint8[] vos_data;

    [CCode (cname="")]
    public MOVIentry cluster;

    [CCode (cname="")]
    public uint cluster_capacity;

    [CCode (cname="")]
    public int audio_vbr;

    /***********************************************************
    @brief Active picture (w/o VBI) height for D-10/IMX
    ***********************************************************/
    [CCode (cname="")]
    public int height;

    [CCode (cname="")]
    public uint32 tref_tag;

    /***********************************************************
    @brief TrackID of the referenced track
    ***********************************************************/
    [CCode (cname="")]
    public int tref_id;

    [CCode (cname="")]
    public int64 start_dts;

    [CCode (cname="")]
    public int64 start_cts;

    [CCode (cname="")]
    public int64 end_pts;

    [CCode (cname="")]
    public int end_reliable;

    [CCode (cname="")]
    public int64 dts_shift;

    /***********************************************************
    @brief The track that hints this track, -1 if no hint track is set
    ***********************************************************/
    [CCode (cname="")]
    public int hint_track;

    /***********************************************************
    @brief The track that this hint (or tmcd) track describes
    ***********************************************************/
    [CCode (cname="")]
    public int src_track;

    /***********************************************************
    @brief The format context for the hinting rtp muxer
    ***********************************************************/
    [CCode (cname="")]
    public LibAVFormat.FormatContext rtp_ctx;

    [CCode (cname="")]
    public uint32 prev_rtp_ts;

    [CCode (cname="")]
    public int64 cur_rtp_ts_unwrapped;

    [CCode (cname="")]
    public uint32 max_packet_size;

    [CCode (cname="")]
    public int64 default_duration;

    [CCode (cname="")]
    public uint32 default_sample_flags;

    [CCode (cname="")]
    public uint32 default_size;

    [CCode (cname="")]
    public HintSampleQueue sample_queue;

    [CCode (cname="")]
    public LibAVCodec.Packet cover_image;

    [CCode (cname="")]
    public LibAVFormat.IOContext mdat_buf;

    [CCode (cname="")]
    public int64 data_offset;

    [CCode (cname="")]
    public int64 frag_start;

    [CCode (cname="")]
    public int frag_discont;

    [CCode (cname="")]
    public int entries_flushed;

    [CCode (cname="")]
    public int nb_frag_info;

    [CCode (cname="")]
    public MOVFragmentInfo frag_info;

    [CCode (cname="")]
    public uint frag_info_capacity;

    [CCode (cname="")]
    public VC1Info vc1_info;

    [CCode (cname="")]
    public void *eac3_priv;

    [CCode (cname="")]
    public MOVMuxCencContext cenc;

    [CCode (cname="")]
    public uint32 palette[LibAVUtil.AVPALETTE_COUNT];

    [CCode (cname="")]
    public int pal_done;

    [CCode (cname="")]
    public bool is_unaligned_qt_rgb;
}

[CCode (cname="struct VC1Info",cheader_filename="subprojects/ffmpeg/libavformat/movenc.h")]
[Compact]
public class VC1Info {
    [CCode (cname="")]
    public int first_packet_seq;

    [CCode (cname="")]
    public int first_packet_entry;

    [CCode (cname="")]
    public int first_packet_seen;

    [CCode (cname="")]
    public int first_frag_written;

    [CCode (cname="")]
    public int packet_seq;

    [CCode (cname="")]
    public int packet_entry;

    [CCode (cname="")]
    public int slices;
}

[CCode (cname="enum MOVEncryptionScheme",cheader_filename="subprojects/ffmpeg/libavformat/movenc.h")]
public enum MOVEncryptionScheme {
    [CCode (cname="MOV_ENC_NONE")]
    NONE,

    [CCode (cname="MOV_ENC_CENC_AES_CTR")]
    CENC_AES_CTR;
}

[CCode (cname="enum MOVPrftBox",cheader_filename="subprojects/ffmpeg/libavformat/movenc.h")]
public enum MOVPrftBox {
    [CCode (cname="MOV_PRFT_NONE")]
    NONE,

    [CCode (cname="MOV_PRFT_SRC_WALLCLOCK")]
    SOURCE_WALL_CLOCK,

    [CCode (cname="MOV_PRFT_SRC_PTS")]
    SOURCE_PTS,

    [CCode (cname="MOV_PRFT_NB")]
    NB;
}

[CCode (cname="struct MOVMuxContext",cheader_filename="subprojects/ffmpeg/libavformat/movenc.h")]
[Compact]
public class MOVMuxContext {
    [CCode (cname="")]
    public LibAVUtil.Log.Class av_class;

    [CCode (cname="")]
    public int mode;

    [CCode (cname="")]
    public int64 time;

    [CCode (cname="")]
    public int nb_streams;

    /***********************************************************\
    number of new created tmcd track based on metadata (aka not data copy)
    ***********************************************************/
    [CCode (cname="")]
    public int nb_meta_tmcd;

    /***********************************************************
    @brief Qt chapter track number
    ***********************************************************/
    [CCode (cname="")]
    public int chapter_track;

    [CCode (cname="")]
    public int64 mdat_pos;

    [CCode (cname="")]
    public uint64 mdat_size;

    [CCode (cname="")]
    public MOVTrack tracks;

    [CCode (cname="")]
    public int flags;

    [CCode (cname="")]
    public int rtp_flags;

    [CCode (cname="")]
    public int iods_skip;

    [CCode (cname="")]
    public int iods_video_profile;

    [CCode (cname="")]
    public int iods_audio_profile;

    [CCode (cname="")]
    public int moov_written;

    [CCode (cname="")]
    public int fragments;

    [CCode (cname="")]
    public int max_fragment_duration;

    [CCode (cname="")]
    public int min_fragment_duration;

    [CCode (cname="")]
    public int max_fragment_size;

    [CCode (cname="")]
    public int ism_lookahead;

    [CCode (cname="")]
    public LibAVFormat.IOContext mdat_buf;

    [CCode (cname="")]
    public int first_trun;

    [CCode (cname="")]
    public int video_track_timescale;

    /***********************************************************
    0 for disabled, -1 for automatic, size otherwise
    ***********************************************************/
    [CCode (cname="")]
    public int reserved_moov_size;

    [CCode (cname="")]
    public int64 reserved_header_pos;

    [CCode (cname="")]
    public string major_brand;

    [CCode (cname="")]
    public int per_stream_grouping;

    [CCode (cname="")]
    public LibAVFormat.FormatContext fc;

    [CCode (cname="")]
    public int use_editlist;

    [CCode (cname="")]
    public float gamma;

    [CCode (cname="")]
    public int frag_interleave;

    [CCode (cname="")]
    public int missing_duration_warned;

    [CCode (cname="")]
    public string encryption_scheme_str;

    [CCode (cname="")]
    public MOVEncryptionScheme encryption_scheme;

    [CCode (cname="")]
    public uint8[] encryption_key;

    [CCode (cname="")]
    public int encryption_key_len;

    [CCode (cname="")]
    public uint8[] encryption_kid;

    [CCode (cname="")]
    public int encryption_kid_len;

    [CCode (cname="")]
    public int need_rewrite_extradata;

    [CCode (cname="")]
    public int use_stream_ids_as_track_ids;

    [CCode (cname="")]
    public int track_ids_ok;

    [CCode (cname="")]
    public int write_tmcd;

    [CCode (cname="")]
    public MOVPrftBox write_prft;

    [CCode (cname="")]
    public int empty_hdlr_name;
}

[Flags]
[CCode (cheader_filename="subprojects/ffmpeg/libavformat/movenc.h")]
public enum MOVFlags {
    [CCode (cname="FF_MOV_FLAG_RTP_HINT")]
    RTP_HINT,

    [CCode (cname="FF_MOV_FLAG_FRAGMENT")]
    FRAGMENT,

    [CCode (cname="FF_MOV_FLAG_EMPTY_MOOV")]
    EMPTY_MOOV,

    [CCode (cname="FF_MOV_FLAG_FRAG_KEYFRAME")]
    FRAG_KEYFRAME,

    [CCode (cname="FF_MOV_FLAG_SEPARATE_MOOF")]
    SEPARATE_MOOF,

    [CCode (cname="FF_MOV_FLAG_FRAG_CUSTOM")]
    FRAG_CUSTOM,

    [CCode (cname="FF_MOV_FLAG_ISML")]
    ISML,

    [CCode (cname="FF_MOV_FLAG_FASTSTART")]
    FASTSTART,

    [CCode (cname="FF_MOV_FLAG_OMIT_TFHD_OFFSET")]
    OMIT_TFHD_OFFSET,

    [CCode (cname="FF_MOV_FLAG_DISABLE_CHPL")]
    DISABLE_CHPL,

    [CCode (cname="FF_MOV_FLAG_DEFAULT_BASE_MOOF")]
    DEFAULT_BASE_MOOF,

    [CCode (cname="FF_MOV_FLAG_DASH")]
    DASH,

    [CCode (cname="FF_MOV_FLAG_FRAG_DISCONT")]
    FRAG_DISCONT,

    [CCode (cname="FF_MOV_FLAG_DELAY_MOOV")]
    DELAY_MOOV,

    [CCode (cname="FF_MOV_FLAG_GLOBAL_SIDX")]
    GLOBAL_SIDX,

    [CCode (cname="FF_MOV_FLAG_WRITE_COLR")]
    WRITE_COLR,

    [CCode (cname="FF_MOV_FLAG_WRITE_GAMA")]
    WRITE_GAMA,

    [CCode (cname="FF_MOV_FLAG_USE_MDTA")]
    USE_MDTA,

    [CCode (cname="FF_MOV_FLAG_SKIP_TRAILER")]
    SKIP_TRAILER,

    [CCode (cname="FF_MOV_FLAG_NEGATIVE_CTS_OFFSETS")]
    NEGATIVE_CTS_OFFSETS,

    [CCode (cname="FF_MOV_FLAG_FRAG_EVERY_FRAME")]
    FRAG_EVERY_FRAME,

    [CCode (cname="FF_MOV_FLAG_SKIP_SIDX")]
    SKIP_SIDX;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/movenc.h")]
public int ff_mov_write_packet (
    LibAVFormat.FormatContext format_context,
    LibAVCodec.Packet packet
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/movenc.h")]
public int ff_mov_init_hinting (
    LibAVFormat.FormatContext format_context,
    int index,
    int src_index
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/movenc.h")]
public int ff_mov_add_hinted_packet (
    LibAVFormat.FormatContext format_context,
    LibAVCodec.Packet packet,
    int track_index,
    int sample,
    uint8[] sample_data,
    int sample_size
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/movenc.h")]
public void ff_mov_close_hinting (
    MOVTrack track
);

} // namespace LibAVFormat
