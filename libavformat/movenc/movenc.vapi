/***********************************************************
MOV, 3GP, MP4 muxer
@copyright 2003 Thomas Raivio
@copyright 2004 Gildas Bazin <gbazin at videolan dot org>
@copyright 2009 Baptiste Coudurier <baptiste dot coudurier at gmail dot com>

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

public const size_t MOV_FRAG_INFO_ALLOC_INCREMENT;
public const size_t MOV_INDEX_CLUSTER_SIZE;
public const int MOV_TIMESCALE;

public const size_t RTP_MAX_PACKET_SIZE;

public enum Mode {
    MODE_MP4,
    MODE_MOV,
    MODE_3GP,
    /***********************************************************
    ***********************************************************/
    MODE_PSP, // example working PSP command line:
    // ffmpeg -i testinput.avi -f psp -r 14.985 -s 320x240 -b 768 -ar 24000 -ab 32 M4V00001.MP4
    MODE_3G2,
    MODE_IPOD,
    MODE_ISM,
    MODE_F4V,
}

public struct MOVIentry {
    public uint64 pos;
    public int64 dts;
    public int64 pts;
    public uint size;
    public uint samples_in_chunk;
    /***********************************************************
    Chunk number if the current entry is a chunk start otherwise 0
    ***********************************************************/
    public uint chunkNum;
    public uint entries;
    public int cts;
    public MOVSampleFlags flags;
}

[Flags]
public enum MOVSampleFlags {
    MOV_SYNC_SAMPLE,
    MOV_PARTIAL_SYNC_SAMPLE,
    MOV_DISPOSABLE_SAMPLE,
}

public struct HintSample {
    public uint8[] data;
    public int size;
    public int sample_number;
    public int offset;
    public int own_data;
}

public struct HintSampleQueue {
    public int size;
    public int len;
    public HintSample samples;
}

public struct MOVFragmentInfo {
    public int64 offset;
    public int64 time;
    public int64 duration;
    public int64 tfrf_offset;
    public int size;
}

[Flags]
public enum MOVTrackFlags {
    MOV_TRACK_CTTS,
    MOV_TRACK_STPS,
    MOV_TRACK_ENABLED,
}

[Flags]
public enum MOVETimeCodeFlags {
    MOV_TIMECODE_FLAG_DROPFRAME,
    MOV_TIMECODE_FLAG_24HOURSMAX,
    MOV_TIMECODE_FLAG_ALLOWNEGATIVE,
}

public struct MOVTrack {
    public int mode;
    public int entry;
    public uint timescale;
    public uint64 time;
    public int64 track_duration;
    public int last_sample_is_subtitle_end;
    public long sample_count;
    public long sample_size;
    public long chunkCount;
    public int has_keyframes;
    public int has_disposable;
    public MOVTrackFlags flags;
    public MOVETimeCodeFlags timecode_flags;
    public int language;
    public int track_id;
    /***********************************************************
    stsd fourcc
    ***********************************************************/
    public int tag;
    public AVStream st;
    public LibAVCodec.CodecParameters par;
    public int multichannel_as_mono;

    public int vos_len;
    public uint8[] vos_data;
    public MOVIentry cluster;
    public uint cluster_capacity;
    public int audio_vbr;
    /***********************************************************
    active picture (w/o VBI) height for D-10/IMX
    ***********************************************************/
    public int height;
    public uint32 tref_tag;
    /***********************************************************
    trackID of the referenced track
    ***********************************************************/
    public int tref_id;
    public int64 start_dts;
    public int64 start_cts;
    public int64 end_pts;
    public int end_reliable;
    public int64 dts_shift;

    /***********************************************************
    the track that hints this track, -1 if no hint track is set
    ***********************************************************/
    public int hint_track;

    /***********************************************************
    the track that this hint (or tmcd) track describes
    ***********************************************************/
    public int src_track;
    /***********************************************************
    the format context for the hinting rtp muxer
    ***********************************************************/
    public AVFormatContext rtp_ctx;
    public uint32 prev_rtp_ts;
    public int64 cur_rtp_ts_unwrapped;
    public uint32 max_packet_size;

    public int64 default_duration;
    public uint32 default_sample_flags;
    public uint32 default_size;

    public HintSampleQueue sample_queue;
    public LibAVCodec.Packet cover_image;

    public AVIOContext mdat_buf;
    public int64 data_offset;
    public int64 frag_start;
    public int frag_discont;
    public int entries_flushed;

    public int nb_frag_info;
    public MOVFragmentInfo frag_info;
    public uint frag_info_capacity;

