/***********************************************************
ISO Media common code
copyright (c) 2001 Fabrice Bellard
copyright (c) 2002 Francois Revol <revol@free.fr>
copyright (c) 2006 Baptiste Coudurier <baptiste.coudurier@free.fr>

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

/***********************************************************
isom.c
***********************************************************/
//  extern const AVCodecTag ff_mp4_obj_type[];
//  extern const AVCodecTag ff_codec_movvideo_tags[];
//  extern const AVCodecTag ff_codec_movaudio_tags[];
//  extern const AVCodecTag ff_codec_movsubtitle_tags[];
//  extern const AVCodecTag ff_codec_movdata_tags[];

int ff_mov_iso639_to_lang(char lang[4], int mp4);
int ff_mov_lang_to_iso639(uint code, char to[4]);

public struct AVAESCTR;

/***********************************************************
the QuickTime file format is quite convoluted...
it has lots of index tables, each indexing something in another one...
Here we just use what is needed to read the chunks
***********************************************************/

public struct MOVStts {
    uint count;
    int duration;
}

public struct MOVStsc {
    int first;
    int count;
    int id;
}

public struct MOVElst {
    int64 duration;
    int64 time;
    float rate;
}

public struct MOVDref {
    uint32 type;
    string path;
    string dir;
    char volume[28];
    char filename[64];
    int16 nlvl_to, nlvl_from;
}

public struct MOVAtom {
    uint32 type;
    int64 size; /***********************************************************
    total size (excluding the size and type fields)
    ***********************************************************/
}

public struct MOVParseTableEntry { }

public struct MOVFragment {
    int found_tfhd;
    uint track_id;
    uint64 base_data_offset;
    uint64 moof_offset;
    uint64 implicit_offset;
    uint stsd_id;
    uint duration;
    uint size;
    uint flags;
}

public struct MOVTrackExt {
    uint track_id;
    uint stsd_id;
    uint duration;
    uint size;
    uint flags;
}

public struct MOVSbgp {
    uint count;
    uint index;
}

public struct MOVEncryptionIndex {
    /***********************************************************
    Individual encrypted samples. If there are no elements,
    then the default settings will be used.
    ***********************************************************/
    AVEncryptionInfo[] encrypted_samples;
    uint nb_encrypted_samples;

    uint8[] auxiliary_info_sizes;
    size_t auxiliary_info_sample_count;
    uint8 auxiliary_info_default_size;
    /***********************************************************
    Absolute seek position
    ***********************************************************/
    uint64[] auxiliary_offsets;
    size_t auxiliary_offsets_count;
}

public struct MOVFragmentStreamInfo {
    int id;
    int64 sidx_pts;
    int64 first_tfra_pts;
    int64 tfdt_dts;
    int index_entry;
    MOVEncryptionIndex *encryption_index;
}

public struct MOVFragmentIndexItem {
    int64 moof_offset;
    int headers_read;
    int current;
    int nb_stream_info;
    MOVFragmentStreamInfo * stream_info;
}

public struct MOVFragmentIndex {
    int allocated_size;
    int complete;
    int current;
    int nb_items;
    MOVFragmentIndexItem * item;
}

public struct MOVIndexRange {
    int64 start;
    int64 end;
}

public struct MOVStreamContext {
    AVIOContext *pb;
    int pb_is_copied;
    /***********************************************************
    AVStream index
    ***********************************************************/
    int ffindex;
    int next_chunk;
    uint chunk_count;
    int64[] chunk_offsets;
    uint stts_count;
    MOVStts *stts_data;
    uint ctts_count;
    uint ctts_allocated_size;
    MOVStts *ctts_data;
    uint stsc_count;
    MOVStsc *stsc_data;
    uint stsc_index;
    int stsc_sample;
    uint stps_count;
    /***********************************************************
    partial sync sample for mpeg-2 open gop
    ***********************************************************/
    uint[] stps_data;
    MOVElst *elst_data;
    uint elst_count;
    int ctts_index;
    int ctts_sample;
    /***********************************************************
    may contain value calculated from stsd or value from stsz atom
    ***********************************************************/
    uint sample_size;
    /***********************************************************
    always contains sample size from stsz atom
    ***********************************************************/
    uint stsz_sample_size;
    uint sample_count;
    int[] sample_sizes;
    int keyframe_absent;
    uint keyframe_count;
    int[] keyframes;
    int time_scale;
    /***********************************************************
    time offset of the edit list entries
    ***********************************************************/
    int64 time_offset;
    /***********************************************************
    minimum Composition time shown by the edits excluding empty edits.
    ***********************************************************/
    int64 min_corrected_pts;
    int current_sample;
    int64 current_index;
    MOVIndexRange* index_ranges;
    MOVIndexRange* current_index_range;
    uint bytes_per_frame;
    uint samples_per_frame;
    int dv_audio_container;
    /***********************************************************
    -1 means demux all ids
    ***********************************************************/
    int pseudo_stream_id;
    /***********************************************************
    stsd audio compression id
    ***********************************************************/
    int16 audio_cid;
    uint drefs_count;
    MOVDref *drefs;
    int dref_id;
    int timecode_track;
    /***********************************************************
    tkhd width
    ***********************************************************/
    int width;
    /***********************************************************
    tkhd height
    ***********************************************************/
    int height;
    /***********************************************************
    dts shift when ctts is negative
    ***********************************************************/
    int dts_shift;
    uint32 palette[256];
    int has_palette;
    int64 data_size;
    /***********************************************************
    tmcd track flags
    ***********************************************************/
    uint32 tmcd_flags;
    /***********************************************************
    used for dts generation in fragmented movie files
    ***********************************************************/
    int64 track_end;
    /***********************************************************
    amount of samples to skip due to enc-dec delay
    ***********************************************************/
    int start_pad;
    uint rap_group_count;
    MOVSbgp *rap_group;

