/***********************************************************
@brief Matroska common data
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
@brief If you add a tag here that is not in ff_codec_bmp_tags[]
    or ff_codec_wav_tags[], add it also to additional_audio_tags[]
    or additional_video_tags[] in matroskaenc.c
***********************************************************/
//  const CodecTags ff_mkv_codec_tags[] = {
//      {"A_AAC"            , LibAVCodec.CodecID.AAC},
//      {"A_AC3"            , LibAVCodec.CodecID.AC3},
//      {"A_ALAC"           , LibAVCodec.CodecID.ALAC},
//      {"A_DTS"            , LibAVCodec.CodecID.DTS},
//      {"A_EAC3"           , LibAVCodec.CodecID.EAC3},
//      {"A_FLAC"           , LibAVCodec.CodecID.FLAC},
//      {"A_MLP"            , LibAVCodec.CodecID.MLP},
//      {"A_MPEG/L2"        , LibAVCodec.CodecID.MP2},
//      {"A_MPEG/L1"        , LibAVCodec.CodecID.MP1},
//      {"A_MPEG/L3"        , LibAVCodec.CodecID.MP3},
//      {"A_OPUS"           , LibAVCodec.CodecID.OPUS},
//      {"A_OPUS/EXPERIMENTAL",LibAVCodec.CodecID.OPUS},
//      {"A_PCM/FLOAT/IEEE" , LibAVCodec.CodecID.PCM_F32LE},
//      {"A_PCM/FLOAT/IEEE" , LibAVCodec.CodecID.PCM_F64LE},
//      {"A_PCM/INT/BIG"    , LibAVCodec.CodecID.PCM_S16BE},
//      {"A_PCM/INT/BIG"    , LibAVCodec.CodecID.PCM_S24BE},
//      {"A_PCM/INT/BIG"    , LibAVCodec.CodecID.PCM_S32BE},
//      {"A_PCM/INT/LIT"    , LibAVCodec.CodecID.PCM_S16LE},
//      {"A_PCM/INT/LIT"    , LibAVCodec.CodecID.PCM_S24LE},
//      {"A_PCM/INT/LIT"    , LibAVCodec.CodecID.PCM_S32LE},
//      {"A_PCM/INT/LIT"    , LibAVCodec.CodecID.PCM_U8},
//      {"A_QUICKTIME/QDMC" , LibAVCodec.CodecID.QDMC},
//      {"A_QUICKTIME/QDM2" , LibAVCodec.CodecID.QDM2},
//      {"A_REAL/14_4"      , LibAVCodec.CodecID.RA_144},
//      {"A_REAL/28_8"      , LibAVCodec.CodecID.RA_288},
//      {"A_REAL/ATRC"      , LibAVCodec.CodecID.ATRAC3},
//      {"A_REAL/COOK"      , LibAVCodec.CodecID.COOK},
//      {"A_REAL/SIPR"      , LibAVCodec.CodecID.SIPR},
//      {"A_TRUEHD"         , LibAVCodec.CodecID.TRUEHD},
//      {"A_TTA1"           , LibAVCodec.CodecID.TTA},
//      {"A_VORBIS"         , LibAVCodec.CodecID.VORBIS},
//      {"A_WAVPACK4"       , LibAVCodec.CodecID.WAVPACK},

//      {"D_WEBVTT/SUBTITLES"   , LibAVCodec.CodecID.WEBVTT},
//      {"D_WEBVTT/CAPTIONS"    , LibAVCodec.CodecID.WEBVTT},
//      {"D_WEBVTT/DESCRIPTIONS", LibAVCodec.CodecID.WEBVTT},
//      {"D_WEBVTT/METADATA"    , LibAVCodec.CodecID.WEBVTT},

//      {"S_TEXT/UTF8"      , LibAVCodec.CodecID.SUBRIP},
//      {"S_TEXT/UTF8"      , LibAVCodec.CodecID.TEXT},
//      {"S_TEXT/ASCII"     , LibAVCodec.CodecID.TEXT},
//      {"S_TEXT/ASS"       , LibAVCodec.CodecID.ASS},
//      {"S_TEXT/SSA"       , LibAVCodec.CodecID.ASS},
//      {"S_ASS"            , LibAVCodec.CodecID.ASS},
//      {"S_SSA"            , LibAVCodec.CodecID.ASS},
//      {"S_VOBSUB"         , LibAVCodec.CodecID.DVD_SUBTITLE},
//      {"S_DVBSUB"         , LibAVCodec.CodecID.DVB_SUBTITLE},
//      {"S_HDMV/PGS"       , LibAVCodec.CodecID.HDMV_PGS_SUBTITLE},
//      {"S_HDMV/TEXTST"    , LibAVCodec.CodecID.HDMV_TEXT_SUBTITLE},

