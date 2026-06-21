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
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
public enum EBMLID {
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    EBML_ID_HEADER,

    /***********************************************************
    @brief IDs in the HEADER master
    ***********************************************************/

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    EBML_ID_EBMLVERSION,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    EBML_ID_EBMLREADVERSION,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    EBML_ID_EBMLMAXIDLENGTH,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    EBML_ID_EBMLMAXSIZELENGTH,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    EBML_ID_DOCTYPE,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    EBML_ID_DOCTYPEVERSION,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    EBML_ID_DOCTYPEREADVERSION,

    /***********************************************************
    @brief General EBML types
    ***********************************************************/

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    EBML_ID_VOID,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    EBML_ID_CRC32;
}

/***********************************************************
@brief Matroska element IDs, max. 32 bits
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
public enum MatroskaID {
    /***********************************************************
    @brief Toplevel segment
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_SEGMENT,

    /***********************************************************
    @brief Matroska top-level master IDs
    ***********************************************************/

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_INFO,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_TRACKS,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_CUES,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_TAGS,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_SEEKHEAD,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_ATTACHMENTS,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_CLUSTER,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_CHAPTERS,

    /***********************************************************
    @brief IDs in the info master
    ***********************************************************/

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_TIMECODESCALE,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_DURATION,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_TITLE,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_WRITINGAPP,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_MUXINGAPP,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_DATEUTC,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_SEGMENTUID,

    /***********************************************************
    @brief ID in the tracks master
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_TRACKENTRY,

    /***********************************************************
    @brief IDs in the trackentry master
    ***********************************************************/

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_TRACKNUMBER,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_TRACKUID,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_TRACKTYPE,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_TRACKVIDEO,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_TRACKAUDIO,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_TRACKOPERATION,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_TRACKCOMBINEPLANES,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_TRACKPLANE,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_TRACKPLANEUID,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_TRACKPLANETYPE,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_CODECID,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_CODECPRIVATE,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_CODECNAME,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_CODECINFOURL,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_CODECDOWNLOADURL,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_CODECDECODEALL,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_CODECDELAY,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_SEEKPREROLL,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_TRACKNAME,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_TRACKLANGUAGE,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_TRACKFLAGENABLED,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_TRACKFLAGDEFAULT,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_TRACKFLAGFORCED,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_TRACKFLAGLACING,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_TRACKMINCACHE,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_TRACKMAXCACHE,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_TRACKDEFAULTDURATION,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_TRACKCONTENTENCODINGS,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_TRACKCONTENTENCODING,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_TRACKTIMECODESCALE,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_TRACKMAXBLKADDID,

    /***********************************************************
    @brief IDs in the trackvideo master
    ***********************************************************/

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_VIDEOFRAMERATE,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_VIDEODISPLAYWIDTH,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_VIDEODISPLAYHEIGHT,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_VIDEOPIXELWIDTH,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_VIDEOPIXELHEIGHT,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_VIDEOPIXELCROPB,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_VIDEOPIXELCROPT,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_VIDEOPIXELCROPL,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_VIDEOPIXELCROPR,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_VIDEODISPLAYUNIT,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_VIDEOFLAGINTERLACED,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_VIDEOFIELDORDER,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_VIDEOSTEREOMODE,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_VIDEOALPHAMODE,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_VIDEOASPECTRATIO,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_VIDEOCOLORSPACE,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_VIDEOCOLOR,


    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_VIDEOCOLORMATRIXCOEFF,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_VIDEOCOLORBITSPERCHANNEL,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_VIDEOCOLORCHROMASUBHORZ,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_VIDEOCOLORCHROMASUBVERT,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_VIDEOCOLORCBSUBHORZ,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_VIDEOCOLORCBSUBVERT,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_VIDEOCOLORCHROMASITINGHORZ,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_VIDEOCOLORCHROMASITINGVERT,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_VIDEOCOLORRANGE,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_VIDEOCOLORTRANSFERCHARACTERISTICS,


    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_VIDEOCOLORPRIMARIES,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_VIDEOCOLORMAXCLL,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_VIDEOCOLORMAXFALL,


    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_VIDEOCOLORMASTERINGMETA,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_VIDEOCOLOR_RX,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_VIDEOCOLOR_RY,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_VIDEOCOLOR_GX,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_VIDEOCOLOR_GY,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_VIDEOCOLOR_BX,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_VIDEOCOLOR_BY,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_VIDEOCOLOR_WHITEX,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_VIDEOCOLOR_WHITEY,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_VIDEOCOLOR_LUMINANCEMAX,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_VIDEOCOLOR_LUMINANCEMIN,


    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_VIDEOPROJECTION,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_VIDEOPROJECTIONTYPE,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_VIDEOPROJECTIONPRIVATE,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_VIDEOPROJECTIONPOSEYAW,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_VIDEOPROJECTIONPOSEPITCH,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_VIDEOPROJECTIONPOSEROLL,

    /***********************************************************
    @brief IDs in the trackaudio master
    ***********************************************************/

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_AUDIOSAMPLINGFREQ,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_AUDIOOUTSAMPLINGFREQ,


    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_AUDIOBITDEPTH,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_AUDIOCHANNELS,

    /***********************************************************
    @brief IDs in the content encoding master
    ***********************************************************/

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_ENCODINGORDER,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_ENCODINGSCOPE,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_ENCODINGTYPE,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_ENCODINGCOMPRESSION,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_ENCODINGCOMPALGO,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_ENCODINGCOMPSETTINGS,


    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_ENCODINGENCRYPTION,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_ENCODINGENCAESSETTINGS,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_ENCODINGENCALGO,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_ENCODINGENCKEYID,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_ENCODINGSIGALGO,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_ENCODINGSIGHASHALGO,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_ENCODINGSIGKEYID,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_ENCODINGSIGNATURE,

    /***********************************************************
    @brief ID in the cues master
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_POINTENTRY,

    /***********************************************************
    @brief IDs in the pointentry master
    ***********************************************************/

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_CUETIME,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_CUETRACKPOSITION,

    /***********************************************************
    @brief IDs in the cuetrackposition master
    ***********************************************************/

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_CUETRACK,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_CUECLUSTERPOSITION,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_CUERELATIVEPOSITION,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_CUEDURATION,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_CUEBLOCKNUMBER,

    /***********************************************************
    @brief IDs in the tags master
    ***********************************************************/

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_TAG,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_SIMPLETAG,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_TAGNAME,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_TAGSTRING,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_TAGLANG,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_TAGDEFAULT,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_TAGDEFAULT_BUG,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_TAGTARGETS,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_TAGTARGETS_TYPE,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_TAGTARGETS_TYPEVALUE,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_TAGTARGETS_TRACKUID,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_TAGTARGETS_CHAPTERUID,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_TAGTARGETS_ATTACHUID,

    /***********************************************************
    @brief IDs in the seekhead master
    ***********************************************************/

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_SEEKENTRY,

    /***********************************************************
    @brief IDs in the seekpoint master
    ***********************************************************/

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_SEEKID,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_SEEKPOSITION,

    /***********************************************************
    @brief IDs in the cluster master
    ***********************************************************/

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_CLUSTERTIMECODE,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_CLUSTERPOSITION,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_CLUSTERPREVSIZE,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_BLOCKGROUP,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_BLOCKADDITIONS,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_BLOCKMORE,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_BLOCKADDID,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_BLOCKADDITIONAL,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_SIMPLEBLOCK,

    /***********************************************************
    @brief IDs in the blockgroup master
    ***********************************************************/

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_BLOCK,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_BLOCKDURATION,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_BLOCKREFERENCE,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_CODECSTATE,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_DISCARDPADDING,

    /***********************************************************
    @brief IDs in the attachments master
    ***********************************************************/

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_ATTACHEDFILE,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_FILEDESC,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_FILENAME,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_FILEMIMETYPE,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_FILEDATA,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_FILEUID,

    /***********************************************************
    @brief IDs in the chapters master
    ***********************************************************/

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_EDITIONENTRY,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_CHAPTERATOM,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_CHAPTERTIMESTART,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_CHAPTERTIMEEND,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_CHAPTERDISPLAY,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_CHAPSTRING,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_CHAPLANG,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_CHAPCOUNTRY,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_EDITIONUID,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_EDITIONFLAGHIDDEN,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_EDITIONFLAGDEFAULT,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_EDITIONFLAGORDERED,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_CHAPTERUID,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_CHAPTERFLAGHIDDEN,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_CHAPTERFLAGENABLED,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_ID_CHAPTERPHYSEQUIV;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
public enum MatroskaTrackType {
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_TRACK_TYPE_NONE,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_TRACK_TYPE_VIDEO,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_TRACK_TYPE_AUDIO,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_TRACK_TYPE_COMPLEX,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_TRACK_TYPE_LOGO,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_TRACK_TYPE_SUBTITLE,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_TRACK_TYPE_CONTROL,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_TRACK_TYPE_METADATA;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
public enum MatroskaTrackEncodingCompAlgo {
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_TRACK_ENCODING_COMP_ZLIB,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_TRACK_ENCODING_COMP_BZLIB,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_TRACK_ENCODING_COMP_LZO,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_TRACK_ENCODING_COMP_HEADERSTRIP;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
public enum MatroskaVideoInterlaceFlag {
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_VIDEO_INTERLACE_FLAG_UNDETERMINED,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_VIDEO_INTERLACE_FLAG_INTERLACED,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_VIDEO_INTERLACE_FLAG_PROGRESSIVE;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
public enum MatroskaVideoFieldOrder {
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_VIDEO_FIELDORDER_PROGRESSIVE,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_VIDEO_FIELDORDER_UNDETERMINED,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_VIDEO_FIELDORDER_TT,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_VIDEO_FIELDORDER_BB,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_VIDEO_FIELDORDER_TB,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_VIDEO_FIELDORDER_BT;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
public enum MatroskaVideoStereoModeType {
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_VIDEO_STEREOMODE_TYPE_MONO,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_VIDEO_STEREOMODE_TYPE_LEFT_RIGHT,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_VIDEO_STEREOMODE_TYPE_BOTTOM_TOP,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_VIDEO_STEREOMODE_TYPE_TOP_BOTTOM,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_VIDEO_STEREOMODE_TYPE_CHECKERBOARD_RL,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_VIDEO_STEREOMODE_TYPE_CHECKERBOARD_LR,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_VIDEO_STEREOMODE_TYPE_ROW_INTERLEAVED_RL,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_VIDEO_STEREOMODE_TYPE_ROW_INTERLEAVED_LR,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_VIDEO_STEREOMODE_TYPE_COL_INTERLEAVED_RL,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_VIDEO_STEREOMODE_TYPE_COL_INTERLEAVED_LR,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_VIDEO_STEREOMODE_TYPE_ANAGLYPH_CYAN_RED,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_VIDEO_STEREOMODE_TYPE_RIGHT_LEFT,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_VIDEO_STEREOMODE_TYPE_ANAGLYPH_GREEN_MAG,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_VIDEO_STEREOMODE_TYPE_BOTH_EYES_BLOCK_LR,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_VIDEO_STEREOMODE_TYPE_BOTH_EYES_BLOCK_RL,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_VIDEO_STEREOMODE_TYPE_NB;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
public enum MatroskaVideoDisplayUnit {
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_VIDEO_DISPLAYUNIT_PIXELS,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_VIDEO_DISPLAYUNIT_CENTIMETERS,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_VIDEO_DISPLAYUNIT_INCHES,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_VIDEO_DISPLAYUNIT_DAR,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_VIDEO_DISPLAYUNIT_UNKNOWN;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
public enum MatroskaColourChromaSitingHorz {
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_COLOUR_CHROMASITINGHORZ_UNDETERMINED,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_COLOUR_CHROMASITINGHORZ_LEFT,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_COLOUR_CHROMASITINGHORZ_HALF,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_COLOUR_CHROMASITINGHORZ_NB;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
public enum MatroskaColourChromaSitingVert {
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_COLOUR_CHROMASITINGVERT_UNDETERMINED,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_COLOUR_CHROMASITINGVERT_TOP,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_COLOUR_CHROMASITINGVERT_HALF,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_COLOUR_CHROMASITINGVERT_NB;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
public enum MatroskaVideoProjectionType {
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_VIDEO_PROJECTION_TYPE_RECTANGULAR,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_VIDEO_PROJECTION_TYPE_EQUIRECTANGULAR,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_VIDEO_PROJECTION_TYPE_CUBEMAP,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/matroska.h")]
    MATROSKA_VIDEO_PROJECTION_TYPE_MESH;
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
