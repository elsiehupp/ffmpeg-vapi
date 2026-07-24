/***********************************************************
@brief MXF
@copyright 2006 SmartJog S.A., Baptiste Coudurier <baptiste dot coudurier at smartjog dot com>
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

[CCode (cname="struct UID",cheader_filename="subprojects/ffmpeg/libavformat/mxf.h")]
[Compact]
public class UID { } // uint8[16]

[CCode (cname="enum MXFMetadataSetType",cheader_filename="subprojects/ffmpeg/libavformat/mxf.h")]
public enum MXFMetadataSetType {
    [CCode (cname="AnyType")]
    ANY,

    [CCode (cname="MaterialPackage")]
    MATERIAL_PACKAGE,

    [CCode (cname="SourcePackage")]
    SOURCE_PACKAGE,

    [CCode (cname="SourceClip")]
    SOURCE_CLIP,

    [CCode (cname="TimecodeComponent")]
    TIMECODE_COMPONENT,

    [CCode (cname="PulldownComponent")]
    PULLDOWN_COMPONENT,

    [CCode (cname="Sequence")]
    SEQUENCE,

    [CCode (cname="MultipleDescriptor")]
    MULTIPLE_DESCRIPTOR,

    [CCode (cname="Descriptor")]
    DESCRIPTOR,

    [CCode (cname="Track")]
    TRACK,

    [CCode (cname="CryptoContext")]
    CRYPTO_CONTEXT,

    [CCode (cname="Preface")]
    PREFACE,

    [CCode (cname="Identification")]
    IDENTIFICATION,

    [CCode (cname="ContentStorage")]
    CONTENT_STORAGE,

    [CCode (cname="SubDescriptor")]
    SUB_DESCRIPTOR,

    [CCode (cname="IndexTableSegment")]
    INDEX_TABLE_SEGMENT,

    [CCode (cname="EssenceContainerData")]
    ESSENCE_CONTAINER_DATA,

    [CCode (cname="EssenceGroup")]
    ESSENCE_GROUP,

    [CCode (cname="TaggedValue")]
    TAGGED_VALUE,

    [CCode (cname="TapeDescriptor")]
    TAPE_DESCRIPTOR,

    [CCode (cname="AVCSubDescriptor")]
    AVC_SUB_DESCRIPTOR;
}

[CCode (cname="enum MXFFrameLayout",cheader_filename="subprojects/ffmpeg/libavformat/mxf.h")]
public enum MXFFrameLayout {
    [CCode (cname="FullFrame")]
    FULL_FRAME, // = 0,

    [CCode (cname="SeparateFields")]
    SEPARATE_FIELDS,

    [CCode (cname="OneField")]
    ONE_FIELD,

    [CCode (cname="MixedFields")]
    MIXED_FIELDS,

    [CCode (cname="SegmentedFrame")]
    SEGMENTED_FRAME;
}

[CCode (cname="struct KLVPacket",cheader_filename="subprojects/ffmpeg/libavformat/mxf.h")]
[Compact]
public class KLVPacket {
    [CCode (cname="")]
    public UID key;

    [CCode (cname="")]
    public int64 offset;

    [CCode (cname="")]
    public uint64 length;

    [CCode (cname="")]
    public int64 next_klv;
}

[CCode (cname="enum MXFWrappingIndicatorType",cheader_filename="subprojects/ffmpeg/libavformat/mxf.h")]
public enum MXFWrappingIndicatorType {
    [CCode (cname="NormalWrap")]
    NORMAL, // = 0,

    [CCode (cname="D10D11Wrap")]
    DIRECTX_10_DIRECTX_11,

    [CCode (cname="RawAWrap")]
    RAW_AUDIO,

    [CCode (cname="RawVWrap")]
    RAW_VIDEO;
}

[CCode (cname="struct MXFCodecUL",cheader_filename="subprojects/ffmpeg/libavformat/mxf.h")]
[Compact]
public class MXFCodecUL {
    [CCode (cname="")]
    public UID uid;

    [CCode (cname="")]
    public uint matching_len;

    [CCode (cname="")]
    public int id;

    [CCode (cname="")]
    public string desc;

    [CCode (cname="")]
    public uint wrapping_indicator_pos;

    [CCode (cname="")]
    public MXFWrappingIndicatorType wrapping_indicator_type;
}

[CCode (cname="struct MXFSamplesPerFrame",cheader_filename="subprojects/ffmpeg/libavformat/mxf.h")]
[Compact]
public class MXFSamplesPerFrame {
    [CCode (cname="")]
    public LibAVUtil.Rational time_base;

    [CCode (cname="")]
    public int samples_per_frame[6];
}

//  extern const MXFCodecUL ff_mxf_data_definition_uls[];
//  extern const MXFCodecUL ff_mxf_codec_uls[];
//  extern const MXFCodecUL ff_mxf_pixel_format_uls[];
//  extern const MXFCodecUL ff_mxf_codec_tag_uls[];

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/mxf.h")]
public int ff_mxf_decode_pixel_layout (
    char pixel_layout[16],
    LibAVUtil.PixelFormat pix_fmt
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/mxf.h")]
public MXFSamplesPerFrame ff_mxf_get_samples_per_frame (
    LibAVFormat.FormatContext format_context,
    LibAVUtil.Rational time_base
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/mxf.h")]
public int ff_mxf_get_content_package_rate (
    LibAVUtil.Rational time_base
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/mxf.h")]
public const string PRIxUID;

//  #define UID_ARG (x)
//      (x)[0], (x)[1], (x)[2], (x)[3],
//      (x)[4], (x)[5], (x)[6], (x)[7],
//      (x)[8], (x)[9], (x)[10], (x)[11],
//      (x)[12], (x)[13], (x)[14], (x)[15]

//  #ifdef DEBUG
//  #define PRINT_KEY (pc, s, x)
//      LibAVUtil.Log.Class.av_log (pc, LibAVUtil.Log.Level.VERBOSE,
//             "%s "
//             "0x%02x,0x%02x,0x%02x,0x%02x,"
//             "0x%02x,0x%02x,0x%02x,0x%02x,"
//             "0x%02x,0x%02x,0x%02x,0x%02x,"
//             "0x%02x,0x%02x,0x%02x,0x%02x ",
//              s, UID_ARG (x));
//      LibAVUtil.Log.Class.av_log (pc, LibAVUtil.Log.Level.INFO,
//             "%s "
//             "%02x.%02x.%02x.%02x."
//             "%02x.%02x.%02x.%02x."
//             "%02x.%02x.%02x.%02x."
//             "%02x.%02x.%02x.%02x\n",
//              s, UID_ARG (x))
//  #else
//  #define PRINT_KEY (pc, s, x) do { if (0)
//      LibAVUtil.Log.Class.av_log (pc, LibAVUtil.Log.Level.VERBOSE,
//             "%s "
//             "0x%02x,0x%02x,0x%02x,0x%02x,"
//             "0x%02x,0x%02x,0x%02x,0x%02x,"
//             "0x%02x,0x%02x,0x%02x,0x%02x,"
//             "0x%02x,0x%02x,0x%02x,0x%02x ",
//              s, UID_ARG (x));
//      }while (0)
//  #endif

} // namespace LibAVFormat
