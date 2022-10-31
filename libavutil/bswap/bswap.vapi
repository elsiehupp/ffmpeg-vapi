/***********************************************************
@copyright 2006 Michael Niedermayer <michaelni@gmx.at>

This file is part of FFmpeg.

FFmpeg is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

FFmpeg is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with FFmpeg; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
***********************************************************/

namespace LibAVUtil {

/***********************************************************
@file
byte swapping routines
***********************************************************/

//  #define AV_BSWAP16C (x) (((x) << 8 & 0xff00)  | ((x) >> 8 & 0x00ff))
//  #define AV_BSWAP32C (x) (AV_BSWAP16C (x) << 16 | AV_BSWAP16C ((x) >> 16))
//  #define AV_BSWAP64C (x) (AV_BSWAP32C (x) << 32 | AV_BSWAP32C ((x) >> 32))

//  #define AV_BSWAPC (s, x) AV_BSWAP##s##C (x)

[CCode (cname="av_bswap16", cheader_filename="ffmpeg/libavutil/bswap.h")]
public static uint16 av_bswap16 (
    uint16 x
);

[CCode (cname="av_bswap32", cheader_filename="ffmpeg/libavutil/bswap.h")]
public static uint32 av_bswap32 (
    uint32 x
);

[CCode (cname="av_bswap64", cheader_filename="ffmpeg/libavutil/bswap.h")]
public static uint64 av_bswap64 (
    uint64 x
);

// be2ne ... big-endian to native-endian
// le2ne ... little-endian to native-endian

[CCode (cname="av_be2ne16", cheader_filename="ffmpeg/libavutil/bswap.h")]
public uint16 av_be2ne16 (uint16 x);

[CCode (cname="av_be2ne32", cheader_filename="ffmpeg/libavutil/bswap.h")]
public uint32 av_be2ne32 (uint32 x);

[CCode (cname="av_be2ne64", cheader_filename="ffmpeg/libavutil/bswap.h")]
public uint64 av_be2ne64 (uint64 x);

[CCode (cname="av_le2ne16", cheader_filename="ffmpeg/libavutil/bswap.h")]
public uint16 av_le2ne16 (uint16 x);

[CCode (cname="av_le2ne32", cheader_filename="ffmpeg/libavutil/bswap.h")]
public uint32 av_le2ne32 (uint32 x);

[CCode (cname="av_le2ne64", cheader_filename="ffmpeg/libavutil/bswap.h")]
public uint64 av_le2ne64 (uint64 x);

[CCode (cname="AV_BE2NEC", cheader_filename="ffmpeg/libavutil/bswap.h")]
public uint AV_BE2NEC (size_t s, uint x);

[CCode (cname="AV_LE2NEC", cheader_filename="ffmpeg/libavutil/bswap.h")]
public uint AV_LE2NEC (size_t s, uint x);

//  [CCode (cname="AV_BE2NE16C", cheader_filename="ffmpeg/libavutil/bswap.h")]
//  #define AV_BE2NE16C (uint x) AV_BE2NEC (16, x)
//  [CCode (cname="AV_BE2NE32C", cheader_filename="ffmpeg/libavutil/bswap.h")]
//  #define AV_BE2NE32C (uint x) AV_BE2NEC (32, x)
//  [CCode (cname="AV_BE2NE64C", cheader_filename="ffmpeg/libavutil/bswap.h")]
//  #define AV_BE2NE64C (uint x) AV_BE2NEC (64, x)
//  [CCode (cname="AV_LE2NE16C", cheader_filename="ffmpeg/libavutil/bswap.h")]
//  #define AV_LE2NE16C (uint x) AV_LE2NEC (16, x)
//  [CCode (cname="AV_LE2NE32C", cheader_filename="ffmpeg/libavutil/bswap.h")]
//  #define AV_LE2NE32C (uint x) AV_LE2NEC (32, x)
//  [CCode (cname="AV_LE2NE64C", cheader_filename="ffmpeg/libavutil/bswap.h")]
//  #define AV_LE2NE64C (uint x) AV_LE2NEC (64, x)

} // namespace LibAVUtil
