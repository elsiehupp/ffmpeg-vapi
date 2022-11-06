/***********************************************************
ISO Media common code
@copyright 2001 Fabrice Bellard
@copyright 2002 Francois Revol <revol@free.fr>
@copyright 2006 Baptiste Coudurier <baptiste.coudurier@free.fr>

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

/***********************************************************
isom.c
***********************************************************/
//  extern const AVCodecTag ff_mp4_obj_type[];
//  extern const AVCodecTag ff_codec_movvideo_tags[];
//  extern const AVCodecTag ff_codec_movaudio_tags[];
//  extern const AVCodecTag ff_codec_movsubtitle_tags[];
//  extern const AVCodecTag ff_codec_movdata_tags[];

public int ff_mov_iso639_to_lang (
    char lang[4],
    int mp4
);

public int ff_mov_lang_to_iso639 (
    uint code,
    char to[4]
);

/***********************************************************
the QuickTime file format is quite convoluted...
it has lots of index tables, each indexing something in another one...
Here we just use what is needed to read the chunks
***********************************************************/

public struct MOVStts {
    public uint count;
    public int duration;
}

public struct MOVStsc {
    public int first;
    public int count;
    public int id;
}

public struct MOVElst {
    public int64 duration;
    public int64 time;
    public float rate;
}

public struct MOVDref {
    public uint32 type;
    public string path;
    public string dir;
    public string volume; //[28];
    public string filename; //[64];
    public int16 nlvl_to;
    public int16 nlvl_from;
}

public struct MOVAtom {
    public uint32 type;
    /***********************************************************
    total size (excluding the size and type fields)
    ***********************************************************/
    public int64 size;
}

public struct MOVParseTableEntry { }

public struct MOVFragment {
    public int found_tfhd;
    public uint track_id;
    public uint64 base_data_offset;
    public uint64 moof_offset;
    public uint64 implicit_offset;
    public uint stsd_id;
    public uint duration;
    public uint size;
    public uint flags;
}

public struct MOVTrackExt {
    public uint track_id;
    public uint stsd_id;
    public uint duration;
    public uint size;
    public uint flags;
}

public struct MOVSbgp {
    public uint count;
    public uint index;
}

public struct MOVEncryptionIndex {
    /***********************************************************
    Individual encrypted samples. If there are no elements,
    then the default settings will be used.
    ***********************************************************/
    public LibAVUtil.EncryptionInfo[] encrypted_samples;
    public uint nb_encrypted_samples;

    public uint8[] auxiliary_info_sizes;
    public size_t auxiliary_info_sample_count;
    public uint8 auxiliary_info_default_size;
    /***********************************************************
    Absolute seek position
    ***********************************************************/
    public uint64[] auxiliary_offsets;
    public size_t auxiliary_offsets_count;
}

public struct MOVFragmentStreamInfo {
    public int id;
    public int64 sidx_pts;
    public int64 first_tfra_pts;
    public int64 tfdt_dts;
    public int index_entry;
    public MOVEncryptionIndex encryption_index;
}

public struct MOVFragmentIndexItem {
    public int64 moof_offset;
    public int headers_read;
    public int current;
    public int nb_stream_info;
    public MOVFragmentStreamInfo stream_info;
}

public struct MOVFragmentIndex {
    public int allocated_size;
    public int complete;
    public int current;
    public int nb_items;
    public MOVFragmentIndexItem item;
}

public struct MOVIndexRange {
    public int64 start;
    public int64 end;
}

public struct MOVStreamContext {
    public AVIOContext pb;
    public int pb_is_copied;
    /***********************************************************
    AVStream index
    ***********************************************************/
    public int ffindex;
    public int next_chunk;
    public uint chunk_count;
    public int64[] chunk_offsets;
    public uint stts_count;
    public MOVStts stts_data;
    public uint ctts_count;
    public uint ctts_allocated_size;
    public MOVStts ctts_data;
    public uint stsc_count;
    public MOVStsc stsc_data;
    public uint stsc_index;
    public int stsc_sample;
    public uint stps_count;
    /***********************************************************
    partial sync sample for mpeg-2 open gop
    ***********************************************************/
    public uint[] stps_data;
    public MOVElst elst_data;
    public uint elst_count;
    public int ctts_index;
    public int ctts_sample;
    /***********************************************************
    may contain value calculated from stsd or value from stsz atom
    ***********************************************************/
    public uint sample_size;
    /***********************************************************
    always contains sample size from stsz atom
    ***********************************************************/
    public uint stsz_sample_size;
    public uint sample_count;
    public int[] sample_sizes;
    public int keyframe_absent;
    public uint keyframe_count;
    public int[] keyframes;
    public int time_scale;
    /***********************************************************
    time offset of the edit list entries
    ***********************************************************/
    public int64 time_offset;
    /***********************************************************
    minimum Composition time shown by the edits excluding empty edits.
    ***********************************************************/
    public int64 min_corrected_pts;
    public int current_sample;
    public int64 current_index;
    public MOVIndexRange index_ranges;
    public MOVIndexRange current_index_range;
    public uint bytes_per_frame;
    public uint samples_per_frame;
    public int dv_audio_container;
    /***********************************************************
    -1 means demux all ids
    ***********************************************************/
    public int pseudo_stream_id;
    /***********************************************************
    stsd audio compression id
    ***********************************************************/
    public int16 audio_cid;
    public uint drefs_count;
    public MOVDref drefs;
    public int dref_id;
    public int timecode_track;
    /***********************************************************
    tkhd width
    ***********************************************************/
    public int width;
    /***********************************************************
    tkhd height
    ***********************************************************/
    public int height;
    /***********************************************************
    dts shift when ctts is negative
    ***********************************************************/
    public int dts_shift;
    public uint32 palette[256];
    public int has_palette;
    public int64 data_size;
    /***********************************************************
    tmcd track flags
    ***********************************************************/
    public uint32 tmcd_flags;
    /***********************************************************
    used for dts generation in fragmented movie files
    ***********************************************************/
    public int64 track_end;
    /***********************************************************
    amount of samples to skip due to enc-dec delay
    ***********************************************************/
    public int start_pad;
    public uint rap_group_count;
    public MOVSbgp rap_group;

