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

namespace LibAVUtil {

/***********************************************************
@addtogroup LibAVUtil.Audio

@defgroup lavu_sampfmts Audio sample formats

Audio sample format enumeration and related convenience functions.
***********************************************************/

/***********************************************************
@brief Audio sample formats

- The data described by the sample format is always in native-endian order.
    Sample values can be expressed by native C types, hence the lack of a signed
    24-bit sample format even though it is a common raw audio data format.

- The floating-point formats are based on full volume being in the range
    [-1.0, 1.0]. Any values outside this range are beyond full volume level.

- The data layout as used in av_samples_fill_arrays () and elsewhere in FFmpeg
    (such as Frame in LibAVCodec) is as follows:

@par
For planar sample formats, each audio channel is in a separate data plane,
and linesize is the buffer size, in bytes, for a single plane. All data
planes must be the same size. For packed sample formats, only the first data
plane is used, and samples for each channel are interleaved. In this case,
linesize is the buffer size, in bytes, for the 1 plane.
***********************************************************/
[CCode (cheader_filename="ffmpeg/libavutil/samplefmt.h")]
public enum SampleFormat {
    [CCode (cname="AV_SAMPLE_FMT_NONE")]
    NONE,
    /***********************************************************
    @brief uint 8 bits
    ***********************************************************/
    [CCode (cname="AV_SAMPLE_FMT_U8")]
    UNSIGNED_8_BIT,
    /***********************************************************
    @brief signed 16 bits
    ***********************************************************/
    [CCode (cname="AV_SAMPLE_FMT_S16")]
    SIGNED_16_BIT,
    /***********************************************************
    @brief signed 32 bits
    ***********************************************************/
    [CCode (cname="AV_SAMPLE_FMT_S32")]
    SIGNED_32_BIT,
    /***********************************************************
    @brief float
    ***********************************************************/
    [CCode (cname="AV_SAMPLE_FMT_FLT")]
    FLOAT,
    /***********************************************************
    @brief double
    ***********************************************************/
    [CCode (cname="AV_SAMPLE_FMT_DBL")]
    DOUBLE,
    /***********************************************************
    @brief uint 8 bits, planar
    ***********************************************************/
    [CCode (cname="AV_SAMPLE_FMT_U8P")]
    UNSIGNED_8_BIT_PLANAR,
    /***********************************************************
    @brief signed 16 bits, planar
    ***********************************************************/
    [CCode (cname="AV_SAMPLE_FMT_S16P")]
    SIGNED_16_BIT_PLANAR,
    /***********************************************************
    @brief signed 32 bits, planar
    ***********************************************************/
    [CCode (cname="AV_SAMPLE_FMT_S32P")]
    SIGNED_32_BIT_PLANAR,
    /***********************************************************
    @brief float, planar
    ***********************************************************/
    [CCode (cname="AV_SAMPLE_FMT_FLTP")]
    FLOAT_PLANAR,
    /***********************************************************
    @brief double, planar
    ***********************************************************/
    [CCode (cname="AV_SAMPLE_FMT_DBLP")]
    DOUBLE_PLANAR,
    /***********************************************************
    @brief signed 64 bits
    ***********************************************************/
    [CCode (cname="AV_SAMPLE_FMT_S64")]
    AV_SAMPLE_FMT_S64,
    /***********************************************************
    @brief signed 64 bits, planar
    ***********************************************************/
    [CCode (cname="AV_SAMPLE_FMT_S64P")]
    SIGNED_64_BIT_PLANAR;
    /***********************************************************
    @brief Number of sample formats. DO NOT USE if linking dynamically
    ***********************************************************/
    //  AV_SAMPLE_FMT_NB;

    /***********************************************************
    @brief Return the name of sample_fmt, or null if sample_fmt is not
    recognized.
    ***********************************************************/
    [CCode (cname="av_get_sample_fmt_name", cheader_filename="ffmpeg/libavutil/samplefmt.h")]
    public static string av_get_sample_fmt_name (
        SampleFormat sample_fmt
    );

    /***********************************************************
    @brief Return a sample format corresponding to name, or SampleFormat.NONE
    on error.
    ***********************************************************/
    [CCode (cname="av_get_sample_fmt", cheader_filename="ffmpeg/libavutil/samplefmt.h")]
    public static SampleFormat av_get_sample_fmt (
        string name
    );

