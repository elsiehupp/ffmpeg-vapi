/***********************************************************
Copyright (c) 2006 Michael Niedermayer <michaelni@gmx.at>

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
pixel format definitions
***********************************************************/

//  #include "libavutil/avconfig.h"
//  #include "version.h"

namespace LibAVUtil {

/***********************************************************
Visual content value range.

These values are based on definitions that can be found in multiple
specifications, such as ITU-T BT.709 (3.4 - Quantization of RGB, luminance
and colour-difference signals), ITU-T BT.2020 (Table 5 - Digital
Representation) as well as ITU-T BT.2100 (Table 9 - Digital 10- and 12-bit
integer representation). At the time of writing, the BT.2100 one is
recommended, as it also defines the full range representation.

Common definitions:
  - For RGB and luma planes such as Y in YCbCr and I in ICtCp,
    'E' is the original value in range of 0.0 to 1.0.
  - For chroma planes such as Cb,Cr and Ct,Cp, 'E' is the original
    value in range of -0.5 to 0.5.
  - 'n' is the output bit depth.
  - For additional definitions such as rounding and clipping to valid n
    bit unsigned integer range, please refer to BT.2100 (Table 9).
***********************************************************/
[CCode (cname="enum AVColorRange",cheader_filename="subprojects/ffmpeg/libavutil/pixfmt.h")]
public enum ColorRange {
    [CCode (cname="AVCOL_RANGE_UNSPECIFIED")]
    UNSPECIFIED, // 0

    /***********************************************************
    Narrow or limited range content.

    - For luma planes:

          (219 * E + 16) * 2^(n-8)

      F.ex. the range of 16-235 for 8 bits

    - For chroma planes:

          (224 * E + 128) * 2^(n-8)

      F.ex. the range of 16-240 for 8 bits
    ***********************************************************/
    [CCode (cname="AVCOL_RANGE_MPEG")]
    MPEG, // 1

    /***********************************************************
    Full range content.

    - For RGB and luma planes:

          (2^n - 1) * E

      F.ex. the range of 0-255 for 8 bits

    - For chroma planes:

          (2^n - 1) * E + 2^(n - 1)

      F.ex. the range of 1-255 for 8 bits
    ***********************************************************/
    [CCode (cname="AVCOL_RANGE_JPEG")]
    JPEG, // 2

    /***********************************************************
    @brief Not part of ABI
    ***********************************************************/
    [CCode (cname="AVCOL_RANGE_NB")]
    NB;
}

} // namespace LibAVUtil
