/***********************************************************
@brief Audio FIFO
@copyright 2012 Justin Ruggles <justin.ruggles@gmail.com>

This file is part of FFmpeg.

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

namespace LibAVUtil {

/***********************************************************
@file
Audio FIFO Buffer
***********************************************************/

/***********************************************************
@addtogroup LibAVUtil.Audio

@defgroup lavu_audiofifo Audio FIFO Buffer
***********************************************************/

/***********************************************************
@brief Context for an Audio FIFO Buffer.

- Operates at the sample level rather than the byte level.
- Supports multiple channels with either planar or packed sample format.
- Automatic reallocation when writing to a full buffer.
***********************************************************/
[CCode (cname="struct AVAudioFifo", cheader_filename="libavcodec/audio_fifo.h")]
public struct AudioFifo {

    /***********************************************************
    @brief Free an AudioFifo.

    @param audio_fifo AudioFifo to free
    ***********************************************************/
    [CCode (cname="av_audio_fifo_free", cheader_filename="libavcodec/audio_fifo.h")]
    public void av_audio_fifo_free (
        AudioFifo audio_fifo
    );

    /***********************************************************
    @brief Allocate an AudioFifo.

    @param sample_fmt sample format
    @param channels number of channels
    @param nb_samples initial allocation size, in samples
    @return newly allocated AudioFifo, or null on error
    ***********************************************************/
    AudioFifo av_audio_fifo_alloc (
        SampleFormat sample_fmt,
        int channels,
        int nb_samples
    );

    /***********************************************************
    @brief Reallocate an AudioFifo.

    @param audio_fifo AudioFifo to reallocate
    @param nb_samples new allocation size, in samples
    @return 0 if OK, or negative LibAVUtil.ErrorCode code on failure
    ***********************************************************/
    //  av_warn_unused_result
    [CCode (cname="av_audio_fifo_realloc", cheader_filename="libavcodec/audio_fifo.h")]
    public int av_audio_fifo_realloc (
        AudioFifo audio_fifo,
        int nb_samples
    );

    /***********************************************************
    @brief Write data to an AudioFifo.

    The AudioFifo will be reallocated automatically if the available space
    is less than nb_samples.

    @see @link SampleFormat
    The documentation for SampleFormat describes the data layout.

    @param audio_fifo AudioFifo to write to
    @param data audio data plane pointers
    @param nb_samples number of samples to write
    @return number of samples actually written, or negative LibAVUtil.ErrorCode
        code on failure. If successful, the number of samples
        actually written will always be nb_samples.
    ***********************************************************/
    [CCode (cname="av_audio_fifo_write", cheader_filename="libavcodec/audio_fifo.h")]
    public int av_audio_fifo_write (
        AudioFifo audio_fifo,
        out void *data,
        int nb_samples
    );

    /***********************************************************
    @brief Peek data from an AudioFifo.

    @see @link SampleFormat
    The documentation for SampleFormat describes the data layout.

    @param audio_fifo AudioFifo to read from
    @param data audio data plane pointers
    @param nb_samples number of samples to peek
    @return number of samples actually peek, or negative LibAVUtil.ErrorCode code
        on failure. The number of samples actually peek will not
        be greater than nb_samples, and will only be less than
        nb_samples if av_audio_fifo_size is less than nb_samples.
    ***********************************************************/
    [CCode (cname="av_audio_fifo_peek", cheader_filename="libavcodec/audio_fifo.h")]
    public int av_audio_fifo_peek (
        AudioFifo audio_fifo,
        out void *data,
        int nb_samples
    );

    /***********************************************************
    @brief Peek data from an AudioFifo.

    @see @link SampleFormat
    The documentation for SampleFormat describes the data layout.

    @param audio_fifo AudioFifo to read from
    @param data audio data plane pointers
    @param nb_samples number of samples to peek
    @param offset offset from current read position
    @return number of samples actually peek, or negative LibAVUtil.ErrorCode code
        on failure. The number of samples actually peek will not
        be greater than nb_samples, and will only be less than
        nb_samples if av_audio_fifo_size is less than nb_samples.
    ***********************************************************/
    [CCode (cname="av_audio_fifo_peek_at", cheader_filename="libavcodec/audio_fifo.h")]
    public int av_audio_fifo_peek_at (
        AudioFifo audio_fifo,
        out void *data,
        int nb_samples,
        int offset
    );

    /***********************************************************
    @brief Read data from an AudioFifo.

    @see @link SampleFormat
    The documentation for SampleFormat describes the data layout.

    @param audio_fifo AudioFifo to read from
    @param data audio data plane pointers
    @param nb_samples number of samples to read
    @return number of samples actually read, or negative LibAVUtil.ErrorCode code
        on failure. The number of samples actually read will not
        be greater than nb_samples, and will only be less than
        nb_samples if av_audio_fifo_size is less than nb_samples.
    ***********************************************************/
    [CCode (cname="av_audio_fifo_read", cheader_filename="libavcodec/audio_fifo.h")]
    public int av_audio_fifo_read (
        AudioFifo audio_fifo,
        out void *data,
        int nb_samples
    );

    /***********************************************************
    @brief Drain data from an AudioFifo.

    Removes the data without reading it.

    @param audio_fifo AudioFifo to drain
    @param nb_samples number of samples to drain
    @return 0 if OK, or negative LibAVUtil.ErrorCode code on failure
    ***********************************************************/
    [CCode (cname="av_audio_fifo_drain", cheader_filename="libavcodec/audio_fifo.h")]
    public int av_audio_fifo_drain (
        AudioFifo audio_fifo,
        int nb_samples
    );

    /***********************************************************
    @brief Reset the AudioFifo buffer.

    This empties all data in the buffer.

    @param audio_fifo AudioFifo to reset
    ***********************************************************/
    [CCode (cname="av_audio_fifo_reset", cheader_filename="libavcodec/audio_fifo.h")]
    public void av_audio_fifo_reset (
        AudioFifo audio_fifo
    );

    /***********************************************************
    @brief Get the current number of samples in the AudioFifo available for reading.

    @param audio_fifo the AudioFifo to query
    @return number of samples available for reading
    ***********************************************************/
    [CCode (cname="av_audio_fifo_size", cheader_filename="libavcodec/audio_fifo.h")]
    public int av_audio_fifo_size (
        AudioFifo audio_fifo
    );

    /***********************************************************
    @brief Get the current number of samples in the AudioFifo available for writing.

    @param audio_fifo the AudioFifo to query
    @return number of samples available for writing
    ***********************************************************/
    [CCode (cname="av_audio_fifo_space", cheader_filename="libavcodec/audio_fifo.h")]
    public int av_audio_fifo_space (
        AudioFifo audio_fifo
    );

}

} // namespace LibAVUtil
