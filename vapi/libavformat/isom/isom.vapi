/***********************************************************
@brief ISO Media common code
@copyright 2001 Fabrice Bellard
@copyright 2002 Francois Revol <revol@free.fr>
@copyright 2006 Baptiste Coudurier <baptiste.coudurier@free.fr>
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

/***********************************************************
@brief Isom.c
***********************************************************/
//  extern const AVCodecTag ff_mp4_obj_type[];
//  extern const AVCodecTag ff_codec_movvideo_tags[];
//  extern const AVCodecTag ff_codec_movaudio_tags[];
//  extern const AVCodecTag ff_codec_movsubtitle_tags[];
//  extern const AVCodecTag ff_codec_movdata_tags[];

[CCode (cname="", cheader_filename="")]
public int ff_mov_iso639_to_lang (
    char lang[4],
    int mp4
);

[CCode (cname="", cheader_filename="")]
public int ff_mov_lang_to_iso639 (
    uint code,
    char to[4]
);

/***********************************************************
@brief The QuickTime file format is quite convoluted...
it has lots of index tables, each indexing something in another one...
Here we just use what is needed to read the chunks
***********************************************************/

[CCode (cname="struct MOVStts", cheader_filename="")]
public struct MOVStts {
    [CCode (cname="", cheader_filename="")]
    public uint count;

    [CCode (cname="", cheader_filename="")]
    public int duration;
}

[CCode (cname="struct MOVStsc", cheader_filename="")]
public struct MOVStsc {
    [CCode (cname="", cheader_filename="")]
    public int first;

    [CCode (cname="", cheader_filename="")]
    public int count;

    [CCode (cname="", cheader_filename="")]
    public int id;
}

[CCode (cname="struct MOVElst", cheader_filename="")]
public struct MOVElst {
    [CCode (cname="", cheader_filename="")]
    public int64 duration;

    [CCode (cname="", cheader_filename="")]
    public int64 time;

    [CCode (cname="", cheader_filename="")]
    public float rate;
}

[CCode (cname="struct MOVDref", cheader_filename="")]
public struct MOVDref {
    [CCode (cname="", cheader_filename="")]
    public uint32 type;

    [CCode (cname="", cheader_filename="")]
    public string path;

    [CCode (cname="", cheader_filename="")]
    public string dir;

    [CCode (cname="", cheader_filename="")]
    public string volume; //[28];

    [CCode (cname="", cheader_filename="")]
    public string filename; //[64];

    [CCode (cname="", cheader_filename="")]
    public int16 nlvl_to;

    [CCode (cname="", cheader_filename="")]
    public int16 nlvl_from;
}

[CCode (cname="struct MOVAtom", cheader_filename="")]
public struct MOVAtom {
    [CCode (cname="", cheader_filename="")]
    public uint32 type;

