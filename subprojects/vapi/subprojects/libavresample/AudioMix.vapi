/***********************************************************
Copyright (c) 2012 Justin Ruggles <justin.ruggles@gmail.com>

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
namespace LibAVResample {

[CCode (cname="struct AudioMix",cheader_filename="subprojects/ffmpeg/libavresample/internal.h")]
[Compact]
internal class LibAVResample.AudioMix {

    [CCode (cname="mix_func",cheader_filename="subprojects/ffmpeg/libavresample/audio_mix.h")]
    internal delegate void MixDelegate (
        uint8[][] src,
        void **matrix,
        int len,
        int out_ch,
        int in_ch
    );

    /***********************************************************
    Set mixing function if the parameters match.

    This compares the parameters of the mixing function to the parameters in the
    LibAVResample.AudioMix context. If the parameters do not match, no changes are made to the
    active functions. If the parameters do match and the alignment is not
    constrained, the function is set as the generic mixing function. If the
    parameters match and the alignment is constrained, the function is set as
    the optimized mixing function.

    @param am             LibAVResample.AudioMix context
    @param fmt            input/output sample format
    @param coeff_type     mixing coefficient type
    @param in_channels    number of input channels, or 0 for any number of channels
    @param out_channels   number of output channels, or 0 for any number of channels
    @param ptr_align      buffer pointer alignment, in bytes
    @param samples_align  buffer size alignment, in samples
    @param descr          function type description (e.g. "C" or "SSE")
    @param mix_func       mixing function pointer
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/audio_mix.h")]
    internal void ff_audio_mix_set_func (
        LibAVResample.AudioMix? am,
        LibAVUtil.SampleFormat fmt,
        LibAVResample.AudioMixCoeffType coeff_type,
        int in_channels,
        int out_channels,
        int ptr_align,
        int samples_align,
        string descr,
        MixDelegate mix_func
    );

    /***********************************************************
    Allocate and initialize an LibAVResample.AudioMix context.

    The parameters in the LibAVResample.AudioResampleContext are used to initialize the
    LibAVResample.AudioMix context.

    @param avr  LibAVResample.AudioResampleContext
    @return     newly-allocated LibAVResample.AudioMix context.
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/audio_mix.h")]
    internal LibAVResample.AudioMix? ff_audio_mix_alloc (
        LibAVResample.AudioResampleContext? avr
    );

    /***********************************************************
    Free an LibAVResample.AudioMix context.
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/audio_mix.h")]
    internal void ff_audio_mix_free (
        LibAVResample.AudioMix **am
    );

    /***********************************************************
    Apply channel mixing to audio data using the current mixing matrix.
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/audio_mix.h")]
    internal int ff_audio_mix (
        LibAVResample.AudioMix? am,
        LibAVResample.AudioData? src
    );

    /***********************************************************
    Get the current mixing matrix.
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/audio_mix.h")]
    internal int ff_audio_mix_get_matrix (
        LibAVResample.AudioMix? am,
        double[] matrix,
        int stride
    );

    /***********************************************************
    Set the current mixing matrix.
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/audio_mix.h")]
    internal int ff_audio_mix_set_matrix (
        LibAVResample.AudioMix? am,
        double[] matrix,
        int stride
    );

    /***********************************************************
    arch-specific initialization functions
    ***********************************************************/

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/audio_mix.h")]
    internal void ff_audio_mix_init_x86 (
        LibAVResample.AudioMix? am
    );

}

} // namespace LibAVResample