    int nb_frames_for_fps;
    int64 duration_for_fps;

    /***********************************************************
    ***********************************************************/
    /***********************************************************
    extradata array (and size) for multiple stsd
    ***********************************************************/
    uint8[] *extradata;
    int[] extradata_size;
    int last_stsd_index;
    int stsd_count;
    int stsd_version;

    int32[] display_matrix;
    AVStereo3D *stereo3d;
    AVSphericalMapping *spherical;
    size_t spherical_size;
    AVMasteringDisplayMetadata *mastering;
    AVContentLightMetadata *coll;
    size_t coll_size;

    uint32 format;

    /***********************************************************
    If there is an sidx entry for this stream.
    ***********************************************************/
    int has_sidx;
    struct {
        AVAESCTR* aes_ctr;
        /***********************************************************
        Either 0, 8, or 16.
        ***********************************************************/
        uint per_sample_iv_size;
        AVEncryptionInfo *default_encrypted_sample;
        MOVEncryptionIndex *encryption_index;
    } cenc;
}

public struct MOVContext {
    /***********************************************************
    class for private options
    ***********************************************************/
    AVClass *class;
    AVFormatContext *fc;
    int time_scale;
    /***********************************************************
    duration of the longest track
    ***********************************************************/
    int64 duration;
    /***********************************************************
    'moov' atom has been found
    ***********************************************************/
    int found_moov;
    /***********************************************************
    'mdat' atom has been found
    ***********************************************************/
    int found_mdat;
    /***********************************************************
    'hdlr' atom with type 'mdta' has been found
    ***********************************************************/
    int found_hdlr_mdta;
    /***********************************************************
    Index of the current 'trak'
    ***********************************************************/
    int trak_index;
    string[] meta_keys;
    uint meta_keys_count;
    DVDemuxContext *dv_demux;
    AVFormatContext *dv_fctx;
    /***********************************************************
    1 if file is ISO Media (mp4/3gp)
    ***********************************************************/
    int isom;
    /***********************************************************
    current fragment in moof atom
    ***********************************************************/
    MOVFragment fragment;
    MOVTrackExt *trex_data;
    uint trex_count;
    /***********************************************************
    metadata are itunes style
    ***********************************************************/
    int itunes_metadata;
    int handbrake_version;
    int[] chapter_tracks;
    uint nb_chapter_tracks;
    int use_absolute_path;
    int ignore_editlist;
    int advanced_editlist;
    int ignore_chapters;
    int seek_individually;
    /***********************************************************
    offset of the next root atom
    ***********************************************************/
    int64 next_root_atom;
    int export_all;
    int export_xmp;
    /***********************************************************
    bitrates read before streams creation
    ***********************************************************/
    int[] bitrates;
    int bitrates_count;
    int moov_retry;
    int use_mfra_for;
    int has_looked_for_mfra;
    MOVFragmentIndex frag_index;
    int atom_depth;
    /***********************************************************
    'aax' file has been detected
    ***********************************************************/
    uint aax_mode;
    uint8 file_key[20];
    uint8 file_iv[20];
    void *activation_bytes;
    int activation_bytes_size;
    void *audible_fixed_key;
    int audible_fixed_key_size;
    AVAES *aes_decrypt;
    uint8[] decryption_key;
    int decryption_key_len;
    int enable_drefs;
    /***********************************************************
    display matrix from mvhd
    ***********************************************************/
    int32 movie_display_matrix[3][3];
}

int ff_mp4_read_descr_len(AVIOContext *pb);
int ff_mp4_read_descr(AVFormatContext *fc, AVIOContext *pb, int[] tag);
int ff_mp4_read_dec_config_descr(AVFormatContext *fc, AVStream *st, AVIOContext *pb);
void ff_mp4_parse_es_descr(AVIOContext *pb, int[] es_id);

