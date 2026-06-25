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

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/isom.h")]
public int ff_mov_iso639_to_lang (
    char lang[4],
    int mp4
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/isom.h")]
public int ff_mov_lang_to_iso639 (
    uint code,
    char to[4]
);

/***********************************************************
@brief The QuickTime file format is quite convoluted...
it has lots of index tables, each indexing something in another one...
Here we just use what is needed to read the chunks
***********************************************************/

[CCode (cname="struct MOVStts",cheader_filename="subprojects/ffmpeg/libformat/isom.h")]
[Compact]
public class MOVStts {
    [CCode (cname="")]
    public uint count;

    [CCode (cname="")]
    public int duration;
}

[CCode (cname="struct MOVStsc",cheader_filename="subprojects/ffmpeg/libformat/isom.h")]
[Compact]
public class MOVStsc {
    [CCode (cname="")]
    public int first;

    [CCode (cname="")]
    public int count;

    [CCode (cname="")]
    public int id;
}

[CCode (cname="struct MOVElst",cheader_filename="subprojects/ffmpeg/libformat/isom.h")]
[Compact]
public class MOVElst {
    [CCode (cname="")]
    public int64 duration;

    [CCode (cname="")]
    public int64 time;

    [CCode (cname="")]
    public float rate;
}

[CCode (cname="struct MOVDref",cheader_filename="subprojects/ffmpeg/libformat/isom.h")]
[Compact]
public class MOVDref {
    [CCode (cname="")]
    public uint32 type;

    [CCode (cname="")]
    public string path;

    [CCode (cname="")]
    public string dir;

    [CCode (cname="")]
    public string volume; //[28];

    [CCode (cname="")]
    public string filename; //[64];

    [CCode (cname="")]
    public int16 nlvl_to;

    [CCode (cname="")]
    public int16 nlvl_from;
}

[CCode (cname="struct MOVAtom",cheader_filename="subprojects/ffmpeg/libformat/isom.h")]
[Compact]
public class MOVAtom {
    [CCode (cname="")]
    public uint32 type;

    /***********************************************************
    @brief Total size (excluding the size and type fields)
    ***********************************************************/
    [CCode (cname="")]
    public int64 size;
}

[CCode (cname="struct MOVParseTableEntry",cheader_filename="subprojects/ffmpeg/libformat/isom.h")]
[Compact]
public class MOVParseTableEntry { }

[CCode (cname="struct MOVFragment",cheader_filename="subprojects/ffmpeg/libformat/isom.h")]
[Compact]
public class MOVFragment {
    [CCode (cname="")]
    public int found_tfhd;

    [CCode (cname="")]
    public uint track_id;

    [CCode (cname="")]
    public uint64 base_data_offset;

    [CCode (cname="")]
    public uint64 moof_offset;

    [CCode (cname="")]
    public uint64 implicit_offset;

    [CCode (cname="")]
    public uint stsd_id;

    [CCode (cname="")]
    public uint duration;

    [CCode (cname="")]
    public uint size;

    [CCode (cname="")]
    public uint flags;
}

[CCode (cname="struct MOVTrackExt",cheader_filename="subprojects/ffmpeg/libformat/isom.h")]
[Compact]
public class MOVTrackExt {
    [CCode (cname="")]
    public uint track_id;

    [CCode (cname="")]
    public uint stsd_id;

    [CCode (cname="")]
    public uint duration;

    [CCode (cname="")]
    public uint size;

    [CCode (cname="")]
    public uint flags;
}

[CCode (cname="struct MOVSbgp",cheader_filename="subprojects/ffmpeg/libformat/isom.h")]
[Compact]
public class MOVSbgp {
    [CCode (cname="")]
    public uint count;

    [CCode (cname="")]
    public uint index;
}

[CCode (cname="struct MOVEncryptionIndex",cheader_filename="subprojects/ffmpeg/libformat/isom.h")]
[Compact]
public class MOVEncryptionIndex {
    /***********************************************************
    @brief Individual encrypted samples. If there are no elements,
    then the default settings will be used.
    ***********************************************************/
    [CCode (cname="")]
    public LibAVUtil.EncryptionInfo[] encrypted_samples;

    [CCode (cname="")]
    public uint nb_encrypted_samples;

    [CCode (cname="")]
    public uint8[] auxiliary_info_sizes;

    [CCode (cname="")]
    public size_t auxiliary_info_sample_count;

    [CCode (cname="")]
    public uint8 auxiliary_info_default_size;

    /***********************************************************
    @brief Absolute seek position
    ***********************************************************/
    [CCode (cname="")]
    public uint64[] auxiliary_offsets;

    [CCode (cname="")]
    public size_t auxiliary_offsets_count;
}

[CCode (cname="struct MOVFragmentStreamInfo",cheader_filename="subprojects/ffmpeg/libformat/isom.h")]
[Compact]
public class MOVFragmentStreamInfo {
    [CCode (cname="")]
    public int id;

    [CCode (cname="")]
    public int64 sidx_pts;

    [CCode (cname="")]
    public int64 first_tfra_pts;

    [CCode (cname="")]
    public int64 tfdt_dts;

    [CCode (cname="")]
    public int index_entry;

    [CCode (cname="")]
    public MOVEncryptionIndex encryption_index;
}

[CCode (cname="struct MOVFragmentIndexItem",cheader_filename="subprojects/ffmpeg/libformat/isom.h")]
[Compact]
public class MOVFragmentIndexItem {
    [CCode (cname="")]
    public int64 moof_offset;

    [CCode (cname="")]
    public int headers_read;

    [CCode (cname="")]
    public int current;

    [CCode (cname="")]
    public int nb_stream_info;

    [CCode (cname="")]
    public MOVFragmentStreamInfo stream_info;
}

[CCode (cname="struct MOVFragmentIndex",cheader_filename="subprojects/ffmpeg/libformat/isom.h")]
[Compact]
public class MOVFragmentIndex {
    [CCode (cname="")]
    public int allocated_size;

    [CCode (cname="")]
    public int complete;

    [CCode (cname="")]
    public int current;

    [CCode (cname="")]
    public int nb_items;

    [CCode (cname="")]
    public MOVFragmentIndexItem item;
}

[CCode (cname="struct MOVIndexRange",cheader_filename="subprojects/ffmpeg/libformat/isom.h")]
[Compact]
public class MOVIndexRange {
    [CCode (cname="")]
    public int64 start;

    [CCode (cname="")]
    public int64 end;
}

[CCode (cname="struct MOVStreamContext",cheader_filename="subprojects/ffmpeg/libformat/isom.h")]
[Compact]
public class MOVStreamContext {
    [CCode (cname="")]
    public AVIOContext pb;

    [CCode (cname="")]
    public int pb_is_copied;

    /***********************************************************
    @brief LibAVFormat.Stream index
    ***********************************************************/
    [CCode (cname="")]
    public int ffindex;

    [CCode (cname="")]
    public int next_chunk;

    [CCode (cname="")]
    public uint chunk_count;

    [CCode (cname="")]
    public int64[] chunk_offsets;

    [CCode (cname="")]
    public uint stts_count;

    [CCode (cname="")]
    public MOVStts stts_data;

    [CCode (cname="")]
    public uint ctts_count;

    [CCode (cname="")]
    public uint ctts_allocated_size;

    [CCode (cname="")]
    public MOVStts ctts_data;

    [CCode (cname="")]
    public uint stsc_count;

    [CCode (cname="")]
    public MOVStsc stsc_data;

    [CCode (cname="")]
    public uint stsc_index;

    [CCode (cname="")]
    public int stsc_sample;

    [CCode (cname="")]
    public uint stps_count;

    /***********************************************************
    @brief Partial sync sample for mpeg-2 open gop
    ***********************************************************/
    [CCode (cname="")]
    public uint[] stps_data;

    [CCode (cname="")]
    public MOVElst elst_data;

    [CCode (cname="")]
    public uint elst_count;

    [CCode (cname="")]
    public int ctts_index;

    [CCode (cname="")]
    public int ctts_sample;

    /***********************************************************
    @brief May contain value calculated from stsd or value from stsz atom
    ***********************************************************/
    [CCode (cname="")]
    public uint sample_size;

    /***********************************************************
    @brief Always contains sample size from stsz atom
    ***********************************************************/
    [CCode (cname="")]
    public uint stsz_sample_size;

    [CCode (cname="")]
    public uint sample_count;

    [CCode (cname="")]
    public int[] sample_sizes;

    [CCode (cname="")]
    public int keyframe_absent;

    [CCode (cname="")]
    public uint keyframe_count;

    [CCode (cname="")]
    public int[] keyframes;

    [CCode (cname="")]
    public int time_scale;

    /***********************************************************
    @brief Time offset of the edit list entries
    ***********************************************************/
    [CCode (cname="")]
    public int64 time_offset;

    /***********************************************************
    @brief Minimum Composition time shown by the edits excluding empty edits.
    ***********************************************************/
    [CCode (cname="")]
    public int64 min_corrected_pts;

    [CCode (cname="")]
    public int current_sample;

    [CCode (cname="")]
    public int64 current_index;

    [CCode (cname="")]
    public MOVIndexRange index_ranges;

    [CCode (cname="")]
    public MOVIndexRange current_index_range;

    [CCode (cname="")]
    public uint bytes_per_frame;

    [CCode (cname="")]
    public uint samples_per_frame;

    [CCode (cname="")]
    public int dv_audio_container;

    /***********************************************************
    -1 means demux all ids
    ***********************************************************/
    [CCode (cname="")]
    public int pseudo_stream_id;

    /***********************************************************
    @brief Stsd audio compression id
    ***********************************************************/
    [CCode (cname="")]
    public int16 audio_cid;

    [CCode (cname="")]
    public uint drefs_count;

    [CCode (cname="")]
    public MOVDref drefs;

    [CCode (cname="")]
    public int dref_id;

    [CCode (cname="")]
    public int timecode_track;

    /***********************************************************
    @brief Tkhd width
    ***********************************************************/
    [CCode (cname="")]
    public int width;

    /***********************************************************
    @brief Tkhd height
    ***********************************************************/
    [CCode (cname="")]
    public int height;

    /***********************************************************
    @brief Dts shift when ctts is negative
    ***********************************************************/
    [CCode (cname="")]
    public int dts_shift;

    [CCode (cname="")]
    public uint32 palette[256];

    [CCode (cname="")]
    public int has_palette;

    [CCode (cname="")]
    public int64 data_size;

    /***********************************************************
    @brief Tmcd track flags
    ***********************************************************/
    [CCode (cname="")]
    public uint32 tmcd_flags;

    /***********************************************************
    used for dts generation in fragmented movie files
    ***********************************************************/
    [CCode (cname="")]
    public int64 track_end;

    /***********************************************************
    @brief Amount of samples to skip due to enc-dec delay
    ***********************************************************/
    [CCode (cname="")]
    public int start_pad;

    [CCode (cname="")]
    public uint rap_group_count;

    [CCode (cname="")]
    public MOVSbgp rap_group;

    [CCode (cname="")]
    public int nb_frames_for_fps;

    [CCode (cname="")]
    public int64 duration_for_fps;

    /***********************************************************
    @brief Extradata array (and size) for multiple stsd
    ***********************************************************/
    [CCode (cname="")]
    public uint8[][] extradata;

    [CCode (cname="")]
    public int[] extradata_size;

    [CCode (cname="")]
    public int last_stsd_index;

    [CCode (cname="")]
    public int stsd_count;

    [CCode (cname="")]
    public int stsd_version;

    [CCode (cname="")]
    public int32[] display_matrix;

    [CCode (cname="")]
    public LibAVUtil.Stereo3D stereo3d;

    [CCode (cname="")]
    public LibAVUtil.SphericalMapping spherical;

    [CCode (cname="")]
    public size_t spherical_size;

    [CCode (cname="")]
    public LibAVUtil.MasteringDisplayMetadata mastering;

    [CCode (cname="")]
    public LibAVUtil.ContentLightMetadata coll;

    [CCode (cname="")]
    public size_t coll_size;

    [CCode (cname="")]
    public uint32 format;

    /***********************************************************
    @brief If there is an sidx entry for this stream.
    ***********************************************************/
    [CCode (cname="")]
    public int has_sidx;

    [CCode (cname="")]
    public CEnc cenc;
}

[CCode (cname="struct CEnc",cheader_filename="subprojects/ffmpeg/libformat/isom.h")]
[Compact]
public class CEnc {
    [CCode (cname="")]
    public LibAVUtil.AESCTRContext aes_ctr;

    /***********************************************************
    @brief Either 0, 8, or 16.
    ***********************************************************/
    [CCode (cname="")]
    public uint per_sample_iv_size;

    [CCode (cname="")]
    public LibAVUtil.EncryptionInfo default_encrypted_sample;

    [CCode (cname="")]
    public MOVEncryptionIndex encryption_index;
}

[CCode (cname="struct MOVContext",cheader_filename="subprojects/ffmpeg/libformat/isom.h")]
[Compact]
public class MOVContext {
    /***********************************************************
    @brief Class for private options
    ***********************************************************/
    [CCode (cname="")]
    public LibAVUtil.Class class;

    [CCode (cname="")]
    public LibAVFormat.FormatContext fc;

    [CCode (cname="")]
    public int time_scale;

    /***********************************************************
    @brief Duration of the longest track
    ***********************************************************/
    [CCode (cname="")]
    public int64 duration;

    /***********************************************************
    'moov' atom has been found
    ***********************************************************/
    [CCode (cname="")]
    public int found_moov;

    /***********************************************************
    'mdat' atom has been found
    ***********************************************************/
    [CCode (cname="")]
    public int found_mdat;

    /***********************************************************
    'hdlr' atom with type 'mdta' has been found
    ***********************************************************/
    [CCode (cname="")]
    public int found_hdlr_mdta;

    /***********************************************************
    @brief Index of the current 'trak'
    ***********************************************************/
    [CCode (cname="")]
    public int trak_index;

    [CCode (cname="")]
    public string[] meta_keys;

    [CCode (cname="")]
    public uint meta_keys_count;

    [CCode (cname="")]
    public DVDemuxContext dv_demux;

    [CCode (cname="")]
    public LibAVFormat.FormatContext dv_fctx;

    /***********************************************************
    1 if file is ISO Media (mp4/3gp)
    ***********************************************************/
    [CCode (cname="")]
    public int isom;

    /***********************************************************
    @brief Current fragment in moof atom
    ***********************************************************/
    [CCode (cname="")]
    public MOVFragment fragment;

    [CCode (cname="")]
    public MOVTrackExt trex_data;

    [CCode (cname="")]
    public uint trex_count;

    /***********************************************************
    @brief Metadata are itunes style
    ***********************************************************/
    [CCode (cname="")]
    public int itunes_metadata;

    [CCode (cname="")]
    public int handbrake_version;

    [CCode (cname="")]
    public int[] chapter_tracks;

    [CCode (cname="")]
    public uint nb_chapter_tracks;

    [CCode (cname="")]
    public int use_absolute_path;

    [CCode (cname="")]
    public int ignore_editlist;

    [CCode (cname="")]
    public int advanced_editlist;

    [CCode (cname="")]
    public int ignore_chapters;

    [CCode (cname="")]
    public int seek_individually;

    /***********************************************************
    @brief Offset of the next root atom
    ***********************************************************/
    [CCode (cname="")]
    public int64 next_root_atom;

    [CCode (cname="")]
    public int export_all;

    [CCode (cname="")]
    public int export_xmp;

    /***********************************************************
    @brief Bitrates read before streams creation
    ***********************************************************/
    [CCode (cname="")]
    public int[] bitrates;

    [CCode (cname="")]
    public int bitrates_count;

    [CCode (cname="")]
    public int moov_retry;

    [CCode (cname="")]
    public int use_mfra_for;

    [CCode (cname="")]
    public int has_looked_for_mfra;

    [CCode (cname="")]
    public MOVFragmentIndex frag_index;

    [CCode (cname="")]
    public int atom_depth;

    /***********************************************************
    'aax' file has been detected
    ***********************************************************/
    [CCode (cname="")]
    public uint aax_mode;

    [CCode (cname="")]
    public uint8 file_key[20];

    [CCode (cname="")]
    public uint8 file_iv[20];

    [CCode (cname="")]
    public void *activation_bytes;

    [CCode (cname="")]
    public int activation_bytes_size;

    [CCode (cname="")]
    public void *audible_fixed_key;

    [CCode (cname="")]
    public int audible_fixed_key_size;

    [CCode (cname="")]
    public LibAVUtil.Crypto.AESContext aes_decrypt;

    [CCode (cname="")]
    public uint8[] decryption_key;

    [CCode (cname="")]
    public int decryption_key_len;

    [CCode (cname="")]
    public int enable_drefs;

    /***********************************************************
    @brief Display matrix from mvhd
    ***********************************************************/
    [CCode (cname="")]
    public int32 movie_display_matrix[3 * 3];
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/isom.h")]
public int ff_mp4_read_descr_len (
    AVIOContext pb
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/isom.h")]
public int ff_mp4_read_descr (
    LibAVFormat.FormatContext fc,
    AVIOContext pb,
    out int tag
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/isom.h")]
public int ff_mp4_read_dec_config_descr (
    LibAVFormat.FormatContext fc,
    LibAVFormat.Stream st,
    AVIOContext pb
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/isom.h")]
public void ff_mp4_parse_es_descr (
    AVIOContext pb,
    out int es_id
);

[Flags]
[CCode (cheader_filename="subprojects/ffmpeg/libformat/isom.h")]
public enum MP4TagFlags {
    [CCode (cname="MP4ODescrTag")]
    O_DESCR,

    [CCode (cname="MP4IODescrTag")]
    IO_DESCR,

    [CCode (cname="MP4ESDescrTag")]
    ES_DESCR,

    [CCode (cname="MP4DecConfigDescrTag")]
    DEC_CONFIG_DESCR,

    [CCode (cname="MP4DecSpecificDescrTag")]
    DEC_SPECIFIC_DESCR,

    [CCode (cname="MP4SLDescrTag")]
    SL_DESCR;
}

[Flags]
[CCode (cheader_filename="subprojects/ffmpeg/libformat/isom.h")]
public enum MOVTFHDFlags {
    [CCode (cname="MOV_TFHD_BASE_DATA_OFFSET")]
    BASE_DATA_OFFSET,

    [CCode (cname="MOV_TFHD_STSD_ID")]
    STSD_ID,

    [CCode (cname="MOV_TFHD_DEFAULT_DURATION")]
    DEFAULT_DURATION,

    [CCode (cname="MOV_TFHD_DEFAULT_SIZE")]
    DEFAULT_SIZE,

    [CCode (cname="MOV_TFHD_DEFAULT_FLAGS")]
    DEFAULT_FLAGS,

    [CCode (cname="MOV_TFHD_DURATION_IS_EMPTY")]
    DURATION_IS_EMPTY,

    [CCode (cname="MOV_TFHD_DEFAULT_BASE_IS_MOOF")]
    DEFAULT_BASE_IS_MOOF;
}

[Flags]
[CCode (cheader_filename="subprojects/ffmpeg/libformat/isom.h")]
public enum MOVTruncationFlags {
    [CCode (cname="MOV_TRUN_DATA_OFFSET")]
    DATA_OFFSET,

    [CCode (cname="MOV_TRUN_FIRST_SAMPLE_FLAGS")]
    FIRST_SAMPLE_FLAGS,

    [CCode (cname="MOV_TRUN_SAMPLE_DURATION")]
    SAMPLE_DURATION,

    [CCode (cname="MOV_TRUN_SAMPLE_SIZE")]
    SAMPLE_SIZE,

    [CCode (cname="MOV_TRUN_SAMPLE_FLAGS")]
    SAMPLE_FLAGS,

    [CCode (cname="MOV_TRUN_SAMPLE_CTS")]
    SAMPLE_CTS;
}

[Flags]
[CCode (cheader_filename="subprojects/ffmpeg/libformat/isom.h")]
public enum MOVFragmentSampleFlags {
    [CCode (cname="MOV_FRAG_SAMPLE_FLAG_DEGRADATION_PRIORITY_MASK")]
    DEGRADATION_PRIORITY_MASK,

    [CCode (cname="MOV_FRAG_SAMPLE_FLAG_IS_NON_SYNC")]
    IS_NON_SYNC,

    [CCode (cname="MOV_FRAG_SAMPLE_FLAG_PADDING_MASK")]
    PADDING_MASK,

    [CCode (cname="MOV_FRAG_SAMPLE_FLAG_REDUNDANCY_MASK")]
    REDUNDANCY_MASK,

    [CCode (cname="MOV_FRAG_SAMPLE_FLAG_DEPENDED_MASK")]
    DEPENDED_MASK,

    [CCode (cname="MOV_FRAG_SAMPLE_FLAG_DEPENDS_MASK")]
    DEPENDS_MASK,

    [CCode (cname="MOV_FRAG_SAMPLE_FLAG_DEPENDS_NO")]
    DEPENDS_NO,

    [CCode (cname="MOV_FRAG_SAMPLE_FLAG_DEPENDS_YES")]
    DEPENDS_YES;
}

[Flags]
[CCode (cheader_filename="subprojects/ffmpeg/libformat/isom.h")]
public enum MOVTKHDFlags {
    [CCode (cname="MOV_TKHD_FLAG_ENABLED")]
    ENABLED,

    [CCode (cname="MOV_TKHD_FLAG_IN_MOVIE")]
    IN_MOVIE,

    [CCode (cname="MOV_TKHD_FLAG_IN_PREVIEW")]
    IN_PREVIEW,

    [CCode (cname="MOV_TKHD_FLAG_IN_POSTER")]
    IN_POSTER;
}

[Flags]
[CCode (cheader_filename="subprojects/ffmpeg/libformat/isom.h")]
public enum MOVSampleDependencyFlags {
    [CCode (cname="MOV_SAMPLE_DEPENDENCY_UNKNOWN")]
    UNKNOWN,

    [CCode (cname="MOV_SAMPLE_DEPENDENCY_YES")]
    YES,

    [CCode (cname="MOV_SAMPLE_DEPENDENCY_NO")]
    NO;
}


[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/isom.h")]
public static bool TAG_IS_AVCI (
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


[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/isom.h")]
public int ff_mov_read_esds (
    LibAVFormat.FormatContext fc,
    AVIOContext pb
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/isom.h")]
public int ff_mov_read_stsd_entries (
    MOVContext mov_context,
    AVIOContext pb,
    int entries
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/isom.h")]
public void ff_mov_write_chan (
    AVIOContext pb,
    int64 channel_layout
);

[CCode (cheader_filename="subprojects/ffmpeg/libformat/isom.h")]
public enum FFMOVFlagMfra {
    [CCode (cname="FF_MOV_FLAG_MFRA_AUTO")]
    AUTO,

    [CCode (cname="FF_MOV_FLAG_MFRA_DTS")]
    DTS,

    [CCode (cname="FF_MOV_FLAG_MFRA_PTS")]
    PTS;
}

/***********************************************************
@brief Compute codec id for 'lpcm' tag.
See CoreAudioTypes and AudioStreamBasicDescription at Apple.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/isom.h")]
public static LibAVCodec.CodecID ff_mov_get_lpcm_codec_id (
    int bps,
    int flags
);
//  {
//      /***********************************************************
//      @brief Lpcm flags:
//      0x1 = float
//      0x2 = big-endian
//      0x4 = signed
//      ***********************************************************/
//      return ff_get_pcm_codec_id (
//          bps,
//          flags & 1,
//          flags & 2,
//          (flags & 4) != 0 ? -1 : 0
//      );
//  }

} // namespace LibAVFormat