    /***********************************************************
    @brief Return the planar<->packed alternative form of the given sample format, or
    SampleFormat.NONE on error. If the passed sample_fmt is already in the
    requested planar/packed format, the format returned is the same as the
    input.
    ***********************************************************/
    [CCode (cname="av_get_alt_sample_fmt", cheader_filename="ffmpeg/libavutil/samplefmt.h")]
    public static SampleFormat av_get_alt_sample_fmt (
        SampleFormat sample_fmt,
        int planar
    );

    /***********************************************************
    @brief Get the packed alternative form of the given sample format.

    If the passed sample_fmt is already in packed format, the format returned is
    the same as the input.

    @return the packed alternative form of the given sample format or
        SampleFormat.NONE on error.
    ***********************************************************/
    [CCode (cname="av_get_packed_sample_fmt", cheader_filename="ffmpeg/libavutil/samplefmt.h")]
    public static SampleFormat av_get_packed_sample_fmt (
        SampleFormat sample_fmt
    );

    /***********************************************************
    @brief Get the planar alternative form of the given sample format.

    If the passed sample_fmt is already in planar format, the format returned is
    the same as the input.

    @return the planar alternative form of the given sample format or
        SampleFormat.NONE on error.
    ***********************************************************/
    [CCode (cname="av_get_planar_sample_fmt", cheader_filename="ffmpeg/libavutil/samplefmt.h")]
    public static SampleFormat av_get_planar_sample_fmt (
        SampleFormat sample_fmt
    );

    /***********************************************************
    @brief Generate a string corresponding to the sample format with
    sample_fmt, or a header if sample_fmt is negative.

    @param buffer the buffer where to write the string
    @param buf_size the size of buffer
    @param sample_fmt the number of the sample format to print the
    corresponding info string, or a negative value to print the
    corresponding header.
    @return the pointer to the filled buffer or null if sample_fmt is
    unknown or in case of other errors
    ***********************************************************/
    [CCode (cname="av_get_sample_fmt_string", cheader_filename="ffmpeg/libavutil/samplefmt.h")]
    public static string av_get_sample_fmt_string (
        string buffer,
        int buf_size,
        SampleFormat sample_fmt
    );

    /***********************************************************
    @brief Return number of bytes per sample.

    @param sample_fmt the sample format
    @return number of bytes per sample or zero if unknown for the given
    sample format
    ***********************************************************/
    [CCode (cname="av_get_bytes_per_sample", cheader_filename="ffmpeg/libavutil/samplefmt.h")]
    public static int av_get_bytes_per_sample (
        SampleFormat sample_fmt
    );

    /***********************************************************
    @brief Check if the sample format is planar.

    @param sample_fmt the sample format to inspect
    @return 1 if the sample format is planar, 0 if it is interleaved
    ***********************************************************/
    [CCode (cname="av_sample_fmt_is_planar", cheader_filename="ffmpeg/libavutil/samplefmt.h")]
    public static int av_sample_fmt_is_planar (
        SampleFormat sample_fmt
    );

    /***********************************************************
    @brief Get the required buffer size for the given audio parameters.

    @param[out] linesize calculated linesize, may be null
    @param nb_channels the number of channels
    @param nb_samples the number of samples in a single channel
    @param sample_fmt the sample format
    @param align buffer size alignment (0 = default, 1 = no alignment)
    @return required buffer size, or negative error code on failure
    ***********************************************************/
    [CCode (cname="av_samples_get_buffer_size", cheader_filename="ffmpeg/libavutil/samplefmt.h")]
    public static int av_samples_get_buffer_size (
        out int linesize,
        int nb_channels,
        int nb_samples,
        SampleFormat sample_fmt,
        int align
    );

    /***********************************************************
    @defgroup lavu_sampmanip Samples manipulation

    Functions that manipulate audio samples
    ***********************************************************/

