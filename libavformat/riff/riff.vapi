/***********************************************************
RIFF common functions and data
copyright (c) 2000 Fabrice Bellard

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

/***********************************************************
@file
internal header for RIFF based (de)muxers
do NOT include this in end user applications
***********************************************************/

//  extern const AVMetadataConv ff_riff_info_conv[];

int64 ff_start_tag (
    AVIOContext *pb,
    string tag
);
void ff_end_tag (
    AVIOContext *pb,
    int64 start
);

/***********************************************************
Read BITMAPINFOHEADER structure and set AVStream codec width, height and
bits_per_encoded_sample fields. Does not read extradata.
Writes the size of the BMP file to *size.
@return codec tag
***********************************************************/
int ff_get_bmp_header (
    AVIOContext *pb,
    AVStream *st,
    uint32[] size
);

void ff_put_bmp_header (
    AVIOContext *pb,
    LibAVCodec.CodecParameters *par,
    int for_asf,
    int ignore_extradata
);

[Flags]
public enum PutWAVHeaderFlags {
    /***********************************************************
    Tell ff_put_wav_header () to use WAVEFORMATEX even for PCM codecs.
    ***********************************************************/
    FF_PUT_WAV_HEADER_FORCE_WAVEFORMATEX,

    /***********************************************************
    Tell ff_put_wav_header () to write an empty channel mask.
    ***********************************************************/
    FF_PUT_WAV_HEADER_SKIP_CHANNELMASK,
}

/***********************************************************
Write WAVEFORMAT header structure.

@param flags a combination of FF_PUT_WAV_HEADER_* constants

@return the size or -1 on error
***********************************************************/
int ff_put_wav_header (
    AVFormatContext *s,
    AVIOContext *pb,
    LibAVCodec.CodecParameters *par,
    int flags
);

public LibAVCodec.CodecID ff_wav_codec_get_id (
    uint tag,
    int bps
);
int ff_get_wav_header (
    AVFormatContext *s,
    AVIOContext *pb,
    LibAVCodec.CodecParameters *par,
    int size,
    int big_endian
);

//  extern const AVCodecTag ff_codec_bmp_tags[]; // exposed through avformat_get_riff_video_tags ()
//  extern const AVCodecTag ff_codec_wav_tags[];

//  extern const AVCodecTag ff_codec_bmp_tags_unofficial[];

void ff_parse_specific_params (
    AVStream *st,
    out int au_rate,
    out int au_ssize,
    out int au_scale
);

int ff_read_riff_info (
    AVFormatContext *s,
    int64 size
);

/***********************************************************
Write all recognized RIFF tags from s.metadata
***********************************************************/
void ff_riff_write_info (
    AVFormatContext *s
);

/***********************************************************
Write a single RIFF info tag
***********************************************************/
void ff_riff_write_info_tag (
    AVIOContext *pb,
    string tag,
    string str
);

public struct ff_asf_guid { }

public struct AVCodecGuid {
    LibAVCodec.CodecID id;
    ff_asf_guid guid;
}

//  extern const AVCodecGuid ff_codec_wav_guids[];

//  public const string FF_PRI_GUID \
//      "%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x " \
//      "{%02x%02x%02x%02x-%02x%02x-%02x%02x-%02x%02x-%02x%02x%02x%02x%02x%02x}"

//  #define FF_ARG_GUID (g) \
//      g[0], g[1], g[2], g[3], g[4], g[5], g[6], g[7], \
//      g[8], g[9], g[10], g[11], g[12], g[13], g[14], g[15],\
//      g[3], g[2], g[1], g[0], g[5], g[4], g[7], g[6], \
//      g[8], g[9], g[10], g[11], g[12], g[13], g[14], g[15]

//  #define FF_MEDIASUBTYPE_BASE_GUID \
//      0x00, 0x00, 0x10, 0x00, 0x80, 0x00, 0x00, 0xAA, 0x00, 0x38, 0x9B, 0x71
//  #define FF_AMBISONIC_BASE_GUID \
//      0x21, 0x07, 0xD3, 0x11, 0x86, 0x44, 0xC8, 0xC1, 0xCA, 0x00, 0x00, 0x00
//  #define FF_BROKEN_BASE_GUID \
//      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x80, 0x00, 0x00, 0xAA

static int ff_guidcmp (
    void *g1,
    void *g2
);

int ff_get_guid (
    AVIOContext *s,
    ff_asf_guid *g
);
void ff_put_guid (
    AVIOContext *s,
    ff_asf_guid *g
);
ff_asf_guid *ff_get_codec_guid (
    LibAVCodec.CodecID id,
    AVCodecGuid *av_guid
);

public LibAVCodec.CodecID ff_codec_guid_get_id (
    AVCodecGuid *guids,
    ff_asf_guid guid
);
