/***********************************************************
Copyright (c) Stefano Sabatini | stefasab at gmail.com
Copyright (c) S.N. Hemanth Meenakshisundaram | smeenaks at ucsd.edu

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
namespace LibAVFilter {

[CCode (cname="ff_packed_sample_fmts_array",cheader_filename="subprojects/ffmpeg/libavfilter/audio.h")]
public static const LibAVUtil.SampleFormat ff_packed_sample_fmts_array[];
//  = {
//      LibAVUtil.SampleFormat.UNSIGNED_8_BIT,
//      LibAVUtil.SampleFormat.SIGNED_16_BIT,
//      LibAVUtil.SampleFormat.SIGNED_32_BIT,
//      LibAVUtil.SampleFormat.FLOAT,
//      LibAVUtil.SampleFormat.DOUBLE,
//      LibAVUtil.SampleFormat.NONE
//  };

[CCode (cname="ff_planar_sample_fmts_array",cheader_filename="subprojects/ffmpeg/libavfilter/audio.h")]
public static const LibAVUtil.SampleFormat ff_planar_sample_fmts_array[];
//   = {
//      LibAVUtil.SampleFormat.UNSIGNED_8_BIT_PLANAR,
//      LibAVUtil.SampleFormat.SIGNED_16_BIT_PLANAR,
//      LibAVUtil.SampleFormat.SIGNED_32_BIT_PLANAR,
//      LibAVUtil.SampleFormat.FLOAT_PLANAR,
//      LibAVUtil.SampleFormat.DOUBLE_PLANAR,
//      LibAVUtil.SampleFormat.NONE
//  };

/***********************************************************
default handler for get_audio_buffer () for audio inputs
***********************************************************/
[CCode (cname="ff_default_get_audio_buffer",cheader_filename="subprojects/ffmpeg/libavfilter/audio.h")]
public AVFrame? ff_default_get_audio_buffer (
    LibAVFilter.FilterLink? link,
    int nb_samples
);

/***********************************************************
get_audio_buffer () handler for filters which simply pass audio along
***********************************************************/
[CCode (cname="ff_null_get_audio_buffer",cheader_filename="subprojects/ffmpeg/libavfilter/audio.h")]
public AVFrame? ff_null_get_audio_buffer (
    LibAVFilter.FilterLink? link,
    int nb_samples
);

/***********************************************************
Request an audio samples buffer with a specific set of permissions.

@param link           the output link to the filter from which the buffer will
                      be requested
@param nb_samples     the number of samples per channel
@return               A reference to the samples. This must be unreferenced with
                      avfilter_unref_buffer when you are finished with it.
***********************************************************/
[CCode (cname="ff_get_audio_buffer",cheader_filename="subprojects/ffmpeg/libavfilter/audio.h")]
public AVFrame? ff_get_audio_buffer (
    LibAVFilter.FilterLink? link,
    int nb_samples
);

} // namespace LibAVFilter