    /***********************************************************
    @brief Fill plane data pointers and linesize for samples with sample
    format sample_fmt.

    The audio_data array is filled with the pointers to the samples data planes:
    for planar, set the start point of each channel's data within the buffer,
    for packed, set the start point of the entire buffer only.

    The value pointed to by linesize is set to the aligned size of each
    channel's data buffer for planar layout, or to the aligned size of the
    buffer for all channels for packed layout.

    The buffer in buffer must be big enough to contain all the samples
    (use av_samples_get_buffer_size () to compute its minimum size),
    otherwise the audio_data pointers will point to invalid data.

    @see @link SampleFormat
    The documentation for SampleFormat describes the data layout.

    @param[out] audio_data array to be filled with the pointer for each channel
    @param[out] linesize calculated linesize, may be null
    @param buffer the pointer to a buffer containing the samples
    @param nb_channels the number of channels
    @param nb_samples the number of samples in a single channel
    @param sample_fmt the sample format
    @param align buffer size alignment (0 = default, 1 = no alignment)
    @return        >=0 on success or a negative error code on failure
    @todo return minimum size in bytes required for the buffer in case
    of success at the next bump
    ***********************************************************/
    [CCode (cname="av_samples_fill_arrays", cheader_filename="ffmpeg/libavutil/samplefmt.h")]
    public static int av_samples_fill_arrays (
        out uint8[] audio_data,
        out int linesize,
        uint8[] buffer,
        int nb_channels,
        int nb_samples,
        SampleFormat sample_fmt,
        int align
    );

    /***********************************************************
    @brief Allocate a samples buffer for nb_samples samples, and fill data pointers and
    linesize accordingly.
    The allocated samples buffer can be freed by using av_freep (&audio_data[0])
    Allocated data will be initialized to silence.

    @see @link SampleFormat
    The documentation for SampleFormat describes the data layout.

    @param[out] audio_data array to be filled with the pointer for each channel
    @param[out] linesize aligned size for audio buffer (s), may be null
    @param nb_channels number of audio channels
    @param nb_samples number of samples per channel
    @param align buffer size alignment (0 = default, 1 = no alignment)
    @return        >=0 on success or a negative error code on failure
    @todo return the size of the allocated buffer in case of success at the next bump
    @see @link av_samples_fill_arrays ()
    @see @link av_samples_alloc_array_and_samples ()
    ***********************************************************/
    [CCode (cname="av_samples_alloc", cheader_filename="ffmpeg/libavutil/samplefmt.h")]
    public static int av_samples_alloc (
        out uint8[] audio_data,
        out int linesize,
        int nb_channels,
        int nb_samples,
        SampleFormat sample_fmt,
        int align
    );

    /***********************************************************
    @brief Allocate a data pointers array, samples buffer for nb_samples
    samples, and fill data pointers and linesize accordingly.

    This is the same as av_samples_alloc (), but also allocates the data
    pointers array.

    @see @link av_samples_alloc ()
    ***********************************************************/
    [CCode (cname="av_samples_alloc_array_and_samples", cheader_filename="ffmpeg/libavutil/samplefmt.h")]
    public static int av_samples_alloc_array_and_samples (
        out uint8[] audio_data,
        out int linesize,
        int nb_channels,
        int nb_samples,
        SampleFormat sample_fmt,
        int align
    );

    /***********************************************************
    @brief Copy samples from input_buffer to output_buffer.

    @param output_buffer destination array of pointers to data planes
    @param input_buffer source array of pointers to data planes
    @param output_offset offset in samples at which the data will be written to output_buffer
    @param input_offset offset in samples at which the data will be read from input_buffer
    @param nb_samples number of samples to be copied
    @param nb_channels number of audio channels
    @param sample_fmt audio sample format
    ***********************************************************/
    [CCode (cname="av_samples_copy", cheader_filename="ffmpeg/libavutil/samplefmt.h")]
    public static int av_samples_copy (
        out uint8[] output_buffer,
        out uint8[] input_buffer,
        int output_offset,
        int input_offset,
        int nb_samples,
        int nb_channels,
        SampleFormat sample_fmt
    );

    /***********************************************************
    @brief Fill an audio buffer with silence.

    @param audio_data array of pointers to data planes
    @param offset offset in samples at which to start filling
    @param nb_samples number of samples to fill
    @param nb_channels number of audio channels
    @param sample_fmt audio sample format
    ***********************************************************/
    [CCode (cname="av_samples_set_silence", cheader_filename="ffmpeg/libavutil/samplefmt.h")]
    public static int av_samples_set_silence (
        out uint8[] audio_data,
        int offset,
        int nb_samples,
        int nb_channels,
        SampleFormat sample_fmt
    );

}

} // namespace LibAVUtil