//      {"V_AV1"            , LibAVCodec.CodecID.AV1},
//      {"V_DIRAC"          , LibAVCodec.CodecID.DIRAC},
//      {"V_FFV1"           , LibAVCodec.CodecID.FFV1},
//      {"V_MJPEG"          , LibAVCodec.CodecID.MJPEG},
//      {"V_MPEG1"          , LibAVCodec.CodecID.MPEG1VIDEO},
//      {"V_MPEG2"          , LibAVCodec.CodecID.MPEG2VIDEO},
//      {"V_MPEG4/ISO/ASP"  , LibAVCodec.CodecID.MPEG4},
//      {"V_MPEG4/ISO/AP"   , LibAVCodec.CodecID.MPEG4},
//      {"V_MPEG4/ISO/SP"   , LibAVCodec.CodecID.MPEG4},
//      {"V_MPEG4/ISO/AVC"  , LibAVCodec.CodecID.H264},
//      {"V_MPEGH/ISO/HEVC" , LibAVCodec.CodecID.HEVC},
//      {"V_MPEG4/MS/V3"    , LibAVCodec.CodecID.MSMPEG4V3},
//      {"V_PRORES"         , LibAVCodec.CodecID.PRORES},
//      {"V_REAL/RV10"      , LibAVCodec.CodecID.RV10},
//      {"V_REAL/RV20"      , LibAVCodec.CodecID.RV20},
//      {"V_REAL/RV30"      , LibAVCodec.CodecID.RV30},
//      {"V_REAL/RV40"      , LibAVCodec.CodecID.RV40},
//      {"V_SNOW"           , LibAVCodec.CodecID.SNOW},
//      {"V_THEORA"         , LibAVCodec.CodecID.THEORA},
//      {"V_UNCOMPRESSED"   , LibAVCodec.CodecID.RAWVIDEO},
//      {"V_VP8"            , LibAVCodec.CodecID.VP8},
//      {"V_VP9"            , LibAVCodec.CodecID.VP9},

//      {""                 , LibAVCodec.CodecID.NONE}
//  }

//  const CodecTags ff_webm_codec_tags[] = {
//      {"V_VP8"            , LibAVCodec.CodecID.VP8},
//      {"V_VP9"            , LibAVCodec.CodecID.VP9},
//      {"V_AV1"            , LibAVCodec.CodecID.AV1},

//      {"A_VORBIS"         , LibAVCodec.CodecID.VORBIS},
//      {"A_OPUS"           , LibAVCodec.CodecID.OPUS},

//      {"D_WEBVTT/SUBTITLES"   , LibAVCodec.CodecID.WEBVTT},
//      {"D_WEBVTT/CAPTIONS"    , LibAVCodec.CodecID.WEBVTT},
//      {"D_WEBVTT/DESCRIPTIONS", LibAVCodec.CodecID.WEBVTT},
//      {"D_WEBVTT/METADATA"    , LibAVCodec.CodecID.WEBVTT},

//      {""                 , LibAVCodec.CodecID.NONE}
//  }

//  const CodecMime ff_mkv_image_mime_tags[] = {
//      {"image/gif"                  , LibAVCodec.CodecID.GIF},
//      {"image/jpeg"                 , LibAVCodec.CodecID.MJPEG},
//      {"image/png"                  , LibAVCodec.CodecID.PNG},
//      {"image/tiff"                 , LibAVCodec.CodecID.TIFF},

//      {""                           , LibAVCodec.CodecID.NONE}
//  }

//  const CodecMime ff_mkv_mime_tags[] = {
//      {"text/plain"                 , LibAVCodec.CodecID.TEXT},
//      {"application/x-truetype-font", LibAVCodec.CodecID.TTF},
//      {"application/x-font"         , LibAVCodec.CodecID.TTF},
//      {"application/vnd.ms-opentype", LibAVCodec.CodecID.OTF},
//      {"binary"                     , LibAVCodec.CodecID.BIN_DATA},

