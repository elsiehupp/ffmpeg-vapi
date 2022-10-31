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

[CCode (cname="struct FFTContext", cheader_filename="libavcodec/avfft.h")]
public struct FFTContext {
    /***********************************************************
    @brief Set up a complex FFT.
    @param nbits log2 of the length of the input array
    @param inverse if 0 perform the forward transform, if 1 perform the inverse
    ***********************************************************/
    [CCode (cname="av_fft_init", cheader_filename="libavcodec/avfft.h")]
    public FFTContext av_fft_init (
        int nbits,
        int inverse
    );

    /***********************************************************
    @brief Do the permutation needed BEFORE calling ff_fft_calc ().
    ***********************************************************/
    [CCode (cname="av_fft_permute", cheader_filename="libavcodec/avfft.h")]
    public void av_fft_permute (
        FFTContext fft_context,
        FFTComplex z
    );

    /***********************************************************
    @brief Do a complex FFT with the parameters defined in av_fft_init (). The
    input data must be permuted before. No 1.0/sqrt (n) normalization is done.
    ***********************************************************/
    [CCode (cname="av_fft_calc", cheader_filename="libavcodec/avfft.h")]
    public void av_fft_calc (
        FFTContext fft_context,
        FFTComplex z
    );

    [CCode (cname="av_fft_end", cheader_filename="libavcodec/avfft.h")]
    public void av_fft_end (
        FFTContext fft_context
    );

    [CCode (cname="av_mdct_init", cheader_filename="libavcodec/avfft.h")]
    public FFTContext av_mdct_init (
        int nbits,
        int inverse,
        double scale
    );

    [CCode (cname="av_imdct_calc", cheader_filename="libavcodec/avfft.h")]
    public void av_imdct_calc (
        FFTContext fft_context,
        out FFTSample output,
        FFTSample input
    );

    [CCode (cname="av_imdct_half", cheader_filename="libavcodec/avfft.h")]
    public void av_imdct_half (
        FFTContext fft_context,
        out FFTSample output,
        FFTSample input
    );

    [CCode (cname="av_mdct_calc", cheader_filename="libavcodec/avfft.h")]
    public void av_mdct_calc (
        FFTContext fft_context,
        out FFTSample output,
        FFTSample input
    );

    [CCode (cname="av_mdct_end", cheader_filename="libavcodec/avfft.h")]
    public void av_mdct_end (
        FFTContext fft_context
    );
}

} // namespace LibAVCodec
