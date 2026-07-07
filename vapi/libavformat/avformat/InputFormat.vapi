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
@addtogroup lavf_decoding
@{
***********************************************************/
[CCode (cname="struct AVInputFormat",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public abstract class LibAVFormat.InputFormat {
    /***********************************************************
    @brief A comma separated list of short names for the format. New names
    may be appended with a minor bump.
    ***********************************************************/
    [CCode (cname="name")]
    public abstract string name { public get; }

    /***********************************************************
    @brief Descriptive name for the format, meant to be more human-readable
    than name. You should use the NULL_IF_CONFIG_SMALL () macro
    to define it.
    ***********************************************************/
    [CCode (cname="long_name")]
    public abstract string long_name { public get; }

    /***********************************************************
    @brief Can use flags:
        LibAVFormat.FormatFlags1.NO_FILE,
        LibAVFormat.FormatFlags1.NEED_NUMBER,
        LibAVFormat.FormatFlags1.SHOW_IDS,
        LibAVFormat.FormatFlags1.NO_TIMESTAMPS,
        LibAVFormat.FormatFlags1.USE_GENERIC_INDEX,
        LibAVFormat.FormatFlags1.ALLOWS_TIMESTAMP_DISCONTINUITIES,
        LibAVFormat.FormatFlags1.NO_BINARY_SEARCH,
        LibAVFormat.FormatFlags1.NO_GENERIC_SEARCH,
        LibAVFormat.FormatFlags1.NO_BYTE_SEEK,
        LibAVFormat.FormatFlags1.SEEK_TO_PTS.
    ***********************************************************/
    [CCode (cname="flags")]
    public abstract LibAVFormat.FormatFlags1 flags { public get; }

    /***********************************************************
    @brief If extensions are defined, then no probe is done. You should
    usually not use extension format guessing because it is not
    reliable enough
    ***********************************************************/
    [CCode (cname="extensions")]
    public abstract string extensions { public get; }

    [CCode (cname="codec_tag_list")]
    public LibAVFormat.CodecTag codec_tag_list;

    /***********************************************************
    @brief LibAVUtil.Log.Class for the private context
    ***********************************************************/
    [CCode (cname="priv_class")]
    public LibAVUtil.Log.Class priv_class;

    /***********************************************************
    @brief Comma-separated list of mime types.
    It is used check for matching mime types while probing.
    @see av_probe_input_format2
    ***********************************************************/
    [CCode (cname="mime_type")]
    public abstract string mime_type { public get; }

    /***********************************************************
    @brief No fields below this line are part of the public API. They
    may not be used outside of libavformat and can be changed and
    removed at will.
    New public fields should be added right above.
    ***********************************************************/
    [CCode (cname="next")]
    public LibAVFormat.InputFormat next;

    /***********************************************************
    @brief Raw demuxers store their codec ID here.
    ***********************************************************/
    [CCode (cname="raw_codec_id")]
    public abstract LibAVCodec.CodecID raw_codec_id { public get; }

    /***********************************************************
    @brief Size of private data so that it can be allocated in the wrapper.
    ***********************************************************/
    [CCode (cname="priv_data_size")]
    public abstract size_t priv_data_size { public get; }

    /***********************************************************
    @brief Tell if a given file has a chance of being parsed as this format.
    The buffer provided is guaranteed to be AVPROBE_PADDING_SIZE bytes
    big so you do not have to check for that unless you need more.
    ***********************************************************/
    [CCode (cname="read_probe")]
    public abstract int read_probe (
        LibAVFormat.ProbeData format_context
    );

    /***********************************************************
    @brief Read the format header and initialize the LibAVFormat.FormatContext
    structure. Return 0 if OK. 'avformat_new_stream' should be
    called to create new streams.
    ***********************************************************/
    [CCode (cname="read_header")]
    public abstract int read_header (
        LibAVFormat.FormatContext format_context
    );

    /***********************************************************
    @brief Read one packet and put it in 'packet'. pts and flags are also
    set. 'avformat_new_stream' can be called only if the flag
    LibAVFormat.FormatContextFlags.NO_HEADER is used and only in the calling thread (not in a
    background thread).
    @return 0 on success, < 0 on error.
            When returning an error, packet must not have been allocated
            or must be freed before returning
    ***********************************************************/
    [CCode (cname="read_packet")]
    public abstract int read_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    /***********************************************************
    @brief Close the stream. The LibAVFormat.FormatContext and AVStreams are not
    freed by this function
    ***********************************************************/
    [CCode (cname="read_close")]
    public abstract int read_close (
        LibAVFormat.FormatContext format_context
    );

    /***********************************************************
    @brief Seek to a given timestamp relative to the frames in
    stream component stream_index.
    @param stream_index Must not be -1.
    @param flags Selects which direction should be preferred if no exact
                 match is available.
    @return >= 0 on success (but not necessarily the new offset)
    ***********************************************************/
    [CCode (cname="read_seek")]
    public abstract int read_seek (
        LibAVFormat.FormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    /***********************************************************
    @brief Get the next timestamp in stream[stream_index].time_base units.
    @return the timestamp or AV_NOPTS_VALUE if an error occurred
    ***********************************************************/
    [CCode (cname="read_timestamp")]
    public abstract int64 read_timestamp (
        LibAVFormat.FormatContext format_context,
        int stream_index,
        int64[] pos,
        int64 pos_limit
    );

    /***********************************************************
    @brief Start/resume playing - only meaningful if using a network-based format
    (RTSP).
    ***********************************************************/
    [CCode (cname="read_play")]
    public abstract int read_play (
        LibAVFormat.FormatContext format_context
    );

    /***********************************************************
    @brief Pause playing - only meaningful if using a network-based format
    (RTSP).
    ***********************************************************/
    [CCode (cname="read_pause")]
    public abstract int read_pause (
        LibAVFormat.FormatContext format_context
    );

    /***********************************************************
    @brief Seek to timestamp ts.
    Seeking will be done so that the point from which all active streams
    can be presented successfully will be closest to ts and within min/max_ts.
    Active streams are all streams that have LibAVFormat.Stream.discard < AVDISCARD_ALL.
    ***********************************************************/
    [CCode (cname="read_seek2")]
    public abstract int read_seek2 (
        LibAVFormat.FormatContext format_context,
        int stream_index,
        int64 min_ts,
        int64 ts,
        int64 max_ts,
        int flags
    );

    /***********************************************************
    @brief Returns device list with it properties.
    @see avdevice_list_devices () for more details.
    ***********************************************************/
    [CCode (cname="get_device_list")]
    public abstract int get_device_list (
        LibAVFormat.FormatContext format_context,
        LibAVFormat.DeviceInfoList device_list
    );

    /***********************************************************
    @brief Initialize device capabilities submodule.
    @see avdevice_capabilities_create () for more details.
    ***********************************************************/
    [CCode (cname="create_device_capabilities")]
    public abstract int create_device_capabilities (
        LibAVFormat.FormatContext format_context,
        LibAVFormat.DeviceCapabilitiesQuery caps
    );

    /***********************************************************
    @brief Free device capabilities submodule.
    @see avdevice_capabilities_free () for more details.
    ***********************************************************/
    [CCode (cname="free_device_capabilities")]
    public abstract int free_device_capabilities (
        LibAVFormat.FormatContext format_context,
        LibAVFormat.DeviceCapabilitiesQuery caps
    );

    /***********************************************************
    @brief Iterate over all registered demuxers.

    @param opaque a pointer where libavformat will store the iteration state. Must
                  point to NULL to start the iteration.

    @return the next registered demuxer or NULL when the iteration is
            finished
    ***********************************************************/
    [CCode (cname="av_demuxer_iterate",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public LibAVFormat.InputFormat? av_demuxer_iterate (
        out void *opaque
    );

    /***********************************************************
    @addtogroup lavf_decoding
    @{
    ***********************************************************/

    /***********************************************************
    @brief Find LibAVFormat.InputFormat based on the short name of the input format.
    ***********************************************************/
    [CCode (cname="av_find_input_format",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public LibAVFormat.InputFormat? av_find_input_format (
        string short_name
    );

    /***********************************************************
    @}
    ***********************************************************/

}

/***********************************************************
@}
***********************************************************/

} // namespace LibAVFormat

/***********************************************************
@addtogroup lavf_decoding
@{
***********************************************************/
typedef struct LibAVFormat.InputFormat {
    /***********************************************************
    Descriptive name for the format, meant to be more human-readable
    than name. You should use the NULL_IF_CONFIG_SMALL () macro
    to define it.
    ***********************************************************/
    const string long_name;

    /***********************************************************
    Can use flags:
        * LibAVFormat.FormatFlags1.NO_FILE,
        * LibAVFormat.FormatFlags1.NEED_NUMBER,
        * LibAVFormat.FormatFlags1.SHOW_IDS,
        * LibAVFormat.FormatFlags1.NO_TIMESTAMPS,
        * LibAVFormat.FormatFlags1.USE_GENERIC_INDEX,
        * LibAVFormat.FormatFlags1.ALLOWS_TIMESTAMP_DISCONTINUITIES,
        * LibAVFormat.FormatFlags1.NO_BINARY_SEARCH,
        * LibAVFormat.FormatFlags1.NO_GENERIC_SEARCH,
        * LibAVFormat.FormatFlags1.NO_BYTE_SEEK,
        * LibAVFormat.FormatFlags1.SEEK_TO_PTS.
    ***********************************************************/
    LibAVFormat.FormatFlags1 flags;

    /***********************************************************
    If extensions are defined, then no probe is done. You should
    usually not use extension format guessing because it is not
    reliable enough
    ***********************************************************/
    const string extensions;

    const struct LibAVFormat.CodecTag * const *codec_tag;

    const LibAVUtil.Log.Class *priv_class; ///< LibAVUtil.Log.Class for the private context

    /***********************************************************
    Comma-separated list of mime types.
    It is used check for matching mime types while probing.
    @see av_probe_input_format2
    ***********************************************************/
    const string mime_type;
} LibAVFormat.InputFormat;
/***********************************************************
@}
***********************************************************/