//      {""                           , LibAVCodec.CodecID.NONE}
//  }

//  const AVMetadataConv ff_mkv_metadata_conv[] = {
//      { "LEAD_PERFORMER", "performer" },
//      { "PART_NUMBER"   , "track"  },
//      { 0 }
//  }

//  const string const ff_matroska_video_stereo_mode[MATROSKA_VIDEO_STEREOMODE_TYPE_NB] = {
//      "mono",
//      "left_right",
//      "bottom_top",
//      "top_bottom",
//      "checkerboard_rl",
//      "checkerboard_lr",
//      "row_interleaved_rl",
//      "row_interleaved_lr",
//      "col_interleaved_rl",
//      "col_interleaved_lr",
//      "anaglyph_cyan_red",
//      "right_left",
//      "anaglyph_green_magenta",
//      "block_lr",
//      "block_rl",
//  }

//  const string ff_matroska_video_stereo_plane[MATROSKA_VIDEO_STEREO_PLANE_COUNT] = {
//      "left",
//      "right",
//      "background",
//  }

//  public int ff_mkv_stereo3d_conv (
//      AVStream st,
//      MatroskaVideoStereoModeType stereo_mode
//  );
//  {
//      AVStereo3D *stereo;
//      int ret;

//      stereo = av_stereo3d_alloc();
//      if (!stereo)
//          return AVERROR(ENOMEM);

//      // note: the missing breaks are intentional
//      switch (stereo_mode) {
//      case MATROSKA_VIDEO_STEREOMODE_TYPE_MONO:
//          stereo->type = AV_STEREO3D_2D;
//          break;
//      case MATROSKA_VIDEO_STEREOMODE_TYPE_RIGHT_LEFT:
//          stereo->flags |= AV_STEREO3D_FLAG_INVERT;
//      case MATROSKA_VIDEO_STEREOMODE_TYPE_LEFT_RIGHT:
//          stereo->type = AV_STEREO3D_SIDEBYSIDE;
//          break;
//      case MATROSKA_VIDEO_STEREOMODE_TYPE_BOTTOM_TOP:
//          stereo->flags |= AV_STEREO3D_FLAG_INVERT;
//      case MATROSKA_VIDEO_STEREOMODE_TYPE_TOP_BOTTOM:
//          stereo->type = AV_STEREO3D_TOPBOTTOM;
//          break;
//      case MATROSKA_VIDEO_STEREOMODE_TYPE_CHECKERBOARD_RL:
//          stereo->flags |= AV_STEREO3D_FLAG_INVERT;
//      case MATROSKA_VIDEO_STEREOMODE_TYPE_CHECKERBOARD_LR:
//          stereo->type = AV_STEREO3D_CHECKERBOARD;
//          break;
//      case MATROSKA_VIDEO_STEREOMODE_TYPE_ROW_INTERLEAVED_RL:
//          stereo->flags |= AV_STEREO3D_FLAG_INVERT;
//      case MATROSKA_VIDEO_STEREOMODE_TYPE_ROW_INTERLEAVED_LR:
//          stereo->type = AV_STEREO3D_LINES;
//          break;
//      case MATROSKA_VIDEO_STEREOMODE_TYPE_COL_INTERLEAVED_RL:
//          stereo->flags |= AV_STEREO3D_FLAG_INVERT;
//      case MATROSKA_VIDEO_STEREOMODE_TYPE_COL_INTERLEAVED_LR:
//          stereo->type = AV_STEREO3D_COLUMNS;
//          break;
//      case MATROSKA_VIDEO_STEREOMODE_TYPE_BOTH_EYES_BLOCK_RL:
//          stereo->flags |= AV_STEREO3D_FLAG_INVERT;
//      case MATROSKA_VIDEO_STEREOMODE_TYPE_BOTH_EYES_BLOCK_LR:
//          stereo->type = AV_STEREO3D_FRAMESEQUENCE;
//          break;
//      }

//      ret = av_stream_add_side_data(st, AV_PKT_DATA_STEREO3D, (uint8_t *)stereo,
//                                    sizeof(*stereo));
//      if (ret < 0) {
//          av_freep(&stereo);
//          return ret;
//      }

//      return 0;
//  }

} // namespace LibAVFormat
