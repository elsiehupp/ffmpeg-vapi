/***********************************************************
@brief Matroska constants
@copyright 2003-2004 The FFmpeg project
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
@brief EBML version supported
***********************************************************/
[CCode (cname="", cheader_filename="")]
public const int EBML_VERSION;

/***********************************************************
@brief Top-level master-IDs
***********************************************************/
[CCode (cname="", cheader_filename="")]
public enum EBMLID {
    EBML_ID_HEADER,

    /***********************************************************
    @brief IDs in the HEADER master
    ***********************************************************/
    EBML_ID_EBMLVERSION,
    EBML_ID_EBMLREADVERSION,
    EBML_ID_EBMLMAXIDLENGTH,
    EBML_ID_EBMLMAXSIZELENGTH,
    EBML_ID_DOCTYPE,
    EBML_ID_DOCTYPEVERSION,
    EBML_ID_DOCTYPEREADVERSION,

    /***********************************************************
    @brief General EBML types
    ***********************************************************/
    EBML_ID_VOID,
    EBML_ID_CRC32,
}

/***********************************************************
@brief Matroska element IDs, max. 32 bits
***********************************************************/
[CCode (cname="", cheader_filename="")]
public enum MatroskaID {
    /***********************************************************
    @brief Toplevel segment
    ***********************************************************/
    MATROSKA_ID_SEGMENT,

    /***********************************************************
    @brief Matroska top-level master IDs
    ***********************************************************/
    MATROSKA_ID_INFO,
    MATROSKA_ID_TRACKS,
    MATROSKA_ID_CUES,
    MATROSKA_ID_TAGS,
    MATROSKA_ID_SEEKHEAD,
    MATROSKA_ID_ATTACHMENTS,
    MATROSKA_ID_CLUSTER,
    MATROSKA_ID_CHAPTERS,

    /***********************************************************
    @brief IDs in the info master
    ***********************************************************/
    MATROSKA_ID_TIMECODESCALE,
    MATROSKA_ID_DURATION,
    MATROSKA_ID_TITLE,
    MATROSKA_ID_WRITINGAPP,
    MATROSKA_ID_MUXINGAPP,
    MATROSKA_ID_DATEUTC,
    MATROSKA_ID_SEGMENTUID,

    /***********************************************************
    @brief ID in the tracks master
    ***********************************************************/
    MATROSKA_ID_TRACKENTRY,

    /***********************************************************
    @brief IDs in the trackentry master
    ***********************************************************/
    MATROSKA_ID_TRACKNUMBER,
    MATROSKA_ID_TRACKUID,
    MATROSKA_ID_TRACKTYPE,
    MATROSKA_ID_TRACKVIDEO,
    MATROSKA_ID_TRACKAUDIO,
    MATROSKA_ID_TRACKOPERATION,
    MATROSKA_ID_TRACKCOMBINEPLANES,
    MATROSKA_ID_TRACKPLANE,
    MATROSKA_ID_TRACKPLANEUID,
    MATROSKA_ID_TRACKPLANETYPE,
    MATROSKA_ID_CODECID,
    MATROSKA_ID_CODECPRIVATE,
    MATROSKA_ID_CODECNAME,
    MATROSKA_ID_CODECINFOURL,
    MATROSKA_ID_CODECDOWNLOADURL,
    MATROSKA_ID_CODECDECODEALL,
    MATROSKA_ID_CODECDELAY,
    MATROSKA_ID_SEEKPREROLL,
    MATROSKA_ID_TRACKNAME,
    MATROSKA_ID_TRACKLANGUAGE,
    MATROSKA_ID_TRACKFLAGENABLED,
    MATROSKA_ID_TRACKFLAGDEFAULT,
    MATROSKA_ID_TRACKFLAGFORCED,
    MATROSKA_ID_TRACKFLAGLACING,
    MATROSKA_ID_TRACKMINCACHE,
    MATROSKA_ID_TRACKMAXCACHE,
    MATROSKA_ID_TRACKDEFAULTDURATION,
    MATROSKA_ID_TRACKCONTENTENCODINGS,
    MATROSKA_ID_TRACKCONTENTENCODING,
    MATROSKA_ID_TRACKTIMECODESCALE,
    MATROSKA_ID_TRACKMAXBLKADDID,

