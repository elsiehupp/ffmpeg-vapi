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

[CCode (cname="struct DitherContext",cheader_filename="subprojects/ffmpeg/libavresample/dither.h")]
[Compact]
internal class LibAVResample.DitherContext {

    /***********************************************************
    Allocate and initialize a LibAVResample.DitherContext.

    The parameters in the LibAVResample.AudioResampleContext are used to initialize the
    LibAVResample.DitherContext.

    @param avr  LibAVResample.AudioResampleContext
    @return     newly-allocated LibAVResample.DitherContext
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/dither.h")]
    internal LibAVResample.DitherContext? ff_dither_alloc (
        LibAVResample.AudioResampleContext? avr,
        AVSampleFormat out_fmt,
        AVSampleFormat in_fmt,
        int channels,
        int sample_rate,
        int apply_map
    );

    /***********************************************************
    Free a LibAVResample.DitherContext.

    @param c  LibAVResample.DitherContext
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/dither.h")]
    internal void ff_dither_free (
        LibAVResample.DitherContext **c
    );

    /***********************************************************
    Convert audio sample format with dithering.

    @param c    LibAVResample.DitherContext
    @param dst  destination audio data
    @param src  source audio data
    @return     0 if ok, negative AVERROR code on failure
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/dither.h")]
    internal int ff_convert_dither (
        LibAVResample.DitherContext? c,
        LibAVResample.AudioData? dst,
        LibAVResample.AudioData? src
    );

}

} // namespace LibAVResample