#define MP4ODescrTag 0x01
#define MP4IODescrTag 0x02
#define MP4ESDescrTag 0x03
#define MP4DecConfigDescrTag 0x04
#define MP4DecSpecificDescrTag 0x05
#define MP4SLDescrTag 0x06

#define MOV_TFHD_BASE_DATA_OFFSET 0x01
#define MOV_TFHD_STSD_ID 0x02
#define MOV_TFHD_DEFAULT_DURATION 0x08
#define MOV_TFHD_DEFAULT_SIZE 0x10
#define MOV_TFHD_DEFAULT_FLAGS 0x20
#define MOV_TFHD_DURATION_IS_EMPTY 0x010000
#define MOV_TFHD_DEFAULT_BASE_IS_MOOF 0x020000

#define MOV_TRUN_DATA_OFFSET 0x01
#define MOV_TRUN_FIRST_SAMPLE_FLAGS 0x04
#define MOV_TRUN_SAMPLE_DURATION 0x100
#define MOV_TRUN_SAMPLE_SIZE 0x200
#define MOV_TRUN_SAMPLE_FLAGS 0x400
#define MOV_TRUN_SAMPLE_CTS 0x800

#define MOV_FRAG_SAMPLE_FLAG_DEGRADATION_PRIORITY_MASK 0x0000ffff
#define MOV_FRAG_SAMPLE_FLAG_IS_NON_SYNC 0x00010000
#define MOV_FRAG_SAMPLE_FLAG_PADDING_MASK 0x000e0000
#define MOV_FRAG_SAMPLE_FLAG_REDUNDANCY_MASK 0x00300000
#define MOV_FRAG_SAMPLE_FLAG_DEPENDED_MASK 0x00c00000
#define MOV_FRAG_SAMPLE_FLAG_DEPENDS_MASK 0x03000000

#define MOV_FRAG_SAMPLE_FLAG_DEPENDS_NO 0x02000000
#define MOV_FRAG_SAMPLE_FLAG_DEPENDS_YES 0x01000000

#define MOV_TKHD_FLAG_ENABLED 0x0001
#define MOV_TKHD_FLAG_IN_MOVIE 0x0002
#define MOV_TKHD_FLAG_IN_PREVIEW 0x0004
#define MOV_TKHD_FLAG_IN_POSTER 0x0008

#define MOV_SAMPLE_DEPENDENCY_UNKNOWN 0x0
#define MOV_SAMPLE_DEPENDENCY_YES 0x1
#define MOV_SAMPLE_DEPENDENCY_NO 0x2


#define TAG_IS_AVCI(tag)                    \
    ((tag) == MKTAG('a', 'i', '5', 'p') ||  \
     (tag) == MKTAG('a', 'i', '5', 'q') ||  \
     (tag) == MKTAG('a', 'i', '5', '2') ||  \
     (tag) == MKTAG('a', 'i', '5', '3') ||  \
     (tag) == MKTAG('a', 'i', '5', '5') ||  \
     (tag) == MKTAG('a', 'i', '5', '6') ||  \
     (tag) == MKTAG('a', 'i', '1', 'p') ||  \
     (tag) == MKTAG('a', 'i', '1', 'q') ||  \
     (tag) == MKTAG('a', 'i', '1', '2') ||  \
     (tag) == MKTAG('a', 'i', '1', '3') ||  \
     (tag) == MKTAG('a', 'i', '1', '5') ||  \
     (tag) == MKTAG('a', 'i', '1', '6') ||  \
     (tag) == MKTAG('a', 'i', 'v', 'x') ||  \
     (tag) == MKTAG('A', 'V', 'i', 'n'))


int ff_mov_read_esds(AVFormatContext *fc, AVIOContext *pb);

int ff_mov_read_stsd_entries(MOVContext *c, AVIOContext *pb, int entries);
void ff_mov_write_chan(AVIOContext *pb, int64 channel_layout);

#define FF_MOV_FLAG_MFRA_AUTO -1
#define FF_MOV_FLAG_MFRA_DTS 1
#define FF_MOV_FLAG_MFRA_PTS 2

/***********************************************************
Compute codec id for 'lpcm' tag.
See CoreAudioTypes and AudioStreamBasicDescription at Apple.
***********************************************************/
static inline enum AVCodecID ff_mov_get_lpcm_codec_id(int bps, int flags)
{
    /***********************************************************
    lpcm flags:
    0x1 = float
    0x2 = big-endian
    0x4 = signed
    ***********************************************************/
    return ff_get_pcm_codec_id(bps, flags & 1, flags & 2, flags & 4 ? -1 : 0);
}