    /***********************************************************
    @brief IDs in the trackvideo master
    ***********************************************************/
    MATROSKA_ID_VIDEOFRAMERATE,
    MATROSKA_ID_VIDEODISPLAYWIDTH,
    MATROSKA_ID_VIDEODISPLAYHEIGHT,
    MATROSKA_ID_VIDEOPIXELWIDTH,
    MATROSKA_ID_VIDEOPIXELHEIGHT,
    MATROSKA_ID_VIDEOPIXELCROPB,
    MATROSKA_ID_VIDEOPIXELCROPT,
    MATROSKA_ID_VIDEOPIXELCROPL,
    MATROSKA_ID_VIDEOPIXELCROPR,
    MATROSKA_ID_VIDEODISPLAYUNIT,
    MATROSKA_ID_VIDEOFLAGINTERLACED,
    MATROSKA_ID_VIDEOFIELDORDER,
    MATROSKA_ID_VIDEOSTEREOMODE,
    MATROSKA_ID_VIDEOALPHAMODE,
    MATROSKA_ID_VIDEOASPECTRATIO,
    MATROSKA_ID_VIDEOCOLORSPACE,
    MATROSKA_ID_VIDEOCOLOR,

    MATROSKA_ID_VIDEOCOLORMATRIXCOEFF,
    MATROSKA_ID_VIDEOCOLORBITSPERCHANNEL,
    MATROSKA_ID_VIDEOCOLORCHROMASUBHORZ,
    MATROSKA_ID_VIDEOCOLORCHROMASUBVERT,
    MATROSKA_ID_VIDEOCOLORCBSUBHORZ,
    MATROSKA_ID_VIDEOCOLORCBSUBVERT,
    MATROSKA_ID_VIDEOCOLORCHROMASITINGHORZ,
    MATROSKA_ID_VIDEOCOLORCHROMASITINGVERT,
    MATROSKA_ID_VIDEOCOLORRANGE,
    MATROSKA_ID_VIDEOCOLORTRANSFERCHARACTERISTICS,

    MATROSKA_ID_VIDEOCOLORPRIMARIES,
    MATROSKA_ID_VIDEOCOLORMAXCLL,
    MATROSKA_ID_VIDEOCOLORMAXFALL,

    MATROSKA_ID_VIDEOCOLORMASTERINGMETA,
    MATROSKA_ID_VIDEOCOLOR_RX,
    MATROSKA_ID_VIDEOCOLOR_RY,
    MATROSKA_ID_VIDEOCOLOR_GX,
    MATROSKA_ID_VIDEOCOLOR_GY,
    MATROSKA_ID_VIDEOCOLOR_BX,
    MATROSKA_ID_VIDEOCOLOR_BY,
    MATROSKA_ID_VIDEOCOLOR_WHITEX,
    MATROSKA_ID_VIDEOCOLOR_WHITEY,
    MATROSKA_ID_VIDEOCOLOR_LUMINANCEMAX,
    MATROSKA_ID_VIDEOCOLOR_LUMINANCEMIN,

    MATROSKA_ID_VIDEOPROJECTION,
    MATROSKA_ID_VIDEOPROJECTIONTYPE,
    MATROSKA_ID_VIDEOPROJECTIONPRIVATE,
    MATROSKA_ID_VIDEOPROJECTIONPOSEYAW,
    MATROSKA_ID_VIDEOPROJECTIONPOSEPITCH,
    MATROSKA_ID_VIDEOPROJECTIONPOSEROLL,

    /***********************************************************
    @brief IDs in the trackaudio master
    ***********************************************************/
    MATROSKA_ID_AUDIOSAMPLINGFREQ,
    MATROSKA_ID_AUDIOOUTSAMPLINGFREQ,

    MATROSKA_ID_AUDIOBITDEPTH,
    MATROSKA_ID_AUDIOCHANNELS,

    /***********************************************************
    @brief IDs in the content encoding master
    ***********************************************************/
    MATROSKA_ID_ENCODINGORDER,
    MATROSKA_ID_ENCODINGSCOPE,
    MATROSKA_ID_ENCODINGTYPE,
    MATROSKA_ID_ENCODINGCOMPRESSION,
    MATROSKA_ID_ENCODINGCOMPALGO,
    MATROSKA_ID_ENCODINGCOMPSETTINGS,

