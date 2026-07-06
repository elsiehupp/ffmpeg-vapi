/***********************************************************
@copyright 2001 Fabrice Bellard
***********************************************************/
/***********************************************************
@brief This file is part of FFmpeg.

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

namespace LibAVFormat {

/***********************************************************
@file @ingroup libavf
Main libavformat public API header
***********************************************************/

/***********************************************************
@addtogroup lavf_encoding
@{
***********************************************************/
[CCode (cname="struct AVOutputFormat",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public abstract class LibAVFormat.OutputFormat {
    [CCode (cname="name")]
    public abstract string name { public get; }

    /***********************************************************
    @brief Descriptive name for the format, meant to be more human-readable
    than name. You should use the NULL_IF_CONFIG_SMALL () macro
    to define it.
    ***********************************************************/
    [CCode (cname="")]
    public abstract string long_name { public get; }

    [CCode (cname="")]
    public abstract string mime_type { public get; }

    /***********************************************************
    @brief Comma-separated filename extensions
    ***********************************************************/
    [CCode (cname="")]
    public abstract string extensions { public get; }

    /***********************************************************
    @brief Output support
    ***********************************************************/

    /***********************************************************
    @brief Default audio codec
    ***********************************************************/
    [CCode (cname="")]
    public abstract LibAVCodec.CodecID audio_codec { public get; }

    /***********************************************************
    @brief Default video codec
    ***********************************************************/
    [CCode (cname="")]
    public abstract LibAVCodec.CodecID video_codec { public get; }

    /***********************************************************
    @brief Default subtitle codec
    ***********************************************************/
    [CCode (cname="")]
    public abstract LibAVCodec.CodecID subtitle_codec { public get; }

    /***********************************************************
    @brief Can use flags:
        LibAVFormat.FormatFlags1.NO_FILE,
        LibAVFormat.FormatFlags1.NEED_NUMBER,
        LibAVFormat.FormatFlags1.WANTS_GLOBAL_HEADER,
        LibAVFormat.FormatFlags1.NO_TIMESTAMPS,
        LibAVFormat.FormatFlags1.ALLOWS_VARIABLE_FPS,
        LibAVFormat.FormatFlags1.NO_DIMENSIONS,
        LibAVFormat.FormatFlags1.NO_STREAMS,
        LibAVFormat.FormatFlags1.ALLOWS_FLUSH,
        LibAVFormat.FormatFlags1.ALLOW_NON_STRICT_TIMESTAMPS,
        LibAVFormat.FormatFlags1.ALLOW_NEGATIVE_TIMESTAMPS
    ***********************************************************/
    [CCode (cname="")]
    public abstract LibAVFormat.FormatFlags1 flags { public get; }

    /***********************************************************
    @brief List of supported codec_id-codec_tag_list pairs, ordered by "better
    choice first". The arrays are all terminated by LibAVCodec.CodecID.NONE.
    ***********************************************************/
    [CCode (cname="codec_tag",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public abstract LibAVFormat.CodecTag[] codec_tag_list { public get; }


    /***********************************************************
    @brief LibAVUtil.Log.Class for the private context
    ***********************************************************/
    [CCode (cname="")]
    public abstract LibAVUtil.Log.Class priv_class { public get; }

    /***********************************************************
    @brief No fields below this line are part of the public API. They
    may not be used outside of libavformat and can be changed and
    removed at will.
    New public fields should be added right above.
    ***********************************************************/
    [CCode (cname="")]
    public LibAVFormat.OutputFormat next;

    /***********************************************************
    @brief Size of private data so that it can be allocated in the wrapper
    ***********************************************************/
    [CCode (cname="")]
    public abstract size_t priv_data_size { public get; }

    [CCode (cname="")]
    public abstract int write_header (
        LibAVFormat.FormatContext format_context
    );

    /***********************************************************
    @brief Write a packet. If LibAVFormat.FormatFlags1.ALLOWS_FLUSH is set in flags,
    packet can be NULL in order to flush data buffered in the muxer.
    When flushing, return 0 if there still is more data to flush,
    or 1 if everything was flushed and there is no more buffered
    data.
    ***********************************************************/
    [CCode (cname="")]
    public abstract int write_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="")]
    public abstract int write_trailer (
        LibAVFormat.FormatContext format_context
    );

    /***********************************************************
    @brief Currently only used to set pixel format if not YUV420P.
    ***********************************************************/
    [CCode (cname="")]
    public abstract int interleave_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet output,
        LibAVCodec.Packet input,
        int flush
    );

    /***********************************************************
    @brief Test if the given codec can be stored in this container.

    @return 1 if the codec is supported, 0 if it is not.
            A negative number if unknown.
            MKTAG ('A', 'P', 'I', 'C') if the codec is only supported as LibAVFormat.DispositionFlags.ATTACHED_PIC
    ***********************************************************/
    [CCode (cname="")]
    public abstract int query_codec (
        LibAVCodec.CodecID id,
        int std_compliance
    );

    [CCode (cname="")]
    public abstract void get_output_timestamp (
        LibAVFormat.FormatContext format_context,
        int stream,
        int64[] dts,
        int64[] wall
    );

    /***********************************************************
    @brief Allows sending messages from application to device.
    ***********************************************************/
    [CCode (cname="")]
    public abstract int control_message (
        LibAVFormat.FormatContext format_context,
        int type,
        void *data,
        size_t data_size
    );

    /***********************************************************
    @brief Write an uncoded LibAVUtil.Frame.

    See av_write_uncoded_frame () for details.

    The library will free frame afterwards, but the muxer can prevent it
    by setting the pointer to NULL.
    ***********************************************************/
    [CCode (cname="")]
    public abstract int write_uncoded_frame (
        LibAVFormat.FormatContext format_context,
        int stream_index,
        LibAVUtil.Frame frame,
        uint flags
    );

    /***********************************************************
    @brief Returns device list with it properties.
    @see avdevice_list_devices () for more details.
    ***********************************************************/
    [CCode (cname="")]
    public abstract int get_device_list (
        LibAVFormat.FormatContext format_context,
        LibAVFormat.DeviceInfoList device_list
    );

    /***********************************************************
    @brief Initialize device capabilities submodule.
    @see avdevice_capabilities_create () for more details.
    ***********************************************************/
    [CCode (cname="")]
    public abstract int create_device_capabilities (
        LibAVFormat.FormatContext format_context,
        LibAVFormat.DeviceCapabilitiesQuery caps
    );

    /***********************************************************
    @brief Free device capabilities submodule.
    @see avdevice_capabilities_free () for more details.
    ***********************************************************/
    [CCode (cname="")]
    public abstract int free_device_capabilities (
        LibAVFormat.FormatContext format_context,
        LibAVFormat.DeviceCapabilitiesQuery caps
    );

    /***********************************************************
    @brief Default data codec
    ***********************************************************/
    [CCode (cname="")]
    public abstract LibAVCodec.CodecID data_codec { public get; }

    /***********************************************************
    @brief Initialize format. May allocate data here, and set any LibAVFormat.FormatContext or
    LibAVFormat.Stream parameters that need to be set before packets are sent.
    This method must not write output.

    Return 0 if streams were fully configured, 1 if not, negative LibAVUtil.ErrorCode on failure

    Any allocations made here must be freed in deinit ().
    ***********************************************************/
    [CCode (cname="")]
    public abstract int init (
        LibAVFormat.FormatContext format_context
    );

    /***********************************************************
    @brief Deinitialize format. If present, this is called whenever the muxer is being
    destroyed, regardless of whether or not the header has been written.

    If a trailer is being written, this is called after write_trailer ().

    This is called if init () fails as well.
    ***********************************************************/
    [CCode (cname="")]
    public abstract void deinit (
        LibAVFormat.FormatContext format_context
    );

    /***********************************************************
    @brief Set up any necessary bitstream filtering and extract any extra data needed
    for the global header.
    Return 0 if more packets from this stream must be checked; 1 if not.
    ***********************************************************/
    [CCode (cname="")]
    public abstract int check_bitstream (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    /***********************************************************
    @brief Iterate over all registered muxers.

    @param opaque a pointer where libavformat will store the iteration state. Must
                  point to NULL to start the iteration.

    @return the next registered muxer or NULL when the iteration is
            finished
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public LibAVFormat.OutputFormat? av_muxer_iterate (
        out void *opaque
    );

    /***********************************************************
    @brief Generate an SDP for an RTP session.

    Note, this overwrites the id values of AVStreams in the muxer contexts
    for getting unique dynamic payload types.

    @param ac array of AVFormatContexts describing the RTP streams. If the
              array is composed by only one context, such context can contain
              multiple AVStreams (one LibAVFormat.Stream per RTP stream). Otherwise,
              all the contexts in the array (an LibAVCodec.CodecContext per RTP stream)
              must contain only one LibAVFormat.Stream.
    @param n_files number of AVCodecContexts contained in ac
    @param buffer buffer where the SDP will be stored (must be allocated by
               the caller)
    @param size the size of the buffer
    @return 0 if OK, LibAVUtil.ErrorCode.xxx on error
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public int av_sdp_create (
        out LibAVFormat.FormatContext[] ac,
        int n_files,
        string buffer,
        int size
    );

    /***********************************************************
    @brief Return the output format in the list of registered output formats
    which best matches the provided parameters, or return NULL if
    there is no match.

    @param short_name if non-NULL checks if short_name matches with the
    names of the registered formats
    @param filename if non-NULL checks if filename terminates with the
    extensions of the registered formats
    @param mime_type if non-NULL checks if mime_type matches with the
    MIME type of the registered formats
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public LibAVFormat.OutputFormat? av_guess_format (
        string short_name,
        string filename,
        string mime_type
    );

    /***********************************************************
    @brief Guess the codec ID based upon muxer and filename.
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public LibAVCodec.CodecID av_guess_codec (
        LibAVFormat.OutputFormat? fmt,
        string short_name,
        string filename,
        string mime_type,
        LibAVUtil.MediaType type
    );

    /***********************************************************
    @brief Test if the given container can store a codec.

    @param output_format container to check for compatibility
    @param codec_id codec to potentially store in container
    @param std_compliance standards compliance level, one of StrictStandardsCompliance.*

    @return 1 if codec with ID codec_id can be stored in output_format, 0 if it cannot.
            A negative number if this information is not available.
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public int avformat_query_codec (
        LibAVFormat.OutputFormat? output_format,
        LibAVCodec.CodecID codec_id,
        int std_compliance
    );

    /***********************************************************
    @brief Transfer internal timing information from one stream to another.

    This function is useful when doing stream copy.

    @param output_format target output format for output_stream
    @param output_stream output stream which needs timings copy and adjustments
    @param input_stream reference input stream to copy timings from
    @param copy_time_base_source define from where the stream codec timebase needs to be imported
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public int avformat_transfer_internal_stream_timing_info (
        LibAVFormat.OutputFormat? output_format,
        LibAVFormat.Stream? output_stream,
        LibAVFormat.Stream? input_stream,
        LibAVFormat.TimeBaseSource copy_time_base_source
    );

}

/***********************************************************
@}
***********************************************************/

} // namespace LibAVFormat

/***********************************************************
@addtogroup lavf_encoding
@{
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avformat.h")]
typedef struct AVOutputFormat {
    const string name;
    /***********************************************************
    Descriptive name for the format, meant to be more human-readable
    than name. You should use the NULL_IF_CONFIG_SMALL () macro
    to define it.
    ***********************************************************/
    const string long_name;
    const string mime_type;
    const string extensions; /**< comma-separated filename extensions */
    /* output support */
    enum LibAVCodec.CodecID audio_codec;    /**< default audio codec */
    enum LibAVCodec.CodecID video_codec;    /**< default video codec */
    enum LibAVCodec.CodecID subtitle_codec; /**< default subtitle codec */
    /***********************************************************
    can use flags:
        * LibAVFormat.FormatFlags1.NO_FILE,
        * LibAVFormat.FormatFlags1.NEED_NUMBER,
        * LibAVFormat.FormatFlags1.WANTS_GLOBAL_HEADER,
        * LibAVFormat.FormatFlags1.NO_TIMESTAMPS,
        * LibAVFormat.FormatFlags1.ALLOWS_VARIABLE_FPS,
        * LibAVFormat.FormatFlags1.NO_DIMENSIONS,
        * LibAVFormat.FormatFlags1.NO_STREAMS,
        * LibAVFormat.FormatFlags1.ALLOW_NON_STRICT_TIMESTAMPS,
        * LibAVFormat.FormatFlags1.ALLOW_NEGATIVE_TIMESTAMPS
    ***********************************************************/
    LibAVFormat.FormatFlags1 flags;

    /***********************************************************
    List of supported codec_id-codec_tag pairs, ordered by "better
    choice first". The arrays are all terminated by AV_CODEC_ID_NONE.
    ***********************************************************/
    const struct LibAVFormat.CodecTag * const *codec_tag;


    const LibAVUtil.Log.Class *priv_class; ///< LibAVUtil.Log.Class for the private context
} AVOutputFormat;
/***********************************************************
@}
***********************************************************/
