/***********************************************************
@brief RIFF common functions and data
@copyright 2000 Fabrice Bellard
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
@file internal header for RIFF based (de)muxers
do NOT include this in end user applications
***********************************************************/

//  extern const AVMetadataConv ff_riff_info_conv[];

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/riff.h")]
public int64 ff_start_tag (
    LibAVFormat.IOContext pb,
    string tag
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/riff.h")]
public void ff_end_tag (
    LibAVFormat.IOContext pb,
    int64 start
);

/***********************************************************
@brief Read BITMAPINFOHEADER structure and set LibAVFormat.Stream codec width, height and
bits_per_encoded_sample fields. Does not read extradata.
Writes the size of the BMP file to size.
@return codec tag
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/riff.h")]
public int ff_get_bmp_header (
    LibAVFormat.IOContext pb,
    LibAVFormat.Stream stream,
    uint32[] size
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/riff.h")]
public void ff_put_bmp_header (
    LibAVFormat.IOContext pb,
    LibAVCodec.CodecParameters par,
    int for_asf,
    int ignore_extradata
);

[Flags]
[CCode (cheader_filename="subprojects/ffmpeg/libavformat/riff.h")]
public enum PutWAVHeaderFlags {
    /***********************************************************
    @brief Tell ff_put_wav_header () to use WAVEFORMATEX even for PCM codecs.
    ***********************************************************/
    [CCode (cname="FF_PUT_WAV_HEADER_FORCE_WAVEFORMATEX")]
    FORCE_WAVE_FORMAT_EX,

    /***********************************************************
    @brief Tell ff_put_wav_header () to write an empty channel mask.
    ***********************************************************/
    [CCode (cname="FF_PUT_WAV_HEADER_SKIP_CHANNELMASK")]
    SKIP_CHANNEL_MASK;
}

/***********************************************************
@brief Write WAVEFORMAT header structure.

@param flags a combination of FF_PUT_WAV_HEADER_* constants

@return the size or -1 on error
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/riff.h")]
public int ff_put_wav_header (
    LibAVFormat.FormatContext format_context,
    LibAVFormat.IOContext pb,
    LibAVCodec.CodecParameters par,
    int flags
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/riff.h")]
public LibAVCodec.CodecID ff_wav_codec_get_id (
    uint tag,
    int bps
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/riff.h")]
public int ff_get_wav_header (
    LibAVFormat.FormatContext format_context,
    LibAVFormat.IOContext pb,
    LibAVCodec.CodecParameters par,
    int size,
    int big_endian
);

//  extern const LibAVFormat.CodecTag ff_codec_bmp_tags[]; // exposed through avformat_get_riff_video_tags ()
//  extern const LibAVFormat.CodecTag ff_codec_wav_tags[];

//  extern const LibAVFormat.CodecTag ff_codec_bmp_tags_unofficial[];

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/riff.h")]
public void ff_parse_specific_params (
    LibAVFormat.Stream stream,
    out int au_rate,
    out int au_ssize,
    out int au_scale
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/riff.h")]
public int ff_read_riff_info (
    LibAVFormat.FormatContext format_context,
    int64 size
);

/***********************************************************
@brief Write all recognized RIFF tags from format_context.metadata
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/riff.h")]
public void ff_riff_write_info (
    LibAVFormat.FormatContext format_context
);

/***********************************************************
@brief Write a single RIFF info tag
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/riff.h")]
public void ff_riff_write_info_tag (
    LibAVFormat.IOContext pb,
    string tag,
    string str
);

[CCode (cname="struct ff_asf_guid",cheader_filename="subprojects/ffmpeg/libavformat/riff.h")]
[Compact]
public class ff_asf_guid { }

[CCode (cname="struct AVCodecGuid",cheader_filename="subprojects/ffmpeg/libavformat/riff.h")]
[Compact]
public class AVCodecGuid {
    [CCode (cname="")]
    public LibAVCodec.CodecID id;

    [CCode (cname="")]
    public ff_asf_guid guid;
}

//  extern const AVCodecGuid ff_codec_wav_guids[];

//  public const string FF_PRI_GUID
//      "%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x " +
//      "{%02x%02x%02x%02x-%02x%02x-%02x%02x-%02x%02x-%02x%02x%02x%02x%02x%02x}";

//  #define FF_ARG_GUID (g)
//      g[0], g[1], g[2], g[3], g[4], g[5], g[6], g[7],
//      g[8], g[9], g[10], g[11], g[12], g[13], g[14], g[15],
//      g[3], g[2], g[1], g[0], g[5], g[4], g[7], g[6],
//      g[8], g[9], g[10], g[11], g[12], g[13], g[14], g[15]

//  #define FF_MEDIASUBTYPE_BASE_GUID
//      0x00, 0x00, 0x10, 0x00, 0x80, 0x00, 0x00, 0xAA, 0x00, 0x38, 0x9B, 0x71
//  #define FF_AMBISONIC_BASE_GUID
//      0x21, 0x07, 0xD3, 0x11, 0x86, 0x44, 0xC8, 0xC1, 0xCA, 0x00, 0x00, 0x00
//  #define FF_BROKEN_BASE_GUID
//      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x80, 0x00, 0x00, 0xAA

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/riff.h")]
public static int ff_guidcmp (
    void *g1,
    void *g2
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/riff.h")]
public int ff_get_guid (
    LibAVFormat.IOContext io_context,
    ff_asf_guid? g
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/riff.h")]
public void ff_put_guid (
    LibAVFormat.IOContext io_context,
    ff_asf_guid? g
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/riff.h")]
public ff_asf_guid? ff_get_codec_guid (
    LibAVCodec.CodecID id,
    AVCodecGuid? av_guid
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/riff.h")]
public LibAVCodec.CodecID ff_codec_guid_get_id (
    AVCodecGuid? guids,
    ff_asf_guid guid
);

} // namespace LibAVFormat