    public VC1Info vc1_info;

    public void *eac3_priv;

    public MOVMuxCencContext cenc;

    public uint32 palette[LibAVUtil.AVPALETTE_COUNT];
    public int pal_done;

    public int is_unaligned_qt_rgb;
}

public struct VC1Info {
    public int first_packet_seq;
    public int first_packet_entry;
    public int first_packet_seen;
    public int first_frag_written;
    public int packet_seq;
    public int packet_entry;
    public int slices;
}

public enum MOVEncryptionScheme {
    MOV_ENC_NONE,
    MOV_ENC_CENC_AES_CTR,
}

public enum MOVPrftBox {
    MOV_PRFT_NONE,
    MOV_PRFT_SRC_WALLCLOCK,
    MOV_PRFT_SRC_PTS,
    MOV_PRFT_NB
}

public struct MOVMuxContext {
    public LibAVUtil.Class av_class;
    public int mode;
    public int64 time;
    public int nb_streams;
    /***********************************************************\
    number of new created tmcd track based on metadata (aka not data copy)
    ***********************************************************/
    public int nb_meta_tmcd;
    /***********************************************************
    qt chapter track number
    ***********************************************************/
    public int chapter_track;
    public int64 mdat_pos;
    public uint64 mdat_size;
    public MOVTrack tracks;

    public int flags;
    public int rtp_flags;

    public int iods_skip;
    public int iods_video_profile;
    public int iods_audio_profile;

    public int moov_written;
    public int fragments;
    public int max_fragment_duration;
    public int min_fragment_duration;
    public int max_fragment_size;
    public int ism_lookahead;
    public AVIOContext mdat_buf;
    public int first_trun;

    public int video_track_timescale;

    /***********************************************************
    0 for disabled, -1 for automatic, size otherwise
    ***********************************************************/
    public int reserved_moov_size;
    public int64 reserved_header_pos;

    public string major_brand;

    public int per_stream_grouping;
    public AVFormatContext fc;

    public int use_editlist;
    public float gamma;

    public int frag_interleave;
    public int missing_duration_warned;

    public string encryption_scheme_str;
    public MOVEncryptionScheme encryption_scheme;
    public uint8[] encryption_key;
    public int encryption_key_len;
    public uint8[] encryption_kid;
    public int encryption_kid_len;

    public int need_rewrite_extradata;

    public int use_stream_ids_as_track_ids;
    public int track_ids_ok;
    public int write_tmcd;
    public MOVPrftBox write_prft;
    public int empty_hdlr_name;
}

[Flags]
public enum MOVFlags {
    FF_MOV_FLAG_RTP_HINT,
    FF_MOV_FLAG_FRAGMENT,
    FF_MOV_FLAG_EMPTY_MOOV,
    FF_MOV_FLAG_FRAG_KEYFRAME,
    FF_MOV_FLAG_SEPARATE_MOOF,
    FF_MOV_FLAG_FRAG_CUSTOM,
    FF_MOV_FLAG_ISML,
    FF_MOV_FLAG_FASTSTART,
    FF_MOV_FLAG_OMIT_TFHD_OFFSET,
    FF_MOV_FLAG_DISABLE_CHPL,
    FF_MOV_FLAG_DEFAULT_BASE_MOOF,
    FF_MOV_FLAG_DASH,
    FF_MOV_FLAG_FRAG_DISCONT,
    FF_MOV_FLAG_DELAY_MOOV,
    FF_MOV_FLAG_GLOBAL_SIDX,
    FF_MOV_FLAG_WRITE_COLR,
    FF_MOV_FLAG_WRITE_GAMA,
    FF_MOV_FLAG_USE_MDTA,
    FF_MOV_FLAG_SKIP_TRAILER,
    FF_MOV_FLAG_NEGATIVE_CTS_OFFSETS,
    FF_MOV_FLAG_FRAG_EVERY_FRAME,
    FF_MOV_FLAG_SKIP_SIDX,
}

public int ff_mov_write_packet (
    AVFormatContext format_context,
    LibAVCodec.Packet packet
);

public int ff_mov_init_hinting (
    AVFormatContext format_context,
    int index,
    int src_index
);

public int ff_mov_add_hinted_packet (
    AVFormatContext format_context,
    LibAVCodec.Packet packet,
    int track_index,
    int sample,
    uint8[] sample_data,
    int sample_size
);

public void ff_mov_close_hinting (
    MOVTrack track
);

} // namespace LibAVFormat
