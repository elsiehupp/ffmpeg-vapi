/***********************************************************
audio conversion
Copyright (c) 2006 Michael Niedermayer <michaelni@gmx.at>
Copyright (c) 2008 Peter Ross

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
Audio format conversion routines
***********************************************************/
namespace LibSoftwareResample {

[CCode (cname="struct AudioConvert",cheader_filename="subprojects/ffmpeg/libswresample/audioconvert.h")]
[Compact]
internal class LibSoftwareResample.AudioConvert {
    [CCode (cname="")]
    internal int channels;

    [CCode (cname="")]
    internal int in_simd_align_mask;

    [CCode (cname="")]
    internal int out_simd_align_mask;

    [CCode (cname="conv_func_type",cheader_filename="subprojects/ffmpeg/libswresample/audioconvert.h")]
    internal delegate void ConvDelegate (
        uint8[] po,
        uint8[] pi,
        int is,
        int os,
        uint8[] end
    );

    [CCode (cname="")]
    internal ConvDelegate? conv_f;

    [CCode (cname="simd_func_type",cheader_filename="subprojects/ffmpeg/libswresample/audioconvert.h")]
    internal delegate void SimdDelegate (
        ref uint8[] dst,
        ref uint8[] src,
        int len
    );

    [CCode (cname="")]
    internal SimdDelegate? simd_f;

    [CCode (cname="")]
    internal int[] ch_map;

    /***********************************************************
    silence input sample
    ***********************************************************/
    [CCode (cname="")]
    internal uint8 silence[8];

    /***********************************************************
    Create an audio sample format converter context
    @param out_fmt Output sample format
    @param in_fmt Input sample format
    @param channels Number of channels
    @param flags See AV_CPU_FLAG_xx
    @param ch_map list of the channels id to pick from the source stream, NULL
                if all channels must be selected
    @return NULL on error
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/audioconvert.h")]
    internal LibSoftwareResample.AudioConvert? swri_audio_convert_alloc (
        LibAVUtil.SampleFormat out_fmt,
        LibAVUtil.SampleFormat in_fmt,
        int channels,
        int[] ch_map,
        int flags
    );

    /***********************************************************
    Free audio sample format converter context.
    and set the pointer to NULL
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/audioconvert.h")]
    internal void swri_audio_convert_free (
        LibSoftwareResample.AudioConvert **audio_convert_context
    );

    /***********************************************************
    Convert between audio sample formats
    @param[in] out array of output buffers for each channel. set to NULL to ignore processing of the given channel.
    @param[in] in array of input buffers for each channel
    @param len length of audio frame size (measured in samples)
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/audioconvert.h")]
    internal int swri_audio_convert (
        LibSoftwareResample.AudioConvert? audio_convert_context,
        LibSoftwareResample.AudioData? out,
        LibSoftwareResample.AudioData? in,
        int len
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/swresample_internal.h")]
    internal void swri_audio_convert_init_aarch64 (
        LibSoftwareResample.AudioConvert? ac,
        LibAVUtil.SampleFormat out_fmt,
        LibAVUtil.SampleFormat in_fmt,
        int channels
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/swresample_internal.h")]
    internal void swri_audio_convert_init_arm (
        LibSoftwareResample.AudioConvert? ac,
        LibAVUtil.SampleFormat out_fmt,
        LibAVUtil.SampleFormat in_fmt,
        int channels
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/swresample_internal.h")]
    internal void swri_audio_convert_init_x86 (
        LibSoftwareResample.AudioConvert? ac,
        LibAVUtil.SampleFormat out_fmt,
        LibAVUtil.SampleFormat in_fmt,
        int channels
    );

}

} // namespace LibSoftwareResample
