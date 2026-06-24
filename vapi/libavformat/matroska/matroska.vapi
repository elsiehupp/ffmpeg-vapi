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
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
public const int EBML_VERSION;

/***********************************************************
@brief Top-level master-IDs
***********************************************************/
[CCode (cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
public enum EBMLID {
    [CCode (cname="EBML_ID_HEADER")]
    HEADER,

    /***********************************************************
    @brief IDs in the HEADER master
    ***********************************************************/

    [CCode (cname="EBML_ID_EBMLVERSION")]
    EBML_VERSION,

    [CCode (cname="EBML_ID_EBMLREADVERSION")]
    EBML_READ_VERSION,

    [CCode (cname="EBML_ID_EBMLMAXIDLENGTH")]
    EBML_MAX_IDLENGTH,

    [CCode (cname="EBML_ID_EBMLMAXSIZELENGTH")]
    EBML_MAX_SIZE_LENGTH,

    [CCode (cname="EBML_ID_DOCTYPE")]
    DOCTYPE,

    [CCode (cname="EBML_ID_DOCTYPEVERSION")]
    DOCTYPE_VERSION,

    [CCode (cname="EBML_ID_DOCTYPEREADVERSION")]
    DOCTYPE_READ_VERSION,

    /***********************************************************
    @brief General EBML types
    ***********************************************************/

    [CCode (cname="EBML_ID_VOID")]
    VOID,

    [CCode (cname="EBML_ID_CRC32")]
    CRC32;
}

/***********************************************************
@brief Matroska element IDs, max. 32 bits
***********************************************************/
[CCode (cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
public enum MatroskaID {
    /***********************************************************
    @brief Toplevel segment
    ***********************************************************/
    [CCode (cname="MATROSKA_ID_SEGMENT")]
    SEGMENT,

    /***********************************************************
    @brief Matroska top-level master IDs
    ***********************************************************/

    [CCode (cname="MATROSKA_ID_INFO")]
    INFO,

    [CCode (cname="MATROSKA_ID_TRACKS")]
    TRACKS,

    [CCode (cname="MATROSKA_ID_CUES")]
    CUES,

    [CCode (cname="MATROSKA_ID_TAGS")]
    TAGS,

    [CCode (cname="MATROSKA_ID_SEEKHEAD")]
    SEEK_HEAD,

    [CCode (cname="MATROSKA_ID_ATTACHMENTS")]
    ATTACHMENTS,

    [CCode (cname="MATROSKA_ID_CLUSTER")]
    CLUSTER,

    [CCode (cname="MATROSKA_ID_CHAPTERS")]
    CHAPTERS,

    /***********************************************************
    @brief IDs in the info master
    ***********************************************************/

    [CCode (cname="MATROSKA_ID_TIMECODESCALE")]
    TIMECODE_SCALE,

    [CCode (cname="MATROSKA_ID_DURATION")]
    DURATION,

    [CCode (cname="MATROSKA_ID_TITLE")]
    TITLE,

    [CCode (cname="MATROSKA_ID_WRITINGAPP")]
    WRITING_APP,

    [CCode (cname="MATROSKA_ID_MUXINGAPP")]
    MUXING_APP,

    [CCode (cname="MATROSKA_ID_DATEUTC")]
    DATE_UTC,

    [CCode (cname="MATROSKA_ID_SEGMENTUID")]
    SEGMENT_UID,

    /***********************************************************
    @brief ID in the tracks master
    ***********************************************************/
    [CCode (cname="MATROSKA_ID_TRACKENTRY")]
    TRACK_ENTRY,

    /***********************************************************
    @brief IDs in the trackentry master
    ***********************************************************/

    [CCode (cname="MATROSKA_ID_TRACKNUMBER")]
    TRACK_NUMBER,

    [CCode (cname="MATROSKA_ID_TRACKUID")]
    TRACKUID,

    [CCode (cname="MATROSKA_ID_TRACKTYPE")]
    TRACK_TYPE,

    [CCode (cname="MATROSKA_ID_TRACKVIDEO")]
    TRACK_VIDEO,

    [CCode (cname="MATROSKA_ID_TRACKAUDIO")]
    TRACK_AUDIO,

    [CCode (cname="MATROSKA_ID_TRACKOPERATION")]
    TRACK_OPERATION,

    [CCode (cname="MATROSKA_ID_TRACKCOMBINEPLANES")]
    TRACK_COMBINE_PLANES,

    [CCode (cname="MATROSKA_ID_TRACKPLANE")]
    TRACK_PLANE,

    [CCode (cname="MATROSKA_ID_TRACKPLANEUID")]
    TRACK_PLANE_UID,

    [CCode (cname="MATROSKA_ID_TRACKPLANETYPE")]
    TRACK_PLANE_TYPE,

    [CCode (cname="MATROSKA_ID_CODECID")]
    CODEC_ID,

    [CCode (cname="MATROSKA_ID_CODECPRIVATE")]
    CODEC_PRIVATE,

    [CCode (cname="MATROSKA_ID_CODECNAME")]
    CODEC_NAME,

    [CCode (cname="MATROSKA_ID_CODECINFOURL")]
    CODEC_INFO_URL,

    [CCode (cname="MATROSKA_ID_CODECDOWNLOADURL")]
    CODEC_DOWNLOAD_URL,

    [CCode (cname="MATROSKA_ID_CODECDECODEALL")]
    CODEC_DECODE_ALL,

    [CCode (cname="MATROSKA_ID_CODECDELAY")]
    CODEC_DELAY,

    [CCode (cname="MATROSKA_ID_SEEKPREROLL")]
    SEEK_PREROLL,

    [CCode (cname="MATROSKA_ID_TRACKNAME")]
    TRACK_NAME,

    [CCode (cname="MATROSKA_ID_TRACKLANGUAGE")]
    TRACK_LANGUAGE,

    [CCode (cname="MATROSKA_ID_TRACKFLAGENABLED")]
    TRACK_FLAG_ENABLED,

    [CCode (cname="MATROSKA_ID_TRACKFLAGDEFAULT")]
    TRACK_FLAG_DEFAULT,

    [CCode (cname="MATROSKA_ID_TRACKFLAGFORCED")]
    TRACK_FLAG_FORCED,

    [CCode (cname="MATROSKA_ID_TRACKFLAGLACING")]
    TRACK_FLAG_LACING,

    [CCode (cname="MATROSKA_ID_TRACKMINCACHE")]
    TRACK_MIN_CACHE,

    [CCode (cname="MATROSKA_ID_TRACKMAXCACHE")]
    TRACK_MAX_CACHE,

    [CCode (cname="MATROSKA_ID_TRACKDEFAULTDURATION")]
    TRACK_DEFAULT_DURATION,

    [CCode (cname="MATROSKA_ID_TRACKCONTENTENCODINGS")]
    TRACK_CONTENT_ENCODINGS,

    [CCode (cname="MATROSKA_ID_TRACKCONTENTENCODING")]
    TRACK_CONTENT_ENCODING,

    [CCode (cname="MATROSKA_ID_TRACKTIMECODESCALE")]
    TRACK_TIME_CODE_SCALE,

    [CCode (cname="MATROSKA_ID_TRACKMAXBLKADDID")]
    TRACK_MAX_BLOCK_ADD_ID,

    /***********************************************************
    @brief IDs in the trackvideo master
    ***********************************************************/

    [CCode (cname="MATROSKA_ID_VIDEOFRAMERATE")]
    VIDEO_FRAMERATE,

    [CCode (cname="MATROSKA_ID_VIDEODISPLAYWIDTH")]
    VIDEO_DISPLAY_WIDTH,

    [CCode (cname="MATROSKA_ID_VIDEODISPLAYHEIGHT")]
    VIDEO_DISPLAY_HEIGHT,

    [CCode (cname="MATROSKA_ID_VIDEOPIXELWIDTH")]
    VIDEO_PIXEL_WIDTH,

    [CCode (cname="MATROSKA_ID_VIDEOPIXELHEIGHT")]
    VIDEO_PIXEL_HEIGHT,

    [CCode (cname="MATROSKA_ID_VIDEOPIXELCROPB")]
    VIDEO_PIXEL_CROP_BOTTOM,

    [CCode (cname="MATROSKA_ID_VIDEOPIXELCROPT")]
    VIDEO_PIXEL_CROP_TOP,

    [CCode (cname="MATROSKA_ID_VIDEOPIXELCROPL")]
    VIDEO_PIXEL_CROP_LEFT,

    [CCode (cname="MATROSKA_ID_VIDEOPIXELCROPR")]
    VIDEO_PIXEL_CROP_RIGHT,

    [CCode (cname="MATROSKA_ID_VIDEODISPLAYUNIT")]
    VIDEO_DISPLAY_UNIT,

    [CCode (cname="MATROSKA_ID_VIDEOFLAGINTERLACED")]
    VIDEO_FLAG_INTERLACED,

    [CCode (cname="MATROSKA_ID_VIDEOFIELDORDER")]
    VIDEO_FIELD_ORDER,

    [CCode (cname="MATROSKA_ID_VIDEOSTEREOMODE")]
    VIDEO_STEREO_MODE,

    [CCode (cname="MATROSKA_ID_VIDEOALPHAMODE")]
    VIDEO_ALPHA_MODE,

    [CCode (cname="MATROSKA_ID_VIDEOASPECTRATIO")]
    VIDEO_ASPECT_RATIO,

    [CCode (cname="MATROSKA_ID_VIDEOCOLORSPACE")]
    VIDEO_COLORSPACE,

    [CCode (cname="MATROSKA_ID_VIDEOCOLOR")]
    VIDEO_COLOR,


    [CCode (cname="MATROSKA_ID_VIDEOCOLORMATRIXCOEFF")]
    VIDEO_COLOR_MATRIX_COEFF,

    [CCode (cname="MATROSKA_ID_VIDEOCOLORBITSPERCHANNEL")]
    VIDEO_COLOR_BITS_PER_CHANNEL,

    [CCode (cname="MATROSKA_ID_VIDEOCOLORCHROMASUBHORZ")]
    VIDEO_COLOR_CHROMA_SUB_HORIZONTAL,

    [CCode (cname="MATROSKA_ID_VIDEOCOLORCHROMASUBVERT")]
    VIDEO_COLOR_CHROMA_SUB_VERTICAL,

    [CCode (cname="MATROSKA_ID_VIDEOCOLORCBSUBHORZ")]
    VIDEO_COLOR_CB_SUB_HORIZONTAL,

    [CCode (cname="MATROSKA_ID_VIDEOCOLORCBSUBVERT")]
    VIDEO_COLOR_CB_SUB_VERTICAL,

    [CCode (cname="MATROSKA_ID_VIDEOCOLORCHROMASITINGHORZ")]
    VIDEO_COLOR_CHROMA_SITING_HORIZONTAL,

    [CCode (cname="MATROSKA_ID_VIDEOCOLORCHROMASITINGVERT")]
    VIDEO_COLOR_CHROMA_SITING_VERTICAL,

    [CCode (cname="MATROSKA_ID_VIDEOCOLORRANGE")]
    VIDEO_COLOR_RANGE,

    [CCode (cname="MATROSKA_ID_VIDEOCOLORTRANSFERCHARACTERISTICS")]
    VIDEO_COLOR_TRANSFER_CHARACTERISTICS,


    [CCode (cname="MATROSKA_ID_VIDEOCOLORPRIMARIES")]
    VIDEO_COLOR_PRIMARIES,

    [CCode (cname="MATROSKA_ID_VIDEOCOLORMAXCLL")]
    VIDEO_COLOR_MAX_CLL,

    [CCode (cname="MATROSKA_ID_VIDEOCOLORMAXFALL")]
    VIDEO_COLOR_MAX_FALL,


    [CCode (cname="MATROSKA_ID_VIDEOCOLORMASTERINGMETA")]
    VIDEO_COLOR_MASTERING_META,

    [CCode (cname="MATROSKA_ID_VIDEOCOLOR_RX")]
    VIDEO_COLOR_RED_X,

    [CCode (cname="MATROSKA_ID_VIDEOCOLOR_RY")]
    VIDEO_COLOR_RED_Y,

    [CCode (cname="MATROSKA_ID_VIDEOCOLOR_GX")]
    VIDEO_COLOR_GREEN_X,

    [CCode (cname="MATROSKA_ID_VIDEOCOLOR_GY")]
    VIDEO_COLOR_GREEN_Y,

    [CCode (cname="MATROSKA_ID_VIDEOCOLOR_BX")]
    VIDEO_COLOR_BLUE_X,

    [CCode (cname="MATROSKA_ID_VIDEOCOLOR_BY")]
    VIDEO_COLOR_BLUE_Y,

    [CCode (cname="MATROSKA_ID_VIDEOCOLOR_WHITEX")]
    VIDEO_COLOR_WHITE_X,

    [CCode (cname="MATROSKA_ID_VIDEOCOLOR_WHITEY")]
    VIDEO_COLOR_WHITE_Y,

    [CCode (cname="MATROSKA_ID_VIDEOCOLOR_LUMINANCEMAX")]
    VIDEO_COLOR_LUMINANCE_MAX,

    [CCode (cname="MATROSKA_ID_VIDEOCOLOR_LUMINANCEMIN")]
    VIDEO_COLOR_LUMINANCE_MIN,


    [CCode (cname="MATROSKA_ID_VIDEOPROJECTION")]
    VIDEO_PROJECTION,

    [CCode (cname="MATROSKA_ID_VIDEOPROJECTIONTYPE")]
    VIDEO_PROJECTION_TYPE,

    [CCode (cname="MATROSKA_ID_VIDEOPROJECTIONPRIVATE")]
    VIDEO_PROJECTION_PRIVATE,

    [CCode (cname="MATROSKA_ID_VIDEOPROJECTIONPOSEYAW")]
    VIDEO_PROJECTION_POSE_YAW,

    [CCode (cname="MATROSKA_ID_VIDEOPROJECTIONPOSEPITCH")]
    VIDEO_PROJECTION_POSE_PITCH,

    [CCode (cname="MATROSKA_ID_VIDEOPROJECTIONPOSEROLL")]
    VIDEO_PROJECTION_POSE_ROLL,

    /***********************************************************
    @brief IDs in the trackaudio master
    ***********************************************************/

    [CCode (cname="MATROSKA_ID_AUDIOSAMPLINGFREQ")]
    AUDIO_SAMPLING_FREQENCY,

    [CCode (cname="MATROSKA_ID_AUDIOOUTSAMPLINGFREQ")]
    AUDIO_OUT_SAMPLING_FREQUENCY,


    [CCode (cname="MATROSKA_ID_AUDIOBITDEPTH")]
    AUDIO_BIT_DEPTH,

    [CCode (cname="MATROSKA_ID_AUDIOCHANNELS")]
    AUDIO_CHANNELS,

    /***********************************************************
    @brief IDs in the content encoding master
    ***********************************************************/

    [CCode (cname="MATROSKA_ID_ENCODINGORDER")]
    ENCODING_ORDER,

    [CCode (cname="MATROSKA_ID_ENCODINGSCOPE")]
    ENCODING_SCOPE,

    [CCode (cname="MATROSKA_ID_ENCODINGTYPE")]
    ENCODING_TYPE,

    [CCode (cname="MATROSKA_ID_ENCODINGCOMPRESSION")]
    ENCODING_COMPRESSION,

    [CCode (cname="MATROSKA_ID_ENCODINGCOMPALGO")]
    ENCODING_COMPRESSION_ALGORITHM,

    [CCode (cname="MATROSKA_ID_ENCODINGCOMPSETTINGS")]
    ENCODING_COMPRESSION_SETTINGS,


    [CCode (cname="MATROSKA_ID_ENCODINGENCRYPTION")]
    ENCODING_ENCRYPTION,

    [CCode (cname="MATROSKA_ID_ENCODINGENCAESSETTINGS")]
    ENCODING_ENCRYPTION_AES_SETTINGS,

    [CCode (cname="MATROSKA_ID_ENCODINGENCALGO")]
    ENCODING_ENCRYPTION_ALGO,

    [CCode (cname="MATROSKA_ID_ENCODINGENCKEYID")]
    ENCODING_ENCRYPTION_KEY_ID,

    [CCode (cname="MATROSKA_ID_ENCODINGSIGALGO")]
    ENCODING_SIGNATURE_ALGORITHM,

    [CCode (cname="MATROSKA_ID_ENCODINGSIGHASHALGO")]
    ENCODING_SIGNATURE_HASH_ALGORITHM,

    [CCode (cname="MATROSKA_ID_ENCODINGSIGKEYID")]
    ENCODING_SIGNATURE_KEY_ID,

    [CCode (cname="MATROSKA_ID_ENCODINGSIGNATURE")]
    ENCODING_SIGNATURE,

    /***********************************************************
    @brief ID in the cues master
    ***********************************************************/
    [CCode (cname="MATROSKA_ID_POINTENTRY")]
    POINT_ENTRY,

    /***********************************************************
    @brief IDs in the pointentry master
    ***********************************************************/

    [CCode (cname="MATROSKA_ID_CUETIME")]
    CUE_TIME,

    [CCode (cname="MATROSKA_ID_CUETRACKPOSITION")]
    CUE_TRACK_POSITION,

    /***********************************************************
    @brief IDs in the cuetrackposition master
    ***********************************************************/

    [CCode (cname="MATROSKA_ID_CUETRACK")]
    CUE_TRACK,

    [CCode (cname="MATROSKA_ID_CUECLUSTERPOSITION")]
    CUE_CLUSTER_POSITION,

    [CCode (cname="MATROSKA_ID_CUERELATIVEPOSITION")]
    CUE_RELATIVE_POSITION,

    [CCode (cname="MATROSKA_ID_CUEDURATION")]
    CUE_DURATION,

    [CCode (cname="MATROSKA_ID_CUEBLOCKNUMBER")]
    CUE_BLOCK_NUMBER,

    /***********************************************************
    @brief IDs in the tags master
    ***********************************************************/

    [CCode (cname="MATROSKA_ID_TAG")]
    TAG,

    [CCode (cname="MATROSKA_ID_SIMPLETAG")]
    SIMPLE_TAG,

    [CCode (cname="MATROSKA_ID_TAGNAME")]
    TAG_NAME,

    [CCode (cname="MATROSKA_ID_TAGSTRING")]
    TAG_STRING,

    [CCode (cname="MATROSKA_ID_TAGLANG")]
    TAG_LANG,

    [CCode (cname="MATROSKA_ID_TAGDEFAULT")]
    TAG_DEFAULT,

    [CCode (cname="MATROSKA_ID_TAGDEFAULT_BUG")]
    TAG_DEFAULT_BUG,

    [CCode (cname="MATROSKA_ID_TAGTARGETS")]
    TAG_TARGETS,

    [CCode (cname="MATROSKA_ID_TAGTARGETS_TYPE")]
    TAG_TARGETS_TYPE,

    [CCode (cname="MATROSKA_ID_TAGTARGETS_TYPEVALUE")]
    TAG_TARGETS_TYPE_VALUE,

    [CCode (cname="MATROSKA_ID_TAGTARGETS_TRACKUID")]
    TAG_TARGETS_TRACK_UID,

    [CCode (cname="MATROSKA_ID_TAGTARGETS_CHAPTERUID")]
    TAG_TARGETS_CHAPTE_RUID,

    [CCode (cname="MATROSKA_ID_TAGTARGETS_ATTACHUID")]
    TAG_TARGETS_ATTACH_UID,

    /***********************************************************
    @brief IDs in the seekhead master
    ***********************************************************/

    [CCode (cname="MATROSKA_ID_SEEKENTRY")]
    SEEK_ENTRY,

    /***********************************************************
    @brief IDs in the seekpoint master
    ***********************************************************/

    [CCode (cname="MATROSKA_ID_SEEKID")]
    SEEK_ID,

    [CCode (cname="MATROSKA_ID_SEEKPOSITION")]
    SEEK_POSITION,

    /***********************************************************
    @brief IDs in the cluster master
    ***********************************************************/

    [CCode (cname="MATROSKA_ID_CLUSTERTIMECODE")]
    CLUSTER_TIME_CODE,

    [CCode (cname="MATROSKA_ID_CLUSTERPOSITION")]
    CLUSTER_POSITION,

    [CCode (cname="MATROSKA_ID_CLUSTERPREVSIZE")]
    CLUSTER_PREVIOUS_SIZE,

    [CCode (cname="MATROSKA_ID_BLOCKGROUP")]
    BLOCK_GROUP,

    [CCode (cname="MATROSKA_ID_BLOCKADDITIONS")]
    BLOCK_ADDITIONS,

    [CCode (cname="MATROSKA_ID_BLOCKMORE")]
    BLOCK_MORE,

    [CCode (cname="MATROSKA_ID_BLOCKADDID")]
    BLOCK_ADD_ID,

    [CCode (cname="MATROSKA_ID_BLOCKADDITIONAL")]
    BLOCK_ADDITIONAL,

    [CCode (cname="MATROSKA_ID_SIMPLEBLOCK")]
    SIMPLE_BLOCK,

    /***********************************************************
    @brief IDs in the blockgroup master
    ***********************************************************/

    [CCode (cname="MATROSKA_ID_BLOCK")]
    BLOCK,

    [CCode (cname="MATROSKA_ID_BLOCKDURATION")]
    BLOCK_DURATION,

    [CCode (cname="MATROSKA_ID_BLOCKREFERENCE")]
    BLOCK_REFERENCE,

    [CCode (cname="MATROSKA_ID_CODECSTATE")]
    CODEC_STATE,

    [CCode (cname="MATROSKA_ID_DISCARDPADDING")]
    DISCARD_PADDING,

    /***********************************************************
    @brief IDs in the attachments master
    ***********************************************************/

    [CCode (cname="MATROSKA_ID_ATTACHEDFILE")]
    ATTACHED_FILE,

    [CCode (cname="MATROSKA_ID_FILEDESC")]
    FILE_DESCRIPTION,

    [CCode (cname="MATROSKA_ID_FILENAME")]
    FILE_NAME,

    [CCode (cname="MATROSKA_ID_FILEMIMETYPE")]
    FILE_MIMETYPE,

    [CCode (cname="MATROSKA_ID_FILEDATA")]
    FILE_DATA,

    [CCode (cname="MATROSKA_ID_FILEUID")]
    FILE_UID,

    /***********************************************************
    @brief IDs in the chapters master
    ***********************************************************/

    [CCode (cname="MATROSKA_ID_EDITIONENTRY")]
    EDITION_ENTRY,

    [CCode (cname="MATROSKA_ID_CHAPTERATOM")]
    CHAPTER_ATOM,

    [CCode (cname="MATROSKA_ID_CHAPTERTIMESTART")]
    CHAPTER_TIME_START,

    [CCode (cname="MATROSKA_ID_CHAPTERTIMEEND")]
    CHAPTER_TIME_END,

    [CCode (cname="MATROSKA_ID_CHAPTERDISPLAY")]
    CHAPTER_DISPLAY,

    [CCode (cname="MATROSKA_ID_CHAPSTRING")]
    CHAPTER_STRING,

    [CCode (cname="MATROSKA_ID_CHAPLANG")]
    CHAPTER_LANGUAGE,

    [CCode (cname="MATROSKA_ID_CHAPCOUNTRY")]
    CHAPTER_COUNTRY,

    [CCode (cname="MATROSKA_ID_EDITIONUID")]
    EDITION_UID,

    [CCode (cname="MATROSKA_ID_EDITIONFLAGHIDDEN")]
    EDITION_FLAG_HIDDEN,

    [CCode (cname="MATROSKA_ID_EDITIONFLAGDEFAULT")]
    EDITION_FLAG_DEFAULT,

    [CCode (cname="MATROSKA_ID_EDITIONFLAGORDERED")]
    EDITION_FLAG_ORDERED,

    [CCode (cname="MATROSKA_ID_CHAPTERUID")]
    CHAPTER_UID,

    [CCode (cname="MATROSKA_ID_CHAPTERFLAGHIDDEN")]
    CHAPTER_FLAG_HIDDEN,

    [CCode (cname="MATROSKA_ID_CHAPTERFLAGENABLED")]
    CHAPTER_FLAG_ENABLED,

    [CCode (cname="MATROSKA_ID_CHAPTERPHYSEQUIV")]
    CHAPTER_PHYS_EQUIV;
}

[CCode (cname="enum MatroskaTrackType",cprefix="MATROSKA_TRACK_TYPE_",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
public enum MatroskaTrackType {
    NONE,
    VIDEO,
    AUDIO,
    COMPLEX,
    LOGO,
    SUBTITLE,
    CONTROL,
    METADATA;
}

[CCode (cname="enum MatroskaTrackEncodingCompAlgo",cprefix="MATROSKA_TRACK_ENCODING_COMP_",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
public enum MatroskaTrackEncodingCompAlgorithm {
    [CCode (cname="")]
    ZLIB,

    [CCode (cname="")]
    BZLIB,

    [CCode (cname="")]
    LZO,

    [CCode (cname="MATROSKA_TRACK_ENCODING_COMP_HEADERSTRIP")]
    HEADER_STRIP;
}

[CCode (cname="enum MatroskaVideoInterlaceFlag",cprefix="MATROSKA_VIDEO_INTERLACE_FLAG_",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
public enum MatroskaVideoInterlaceFlag {
    UNDETERMINED,
    INTERLACED,
    PROGRESSIVE;
}

[CCode (cname="enum MatroskaVideoFieldOrder",cprefix="MATROSKA_VIDEO_FIELDORDER_",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
public enum MatroskaVideoFieldOrder {
    PROGRESSIVE,
    UNDETERMINED,
    TT,
    BB,
    TB,
    BT;
}

[CCode (cname="enum MatroskaVideoStereoModeType",cprefix="MATROSKA_VIDEO_STEREOMODE_TYPE_",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
public enum MatroskaVideoStereoModeType {
    MONO,
    LEFT_RIGHT,
    BOTTOM_TOP,
    TOP_BOTTOM,

    [CCode (cname="MATROSKA_VIDEO_STEREOMODE_TYPE_CHECKERBOARD_RL")]
    CHECKERBOARD_RIGHT_LEFT,

    [CCode (cname="MATROSKA_VIDEO_STEREOMODE_TYPE_CHECKERBOARD_LR")]
    CHECKERBOARD_LEFT_RIGHT,

    [CCode (cname="MATROSKA_VIDEO_STEREOMODE_TYPE_ROW_INTERLEAVED_RL")]
    ROW_INTERLEAVED_RIGHT_LEFT,

    [CCode (cname="MATROSKA_VIDEO_STEREOMODE_TYPE_ROW_INTERLEAVED_LR")]
    ROW_INTERLEAVED_LEFT_RIGHT,

    [CCode (cname="MATROSKA_VIDEO_STEREOMODE_TYPE_COL_INTERLEAVED_RL")]
    COL_INTERLEAVED_RIGHT_LEFT,

    [CCode (cname="MATROSKA_VIDEO_STEREOMODE_TYPE_COL_INTERLEAVED_LR")]
    COL_INTERLEAVED_LEFT_RIGHT,

    ANAGLYPH_CYAN_RED,
    RIGHT_LEFT,
    ANAGLYPH_GREEN_MAG,

    [CCode (cname="MATROSKA_VIDEO_STEREOMODE_TYPE_BOTH_EYES_BLOCK_LR")]
    BOTH_EYES_BLOCK_LEFT_RIGHT,

    [CCode (cname="MATROSKA_VIDEO_STEREOMODE_TYPE_BOTH_EYES_BLOCK_RL")]
    BOTH_EYES_BLOCK_RIGHT_LEFT,

    [CCode (cname="")]
    NB;
}

[CCode (cname="enum MatroskaVideoDisplayUnit",cprefix="MATROSKA_VIDEO_DISPLAYUNIT_",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
public enum MatroskaVideoDisplayUnit {
    [CCode (cname="")]
    PIXELS,

    [CCode (cname="")]
    CENTIMETERS,

    [CCode (cname="")]
    INCHES,

    [CCode (cname="")]
    DAR,

    [CCode (cname="")]
    UNKNOWN;
}

[CCode (cname="enum MatroskaColourChromaSitingHorz",cprefix="MATROSKA_COLOUR_CHROMASITINGHORZ_",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
public enum MatroskaColourChromaSitingHorz {
    [CCode (cname="")]
    UNDETERMINED,

    [CCode (cname="")]
    LEFT,

    [CCode (cname="")]
    HALF,

    [CCode (cname="")]
    NB;
}

[CCode (cname="enum MatroskaColourChromaSitingVert",cprefix="MATROSKA_COLOUR_CHROMASITINGVERT_",header_filename="subprojects/ffmpeg/libformat/matroska.h")]
public enum MatroskaColourChromaSitingVert {
    [CCode (cname="")]
    UNDETERMINED,

    [CCode (cname="")]
    TOP,

    [CCode (cname="")]
    HALF,

    [CCode (cname="")]
    NB;
}

[CCode (cname="enum MatroskaVideoProjectionType",cprefix="MATROSKA_VIDEO_PROJECTION_TYPE_",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
public enum MatroskaVideoProjectionType {
    [CCode (cname="")]
    RECTANGULAR,

    [CCode (cname="")]
    EQUIRECTANGULAR,

    [CCode (cname="")]
    CUBEMAP,

    [CCode (cname="")]
    MESH;
}

/***********************************************************
@brief Matroska Codec IDs, strings
***********************************************************/

[CCode (cname="struct CodecTags",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
[Compact]
public class CodecTags {
    [CCode (cname="")]
    public char str[22];

    [CCode (cname="")]
    public LibAVCodec.CodecID id;
}

/***********************************************************
@brief Max. depth in the EBML tree structure
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
public const int EBML_MAX_DEPTH;

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
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
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
public const string INITIALIZATION_RANGE; // "webm_dash_manifest_initialization_range"

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
public const string CUES_START; // "webm_dash_manifest_cues_start"

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
public const string CUES_END; // "webm_dash_manifest_cues_end"

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
public const string FILENAME; // "webm_dash_manifest_file_name"

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
public const string BANDWIDTH; // "webm_dash_manifest_bandwidth"

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
public const string DURATION; // "webm_dash_manifest_duration"

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
public const string CLUSTER_KEYFRAME; // "webm_dash_manifest_cluster_keyframe"

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
public const string CUE_TIMESTAMPS; // "webm_dash_manifest_cue_timestamps"

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
public const string TRACK_NUMBER; // "webm_dash_manifest_track_number"

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
public const string CODEC_PRIVATE_SIZE; // "webm_dash_manifest_codec_priv_size"

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
public int ff_mkv_stereo3d_conv (
    AVStream st,
    MatroskaVideoStereoModeType stereo_mode
);

} // namespace LibAVFormat
