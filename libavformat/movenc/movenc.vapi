/***********************************************************
MOV, 3GP, MP4 muxer
Copyright (c) 2003 Thomas Raivio
Copyright (c) 2004 Gildas Bazin <gbazin at videolan dot org>
Copyright (c) 2009 Baptiste Coudurier <baptiste dot coudurier at gmail dot com>

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

public const size_t MOV_FRAG_INFO_ALLOC_INCREMENT;
public const size_t MOV_INDEX_CLUSTER_SIZE;
public const int MOV_TIMESCALE;

public const size_t RTP_MAX_PACKET_SIZE;

public enum Mode {
    MODE_MP4,
    MODE_MOV,
    MODE_3GP,
    MODE_PSP, // example working PSP command line:
    // ffmpeg -i testinput.avi -f psp -r 14.985 -s 320x240 -b 768 -ar 24000 -ab 32 M4V00001.MP4
    MODE_3G2,
    MODE_IPOD,
    MODE_ISM,
    MODE_F4V,
}

public struct MOVIentry {
    uint64 pos;
    int64 dts;
    int64 pts;
    uint size;
    uint samples_in_chunk;
    /***********************************************************
    Chunk number if the current entry is a chunk start otherwise 0
    ***********************************************************/
    uint chunkNum;
    uint entries;
    int cts;
    MOVSampleFlags flags;
}

[Flags]
public enum MOVSampleFlags {
    MOV_SYNC_SAMPLE,
    MOV_PARTIAL_SYNC_SAMPLE,
    MOV_DISPOSABLE_SAMPLE,
}

public struct HintSample {
    uint8[] data;
    int size;
    int sample_number;
    int offset;
    int own_data;
}

public struct HintSampleQueue {
    int size;
    int len;
    HintSample *samples;
}

public struct MOVFragmentInfo {
    int64 offset;
    int64 time;
    int64 duration;
    int64 tfrf_offset;
    int size;
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
    int mode;
    int entry;
    uint timescale;
    uint64 time;
    int64 track_duration;
    int last_sample_is_subtitle_end;
    long sample_count;
    long sample_size;
    long chunkCount;
    int has_keyframes;
    int has_disposable;
    MOVTrackFlags flags;
    MOVETimeCodeFlags timecode_flags;
    int language;
    int track_id;
    /***********************************************************
    stsd fourcc
    ***********************************************************/
    int tag;
    AVStream *st;
    LibAVCodec.CodecParameters *par;
    int multichannel_as_mono;

    int vos_len;
    uint8 *vos_data;
    MOVIentry *cluster;
    uint cluster_capacity;
    int audio_vbr;
    /***********************************************************
    active picture (w/o VBI) height for D-10/IMX
    ***********************************************************/
    int height;
    uint32 tref_tag;
    /***********************************************************
    trackID of the referenced track
    ***********************************************************/
    int tref_id;
    int64 start_dts;
    int64 start_cts;
    int64 end_pts;
    int end_reliable;
    int64 dts_shift;

    /***********************************************************
    the track that hints this track, -1 if no hint track is set
    ***********************************************************/
    int hint_track;

    /***********************************************************
    the track that this hint (or tmcd) track describes
    ***********************************************************/
    int src_track;
    /***********************************************************
    the format context for the hinting rtp muxer
    ***********************************************************/
    AVFormatContext *rtp_ctx;
    uint32 prev_rtp_ts;
    int64 cur_rtp_ts_unwrapped;
    uint32 max_packet_size;

    int64 default_duration;
    uint32 default_sample_flags;
    uint32 default_size;

    HintSampleQueue sample_queue;
    LibAVCodec.Packet cover_image;

    AVIOContext *mdat_buf;
    int64 data_offset;
    int64 frag_start;
    int frag_discont;
    int entries_flushed;

    int nb_frag_info;
    MOVFragmentInfo *frag_info;
    uint frag_info_capacity;

    VC1Info vc1_info;

    void *eac3_priv;

    MOVMuxCencContext cenc;

    uint32 palette[LibAVUtil.AVPALETTE_COUNT];
    int pal_done;

    int is_unaligned_qt_rgb;
}

public struct VC1Info {
    int first_packet_seq;
    int first_packet_entry;
    int first_packet_seen;
    int first_frag_written;
    int packet_seq;
    int packet_entry;
    int slices;
}

public enum MOVEncryptionScheme {
    MOV_ENC_NONE,
    MOV_ENC_CENC_AES_CTR,
}

public enum MOVPrftBox {
    MOV_PRFT_NONE = 0,
    MOV_PRFT_SRC_WALLCLOCK,
    MOV_PRFT_SRC_PTS,
    MOV_PRFT_NB
}

public struct MOVMuxContext {
    LibAVUtil.Class *av_class;
    int mode;
    int64 time;
    int nb_streams;
    /***********************************************************\
    number of new created tmcd track based on metadata (aka not data copy)
    ***********************************************************/
    int nb_meta_tmcd;
    /***********************************************************
    qt chapter track number
    ***********************************************************/
    int chapter_track;
    int64 mdat_pos;
    uint64 mdat_size;
    MOVTrack *tracks;

    int flags;
    int rtp_flags;

    int iods_skip;
    int iods_video_profile;
    int iods_audio_profile;

    int moov_written;
    int fragments;
    int max_fragment_duration;
    int min_fragment_duration;
    int max_fragment_size;
    int ism_lookahead;
    AVIOContext *mdat_buf;
    int first_trun;

    int video_track_timescale;

    /***********************************************************
    0 for disabled, -1 for automatic, size otherwise
    ***********************************************************/
    int reserved_moov_size;
    int64 reserved_header_pos;

    string major_brand;

    int per_stream_grouping;
    AVFormatContext *fc;

    int use_editlist;
    float gamma;

    int frag_interleave;
    int missing_duration_warned;

    string encryption_scheme_str;
    MOVEncryptionScheme encryption_scheme;
    uint8[] encryption_key;
    int encryption_key_len;
    uint8[] encryption_kid;
    int encryption_kid_len;

    int need_rewrite_extradata;

    int use_stream_ids_as_track_ids;
    int track_ids_ok;
    int write_tmcd;
    MOVPrftBox write_prft;
    int empty_hdlr_name;
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

int ff_mov_write_packet (
    AVFormatContext *s,
    LibAVCodec.Packet *packet
);

int ff_mov_init_hinting (
    AVFormatContext *s,
    int index,
    int src_index
);
int ff_mov_add_hinted_packet (
    AVFormatContext *s,
    LibAVCodec.Packet *packet,
    int track_index,
    int sample,
    uint8[] sample_data,
    int sample_size
);
void ff_mov_close_hinting (
    MOVTrack *track
);
