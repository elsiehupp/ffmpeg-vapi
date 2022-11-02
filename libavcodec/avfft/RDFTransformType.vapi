/***********************************************************
@brief This file is part of FFmpeg.

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

namespace LibAVCodec {
using LibAVUtil;

/***********************************************************
@file
@ingroup lavc_fft
FFT functions
***********************************************************/

/***********************************************************
@defgroup lavc_fft FFT functions
@ingroup lavc_misc
***********************************************************/

/***********************************************************
Real Discrete Fourier Transform
***********************************************************/
[CCode (cprefix="", cheader_filename="ffmpeg/libavcodec/avfft.h")]
public enum RDFTransformType {
    DFT_R2C,
    IDFT_C2R,
    IDFT_R2C,
    DFT_C2R,
}

} // namespace LibAVCodec
