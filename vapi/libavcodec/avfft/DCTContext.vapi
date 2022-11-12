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
@file @ingroup lavc_fft
FFT functions
***********************************************************/

/***********************************************************
@defgroup lavc_fft FFT functions
@ingroup lavc_misc
***********************************************************/

/***********************************************************
@brief Discrete Cosine Transform
***********************************************************/
[CCode (cname="struct DCTContext", cheader_filename="ffmpeg/libavcodec/avfft.h")]
public struct DCTContext {

    /***********************************************************
    @brief Set up DCT.

    @param nbits size of the input array:
        (1 << nbits)     for DCT-II, DCT-III and DST-I
        (1 << nbits) + 1 for DCT-I
    @param type the type of transform

    @note the first element of the input of DST-I is ignored
        ***********************************************************/
    [CCode (cname="av_dct_init", cheader_filename="ffmpeg/libavcodec/avfft.h")]
    public DCTContext av_dct_init (
        int nbits,
        DCTTransformType type
    );

    [CCode (cname="av_dct_calc", cheader_filename="ffmpeg/libavcodec/avfft.h")]
    public void av_dct_calc (
        DCTContext dct_context,
        FFTSample data
    );

    [CCode (cname="av_dct_end", cheader_filename="ffmpeg/libavcodec/avfft.h")]
    public void av_dct_end (
        DCTContext dct_context
    );
}

} // namespace LibAVCodec
