/***********************************************************
@brief Flash Compatible Streaming Format common header.
@copyright 2000 Fabrice Bellard
@copyright 2003 Tinic Uro
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
@brief Should have a generic way to indicate probable size
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
public const size_t DUMMY_FILE_SIZE;

/***********************************************************
@brief In seconds
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
public int DUMMY_DURATION;

[CCode (cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
public enum SWFTag {
    [CCode (cname="TAG_END")]
    END,

    [CCode (cname="TAG_SHOWFRAME")]
    SHOW_FRAME,

    [CCode (cname="TAG_DEFINESHAPE")]
    DEFINE_SHAPE_1,

    [CCode (cname="TAG_FREECHARACTER")]
    FREE_CHARACTER,

    [CCode (cname="TAG_PLACEOBJECT")]
    PLACE_OBJECT_1,

    [CCode (cname="TAG_REMOVEOBJECT")]
    REMOVE_OBJECT_1,

    [CCode (cname="TAG_DEFINEBITS")]
    DEFINE_BITS,

    [CCode (cname="TAG_DEFINEBUTTON")]
    DEFINE_BUTTON_1,

    [CCode (cname="TAG_JPEGTABLES")]
    JPEG_TABLES,

    [CCode (cname="TAG_SETBACKGROUNDCOLOR")]
    SET_BACKGROUND_COLOR,

    [CCode (cname="TAG_DEFINEFONT")]
    DEFINE_FONT_1,

    [CCode (cname="TAG_DEFINETEXT")]
    DEFINE_TEXT_1,

    [CCode (cname="TAG_DOACTION")]
    DO_ACTION,

    [CCode (cname="TAG_DEFINEFONTINFO")]
    DEFINE_FONT_INFO_1,

    [CCode (cname="TAG_DEFINESOUND")]
    DEFINE_SOUND,

    [CCode (cname="TAG_STARTSOUND")]
    START_SOUND_1,

    [CCode (cname="TAG_DEFINEBUTTONSOUND")]
    DEFINE_BUTTON_SOUND,

    [CCode (cname="TAG_STREAMHEAD")]
    STREAM_HEAD_1,

    [CCode (cname="TAG_STREAMBLOCK")]
    STREAM_BLOCK,

    [CCode (cname="TAG_DEFINEBITSLOSSLESS")]
    DEFINE_BITS_LOSSLESS_1,

    [CCode (cname="TAG_JPEG2")]
    JPEG2,

    [CCode (cname="TAG_DEFINESHAPE2")]
    DEFINE_SHAPE_2,

    [CCode (cname="TAG_DEFINEBUTTONCXFORM")]
    DEFINE_BUTTON_CX_FORM,

    [CCode (cname="TAG_PROTECT")]
    PROTECT,

    [CCode (cname="TAG_PLACEOBJECT2")]
    PLACE_OBJECT_2,

    [CCode (cname="TAG_REMOVEOBJECT2")]
    REMOVE_OBJECT_2,

    [CCode (cname="TAG_DEFINESHAPE3")]
    DEFINE_SHAPE_3,

    [CCode (cname="TAG_DEFINETEXT2")]
    DEFINE_TEXT_2,

    [CCode (cname="TAG_DEFINEBUTTON2")]
    DEFINE_BUTTON_2,

    [CCode (cname="TAG_DEFINEBITSJPEG3")]
    DEFINE_BITS_JPEG_3,

    [CCode (cname="TAG_DEFINEBITSLOSSLESS2")]
    DEFINE_BITS_LOSSLESS_2,

    [CCode (cname="TAG_DEFINEEDITTEXT")]
    DEFINE_EDIT_TEXT,

    [CCode (cname="TAG_DEFINESPRITE")]
    DEFINE_SPRITE,

    [CCode (cname="TAG_FRAMELABEL")]
    FRAME_LABEL,

    [CCode (cname="TAG_STREAMHEAD2")]
    STREAM_HEAD_2,

    [CCode (cname="TAG_DEFINEMORPHSHAPE")]
    DEFINE_MORPH_SHAPE_1,

    [CCode (cname="TAG_DEFINEFONT2")]
    DEFINE_FONT_2,

    [CCode (cname="TAG_EXPORTASSETS")]
    EXPORT_ASSETS,

    [CCode (cname="TAG_IMPORTASSETS")]
    IMPORT_ASSETS,

    [CCode (cname="TAG_ENABLEDEBUGGER")]
    ENABLE_DEBUGGER_1,

    [CCode (cname="TAG_DOINITACTION")]
    DO_INIT_ACTION,

    [CCode (cname="TAG_VIDEOSTREAM")]
    VIDEO_STREAM,

    [CCode (cname="TAG_VIDEOFRAME")]
    VIDEO_FRAME,

    [CCode (cname="TAG_DEFINEFONTINFO2")]
    DEFINE_FONT_INFO_2,

    [CCode (cname="TAG_ENABLEDEBUGGER2")]
    ENABLE_DEBUGGER_2,

    [CCode (cname="TAG_SCRIPTLIMITS")]
    SCRIPT_LIMITS,

    [CCode (cname="TAG_SETTABINDEX")]
    SET_TAB_INDEX,

    [CCode (cname="TAG_FILEATTRIBUTES")]
    FILE_ATTRIBUTES,

    [CCode (cname="TAG_PLACEOBJECT3")]
    PLACE_OBJECT_3,

    [CCode (cname="TAG_IMPORTASSETS2")]
    IMPORT_ASSETS_2,

    [CCode (cname="TAG_DEFINEFONTALIGNZONES")]
    DEFINE_FONT_ALIGN_ZONES,

    [CCode (cname="TAG_CSMTEXTSETTINGS")]
    CSM_TEXT_SETTINGS,

    [CCode (cname="TAG_DEFINEFONT3")]
    DEFINE_FONT_3,

    [CCode (cname="TAG_SYMBOLCLASS")]
    SYMBOL_CLASS,

    [CCode (cname="TAG_METADATA")]
    METADATA,

    [CCode (cname="TAG_DEFINESCALINGGRID")]
    DEFINE_SCALING_GRID,

    [CCode (cname="TAG_DOABC")]
    DO_ABC,

    [CCode (cname="TAG_DEFINESHAPE4")]
    DEFINE_SHAPE_4,

    [CCode (cname="TAG_DEFINEMORPHSHAPE2")]
    DEFINE_MORPH_SHAPE_2,

    [CCode (cname="TAG_DEFINESCENEANDFRAMELABELDATA")]
    DEFINE_SCENE_AND_FRAME_LABEL_DATA,

    [CCode (cname="TAG_DEFINEBINARYDATA")]
    DEFINE_BINARY_DATA,

    [CCode (cname="TAG_DEFINEFONTNAME")]
    DEFINE_FONT_NAME,

    [CCode (cname="TAG_STARTSOUND2")]
    START_SOUND_2,

    [CCode (cname="TAG_DEFINEBITSJPEG4")]
    DEFINE_BITS_JPEG_4,

    [CCode (cname="TAG_DEFINEFONT4")]
    DEFINE_FONT_4;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
public const int TAG_LONG;

/***********************************************************
@brief Flags for shape definition
***********************************************************/
[Flags]
[CCode (cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
public enum ShapeDefinitionFlags {
    [CCode (cname="FLAG_MOVETO")]
    MOVE_TO,

    [CCode (cname="FLAG_SETFILL0")]
    SET_FILL_0,

    [CCode (cname="FLAG_SETFILL1")]
    SET_FILL_1;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
public const size_t AUDIO_FIFO_SIZE;

/***********************************************************
@brief Character id used
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
public const int BITMAP_ID;

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
public const int VIDEO_ID;

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
public const int SHAPE_ID;

[CCode (cname="struct SWFContext",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
[Compact]
public class SWFContext {
    [CCode (cname="")]
    public int64 duration_pos;

    [CCode (cname="")]
    public int64 tag_pos;

    [CCode (cname="")]
    public int64 vframes_pos;

    [CCode (cname="")]
    public int samples_per_frame;

    [CCode (cname="")]
    public int sound_samples;

    [CCode (cname="")]
    public int swf_frame_number;

    [CCode (cname="")]
    public int video_frame_number;

    [CCode (cname="")]
    public int frame_rate;

    [CCode (cname="")]
    public int tag;

    [CCode (cname="")]
    public LibAVUtil.FifoBuffer audio_fifo;

    [CCode (cname="")]
    public LibAVCodec.CodecParameters audio_par;

    [CCode (cname="")]
    public LibAVCodec.CodecParameters video_par;

    [CCode (cname="")]
    public LibAVFormat.Stream video_st;

#if CONFIG_ZLIB
    [CCode (cname="")]
    public const size_t ZBUF_SIZE;

    [CCode (cname="")]
    public AVIOContext zpb;

    [CCode (cname="")]
    public uint8[] zbuf_in;

    [CCode (cname="")]
    public uint8[] zbuf_out;

    [CCode (cname="")]
    public z_stream zstream;
#endif
}

//  extern const AVCodecTag ff_swf_codec_tags[];

} // namespace LibAVFormat
