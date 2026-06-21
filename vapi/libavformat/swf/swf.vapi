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

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
public enum SWFTag {
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_END,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_SHOWFRAME,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_DEFINESHAPE,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_FREECHARACTER,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_PLACEOBJECT,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_REMOVEOBJECT,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_DEFINEBITS,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_DEFINEBUTTON,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_JPEGTABLES,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_SETBACKGROUNDCOLOR,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_DEFINEFONT,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_DEFINETEXT,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_DOACTION,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_DEFINEFONTINFO,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_DEFINESOUND,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_STARTSOUND,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_DEFINEBUTTONSOUND,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_STREAMHEAD,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_STREAMBLOCK,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_DEFINEBITSLOSSLESS,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_JPEG2,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_DEFINESHAPE2,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_DEFINEBUTTONCXFORM,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_PROTECT,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_PLACEOBJECT2,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_REMOVEOBJECT2,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_DEFINESHAPE3,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_DEFINETEXT2,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_DEFINEBUTTON2,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_DEFINEBITSJPEG3,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_DEFINEBITSLOSSLESS2,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_DEFINEEDITTEXT,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_DEFINESPRITE,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_FRAMELABEL,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_STREAMHEAD2,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_DEFINEMORPHSHAPE,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_DEFINEFONT2,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_EXPORTASSETS,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_IMPORTASSETS,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_ENABLEDEBUGGER,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_DOINITACTION,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_VIDEOSTREAM,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_VIDEOFRAME,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_DEFINEFONTINFO2,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_ENABLEDEBUGGER2,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_SCRIPTLIMITS,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_SETTABINDEX,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_FILEATTRIBUTES,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_PLACEOBJECT3,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_IMPORTASSETS2,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_DEFINEFONTALIGNZONES,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_CSMTEXTSETTINGS,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_DEFINEFONT3,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_SYMBOLCLASS,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_METADATA,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_DEFINESCALINGGRID,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_DOABC,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_DEFINESHAPE4,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_DEFINEMORPHSHAPE2,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_DEFINESCENEANDFRAMELABELDATA,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_DEFINEBINARYDATA,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_DEFINEFONTNAME,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_STARTSOUND2,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_DEFINEBITSJPEG4,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    TAG_DEFINEFONT4;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
public const int TAG_LONG;

/***********************************************************
@brief Flags for shape definition
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
[Flags]
public enum ShapeDefinitionFlags {
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    FLAG_MOVETO,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    FLAG_SETFILL0,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    FLAG_SETFILL1;
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
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    public int64 duration_pos;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    public int64 tag_pos;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    public int64 vframes_pos;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    public int samples_per_frame;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    public int sound_samples;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    public int swf_frame_number;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    public int video_frame_number;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    public int frame_rate;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    public int tag;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    public LibAVUtil.FifoBuffer audio_fifo;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    public LibAVCodec.CodecParameters audio_par;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    public LibAVCodec.CodecParameters video_par;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    public AVStream video_st;

#if CONFIG_ZLIB
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    public const size_t ZBUF_SIZE;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    public AVIOContext zpb;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    public uint8[] zbuf_in;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    public uint8[] zbuf_out;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/swf.h")]
    public z_stream zstream;
#endif
}

//  extern const AVCodecTag ff_swf_codec_tags[];

} // namespace LibAVFormat