    MATROSKA_ID_ENCODINGENCRYPTION,
    MATROSKA_ID_ENCODINGENCAESSETTINGS,
    MATROSKA_ID_ENCODINGENCALGO,
    MATROSKA_ID_ENCODINGENCKEYID,
    MATROSKA_ID_ENCODINGSIGALGO,
    MATROSKA_ID_ENCODINGSIGHASHALGO,
    MATROSKA_ID_ENCODINGSIGKEYID,
    MATROSKA_ID_ENCODINGSIGNATURE,

    /***********************************************************
    @brief ID in the cues master
    ***********************************************************/
    MATROSKA_ID_POINTENTRY,

    /***********************************************************
    @brief IDs in the pointentry master
    ***********************************************************/
    MATROSKA_ID_CUETIME,
    MATROSKA_ID_CUETRACKPOSITION,

    /***********************************************************
    @brief IDs in the cuetrackposition master
    ***********************************************************/
    MATROSKA_ID_CUETRACK,
    MATROSKA_ID_CUECLUSTERPOSITION,
    MATROSKA_ID_CUERELATIVEPOSITION,
    MATROSKA_ID_CUEDURATION,
    MATROSKA_ID_CUEBLOCKNUMBER,

    /***********************************************************
    @brief IDs in the tags master
    ***********************************************************/
    MATROSKA_ID_TAG,
    MATROSKA_ID_SIMPLETAG,
    MATROSKA_ID_TAGNAME,
    MATROSKA_ID_TAGSTRING,
    MATROSKA_ID_TAGLANG,
    MATROSKA_ID_TAGDEFAULT,
    MATROSKA_ID_TAGDEFAULT_BUG,
    MATROSKA_ID_TAGTARGETS,
    MATROSKA_ID_TAGTARGETS_TYPE,
    MATROSKA_ID_TAGTARGETS_TYPEVALUE,
    MATROSKA_ID_TAGTARGETS_TRACKUID,
    MATROSKA_ID_TAGTARGETS_CHAPTERUID,
    MATROSKA_ID_TAGTARGETS_ATTACHUID,

    /***********************************************************
    @brief IDs in the seekhead master
    ***********************************************************/
    MATROSKA_ID_SEEKENTRY,

    /***********************************************************
    @brief IDs in the seekpoint master
    ***********************************************************/
    MATROSKA_ID_SEEKID,
    MATROSKA_ID_SEEKPOSITION,

    /***********************************************************
    @brief IDs in the cluster master
    ***********************************************************/
    MATROSKA_ID_CLUSTERTIMECODE,
    MATROSKA_ID_CLUSTERPOSITION,
    MATROSKA_ID_CLUSTERPREVSIZE,
    MATROSKA_ID_BLOCKGROUP,
    MATROSKA_ID_BLOCKADDITIONS,
    MATROSKA_ID_BLOCKMORE,
    MATROSKA_ID_BLOCKADDID,
    MATROSKA_ID_BLOCKADDITIONAL,
    MATROSKA_ID_SIMPLEBLOCK,

    /***********************************************************
    @brief IDs in the blockgroup master
    ***********************************************************/
    MATROSKA_ID_BLOCK,
    MATROSKA_ID_BLOCKDURATION,
    MATROSKA_ID_BLOCKREFERENCE,
    MATROSKA_ID_CODECSTATE,
    MATROSKA_ID_DISCARDPADDING,

    /***********************************************************
    @brief IDs in the attachments master
    ***********************************************************/
    MATROSKA_ID_ATTACHEDFILE,
    MATROSKA_ID_FILEDESC,
    MATROSKA_ID_FILENAME,
    MATROSKA_ID_FILEMIMETYPE,
    MATROSKA_ID_FILEDATA,
    MATROSKA_ID_FILEUID,

    /***********************************************************
    @brief IDs in the chapters master
    ***********************************************************/
    MATROSKA_ID_EDITIONENTRY,
    MATROSKA_ID_CHAPTERATOM,
    MATROSKA_ID_CHAPTERTIMESTART,
    MATROSKA_ID_CHAPTERTIMEEND,
    MATROSKA_ID_CHAPTERDISPLAY,
    MATROSKA_ID_CHAPSTRING,
    MATROSKA_ID_CHAPLANG,
    MATROSKA_ID_CHAPCOUNTRY,
    MATROSKA_ID_EDITIONUID,
    MATROSKA_ID_EDITIONFLAGHIDDEN,
    MATROSKA_ID_EDITIONFLAGDEFAULT,
    MATROSKA_ID_EDITIONFLAGORDERED,
    MATROSKA_ID_CHAPTERUID,
    MATROSKA_ID_CHAPTERFLAGHIDDEN,
    MATROSKA_ID_CHAPTERFLAGENABLED,
    MATROSKA_ID_CHAPTERPHYSEQUIV,
}

