/***********************************************************
Flash Compatible Streaming Format common header.
@copyright 2000 Fabrice Bellard
@copyright 2003 Tinic Uro
***********************************************************/
/***********************************************************
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
should have a generic way to indicate probable size
***********************************************************/
public const size_t DUMMY_FILE_SIZE;

/***********************************************************
in seconds
***********************************************************/
public int DUMMY_DURATION;

[CCode (cname="", cheader_filename="")]
public enum SWFTag {
    TAG_END,
    TAG_SHOWFRAME,
    TAG_DEFINESHAPE,
    TAG_FREECHARACTER,
    TAG_PLACEOBJECT,
    TAG_REMOVEOBJECT,
    TAG_DEFINEBITS,
    TAG_DEFINEBUTTON,
    TAG_JPEGTABLES,
    TAG_SETBACKGROUNDCOLOR,
    TAG_DEFINEFONT,
    TAG_DEFINETEXT,
    TAG_DOACTION,
    TAG_DEFINEFONTINFO,
    TAG_DEFINESOUND,
    TAG_STARTSOUND,
    TAG_DEFINEBUTTONSOUND,
    TAG_STREAMHEAD,
    TAG_STREAMBLOCK,
    TAG_DEFINEBITSLOSSLESS,
    TAG_JPEG2,
    TAG_DEFINESHAPE2,
    TAG_DEFINEBUTTONCXFORM,
    TAG_PROTECT,
    TAG_PLACEOBJECT2,
    TAG_REMOVEOBJECT2,
    TAG_DEFINESHAPE3,
    TAG_DEFINETEXT2,
    TAG_DEFINEBUTTON2,
    TAG_DEFINEBITSJPEG3,
    TAG_DEFINEBITSLOSSLESS2,
    TAG_DEFINEEDITTEXT,
    TAG_DEFINESPRITE,
    TAG_FRAMELABEL,
    TAG_STREAMHEAD2,
    TAG_DEFINEMORPHSHAPE,
    TAG_DEFINEFONT2,
    TAG_EXPORTASSETS,
    TAG_IMPORTASSETS,
    TAG_ENABLEDEBUGGER,
    TAG_DOINITACTION,
    TAG_VIDEOSTREAM,
    TAG_VIDEOFRAME,
    TAG_DEFINEFONTINFO2,
    TAG_ENABLEDEBUGGER2,
    TAG_SCRIPTLIMITS,
    TAG_SETTABINDEX,
    TAG_FILEATTRIBUTES,
    TAG_PLACEOBJECT3,
    TAG_IMPORTASSETS2,
    TAG_DEFINEFONTALIGNZONES,
    TAG_CSMTEXTSETTINGS,
    TAG_DEFINEFONT3,
    TAG_SYMBOLCLASS,
    TAG_METADATA,
    TAG_DEFINESCALINGGRID,
    TAG_DOABC,
    TAG_DEFINESHAPE4,
    TAG_DEFINEMORPHSHAPE2,
    TAG_DEFINESCENEANDFRAMELABELDATA,
    TAG_DEFINEBINARYDATA,
    TAG_DEFINEFONTNAME,
    TAG_STARTSOUND2,
    TAG_DEFINEBITSJPEG4,
    TAG_DEFINEFONT4,
}

[CCode (cname="", cheader_filename="")]
public const int TAG_LONG;

/***********************************************************
flags for shape definition
***********************************************************/
[Flags]
public enum ShapeDefinitionFlags {
    FLAG_MOVETO,
    FLAG_SETFILL0,
    FLAG_SETFILL1,
}

[CCode (cname="", cheader_filename="")]
public const size_t AUDIO_FIFO_SIZE;

/***********************************************************
character id used
***********************************************************/
public const int BITMAP_ID;
public const int VIDEO_ID;
public const int SHAPE_ID;

[CCode (cname="struct SWFContext", cheader_filename="")]
public struct SWFContext {
    public int64 duration_pos;
    public int64 tag_pos;
    public int64 vframes_pos;
    public int samples_per_frame;
    public int sound_samples;
    public int swf_frame_number;
    public int video_frame_number;
    public int frame_rate;
    public int tag;
    public LibAVUtil.FifoBuffer audio_fifo;
    public LibAVCodec.CodecParameters audio_par;
    public LibAVCodec.CodecParameters video_par;
    public AVStream video_st;
#if CONFIG_ZLIB
    public const size_t ZBUF_SIZE;
    public AVIOContext zpb;
    public uint8[] zbuf_in;
    public uint8[] zbuf_out;
    public z_stream zstream;
#endif
}

//  extern const AVCodecTag ff_swf_codec_tags[];

} // namespace LibAVFormat
