/***********************************************************
MXF
@copyright 2006 SmartJog S.A., Baptiste Coudurier <baptiste dot coudurier at smartjog dot com>
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

[CCode (cname="struct UID", cheader_filename="")]
public struct UID { } // uint8[16]

[CCode (cname="", cheader_filename="")]
public enum MXFMetadataSetType {
    AnyType,
    MaterialPackage,
    SourcePackage,
    SourceClip,
    TimecodeComponent,
    PulldownComponent,
    Sequence,
    MultipleDescriptor,
    Descriptor,
    Track,
    CryptoContext,
    Preface,
    Identification,
    ContentStorage,
    SubDescriptor,
    IndexTableSegment,
    EssenceContainerData,
    EssenceGroup,
    TaggedValue,
    TapeDescriptor,
    AVCSubDescriptor,
}

[CCode (cname="", cheader_filename="")]
public enum MXFFrameLayout {
    FullFrame = 0,
    SeparateFields,
    OneField,
    MixedFields,
    SegmentedFrame,
}

[CCode (cname="struct KLVPacket", cheader_filename="")]
public struct KLVPacket {
    public UID key;
    public int64 offset;
    public uint64 length;
    public int64 next_klv;
}

[CCode (cname="", cheader_filename="")]
public enum MXFWrappingIndicatorType {
    NormalWrap = 0,
    D10D11Wrap,
    RawAWrap,
    RawVWrap
}

[CCode (cname="struct MXFCodecUL", cheader_filename="")]
public struct MXFCodecUL {
    public UID uid;
    public uint matching_len;
    public int id;
    public string desc;
    public uint wrapping_indicator_pos;
    public MXFWrappingIndicatorType wrapping_indicator_type;
}

[CCode (cname="struct MXFSamplesPerFrame", cheader_filename="")]
public struct MXFSamplesPerFrame {
    public LibAVUtil.Rational time_base;
    public int samples_per_frame[6];
}

//  extern const MXFCodecUL ff_mxf_data_definition_uls[];
//  extern const MXFCodecUL ff_mxf_codec_uls[];
//  extern const MXFCodecUL ff_mxf_pixel_format_uls[];
//  extern const MXFCodecUL ff_mxf_codec_tag_uls[];

[CCode (cname="", cheader_filename="")]
public int ff_mxf_decode_pixel_layout (
    char pixel_layout[16],
    LibAVUtil.PixelFormat pix_fmt
);

[CCode (cname="", cheader_filename="")]
public MXFSamplesPerFrame ff_mxf_get_samples_per_frame (
    AVFormatContext format_context,
    LibAVUtil.Rational time_base
);

[CCode (cname="", cheader_filename="")]
public int ff_mxf_get_content_package_rate (
    LibAVUtil.Rational time_base
);

[CCode (cname="", cheader_filename="")]
public const string PRIxUID;

//  #define UID_ARG (x)
//      (x)[0], (x)[1], (x)[2], (x)[3],
//      (x)[4], (x)[5], (x)[6], (x)[7],
//      (x)[8], (x)[9], (x)[10], (x)[11],
//      (x)[12], (x)[13], (x)[14], (x)[15]

//  #ifdef DEBUG
//  #define PRINT_KEY (pc, s, x)
//      av_log (pc, AV_LOG_VERBOSE,
//             "%s "
//             "0x%02x,0x%02x,0x%02x,0x%02x,"
//             "0x%02x,0x%02x,0x%02x,0x%02x,"
//             "0x%02x,0x%02x,0x%02x,0x%02x,"
//             "0x%02x,0x%02x,0x%02x,0x%02x ",
//              s, UID_ARG (x));
//      av_log (pc, AV_LOG_INFO,
//             "%s "
//             "%02x.%02x.%02x.%02x."
//             "%02x.%02x.%02x.%02x."
//             "%02x.%02x.%02x.%02x."
//             "%02x.%02x.%02x.%02x\n",
//              s, UID_ARG (x))
//  #else
//  #define PRINT_KEY (pc, s, x) do { if (0)
//      av_log (pc, AV_LOG_VERBOSE,
//             "%s "
//             "0x%02x,0x%02x,0x%02x,0x%02x,"
//             "0x%02x,0x%02x,0x%02x,0x%02x,"
//             "0x%02x,0x%02x,0x%02x,0x%02x,"
//             "0x%02x,0x%02x,0x%02x,0x%02x ",
//              s, UID_ARG (x));
//      }while (0)
//  #endif

} // namespace LibAVFormat