[CCode (cname="", cheader_filename="")]
public enum MatroskaTrackType {
    MATROSKA_TRACK_TYPE_NONE,
    MATROSKA_TRACK_TYPE_VIDEO,
    MATROSKA_TRACK_TYPE_AUDIO,
    MATROSKA_TRACK_TYPE_COMPLEX,
    MATROSKA_TRACK_TYPE_LOGO,
    MATROSKA_TRACK_TYPE_SUBTITLE,
    MATROSKA_TRACK_TYPE_CONTROL,
    MATROSKA_TRACK_TYPE_METADATA,
}

[CCode (cname="", cheader_filename="")]
public enum MatroskaTrackEncodingCompAlgo {
    MATROSKA_TRACK_ENCODING_COMP_ZLIB,
    MATROSKA_TRACK_ENCODING_COMP_BZLIB,
    MATROSKA_TRACK_ENCODING_COMP_LZO,
    MATROSKA_TRACK_ENCODING_COMP_HEADERSTRIP,
}

[CCode (cname="", cheader_filename="")]
public enum MatroskaVideoInterlaceFlag {
    MATROSKA_VIDEO_INTERLACE_FLAG_UNDETERMINED,
    MATROSKA_VIDEO_INTERLACE_FLAG_INTERLACED,
    MATROSKA_VIDEO_INTERLACE_FLAG_PROGRESSIVE,
}

[CCode (cname="", cheader_filename="")]
public enum MatroskaVideoFieldOrder {
    MATROSKA_VIDEO_FIELDORDER_PROGRESSIVE,
    MATROSKA_VIDEO_FIELDORDER_UNDETERMINED,
    MATROSKA_VIDEO_FIELDORDER_TT,
    MATROSKA_VIDEO_FIELDORDER_BB,
    MATROSKA_VIDEO_FIELDORDER_TB,
    MATROSKA_VIDEO_FIELDORDER_BT,
}

[CCode (cname="", cheader_filename="")]
public enum MatroskaVideoStereoModeType {
    MATROSKA_VIDEO_STEREOMODE_TYPE_MONO,
    MATROSKA_VIDEO_STEREOMODE_TYPE_LEFT_RIGHT,
    MATROSKA_VIDEO_STEREOMODE_TYPE_BOTTOM_TOP,
    MATROSKA_VIDEO_STEREOMODE_TYPE_TOP_BOTTOM,
    MATROSKA_VIDEO_STEREOMODE_TYPE_CHECKERBOARD_RL,
    MATROSKA_VIDEO_STEREOMODE_TYPE_CHECKERBOARD_LR,
    MATROSKA_VIDEO_STEREOMODE_TYPE_ROW_INTERLEAVED_RL,
    MATROSKA_VIDEO_STEREOMODE_TYPE_ROW_INTERLEAVED_LR,
    MATROSKA_VIDEO_STEREOMODE_TYPE_COL_INTERLEAVED_RL,
    MATROSKA_VIDEO_STEREOMODE_TYPE_COL_INTERLEAVED_LR,
    MATROSKA_VIDEO_STEREOMODE_TYPE_ANAGLYPH_CYAN_RED,
    MATROSKA_VIDEO_STEREOMODE_TYPE_RIGHT_LEFT,
    MATROSKA_VIDEO_STEREOMODE_TYPE_ANAGLYPH_GREEN_MAG,
    MATROSKA_VIDEO_STEREOMODE_TYPE_BOTH_EYES_BLOCK_LR,
    MATROSKA_VIDEO_STEREOMODE_TYPE_BOTH_EYES_BLOCK_RL,
    MATROSKA_VIDEO_STEREOMODE_TYPE_NB,
}