    /***********************************************************
    @brief Total size (excluding the size and type fields)
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int64 size;
}

[CCode (cname="struct MOVParseTableEntry", cheader_filename="")]
public struct MOVParseTableEntry { }

[CCode (cname="struct MOVFragment", cheader_filename="")]
public struct MOVFragment {
    [CCode (cname="", cheader_filename="")]
    public int found_tfhd;

    [CCode (cname="", cheader_filename="")]
    public uint track_id;

    [CCode (cname="", cheader_filename="")]
    public uint64 base_data_offset;

    [CCode (cname="", cheader_filename="")]
    public uint64 moof_offset;

    [CCode (cname="", cheader_filename="")]
    public uint64 implicit_offset;

    [CCode (cname="", cheader_filename="")]
    public uint stsd_id;

    [CCode (cname="", cheader_filename="")]
    public uint duration;

    [CCode (cname="", cheader_filename="")]
    public uint size;

    [CCode (cname="", cheader_filename="")]
    public uint flags;
}

[CCode (cname="struct MOVTrackExt", cheader_filename="")]
public struct MOVTrackExt {
    [CCode (cname="", cheader_filename="")]
    public uint track_id;

    [CCode (cname="", cheader_filename="")]
    public uint stsd_id;

    [CCode (cname="", cheader_filename="")]
    public uint duration;

    [CCode (cname="", cheader_filename="")]
    public uint size;

    [CCode (cname="", cheader_filename="")]
    public uint flags;
}

[CCode (cname="struct MOVSbgp", cheader_filename="")]
public struct MOVSbgp {
    [CCode (cname="", cheader_filename="")]
    public uint count;

    [CCode (cname="", cheader_filename="")]
    public uint index;
}

[CCode (cname="struct MOVEncryptionIndex", cheader_filename="")]
public struct MOVEncryptionIndex {
    /***********************************************************
    @brief Individual encrypted samples. If there are no elements,
    then the default settings will be used.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public LibAVUtil.EncryptionInfo[] encrypted_samples;

    [CCode (cname="", cheader_filename="")]
    public uint nb_encrypted_samples;

    [CCode (cname="", cheader_filename="")]
    public uint8[] auxiliary_info_sizes;

    [CCode (cname="", cheader_filename="")]
    public size_t auxiliary_info_sample_count;

    [CCode (cname="", cheader_filename="")]
    public uint8 auxiliary_info_default_size;

    /***********************************************************
    @brief Absolute seek position
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public uint64[] auxiliary_offsets;

    [CCode (cname="", cheader_filename="")]
    public size_t auxiliary_offsets_count;
}

[CCode (cname="struct MOVFragmentStreamInfo", cheader_filename="")]
public struct MOVFragmentStreamInfo {
    [CCode (cname="", cheader_filename="")]
    public int id;

    [CCode (cname="", cheader_filename="")]
    public int64 sidx_pts;

    [CCode (cname="", cheader_filename="")]
    public int64 first_tfra_pts;

    [CCode (cname="", cheader_filename="")]
    public int64 tfdt_dts;

    [CCode (cname="", cheader_filename="")]
    public int index_entry;

    [CCode (cname="", cheader_filename="")]
    public MOVEncryptionIndex encryption_index;
}

[CCode (cname="struct MOVFragmentIndexItem", cheader_filename="")]
public struct MOVFragmentIndexItem {
    [CCode (cname="", cheader_filename="")]
    public int64 moof_offset;

    [CCode (cname="", cheader_filename="")]
    public int headers_read;

    [CCode (cname="", cheader_filename="")]
    public int current;

    [CCode (cname="", cheader_filename="")]
    public int nb_stream_info;

    [CCode (cname="", cheader_filename="")]
    public MOVFragmentStreamInfo stream_info;
}

[CCode (cname="struct MOVFragmentIndex", cheader_filename="")]
public struct MOVFragmentIndex {
    [CCode (cname="", cheader_filename="")]
    public int allocated_size;

    [CCode (cname="", cheader_filename="")]
    public int complete;

    [CCode (cname="", cheader_filename="")]
    public int current;

    [CCode (cname="", cheader_filename="")]
    public int nb_items;

    [CCode (cname="", cheader_filename="")]
    public MOVFragmentIndexItem item;
}

[CCode (cname="struct MOVIndexRange", cheader_filename="")]
public struct MOVIndexRange {
    [CCode (cname="", cheader_filename="")]
    public int64 start;

    [CCode (cname="", cheader_filename="")]
    public int64 end;
}

[CCode (cname="struct MOVStreamContext", cheader_filename="")]
public struct MOVStreamContext {
    [CCode (cname="", cheader_filename="")]
    public AVIOContext pb;

    [CCode (cname="", cheader_filename="")]
    public int pb_is_copied;

    /***********************************************************
    @brief AVStream index
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int ffindex;

    [CCode (cname="", cheader_filename="")]
    public int next_chunk;

    [CCode (cname="", cheader_filename="")]
    public uint chunk_count;

    [CCode (cname="", cheader_filename="")]
    public int64[] chunk_offsets;

    [CCode (cname="", cheader_filename="")]
    public uint stts_count;

    [CCode (cname="", cheader_filename="")]
    public MOVStts stts_data;

    [CCode (cname="", cheader_filename="")]
    public uint ctts_count;

    [CCode (cname="", cheader_filename="")]
    public uint ctts_allocated_size;

    [CCode (cname="", cheader_filename="")]
    public MOVStts ctts_data;

    [CCode (cname="", cheader_filename="")]
    public uint stsc_count;

    [CCode (cname="", cheader_filename="")]
    public MOVStsc stsc_data;

    [CCode (cname="", cheader_filename="")]
    public uint stsc_index;

    [CCode (cname="", cheader_filename="")]
    public int stsc_sample;

    [CCode (cname="", cheader_filename="")]
    public uint stps_count;

    /***********************************************************
    @brief Partial sync sample for mpeg-2 open gop
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public uint[] stps_data;

    [CCode (cname="", cheader_filename="")]
    public MOVElst elst_data;

    [CCode (cname="", cheader_filename="")]
    public uint elst_count;

    [CCode (cname="", cheader_filename="")]
    public int ctts_index;

    [CCode (cname="", cheader_filename="")]
    public int ctts_sample;

    /***********************************************************
    @brief May contain value calculated from stsd or value from stsz atom
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public uint sample_size;

    /***********************************************************
    @brief Always contains sample size from stsz atom
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public uint stsz_sample_size;

    [CCode (cname="", cheader_filename="")]
    public uint sample_count;

    [CCode (cname="", cheader_filename="")]
    public int[] sample_sizes;

    [CCode (cname="", cheader_filename="")]
    public int keyframe_absent;

    [CCode (cname="", cheader_filename="")]
    public uint keyframe_count;

    [CCode (cname="", cheader_filename="")]
    public int[] keyframes;

    [CCode (cname="", cheader_filename="")]
    public int time_scale;

    /***********************************************************
    @brief Time offset of the edit list entries
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int64 time_offset;

    /***********************************************************
    @brief Minimum Composition time shown by the edits excluding empty edits.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int64 min_corrected_pts;

    [CCode (cname="", cheader_filename="")]
    public int current_sample;

    [CCode (cname="", cheader_filename="")]
    public int64 current_index;

    [CCode (cname="", cheader_filename="")]
    public MOVIndexRange index_ranges;

    [CCode (cname="", cheader_filename="")]
    public MOVIndexRange current_index_range;

    [CCode (cname="", cheader_filename="")]
    public uint bytes_per_frame;

    [CCode (cname="", cheader_filename="")]
    public uint samples_per_frame;

    [CCode (cname="", cheader_filename="")]
    public int dv_audio_container;

    /***********************************************************
    -1 means demux all ids
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int pseudo_stream_id;

    /***********************************************************
    @brief Stsd audio compression id
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int16 audio_cid;

    [CCode (cname="", cheader_filename="")]
    public uint drefs_count;

    [CCode (cname="", cheader_filename="")]
    public MOVDref drefs;

    [CCode (cname="", cheader_filename="")]
    public int dref_id;

    [CCode (cname="", cheader_filename="")]
    public int timecode_track;

    /***********************************************************
    @brief Tkhd width
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int width;

    /***********************************************************
    @brief Tkhd height
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int height;

    /***********************************************************
    @brief Dts shift when ctts is negative
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int dts_shift;

    [CCode (cname="", cheader_filename="")]
    public uint32 palette[256];

    [CCode (cname="", cheader_filename="")]
    public int has_palette;

    [CCode (cname="", cheader_filename="")]
    public int64 data_size;

    /***********************************************************
    @brief Tmcd track flags
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public uint32 tmcd_flags;

    /***********************************************************
    used for dts generation in fragmented movie files
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int64 track_end;

    /***********************************************************
    @brief Amount of samples to skip due to enc-dec delay
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int start_pad;

    [CCode (cname="", cheader_filename="")]
    public uint rap_group_count;

    [CCode (cname="", cheader_filename="")]
    public MOVSbgp rap_group;

    [CCode (cname="", cheader_filename="")]
    public int nb_frames_for_fps;

    [CCode (cname="", cheader_filename="")]
    public int64 duration_for_fps;

    /***********************************************************
        ***********************************************************/
    /***********************************************************
    @brief Extradata array (and size) for multiple stsd
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public uint8 **extradata;

    [CCode (cname="", cheader_filename="")]
    public int[] extradata_size;

    [CCode (cname="", cheader_filename="")]
    public int last_stsd_index;

    [CCode (cname="", cheader_filename="")]
    public int stsd_count;

    [CCode (cname="", cheader_filename="")]
    public int stsd_version;

    [CCode (cname="", cheader_filename="")]
    public int32[] display_matrix;

    [CCode (cname="", cheader_filename="")]
    public LibAVUtil.Stereo3D stereo3d;

    [CCode (cname="", cheader_filename="")]
    public LibAVUtil.SphericalMapping spherical;

    [CCode (cname="", cheader_filename="")]
    public size_t spherical_size;

    [CCode (cname="", cheader_filename="")]
    public LibAVUtil.MasteringDisplayMetadata mastering;

    [CCode (cname="", cheader_filename="")]
    public LibAVUtil.ContentLightMetadata coll;

    [CCode (cname="", cheader_filename="")]
    public size_t coll_size;

    [CCode (cname="", cheader_filename="")]
    public uint32 format;

    /***********************************************************
    @brief If there is an sidx entry for this stream.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int has_sidx;

    [CCode (cname="", cheader_filename="")]
    public CEnc cenc;
}

[CCode (cname="struct CEnc", cheader_filename="")]
public struct CEnc {
    [CCode (cname="", cheader_filename="")]
    public LibAVUtil.AESCTRContext aes_ctr;

    /***********************************************************
    @brief Either 0, 8, or 16.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public uint per_sample_iv_size;

    [CCode (cname="", cheader_filename="")]
    public LibAVUtil.EncryptionInfo default_encrypted_sample;

    [CCode (cname="", cheader_filename="")]
    public MOVEncryptionIndex encryption_index;
}

[CCode (cname="struct MOVContext", cheader_filename="")]
public struct MOVContext {
    /***********************************************************
    @brief Class for private options
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public LibAVUtil.Class class;

    [CCode (cname="", cheader_filename="")]
    public AVFormatContext fc;

    [CCode (cname="", cheader_filename="")]
    public int time_scale;

    /***********************************************************
    @brief Duration of the longest track
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int64 duration;

    /***********************************************************
    'moov' atom has been found
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int found_moov;

    /***********************************************************
    'mdat' atom has been found
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int found_mdat;

    /***********************************************************
    'hdlr' atom with type 'mdta' has been found
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int found_hdlr_mdta;

    /***********************************************************
    @brief Index of the current 'trak'
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int trak_index;

    [CCode (cname="", cheader_filename="")]
    public string[] meta_keys;

    [CCode (cname="", cheader_filename="")]
    public uint meta_keys_count;

    [CCode (cname="", cheader_filename="")]
    public DVDemuxContext dv_demux;

    [CCode (cname="", cheader_filename="")]
    public AVFormatContext dv_fctx;

    /***********************************************************
    1 if file is ISO Media (mp4/3gp)
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int isom;

    /***********************************************************
    @brief Current fragment in moof atom
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public MOVFragment fragment;

    [CCode (cname="", cheader_filename="")]
    public MOVTrackExt trex_data;

    [CCode (cname="", cheader_filename="")]
    public uint trex_count;

    /***********************************************************
    @brief Metadata are itunes style
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int itunes_metadata;

    [CCode (cname="", cheader_filename="")]
    public int handbrake_version;

    [CCode (cname="", cheader_filename="")]
    public int[] chapter_tracks;

    [CCode (cname="", cheader_filename="")]
    public uint nb_chapter_tracks;

    [CCode (cname="", cheader_filename="")]
    public int use_absolute_path;

    [CCode (cname="", cheader_filename="")]
    public int ignore_editlist;

    [CCode (cname="", cheader_filename="")]
    public int advanced_editlist;

    [CCode (cname="", cheader_filename="")]
    public int ignore_chapters;

    [CCode (cname="", cheader_filename="")]
    public int seek_individually;

    /***********************************************************
    @brief Offset of the next root atom
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int64 next_root_atom;

    [CCode (cname="", cheader_filename="")]
    public int export_all;

    [CCode (cname="", cheader_filename="")]
    public int export_xmp;

    /***********************************************************
    @brief Bitrates read before streams creation
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int[] bitrates;

    [CCode (cname="", cheader_filename="")]
    public int bitrates_count;

    [CCode (cname="", cheader_filename="")]
    public int moov_retry;

    [CCode (cname="", cheader_filename="")]
    public int use_mfra_for;

    [CCode (cname="", cheader_filename="")]
    public int has_looked_for_mfra;

    [CCode (cname="", cheader_filename="")]
    public MOVFragmentIndex frag_index;

    [CCode (cname="", cheader_filename="")]
    public int atom_depth;

    /***********************************************************
    'aax' file has been detected
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public uint aax_mode;

    [CCode (cname="", cheader_filename="")]
    public uint8 file_key[20];

    [CCode (cname="", cheader_filename="")]
    public uint8 file_iv[20];

    [CCode (cname="", cheader_filename="")]
    public void *activation_bytes;

    [CCode (cname="", cheader_filename="")]
    public int activation_bytes_size;

    [CCode (cname="", cheader_filename="")]
    public void *audible_fixed_key;

    [CCode (cname="", cheader_filename="")]
    public int audible_fixed_key_size;

    [CCode (cname="", cheader_filename="")]
    public LibAVUtil.Crypto.AESContext aes_decrypt;

    [CCode (cname="", cheader_filename="")]
    public uint8[] decryption_key;

    [CCode (cname="", cheader_filename="")]
    public int decryption_key_len;

    [CCode (cname="", cheader_filename="")]
    public int enable_drefs;

    /***********************************************************
    @brief Display matrix from mvhd
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int32 movie_display_matrix[3 * 3];
}

[CCode (cname="", cheader_filename="")]
public int ff_mp4_read_descr_len (
    AVIOContext pb
);

[CCode (cname="", cheader_filename="")]
public int ff_mp4_read_descr (
    AVFormatContext fc,
    AVIOContext pb,
    out int tag
);

[CCode (cname="", cheader_filename="")]
public int ff_mp4_read_dec_config_descr (
    AVFormatContext fc,
    AVStream st,
    AVIOContext pb
);

[CCode (cname="", cheader_filename="")]
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


[CCode (cname="", cheader_filename="")]
public bool TAG_IS_AVCI (
    uint32 tag
);
    //  ((tag) == MKTAG ('a', 'i', '5', 'p') ||
    //   (tag) == MKTAG ('a', 'i', '5', 'q') ||
    //   (tag) == MKTAG ('a', 'i', '5', '2') ||
    //   (tag) == MKTAG ('a', 'i', '5', '3') ||
    //   (tag) == MKTAG ('a', 'i', '5', '5') ||
    //   (tag) == MKTAG ('a', 'i', '5', '6') ||
    //   (tag) == MKTAG ('a', 'i', '1', 'p') ||
    //   (tag) == MKTAG ('a', 'i', '1', 'q') ||
    //   (tag) == MKTAG ('a', 'i', '1', '2') ||
    //   (tag) == MKTAG ('a', 'i', '1', '3') ||
    //   (tag) == MKTAG ('a', 'i', '1', '5') ||
    //   (tag) == MKTAG ('a', 'i', '1', '6') ||
    //   (tag) == MKTAG ('a', 'i', 'v', 'x') ||
    //   (tag) == MKTAG ('A', 'V', 'i', 'n'))


[CCode (cname="", cheader_filename="")]
public int ff_mov_read_esds (
    AVFormatContext fc,
    AVIOContext pb
);

[CCode (cname="", cheader_filename="")]
public int ff_mov_read_stsd_entries (
    MOVContext mov_context,
    AVIOContext pb,
    int entries
);

[CCode (cname="", cheader_filename="")]
public void ff_mov_write_chan (
    AVIOContext pb,
    int64 channel_layout
);

[CCode (cname="", cheader_filename="")]
public enum FFMOVFlagMfra {
    FF_MOV_FLAG_MFRA_AUTO,
    FF_MOV_FLAG_MFRA_DTS,
    FF_MOV_FLAG_MFRA_PTS,
}

/***********************************************************
@brief Compute codec id for 'lpcm' tag.
See CoreAudioTypes and AudioStreamBasicDescription at Apple.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public static LibAVCodec.CodecID ff_mov_get_lpcm_codec_id (
    int bps,
    int flags
) {
    /***********************************************************
    @brief Lpcm flags:
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
