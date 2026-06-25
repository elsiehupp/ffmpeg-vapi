/***********************************************************
Copyright (C) 2001-2011 Michael Niedermayer <michaelni@gmx.at>

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
namespace LibSoftwareScale {

/***********************************************************
AV_STRINGIFY is too long
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
internal string STR (
    void *s
); // AV_TOSTRING (s)

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
internal const size_t DITHER1XBPP; //

/***********************************************************
Based on HAVE_BIGENDIAN
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
internal const int ALT32_CORR;

/***********************************************************
Based on ARCH_X86_64
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
internal const size_t APCK_PTR2;

/***********************************************************
Based on ARCH_X86_64
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
internal const size_t APCK_COEF;

/***********************************************************
Based on ARCH_X86_64
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
internal const size_t APCK_SIZE;

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
internal const int RETCODE_USE_CASCADE; // -12345

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswscale/swscale_internal.h")]
internal static inline void fillPlane16 (
    uint8[] plane,
    int stride,
    int width,
    int height,
    int y,
    int alpha,
    int bits,
    int big_endian
);
//  {
//      int i, j;

//      uint8[] ptr = plane + stride * y;

//      [CCode (cname="")]
//      int v = alpha ? 0xFFFF>>(16-bits) : (1<<(bits-1));

//      for (i = 0; i < height; i++) {
//  internal define FILL (wfunc) \
//          for (j = 0; j < width; j++) {\
//              wfunc (ptr+2*j, v);\
//          }
//          if (big_endian) {
//              FILL (AV_WB16);

//          } else {
//              FILL (AV_WL16);

//          }
//          ptr += stride;

//      }
//  }

} // namespace LibSoftwareScale