[CCode (cname="", cheader_filename="")]
public enum MatroskaVideoDisplayUnit {
    MATROSKA_VIDEO_DISPLAYUNIT_PIXELS,
    MATROSKA_VIDEO_DISPLAYUNIT_CENTIMETERS,
    MATROSKA_VIDEO_DISPLAYUNIT_INCHES,
    MATROSKA_VIDEO_DISPLAYUNIT_DAR,
    MATROSKA_VIDEO_DISPLAYUNIT_UNKNOWN,
}

[CCode (cname="", cheader_filename="")]
public enum MatroskaColourChromaSitingHorz {
    MATROSKA_COLOUR_CHROMASITINGHORZ_UNDETERMINED,
    MATROSKA_COLOUR_CHROMASITINGHORZ_LEFT,
    MATROSKA_COLOUR_CHROMASITINGHORZ_HALF,
    MATROSKA_COLOUR_CHROMASITINGHORZ_NB,
}

[CCode (cname="", cheader_filename="")]
public enum MatroskaColourChromaSitingVert {
    MATROSKA_COLOUR_CHROMASITINGVERT_UNDETERMINED,
    MATROSKA_COLOUR_CHROMASITINGVERT_TOP,
    MATROSKA_COLOUR_CHROMASITINGVERT_HALF,
    MATROSKA_COLOUR_CHROMASITINGVERT_NB,
}

[CCode (cname="", cheader_filename="")]
public enum MatroskaVideoProjectionType {
    MATROSKA_VIDEO_PROJECTION_TYPE_RECTANGULAR,
    MATROSKA_VIDEO_PROJECTION_TYPE_EQUIRECTANGULAR,
    MATROSKA_VIDEO_PROJECTION_TYPE_CUBEMAP,
    MATROSKA_VIDEO_PROJECTION_TYPE_MESH,
}

/***********************************************************
@brief Matroska Codec IDs, strings
***********************************************************/

[CCode (cname="struct CodecTags", cheader_filename="")]
public struct CodecTags {
    char str[22];
    LibAVCodec.CodecID id;
}

/***********************************************************
@brief Max. depth in the EBML tree structure
***********************************************************/
[CCode (cname="", cheader_filename="")]
public const int EBML_MAX_DEPTH;

[CCode (cname="", cheader_filename="")]
public const int MATROSKA_VIDEO_STEREO_PLANE_COUNT;

//  extern const CodecTags ff_mkv_codec_tags[];
//  extern const CodecTags ff_webm_codec_tags[];
//  extern const CodecMime ff_mkv_mime_tags[];
//  extern const CodecMime ff_mkv_image_mime_tags[];
//  extern const AVMetadataConv ff_mkv_metadata_conv[];
//  extern string const ff_matroska_video_stereo_mode[MATROSKA_VIDEO_STEREOMODE_TYPE_NB];
//  extern string const ff_matroska_video_stereo_plane[MATROSKA_VIDEO_STEREO_PLANE_COUNT];

/***********************************************************
@brief AVStream Metadata tag keys for WebM Dash Manifest
***********************************************************/
[CCode (cname="", cheader_filename="")]
public const string INITIALIZATION_RANGE; // "webm_dash_manifest_initialization_range"
[CCode (cname="", cheader_filename="")]
public const string CUES_START; // "webm_dash_manifest_cues_start"
[CCode (cname="", cheader_filename="")]
public const string CUES_END; // "webm_dash_manifest_cues_end"
[CCode (cname="", cheader_filename="")]
public const string FILENAME; // "webm_dash_manifest_file_name"
[CCode (cname="", cheader_filename="")]
public const string BANDWIDTH; // "webm_dash_manifest_bandwidth"
[CCode (cname="", cheader_filename="")]
public const string DURATION; // "webm_dash_manifest_duration"
[CCode (cname="", cheader_filename="")]
public const string CLUSTER_KEYFRAME; // "webm_dash_manifest_cluster_keyframe"
[CCode (cname="", cheader_filename="")]
public const string CUE_TIMESTAMPS; // "webm_dash_manifest_cue_timestamps"
[CCode (cname="", cheader_filename="")]
public const string TRACK_NUMBER; // "webm_dash_manifest_track_number"
[CCode (cname="", cheader_filename="")]
public const string CODEC_PRIVATE_SIZE; // "webm_dash_manifest_codec_priv_size"

[CCode (cname="", cheader_filename="")]
public int ff_mkv_stereo3d_conv (
    AVStream st,
    MatroskaVideoStereoModeType stereo_mode
);

} // namespace LibAVFormat
