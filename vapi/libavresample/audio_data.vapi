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

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/audio_data.h")]
public int ff_sample_fmt_is_planar (
    AVSampleFormat sample_fmt,
    int channels
);

/***********************************************************
Audio buffer used for intermediate storage between conversion phases.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/audio_data.h")]
[Compact]
public class AudioData {
    /***********************************************************
    AVClass for logging
    ***********************************************************/
    [CCode (cname="")]
    public AVClass class;

    /***********************************************************
    data plane pointers
    ***********************************************************/
    [CCode (cname="")]
    public int8[] data[AVRESAMPLE_MAX_CHANNELS];

    /***********************************************************
    data buffer
    ***********************************************************/
    [CCode (cname="")]
    public uint8[] buffer;

    /***********************************************************
    allocated buffer size
    ***********************************************************/
    [CCode (cname="")]
    public uint buffer_size;

    /***********************************************************
    number of samples the buffer can hold
    ***********************************************************/
    [CCode (cname="")]
    public int allocated_samples;

    /***********************************************************
    current number of samples
    ***********************************************************/
    [CCode (cname="")]
    public int nb_samples;

    /***********************************************************
    sample format
    ***********************************************************/
    [CCode (cname="")]
    public AVSampleFormat sample_fmt;

    /***********************************************************
    channel count
    ***********************************************************/
    [CCode (cname="")]
    public int channels;

    /***********************************************************
    allocated channel count
    ***********************************************************/
    [CCode (cname="")]
    public int allocated_channels;

    /***********************************************************
    sample format is planar
    ***********************************************************/
    [CCode (cname="")]
    public int is_planar;

    /***********************************************************
    number of data planes
    ***********************************************************/
    [CCode (cname="")]
    public int planes;

    /***********************************************************
    bytes per sample
    ***********************************************************/
    [CCode (cname="")]
    public int sample_size;

    /***********************************************************
    sample byte offset within a plane
    ***********************************************************/
    [CCode (cname="")]
    public int stride;

    /***********************************************************
    data is read-only
    ***********************************************************/
    [CCode (cname="")]
    public int read_only;

    /***********************************************************
    realloc is allowed
    ***********************************************************/
    [CCode (cname="")]
    public int allow_realloc;

    /***********************************************************
    minimum data pointer alignment
    ***********************************************************/
    [CCode (cname="")]
    public int ptr_align;

    /***********************************************************
    allocated samples alignment
    ***********************************************************/
    [CCode (cname="")]
    public int samples_align;

    /***********************************************************
    name for debug logging
    ***********************************************************/
    [CCode (cname="")]
    public string name;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/audio_data.h")]
public int ff_audio_data_set_channels (
    AudioData? a,
    int channels
);

/***********************************************************
Initialize AudioData using a given source.

This does not allocate an internal buffer. It only sets the data pointers
and audio parameters.

@param a               AudioData struct
@param src             source data pointers
@param plane_size      plane size, in bytes.
                       This can be 0 if unknown, but that will lead to
                       optimized functions not being used in many cases,
                       which could slow down some conversions.
@param channels        channel count
@param nb_samples      number of samples in the source data
@param sample_fmt      sample format
@param read_only       indicates if buffer is read only or read/write
@param name            name for debug logging (can be NULL)
@return                0 on success, negative AVERROR value on error
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/audio_data.h")]
public int ff_audio_data_init (
    AudioData? a,
    uint8[]  const? src,
    int plane_size,
    int channels,
    int nb_samples,
    AVSampleFormat sample_fmt,
    int read_only,
    string name
);

/***********************************************************
Allocate AudioData.

This allocates an internal buffer and sets audio parameters.

@param channels        channel count
@param nb_samples      number of samples to allocate space for
@param sample_fmt      sample format
@param name            name for debug logging (can be NULL)
@return                newly allocated AudioData struct, or NULL on error
***********************************************************/
AudioData? ff_audio_data_alloc (
    int channels,
    int nb_samples,
    AVSampleFormat sample_fmt,
    string name
);

/***********************************************************
Reallocate AudioData.

The AudioData must have been previously allocated with ff_audio_data_alloc ().

@param a           AudioData struct
@param nb_samples  number of samples to allocate space for
@return            0 on success, negative AVERROR value on error
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/audio_data.h")]
public int ff_audio_data_realloc (
    AudioData? a,
    int nb_samples
);

/***********************************************************
Free AudioData.

The AudioData must have been previously allocated with ff_audio_data_alloc ().

@param a  AudioData struct
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/audio_data.h")]
public void ff_audio_data_free (
    AudioData **a
);

/***********************************************************
Copy data from one AudioData to another.

@param out  output AudioData
@param in   input AudioData
@param map  channel map, NULL if not remapping
@return     0 on success, negative AVERROR value on error
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/audio_data.h")]
public int ff_audio_data_copy (
    AudioData? out,
    AudioData? in,
    ChannelMapInfo? map
);

/***********************************************************
Append data from one AudioData to the end of another.

@param dst         destination AudioData
@param dst_offset  offset, in samples, to start writing, relative to the
                   start of dst
@param src         source AudioData
@param src_offset  offset, in samples, to start copying, relative to the
                   start of the src
@param nb_samples  number of samples to copy
@return            0 on success, negative AVERROR value on error
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/audio_data.h")]
public int ff_audio_data_combine (
    AudioData? dst,
    int dst_offset,
    AudioData? src,
    int src_offset,
    int nb_samples
);

/***********************************************************
Drain samples from the start of the AudioData.

Remaining samples are shifted to the start of the AudioData.

@param a           AudioData struct
@param nb_samples  number of samples to drain
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/audio_data.h")]
public void ff_audio_data_drain (
    AudioData? a,
    int nb_samples
);

/***********************************************************
Add samples in AudioData to an AVAudioFifo.

@param af          Audio FIFO Buffer
@param a           AudioData struct
@param offset      number of samples to skip from the start of the data
@param nb_samples  number of samples to add to the FIFO
@return            number of samples actually added to the FIFO, or
                   negative AVERROR code on error
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/audio_data.h")]
public int ff_audio_data_add_to_fifo (
    AVAudioFifo? af,
    AudioData? a,
    int offset,
    int nb_samples
);

/***********************************************************
Read samples from an AVAudioFifo to AudioData.

@param af          Audio FIFO Buffer
@param a           AudioData struct
@param nb_samples  number of samples to read from the FIFO
@return            number of samples actually read from the FIFO, or
                   negative AVERROR code on error
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/audio_data.h")]
public int ff_audio_data_read_from_fifo (
    AVAudioFifo? af,
    AudioData? a,
    int nb_samples
);