    public int nb_frames_for_fps;
    public int64 duration_for_fps;

    /***********************************************************
    ***********************************************************/
    /***********************************************************
    extradata array (and size) for multiple stsd
    ***********************************************************/
    public uint8 **extradata;
    public int[] extradata_size;
    public int last_stsd_index;
    public int stsd_count;
    public int stsd_version;

    public int32[] display_matrix;
    public LibAVUtil.Stereo3D stereo3d;
    public LibAVUtil.SphericalMapping spherical;
    public size_t spherical_size;
    public LibAVUtil.MasteringDisplayMetadata mastering;
    public LibAVUtil.ContentLightMetadata coll;
    public size_t coll_size;

    public uint32 format;

    /***********************************************************
    If there is an sidx entry for this stream.
    ***********************************************************/
    public int has_sidx;
    public CEnc cenc;
}

public struct CEnc {
    public LibAVUtil.AESCTRContext aes_ctr;
    /***********************************************************
    Either 0, 8, or 16.
    ***********************************************************/
    public uint per_sample_iv_size;
    public LibAVUtil.EncryptionInfo default_encrypted_sample;
    public MOVEncryptionIndex encryption_index;
}

public struct MOVContext {
    /***********************************************************
    class for private options
    ***********************************************************/
    public LibAVUtil.Class class;
    public AVFormatContext fc;
    public int time_scale;
    /***********************************************************
    duration of the longest track
    ***********************************************************/
    public int64 duration;
    /***********************************************************
    'moov' atom has been found
    ***********************************************************/
    public int found_moov;
    /***********************************************************
    'mdat' atom has been found
    ***********************************************************/
    public int found_mdat;
    /***********************************************************
    'hdlr' atom with type 'mdta' has been found
    ***********************************************************/
    public int found_hdlr_mdta;
    /***********************************************************
    Index of the current 'trak'
    ***********************************************************/
    public int trak_index;
    public string[] meta_keys;
    public uint meta_keys_count;
    public DVDemuxContext dv_demux;
    public AVFormatContext dv_fctx;
    /***********************************************************
    1 if file is ISO Media (mp4/3gp)
    ***********************************************************/
    public int isom;
    /***********************************************************
    current fragment in moof atom
    ***********************************************************/
    public MOVFragment fragment;
    public MOVTrackExt trex_data;
    public uint trex_count;
    /***********************************************************
    metadata are itunes style
    ***********************************************************/
    public int itunes_metadata;
    public int handbrake_version;
    public int[] chapter_tracks;
    public uint nb_chapter_tracks;
    public int use_absolute_path;
    public int ignore_editlist;
    public int advanced_editlist;
    public int ignore_chapters;
    public int seek_individually;
    /***********************************************************
    offset of the next root atom
    ***********************************************************/
    public int64 next_root_atom;
    public int export_all;
    public int export_xmp;
    /***********************************************************
    bitrates read before streams creation
    ***********************************************************/
    public int[] bitrates;
    public int bitrates_count;
    public int moov_retry;
    public int use_mfra_for;
    public int has_looked_for_mfra;
    public MOVFragmentIndex frag_index;
    public int atom_depth;
    /***********************************************************
    'aax' file has been detected
    ***********************************************************/
    public uint aax_mode;
    public uint8 file_key[20];
    public uint8 file_iv[20];
    public void *activation_bytes;
    public int activation_bytes_size;
    public void *audible_fixed_key;
    public int audible_fixed_key_size;
    public LibAVUtil.Crypto.AESContext aes_decrypt;
    public uint8[] decryption_key;
    public int decryption_key_len;
    public int enable_drefs;
    /***********************************************************
    display matrix from mvhd
    ***********************************************************/
    public int32 movie_display_matrix[3 * 3];
}

public int ff_mp4_read_descr_len (
    AVIOContext pb
);

public int ff_mp4_read_descr (
    AVFormatContext fc,
    AVIOContext pb,
    out int tag
);

