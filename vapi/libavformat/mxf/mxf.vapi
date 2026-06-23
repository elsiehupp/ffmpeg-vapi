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

[CCode (cname="struct UID",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
[Compact]
public class UID { } // uint8[16]

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
public enum MXFMetadataSetType {
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
    AnyType,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
    MaterialPackage,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
    SourcePackage,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
    SourceClip,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
    TimecodeComponent,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
    PulldownComponent,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
    Sequence,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
    MultipleDescriptor,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
    Descriptor,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
    Track,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
    CryptoContext,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
    Preface,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
    Identification,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
    ContentStorage,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
    SubDescriptor,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
    IndexTableSegment,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
    EssenceContainerData,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
    EssenceGroup,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
    TaggedValue,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
    TapeDescriptor,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
    AVCSubDescriptor;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
public enum MXFFrameLayout {
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
    FullFrame, // = 0,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
    SeparateFields,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
    OneField,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
    MixedFields,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
    SegmentedFrame;
}

[CCode (cname="struct KLVPacket",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
[Compact]
public class KLVPacket {
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
    public UID key;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
    public int64 offset;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
    public uint64 length;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
    public int64 next_klv;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
public enum MXFWrappingIndicatorType {
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
    NormalWrap, // = 0,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
    D10D11Wrap,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
    RawAWrap,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
    RawVWrap
}

[CCode (cname="struct MXFCodecUL",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
[Compact]
public class MXFCodecUL {
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
    public UID uid;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
    public uint matching_len;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
    public int id;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
    public string desc;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
    public uint wrapping_indicator_pos;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
    public MXFWrappingIndicatorType wrapping_indicator_type;
}

[CCode (cname="struct MXFSamplesPerFrame",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
[Compact]
public class MXFSamplesPerFrame {
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
    public LibAVUtil.Rational time_base;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
    public int samples_per_frame[6];
}

//  extern const MXFCodecUL ff_mxf_data_definition_uls[];
//  extern const MXFCodecUL ff_mxf_codec_uls[];
//  extern const MXFCodecUL ff_mxf_pixel_format_uls[];
//  extern const MXFCodecUL ff_mxf_codec_tag_uls[];

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
public int ff_mxf_decode_pixel_layout (
    char pixel_layout[16],
    LibAVUtil.PixelFormat pix_fmt
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
public MXFSamplesPerFrame ff_mxf_get_samples_per_frame (
    AVFormatContext format_context,
    LibAVUtil.Rational time_base
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
public int ff_mxf_get_content_package_rate (
    LibAVUtil.Rational time_base
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/mxf.h")]
public const string PRIxUID;

//  #define UID_ARG (x)
//      (x)[0], (x)[1], (x)[2], (x)[3],
//      (x)[4], (x)[5], (x)[6], (x)[7],
//      (x)[8], (x)[9], (x)[10], (x)[11],
//      (x)[12], (x)[13], (x)[14], (x)[15]

//  #ifdef DEBUG
//  #define PRINT_KEY (pc, s, x)
//      av_log (pc, LogLevel.VERBOSE,
//             "%s "
//             "0x%02x,0x%02x,0x%02x,0x%02x,"
//             "0x%02x,0x%02x,0x%02x,0x%02x,"
//             "0x%02x,0x%02x,0x%02x,0x%02x,"
//             "0x%02x,0x%02x,0x%02x,0x%02x ",
//              s, UID_ARG (x));
//      av_log (pc, LogLevel.INFO,
//             "%s "
//             "%02x.%02x.%02x.%02x."
//             "%02x.%02x.%02x.%02x."
//             "%02x.%02x.%02x.%02x."
//             "%02x.%02x.%02x.%02x\n",
//              s, UID_ARG (x))
//  #else
//  #define PRINT_KEY (pc, s, x) do { if (0)
//      av_log (pc, LogLevel.VERBOSE,
//             "%s "
//             "0x%02x,0x%02x,0x%02x,0x%02x,"
//             "0x%02x,0x%02x,0x%02x,0x%02x,"
//             "0x%02x,0x%02x,0x%02x,0x%02x,"
//             "0x%02x,0x%02x,0x%02x,0x%02x ",
//              s, UID_ARG (x));
//      }while (0)
//  #endif

} // namespace LibAVFormat
