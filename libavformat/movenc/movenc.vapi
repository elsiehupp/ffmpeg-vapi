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

#define MOV_FRAG_INFO_ALLOC_INCREMENT 64
#define MOV_INDEX_CLUSTER_SIZE 1024
#define MOV_TIMESCALE 1000

#define RTP_MAX_PACKET_SIZE 1450

#define MODE_MP4 0x01
#define MODE_MOV 0x02
#define MODE_3GP 0x04
#define MODE_PSP 0x08 // example working PSP command line:
// ffmpeg -i testinput.avi -f psp -r 14.985 -s 320x240 -b 768 -ar 24000 -ab 32 M4V00001.MP4
#define MODE_3G2 0x10
#define MODE_IPOD 0x20
#define MODE_ISM 0x40
#define MODE_F4V 0x80

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
#define MOV_SYNC_SAMPLE 0x0001
#define MOV_PARTIAL_SYNC_SAMPLE 0x0002
#define MOV_DISPOSABLE_SAMPLE 0x0004
    uint32 flags;
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
#define MOV_TRACK_CTTS 0x0001
#define MOV_TRACK_STPS 0x0002
#define MOV_TRACK_ENABLED 0x0004
    uint32 flags;
#define MOV_TIMECODE_FLAG_DROPFRAME 0x0001
#define MOV_TIMECODE_FLAG_24HOURSMAX 0x0002
#define MOV_TIMECODE_FLAG_ALLOWNEGATIVE 0x0004
    uint32 timecode_flags;
    int language;
    int track_id;
    /***********************************************************
    stsd fourcc
    ***********************************************************/
    int tag;
    AVStream *st;
    AVCodecParameters *par;
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
    AVPacket cover_image;

    AVIOContext *mdat_buf;
    int64 data_offset;
    int64 frag_start;
    int frag_discont;
    int entries_flushed;

    int nb_frag_info;
    MOVFragmentInfo *frag_info;
    uint frag_info_capacity;

    struct {
        int first_packet_seq;
        int first_packet_entry;
        int first_packet_seen;
        int first_frag_written;
        int packet_seq;
        int packet_entry;
        int slices;
    } vc1_info;

    void *eac3_priv;

    MOVMuxCencContext cenc;

    uint32 palette[AVPALETTE_COUNT];
    int pal_done;

    int is_unaligned_qt_rgb;
}

public enum MOVEncryptionScheme {
    MOV_ENC_NONE = 0,
    MOV_ENC_CENC_AES_CTR,
}

public enum MOVPrftBox {
    MOV_PRFT_NONE = 0,
    MOV_PRFT_SRC_WALLCLOCK,
    MOV_PRFT_SRC_PTS,
    MOV_PRFT_NB
}

public struct MOVMuxContext {
    AVClass *av_class;
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
    AVPacket *packet
);

int ff_mov_init_hinting (
    AVFormatContext *s,
    int index,
    int src_index
);
int ff_mov_add_hinted_packet (
    AVFormatContext *s,
    AVPacket *packet,
    int track_index,
    int sample,
    uint8[] sample_data,
    int sample_size
);
void ff_mov_close_hinting (
    MOVTrack *track
);