public int ff_mp4_read_dec_config_descr (
    AVFormatContext fc,
    AVStream st,
    AVIOContext pb
);

public void ff_mp4_parse_es_descr (
    AVIOContext pb,
    out int es_id
);

[Flags]
public enum MP4TagFlags {
    MP4ODescrTag,
    MP4IODescrTag,
    MP4ESDescrTag,
    MP4DecConfigDescrTag,
    MP4DecSpecificDescrTag,
    MP4SLDescrTag,
}

[Flags]
public enum MOVTFHDFlags {
    MOV_TFHD_BASE_DATA_OFFSET,
    MOV_TFHD_STSD_ID,
    MOV_TFHD_DEFAULT_DURATION,
    MOV_TFHD_DEFAULT_SIZE,
    MOV_TFHD_DEFAULT_FLAGS,
    MOV_TFHD_DURATION_IS_EMPTY,
    MOV_TFHD_DEFAULT_BASE_IS_MOOF,
}

[Flags]
public enum MOVTruncationFlags {
    MOV_TRUN_DATA_OFFSET,
    MOV_TRUN_FIRST_SAMPLE_FLAGS,
    MOV_TRUN_SAMPLE_DURATION,
    MOV_TRUN_SAMPLE_SIZE,
    MOV_TRUN_SAMPLE_FLAGS,
    MOV_TRUN_SAMPLE_CTS,
}

[Flags]
public enum MOVFragmentSampleFlags {
    MOV_FRAG_SAMPLE_FLAG_DEGRADATION_PRIORITY_MASK,
    MOV_FRAG_SAMPLE_FLAG_IS_NON_SYNC,
    MOV_FRAG_SAMPLE_FLAG_PADDING_MASK,
    MOV_FRAG_SAMPLE_FLAG_REDUNDANCY_MASK,
    MOV_FRAG_SAMPLE_FLAG_DEPENDED_MASK,
    MOV_FRAG_SAMPLE_FLAG_DEPENDS_MASK,

    MOV_FRAG_SAMPLE_FLAG_DEPENDS_NO,
    MOV_FRAG_SAMPLE_FLAG_DEPENDS_YES,
}

[Flags]
public enum MOVTKHDFlags {
    MOV_TKHD_FLAG_ENABLED,
    MOV_TKHD_FLAG_IN_MOVIE,
    MOV_TKHD_FLAG_IN_PREVIEW,
    MOV_TKHD_FLAG_IN_POSTER,
}

[Flags]
public enum MOVSampleDependencyFlags {
    MOV_SAMPLE_DEPENDENCY_UNKNOWN,
    MOV_SAMPLE_DEPENDENCY_YES,
    MOV_SAMPLE_DEPENDENCY_NO,
}


public bool TAG_IS_AVCI (
    uint32 tag
);
    //  ((tag) == MKTAG ('a', 'i', '5', 'p') ||  \
    //   (tag) == MKTAG ('a', 'i', '5', 'q') ||  \
    //   (tag) == MKTAG ('a', 'i', '5', '2') ||  \
    //   (tag) == MKTAG ('a', 'i', '5', '3') ||  \
    //   (tag) == MKTAG ('a', 'i', '5', '5') ||  \
    //   (tag) == MKTAG ('a', 'i', '5', '6') ||  \
    //   (tag) == MKTAG ('a', 'i', '1', 'p') ||  \
    //   (tag) == MKTAG ('a', 'i', '1', 'q') ||  \
    //   (tag) == MKTAG ('a', 'i', '1', '2') ||  \
    //   (tag) == MKTAG ('a', 'i', '1', '3') ||  \
    //   (tag) == MKTAG ('a', 'i', '1', '5') ||  \
    //   (tag) == MKTAG ('a', 'i', '1', '6') ||  \
    //   (tag) == MKTAG ('a', 'i', 'v', 'x') ||  \
    //   (tag) == MKTAG ('A', 'V', 'i', 'n'))


public int ff_mov_read_esds (
    AVFormatContext fc,
    AVIOContext pb
);

public int ff_mov_read_stsd_entries (
    MOVContext mov_context,
    AVIOContext pb,
    int entries
);

public void ff_mov_write_chan (
    AVIOContext pb,
    int64 channel_layout
);

public enum FFMOVFlagMfra {
    FF_MOV_FLAG_MFRA_AUTO,
    FF_MOV_FLAG_MFRA_DTS,
    FF_MOV_FLAG_MFRA_PTS,
}

/***********************************************************
Compute codec id for 'lpcm' tag.
See CoreAudioTypes and AudioStreamBasicDescription at Apple.
***********************************************************/
public static LibAVCodec.CodecID ff_mov_get_lpcm_codec_id (
    int bps,
    int flags
) {
    /***********************************************************
    lpcm flags:
    0x1 = float
    0x2 = big-endian
    0x4 = signed
    ***********************************************************/
    return ff_get_pcm_codec_id (
        bps,
        flags & 1,
        flags & 2,
        (flags & 4) != 0 ? -1 : 0
    );
}

} // namespace LibAVFormat
