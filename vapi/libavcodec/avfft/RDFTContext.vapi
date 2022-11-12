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
@brief Real Discrete Fourier Transform
***********************************************************/
[CCode (cname="struct RDFTContext", cheader_filename="ffmpeg/libavcodec/avfft.h")]
public struct RDFTContext {
    /***********************************************************
    @brief Set up a real FFT.
    @param nbits log2 of the length of the input array
    @param trans the type of transform
        ***********************************************************/
    [CCode (cname="av_rdft_init", cheader_filename="ffmpeg/libavcodec/avfft.h")]
    public RDFTContext av_rdft_init (
        int nbits,
        RDFTransformType trans
    );

    [CCode (cname="av_rdft_calc", cheader_filename="ffmpeg/libavcodec/avfft.h")]
    public void av_rdft_calc (
        RDFTContext s,
        FFTSample data
    );

    [CCode (cname="av_rdft_end", cheader_filename="ffmpeg/libavcodec/avfft.h")]
    public void av_rdft_end (
        RDFTContext s
    );
}

} // namespace LibAVCodec
