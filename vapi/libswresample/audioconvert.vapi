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

[CCode (cname="conv_func_type",cheader_filename="subprojects/ffmpeg/libswresample/audioconvert.h")]
public delegate void ConvDelegate (
    uint8[] po,
    uint8[] pi,
    int is,
    int os,
    uint8[] end
);

[CCode (cname="simd_func_type",cheader_filename="subprojects/ffmpeg/libswresample/audioconvert.h")]
public delegate void SimdDelegate (
    uint8[][] dst,
    uint8[][] src,
    int len
);

[CCode (cname="struct AudioConvert",cheader_filename="subprojects/ffmpeg/libswresample/audioconvert.h")]
[Compact]
public class AudioConvert {
    [CCode (cname="")]
    public int channels;

    [CCode (cname="")]
    public int in_simd_align_mask;

    [CCode (cname="")]
    public int out_simd_align_mask;

    [CCode (cname="")]
    public ConvDelegate? conv_f;

    [CCode (cname="")]
    public SimdDelegate? simd_f;

    [CCode (cname="")]
    public int[] ch_map;

    /***********************************************************
    silence input sample
    ***********************************************************/
    [CCode (cname="")]
    public uint8 silence[8];
}

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
public AudioConvert? swri_audio_convert_alloc (
    AVSampleFormat out_fmt,
    AVSampleFormat in_fmt,
    int channels,
    int[] ch_map,
    int flags
);

/***********************************************************
Free audio sample format converter context.
and set the pointer to NULL
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/audioconvert.h")]
public void swri_audio_convert_free (
    AudioConvert **audio_convert_context
);

/***********************************************************
Convert between audio sample formats
@param[in] out array of output buffers for each channel. set to NULL to ignore processing of the given channel.
@param[in] in array of input buffers for each channel
@param len length of audio frame size (measured in samples)
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/audioconvert.h")]
public int swri_audio_convert (
    AudioConvert? audio_convert_context,
    AudioData? out,
    AudioData? in,
    int len
);
