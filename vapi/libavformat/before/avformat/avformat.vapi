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
@defgroup libavf libavformat
I/O and Muxing/Demuxing Library

Libavformat (lavf) is a library for dealing with various media container
formats. Its main two purposes are demuxing - i.e. splitting a media file
public into component streams, and the reverse process of muxing - writing supplied
data in a specified container format. It also has an @ref lavf_io
"I/O module" which supports a number of protocols for accessing the data (e.g.
file, tcp, http and others).
Unless you are absolutely sure you won't use libavformat's network
capabilities, you should also call avformat_network_init ().

A supported input format is described by an LibAVFormat.InputFormat struct, conversely
an output format is described by LibAVFormat.OutputFormat. You can iterate over all
input/output formats using the av_demuxer_iterate / av_muxer_iterate () functions.
The protocols layer is not part of the public API, so you can only get the names
of supported protocols with the avio_enum_protocols () function.

Main lavf structure used for both muxing and demuxing is LibAVFormat.FormatContext,
which exports all information about the file being read or written. As with
most Libavformat structures, its size is not part of public ABI, so it cannot be
allocated on stack or directly with av_malloc (). To create an
LibAVFormat.FormatContext, use avformat_alloc_context () (some functions, like
avformat_open_input () might do that for you).

Most importantly an LibAVFormat.FormatContext contains:
@li the @ref LibAVFormat.FormatContext.iformat "input" or @ref LibAVFormat.FormatContext.oformat
"output" format. It is either autodetected or set by user for input;
always set by user for output.
@li an @ref LibAVFormat.FormatContext.streams "array" of AVStreams, which describe all
elementary streams stored in the file. AVStreams are typically referred to
using their index in this array.
@li an @ref LibAVFormat.FormatContext.pb "I/O context". It is either opened by lavf or
set by user for input, always set by user for output (unless you are dealing
with an AVFormatFlags1.NO_FILE format).

@section lavf_options Passing options to (de)muxers
It is possible to configure lavf muxers and demuxers using the @ref avoptions
mechanism. Generic (format-independent) libavformat options are provided by
LibAVFormat.FormatContext, they can be examined from a user program by calling
av_opt_next () / av_opt_find () on an allocated LibAVFormat.FormatContext (or its LibAVUtil.Log.Class
from avformat_get_class ()). Private (format-specific) options are provided by
LibAVFormat.FormatContext.priv_data if and only if LibAVFormat.InputFormat.priv_class /
LibAVFormat.OutputFormat.priv_class of the corresponding format struct is non-NULL.
Further options may be provided by the @ref LibAVFormat.FormatContext.pb "I/O context"
if its LibAVUtil.Log.Class is non-NULL, and the protocols layer. See the discussion on
nesting in @ref avoptions documentation to learn how to access those.

@section urls
URL strings in libavformat are made of a scheme/protocol, a ':', and a
scheme specific string. URLs without a scheme and ':' used for local files
are supported but deprecated. "file:" should be used for local files.

It is important that the scheme string is not taken from untrusted
sources without checks.

Note that some schemes/protocols are quite powerful, allowing access to
both local and remote files, parts of them, concatenations of them, local
audio and video devices and so on.

@{

@defgroup lavf_decoding Demuxing
@{
Demuxers read a media file and split it into chunks of data (@em packets). A
@ref LibAVCodec.Packet "packet" contains one or more encoded frames which belongs to a
single elementary stream. In the lavf API this process is represented by the
avformat_open_input () function for opening a file, av_read_frame () for
reading a single packet and finally avformat_close_input (), which does the
cleanup.

@section lavf_decoding_open Opening a media file
The minimum information required to open a file is its URL, which
is passed to avformat_open_input (), as in the following code:
@code
string url = "file:in.mp3";
LibAVFormat.FormatContext format_context = NULL;
public int ret = avformat_open_input (&format_context, url, NULL, NULL);
if (ret < 0)
    abort ();
@endcode
The above code attempts to allocate an LibAVFormat.FormatContext, open the
specified file (autodetecting the format) and read the header, exporting the
information stored there into format_context. Some formats do not have a header or do not
store enough information there, so it is recommended that you call the
avformat_find_stream_info () function which tries to read and decode a few
frames to find missing information.

In some cases you might want to preallocate an LibAVFormat.FormatContext yourself with
avformat_alloc_context () and do some tweaking on it before passing it to
avformat_open_input (). One such case is when you want to use custom functions
for reading input data instead of lavf internal I/O layer.
To do that, create your own AVIOContext with avio_alloc_context (), passing
your reading callbacks to it. Then set the @em pb field of your
LibAVFormat.FormatContext to newly created AVIOContext.

Since the format of the opened file is in general not known until after
avformat_open_input () has returned, it is not possible to set demuxer private
options on a preallocated context. Instead, the options should be passed to
avformat_open_input () wrapped in an LibAVUtil.Dictionary:
@code
LibAVUtil.Dictionary options = NULL;
av_dict_set (&options, "video_size", "640x480",
        0);
av_dict_set (&options, "pixel_format", "rgb24",
        0);

if (avformat_open_input (&format_context, url, NULL, &options) < 0)
    abort ();
av_dict_free (&options);
@endcode
This code passes the private options 'video_size' and 'pixel_format' to the
demuxer. They would be necessary for e.g. the rawvideo demuxer, since it
cannot know how to interpret raw video data otherwise. If the format turns
out to be something different than raw video, those options will not be
recognized by the demuxer and therefore will not be applied. Such unrecognized
options are then returned in the options dictionary (recognized options are
consumed). The calling program can handle such unrecognized options as it
wishes, e.g.
@code
LibAVUtil.DictionaryEntry dict_entry;
if (dict_entry = av_dict_get (options, "", NULL, AV_DICT_IGNORE_SUFFIX)) {
    fprintf (stderr, "Option %s not recognized by the demuxer.\n", dict_entry.key);
    abort ();
}
@endcode

After you have finished reading the file, you must close it with
avformat_close_input (). It will free everything associated with the file.

@section lavf_decoding_read Reading from an opened file
Reading data from an opened LibAVFormat.FormatContext is done by repeatedly calling
av_read_frame () on it. Each call, if successful, will return an LibAVCodec.Packet
containing encoded data for one LibAVFormat.Stream, identified by
LibAVCodec.Packet.stream_index. This packet may be passed straight into the libavcodec
decoding functions avcodec_send_packet () or avcodec_decode_subtitle2 () if the
caller wishes to decode the data.

LibAVCodec.Packet.pts, LibAVCodec.Packet.dts and LibAVCodec.Packet.duration timing information will be
set if known. They may also be unset (i.e. AV_NOPTS_VALUE for
pts/dts, 0 for duration) if the stream does not provide them. The timing
information will be in LibAVFormat.Stream.time_base units, i.e. it has to be
multiplied by the timebase to convert them to seconds.

If LibAVCodec.Packet.buffer is set on the returned packet, then the packet is
allocated dynamically and the user may keep it indefinitely.
Otherwise, if LibAVCodec.Packet.buffer is NULL, the packet data is backed by a
static storage somewhere inside the demuxer and the packet is only valid
until the next av_read_frame () call or closing the file. If the caller
requires a longer lifetime, av_packet_make_refcounted () will ensure that
the data is reference counted, copying the data if necessary.
In both cases, the packet must be freed with av_packet_unref () when it is no
longer needed.

@section lavf_decoding_seek Seeking
@}

@defgroup lavf_encoding Muxing
@{
Muxers take encoded data in the form of @ref LibAVCodec.Packet "AVPackets" and write
it into files or other output bytestreams in the specified container format.

The main API functions for muxing are avformat_write_header () for writing the
file header, av_write_frame () / av_interleaved_write_frame () for writing the
packets and av_write_trailer () for finalizing the file.

At the beginning of the muxing process, the caller must first call
avformat_alloc_context () to create a muxing context. The caller then sets up
the muxer by filling the various fields in this context:

- The @ref LibAVFormat.FormatContext.oformat "oformat" field must be set to select the
muxer that will be used.
- Unless the format is of the AVFormatFlags1.NO_FILE type, the @ref LibAVFormat.FormatContext.pb
"pb" field must be set to an opened IO context, either returned from
avio_open2 () or a custom one.
- Unless the format is of the AVFormatFlags1.NO_STREAMS type, at least one stream must
be created with the avformat_new_stream () function. The caller should fill
the @ref LibAVFormat.Stream.codecpar "stream codec parameters" information, such as the
codec @ref LibAVCodec.CodecParameters.codec_type "type", @ref LibAVCodec.CodecParameters.codec_id
"id" and other parameters (e.g. width / height, the pixel or sample format,
etc.) as known. The @ref LibAVFormat.Stream.time_base "stream timebase" should
be set to the timebase that the caller desires to use for this stream (note
that the timebase actually used by the muxer can be different, as will be
described later).
- It is advised to manually initialize only the relevant fields in
LibAVCodec.CodecParameters, rather than using @ref avcodec_parameters_copy () during
remuxing: there is no guarantee that the codec context values remain valid
for both input and output format contexts.
- The caller may fill in additional information, such as @ref
LibAVFormat.FormatContext.metadata "global" or @ref LibAVFormat.Stream.metadata "per-stream"
metadata, @ref LibAVFormat.FormatContext.chapters "chapters", @ref
LibAVFormat.FormatContext.programs "programs", etc. as described in the
LibAVFormat.FormatContext documentation. Whether such information will actually be
stored in the output depends on what the container format and the muxer
support.

When the muxing context is fully set up, the caller must call
avformat_write_header () to initialize the muxer internals and write the file
header. Whether anything actually is written to the IO context at this step
depends on the muxer, but this function must always be called. Any muxer
private options must be passed in the options parameter to this function.

The data is then sent to the muxer by repeatedly calling av_write_frame () or
av_interleaved_write_frame () (consult those functions' documentation for
discussion on the difference between them; only one of them may be used with
a single muxing context, they should not be mixed). Do note that the timing
information on the packets sent to the muxer must be in the corresponding
LibAVFormat.Stream's timebase. That timebase is set by the muxer (in the
avformat_write_header () step) and may be different from the timebase
requested by the caller.

Once all the data has been written, the caller must call av_write_trailer ()
to flush any buffered packets and finalize the output file, then close the IO
context (if any) and finally free the muxing context with
avformat_free_context ().
@}

@defgroup lavf_io I/O Read/Write
@{
@section lavf_io_dirlist Directory listing
The directory listing API makes it possible to list files on remote servers.

Some of possible use cases:
- an "open file" dialog to choose files from a remote location,
- a recursive media finder providing a player with an ability to play all
files from a given directory.

@subsection lavf_io_dirlist_open Opening a directory
At first, a directory needs to be opened by calling avio_open_dir ()
supplied with a URL and, optionally, ::LibAVUtil.Dictionary containing
protocol-specific parameters. The function returns zero or positive
public integer and allocates AVIODirContext on success.

@code
AVIODirContext dir_context = NULL;
if (avio_open_dir (&dir_context, "smb://example.com/some_dir", NULL) < 0) {
    fprintf (stderr, "Cannot open directory.\n");
    abort ();
}
@endcode

This code tries to open a sample directory using smb protocol without
any additional parameters.

@subsection lavf_io_dirlist_read Reading entries
Each directory's entry (i.e. file, another directory, anything else
within ::AVIODirEntryType) is represented by AVIODirEntry.
Reading consecutive entries from an opened AVIODirContext is done by
repeatedly calling avio_read_dir () on it. Each call returns zero or
positive integer if successful. Reading can be stopped right after the
NULL entry has been read -- it means there are no entries left to be
read. The following code reads all entries from a directory associated
with dir_context and prints their names to standard output.
@code
AVIODirEntry entry = NULL;
for (;;) {
    if (avio_read_dir (dir_context, &entry) < 0) {
        fprintf (stderr, "Cannot list directory.\n");
        abort ();
    }
    if (!entry)
        break;
    printf ("%s\n", entry.name);
    avio_free_directory_entry (&entry);
}
@endcode
@}

@defgroup lavf_codec Demuxers
@{
@defgroup lavf_codec_native Native Demuxers
@{
@}
@defgroup lavf_codec_wrappers External library wrappers
@{
@}
@}
@defgroup lavf_protos I/O Protocols
@{
@}
@defgroup lavf_internal Internal
@{
@}
@}
***********************************************************/

[CCode (cname="struct AVDeviceInfoList",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
[Compact]
public class LibAVFormat.DeviceInfoList { }

[CCode (cname="struct AVDeviceCapabilitiesQuery",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
[Compact]
public class LibAVFormat.DeviceCapabilitiesQuery { }

/***********************************************************
@defgroup metadata_api Public Metadata API
@{
@ingroup libavf
The metadata API allows libavformat to export metadata tags to a client
application when demuxing. Conversely it allows a client application to
set metadata when muxing.

Metadata is exported or set as pairs of key/value strings in the 'metadata'
fields of the LibAVFormat.FormatContext, LibAVFormat.Stream, LibAVFormat.Chapter and LibAVFormat.Program structs
using the @ref lavu_dict "LibAVUtil.Dictionary" API. Like all strings in FFmpeg,
metadata is assumed to be UTF-8 encoded Unicode. Note that metadata
exported by demuxers isn't checked to be valid UTF-8 in most cases.

Important concepts to keep in mind:
-  Keys are unique; there can never be 2 tags with the same key. This is
    also meant semantically, i.e., a demuxer should not knowingly produce
    several keys that are literally different but semantically identical.
    E.g., key=Author5, key=Author6. In this example, all authors must be
    placed in the same tag.
-  Metadata is flat, not hierarchical; there are no subtags. If you
    want to store, e.g., the email address of the child of producer Alice
    and actor Bob, that could have key=alice_and_bobs_childs_email_address.
-  Several modifiers can be applied to the tag name. This is done by
    appending a dash character ('-') and the modifier name in the order
    they appear in the list below -- e.g. foo-eng-sort, not foo-sort-eng.
    -  language -- a tag whose value is localized for a particular language
      is appended with the ISO 639-2/B 3-letter language code.
      For example: Author-ger=Michael, Author-eng=Mike
      The original/default language is in the unqualified "Author" tag.
      A demuxer should set a default if it sets any translated tag.
    -  sorting -- a modified version of a tag that should be used for
      sorting will have '-sort' appended. E.g. artist="The Beatles"
      artist-sort="Beatles, The".
- Some protocols and demuxers support metadata updates. After a successful
call to av_read_packet (), LibAVFormat.FormatContext.event_flags or LibAVFormat.Stream.event_flags
will be updated to indicate if metadata changed. In order to detect metadata
changes on a stream, you need to loop through all streams in the LibAVFormat.FormatContext
and check their individual event_flags.

-  Demuxers attempt to export metadata in a generic format, however tags
    with no generic equivalents are left as they are stored in the container.
    Follows a list of generic tag names:

@verbatim
album -- name of the set this work belongs to
album_artist -- main creator of the set/album, if different from artist.
                 e.g. "Various Artists" for compilation albums.
artist -- main creator of the work
comment -- any additional description of the file.
composer -- who composed the work, if different from artist.
copyright -- name of copyright holder.
creation_time-- date when the file was created, preferably in ISO 8601.
date -- date when the work was created, preferably in ISO 8601.
disc -- number of a subset, e.g. disc in a multi-disc collection.
encoder -- name/settings of the software/hardware that produced the file.
encoded_by -- person/group who created the file.
filename -- original name of the file.
genre -- <self-evident>.
language -- main language in which the work is performed, preferably
                 in ISO 639-2 format. Multiple languages can be specified by
                 separating them with commas.
performer -- artist who performed the work, if different from artist.
                 E.g for "Also sprach Zarathustra", artist would be "Richard
                 Strauss" and performer "London Philharmonic Orchestra".
publisher -- name of the label/publisher.
service_name -- name of the service in broadcasting (channel name).
service_provider -- name of the service provider in broadcasting.
title -- name of the work.
track -- number of this work in the set, can be in form current/total.
variant_bitrate -- the total bitrate of the bitrate variant that the current stream is part of
@endverbatim

Look in the examples section for an application example how to use the Metadata API.

@}
***********************************************************/

/***********************************************************
@brief Packet functions
***********************************************************/


/***********************************************************
@brief Allocate and read the payload of a packet and initialize its
fields with default values.

@param io_context associated IO context
@param packet packet
@param size desired payload size
@return >0 (read size) if OK, LibAVUtil.ErrorCode.xxx otherwise
***********************************************************/
[CCode (cname="av_get_packet",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public int av_get_packet (
    AVIOContext io_context,
    LibAVCodec.Packet packet,
    int size
);


/***********************************************************
@brief Read data and append it to the current content of the LibAVCodec.Packet.
If packet.size is 0 this is identical to av_get_packet.
Note that this uses av_grow_packet and thus involves a realloc
which is inefficient. Thus this function should only be used
when there is no reasonable way to know (an upper bound of)
the final size.

@param io_context associated IO context
@param packet packet
@param size amount of data to read
@return >0 (read size) if OK, LibAVUtil.ErrorCode.xxx otherwise, previous data
    will not be lost even if an error occurs.
***********************************************************/
[CCode (cname="av_append_packet",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public int av_append_packet (
    AVIOContext io_context,
    LibAVCodec.Packet packet,
    int size
);

/*************************************************/
/***********************************************************
@brief Input/output formats
***********************************************************/

/***********************************************************
@brief This structure contains the data a format has to probe a file.
***********************************************************/
[CCode (cname="struct AVProbeData",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
[Compact]
public class LibAVFormat.ProbeData {
    [CCode (cname="filename")]
    public string filename;

    /***********************************************************
    @brief Buffer must have AVPROBE_PADDING_SIZE of extra allocated bytes filled with zero.
    ***********************************************************/
    [CCode (cname="buffer")]
    public uchar[] buffer;

    /***********************************************************
    @brief Size of buffer except extra allocated bytes
    ***********************************************************/
    [CCode (cname="buf_size")]
    public int buf_size;

    /***********************************************************
    @brief Mime_type, when known.
    ***********************************************************/
    [CCode (cname="mime_type")]
    public string mime_type;
}

[CCode (cname="AVPROBE_SCORE_RETRY",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public const int AVPROBE_SCORE_RETRY;

[CCode (cname="AVPROBE_SCORE_STREAM_RETRY",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public const int AVPROBE_SCORE_STREAM_RETRY;

/***********************************************************
@brief Score for file extension
***********************************************************/
[CCode (cname="AVPROBE_SCORE_EXTENSION",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public const int AVPROBE_SCORE_EXTENSION;

/***********************************************************
@brief Score for file mime type
***********************************************************/
[CCode (cname="AVPROBE_SCORE_MIME",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public const int AVPROBE_SCORE_MIME;

/***********************************************************
@brief Maximum score
***********************************************************/
[CCode (cname="AVPROBE_SCORE_MAX",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public const int AVPROBE_SCORE_MAX;

/***********************************************************
@brief Extra allocated bytes at the end of the probe buffer
***********************************************************/
[CCode (cname="AVPROBE_PADDING_SIZE",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public const size_t AVPROBE_PADDING_SIZE;

[CCode (cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public enum AVFormatFlags1 {
    /***********************************************************
    @brief Demuxer will use avio_open, no opened file should be provided by the caller.
    ***********************************************************/
    [CCode (cname="AVFMT_NOFILE")]
    NO_FILE,

    /***********************************************************
    @brief Needs '%d' in filename.
    ***********************************************************/
    [CCode (cname="AVFMT_NEEDNUMBER")]
    NEED_NUMBER,

    /***********************************************************
    @brief Show format stream IDs numbers.
    ***********************************************************/
    [CCode (cname="AVFMT_SHOW_IDS")]
    SHOW_IDS,

    /***********************************************************
    @brief Format wants global header.
    ***********************************************************/
    [CCode (cname="AVFMT_GLOBALHEADER")]
    WANTS_GLOBAL_HEADER,

    /***********************************************************
    @brief Format does not need / have any timestamps.
    ***********************************************************/
    [CCode (cname="AVFMT_NOTIMESTAMPS")]
    NO_TIMESTAMPS,

    /***********************************************************
    Use generic index building code.
    ***********************************************************/
    [CCode (cname="AVFMT_GENERIC_INDEX")]
    USE_GENERIC_INDEX,

    /***********************************************************
    @brief Format allows timestamp discontinuities. Note, muxers always require valid (monotone) timestamps
    ***********************************************************/
    [CCode (cname="AVFMT_TS_DISCONT")]
    ALLOWS_TIMESTAMP_DISCONTINUITIES,

    /***********************************************************
    @brief Format allows variable fps.
    ***********************************************************/
    [CCode (cname="AVFMT_VARIABLE_FPS")]
    ALLOWS_VARIABLE_FPS,

    /***********************************************************
    @brief Format does not need width/height
    ***********************************************************/
    [CCode (cname="AVFMT_NODIMENSIONS")]
    NO_DIMENSIONS,

    /***********************************************************
    @brief Format does not require any streams
    ***********************************************************/
    [CCode (cname="AVFMT_NOSTREAMS")]
    NO_STREAMS,

    /***********************************************************
    @brief Format does not allow to fall back on binary search via read_timestamp
    ***********************************************************/
    [CCode (cname="AVFMT_NOBINSEARCH")]
    NO_BINARY_SEARCH,

    /***********************************************************
    @brief Format does not allow to fall back on generic search
    ***********************************************************/
    [CCode (cname="AVFMT_NOGENSEARCH")]
    NO_GENERIC_SEARCH,

    /***********************************************************
    @brief Format does not allow seeking by bytes
    ***********************************************************/
    [CCode (cname="AVFMT_NO_BYTE_SEEK")]
    NO_BYTE_SEEK,

    /***********************************************************
    @brief Format allows flushing. If not set, the muxer will not receive a NULL packet in the write_packet function.
    ***********************************************************/
    [CCode (cname="AVFMT_ALLOW_FLUSH")]
    ALLOWS_FLUSH,

    /***********************************************************
    @brief Format does not require strictly increasing timestamps, but
    they must still be monotonic.
    ***********************************************************/
    [CCode (cname="AVFMT_TS_NONSTRICT")]
    ALLOW_NON_STRICT_TIMESTAMPS,

    /***********************************************************
    @brief Format allows muxing negative
    timestamps. If not set the timestamp
    will be shifted in av_write_frame and
    av_interleaved_write_frame so they
    start from 0.
    The user or muxer can override this through
    LibAVFormat.FormatContext.avoid_negative_ts
    ***********************************************************/
    [CCode (cname="AVFMT_TS_NEGATIVE")]
    ALLOW_NEGATIVE_TIMESTAMPS,

    /***********************************************************
    @brief Seeking is based on PTS
    ***********************************************************/
    [CCode (cname="AVFMT_SEEK_TO_PTS")]
    SEEK_TO_PTS;
}

/***********************************************************
@addtogroup lavf_encoding
@{
***********************************************************/
[CCode (cname="struct LibAVFormat.OutputFormat",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
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
        AVFormatFlags1.NO_FILE,
        AVFormatFlags1.NEED_NUMBER,
        AVFormatFlags1.WANTS_GLOBAL_HEADER,
        AVFormatFlags1.NO_TIMESTAMPS,
        AVFormatFlags1.ALLOWS_VARIABLE_FPS,
        AVFormatFlags1.NO_DIMENSIONS,
        AVFormatFlags1.NO_STREAMS,
        AVFormatFlags1.ALLOWS_FLUSH,
        AVFormatFlags1.ALLOW_NON_STRICT_TIMESTAMPS,
        AVFormatFlags1.ALLOW_NEGATIVE_TIMESTAMPS
    ***********************************************************/
    [CCode (cname="")]
    public abstract AVFormatFlags1 flags { public get; }

    /***********************************************************
    @brief List of supported codec_id-codec_tag_list pairs, ordered by "better
    choice first". The arrays are all terminated by LibAVCodec.CodecID.NONE.
    ***********************************************************/
    [CCode (cname="codec_tag",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public abstract AVCodecTag[] codec_tag_list { public get; }


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
    @brief Write a packet. If AVFormatFlags1.ALLOWS_FLUSH is set in flags,
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
            MKTAG ('A', 'P', 'I', 'C') if the codec is only supported as AVDispositionFlags.ATTACHED_PIC
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

}

/***********************************************************
@}
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
    [CCode (cname="")]
    public abstract string name { public get; }

    /***********************************************************
    @brief Descriptive name for the format, meant to be more human-readable
    than name. You should use the NULL_IF_CONFIG_SMALL () macro
    to define it.
    ***********************************************************/
    [CCode (cname="")]
    public abstract string long_name { public get; }

    /***********************************************************
    @brief Can use flags:
        AVFormatFlags1.NO_FILE,
        AVFormatFlags1.NEED_NUMBER,
        AVFormatFlags1.SHOW_IDS,
        AVFormatFlags1.NO_TIMESTAMPS,
        AVFormatFlags1.USE_GENERIC_INDEX,
        AVFormatFlags1.ALLOWS_TIMESTAMP_DISCONTINUITIES,
        AVFormatFlags1.NO_BINARY_SEARCH,
        AVFormatFlags1.NO_GENERIC_SEARCH,
        AVFormatFlags1.NO_BYTE_SEEK,
        AVFormatFlags1.SEEK_TO_PTS.
    ***********************************************************/
    [CCode (cname="")]
    public abstract AVFormatFlags1 flags { public get; }

    /***********************************************************
    @brief If extensions are defined, then no probe is done. You should
    usually not use extension format guessing because it is not
    reliable enough
    ***********************************************************/
    [CCode (cname="")]
    public abstract string extensions { public get; }

    [CCode (cname="")]
    public AVCodecTag codec_tag_list;

    /***********************************************************
    @brief LibAVUtil.Log.Class for the private context
    ***********************************************************/
    [CCode (cname="")]
    public LibAVUtil.Log.Class priv_class;

    /***********************************************************
    @brief Comma-separated list of mime types.
    It is used check for matching mime types while probing.
    @see av_probe_input_format2
    ***********************************************************/
    [CCode (cname="")]
    public abstract string mime_type { public get; }

    /***********************************************************
    @brief No fields below this line are part of the public API. They
    may not be used outside of libavformat and can be changed and
    removed at will.
    New public fields should be added right above.
    ***********************************************************/
    [CCode (cname="")]
    public LibAVFormat.InputFormat next;

    /***********************************************************
    @brief Raw demuxers store their codec ID here.
    ***********************************************************/
    [CCode (cname="")]
    public abstract LibAVCodec.CodecID raw_codec_id { public get; }

    /***********************************************************
    @brief Size of private data so that it can be allocated in the wrapper.
    ***********************************************************/
    [CCode (cname="")]
    public abstract size_t priv_data_size { public get; }

    /***********************************************************
    @brief Tell if a given file has a chance of being parsed as this format.
    The buffer provided is guaranteed to be AVPROBE_PADDING_SIZE bytes
    big so you do not have to check for that unless you need more.
    ***********************************************************/
    [CCode (cname="")]
    public abstract int read_probe (
        LibAVFormat.ProbeData format_context
    );

    /***********************************************************
    @brief Read the format header and initialize the LibAVFormat.FormatContext
    structure. Return 0 if OK. 'avformat_new_stream' should be
    called to create new streams.
    ***********************************************************/
    [CCode (cname="")]
    public abstract int read_header (
        LibAVFormat.FormatContext format_context
    );

    /***********************************************************
    @brief Read one packet and put it in 'packet'. pts and flags are also
    set. 'avformat_new_stream' can be called only if the flag
    AVFormatContextFlags.NO_HEADER is used and only in the calling thread (not in a
    background thread).
    @return 0 on success, < 0 on error.
            When returning an error, packet must not have been allocated
            or must be freed before returning
    ***********************************************************/
    [CCode (cname="")]
    public abstract int read_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    /***********************************************************
    @brief Close the stream. The LibAVFormat.FormatContext and AVStreams are not
    freed by this function
    ***********************************************************/
    [CCode (cname="")]
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
    [CCode (cname="")]
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
    [CCode (cname="")]
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
    [CCode (cname="")]
    public abstract int read_play (
        LibAVFormat.FormatContext format_context
    );

    /***********************************************************
    @brief Pause playing - only meaningful if using a network-based format
    (RTSP).
    ***********************************************************/
    [CCode (cname="")]
    public abstract int read_pause (
        LibAVFormat.FormatContext format_context
    );

    /***********************************************************
    @brief Seek to timestamp ts.
    Seeking will be done so that the point from which all active streams
    can be presented successfully will be closest to ts and within min/max_ts.
    Active streams are all streams that have LibAVFormat.Stream.discard < AVDISCARD_ALL.
    ***********************************************************/
    [CCode (cname="")]
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

}

/***********************************************************
@}
***********************************************************/

[CCode (cname="enum AVStreamParseType",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public enum AVStreamParseType {
    [CCode (cname="AVSTREAM_PARSE_NONE")]
    NONE,

    /***********************************************************
    @brief Full parsing and repack
    ***********************************************************/
    [CCode (cname="AVSTREAM_PARSE_FULL")]
    FULL,

    /***********************************************************
    @brief Only parse headers, do not repack.
    ***********************************************************/
    [CCode (cname="AVSTREAM_PARSE_HEADERS")]
    HEADERS,

    /***********************************************************
    @brief Full parsing and interpolation of timestamps for frames not starting on a packet boundary
    ***********************************************************/
    [CCode (cname="AVSTREAM_PARSE_TIMESTAMPS")]
    TIMESTAMPS,

    /***********************************************************
    @brief Full parsing and repack of the first frame only, only implemented for H.264 currently
    ***********************************************************/
    [CCode (cname="AVSTREAM_PARSE_FULL_ONCE")]
    FULL_ONCE,

    /***********************************************************
    @brief Full parsing and repack with timestamp and position generation by parser for raw
    this assumes that each packet in the file contains no demuxer level headers and
    just codec level data, otherwise position generation would fail
    ***********************************************************/
    [CCode (cname="AVSTREAM_PARSE_FULL_RAW")]
    FULL_RAW;
}

[CCode (cname="struct AVIndexEntry",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
[Compact]
public class LibAVFormat.IndexEntry {
    [CCode (cname="")]
    public int64 pos;

    /***********************************************************
    @brief Timestamp in LibAVFormat.Stream.time_base units, preferably the time
    from which on correctly decoded frames are available when
    seeking to this entry. This means preferable PTS on keyframe
    based formats, but demuxers can choose to store a different
    timestamp, if it is more convenient for the implementation
    or nothing better is known.
    ***********************************************************/
    [CCode (cname="")]
    public int64 timestamp;

    [CCode (cname="")]
    public AVIndexEntryFlags flags; // :2;

    /***********************************************************
    @brief Yeah, trying to keep the size of this small to reduce memory requirements (it is 24 vs. 32 bytes due to possible 8-byte alignment).
    ***********************************************************/
    [CCode (cname="")]
    public int size; // :30
    /***********************************************************
    @brief Minimum distance between this and the previous keyframe, used to avoid unneeded searching.
    ***********************************************************/
    [CCode (cname="")]
    public int min_distance;
}

[Flags]
[CCode (cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public enum AVIndexEntryFlags {
    [CCode (cname="AVINDEX_KEYFRAME")]
    KEYFRAME,

    /***********************************************************
    @brief Flag is used to indicate which frame should be discarded after decoding.
    ***********************************************************/
    [CCode (cname="AVINDEX_DISCARD_FRAME")]
    DISCARD_FRAME;
}

[Flags]
[CCode (cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public enum AVDispositionFlags {
    [CCode (cname="AV_DISPOSITION_DEFAULT")]
    DEFAULT,

    [CCode (cname="AV_DISPOSITION_DUB")]
    DUB,

    [CCode (cname="AV_DISPOSITION_ORIGINAL")]
    ORIGINAL,

    [CCode (cname="AV_DISPOSITION_COMMENT")]
    COMMENT,

    [CCode (cname="AV_DISPOSITION_LYRICS")]
    LYRICS,

    [CCode (cname="AV_DISPOSITION_KARAOKE")]
    KARAOKE,

    /***********************************************************
    @brief Track should be used during playback by default.
    Useful for subtitle track that should be displayed
    even when user did not explicitly ask for subtitles.
    ***********************************************************/
    [CCode (cname="AV_DISPOSITION_FORCED")]
    FORCED,

    /***********************************************************
    @brief Stream for hearing impaired audiences
    ***********************************************************/
    [CCode (cname="AV_DISPOSITION_HEARING_IMPAIRED")]
    HEARING_IMPAIRED,

    /***********************************************************
    @brief Stream for visual impaired audiences
    ***********************************************************/
    [CCode (cname="AV_DISPOSITION_VISUAL_IMPAIRED")]
    VISUAL_IMPAIRED,

    /***********************************************************
    @brief Stream without voice
    ***********************************************************/
    [CCode (cname="AV_DISPOSITION_CLEAN_EFFECTS")]
    CLEAN_EFFECTS,

    /***********************************************************
    @brief The stream is stored in the file as an attached picture/"cover art" (e.g.
    APIC frame in ID3v2). The first (usually only) packet associated with it
    will be returned among the first few packets read from the file unless
    seeking takes place. It can also be accessed at any time in
    LibAVFormat.Stream.attached_pic.
    ***********************************************************/
    [CCode (cname="AV_DISPOSITION_ATTACHED_PIC")]
    ATTACHED_PIC,

    /***********************************************************
    @brief The stream is sparse, and contains thumbnail images, often corresponding
    to chapter markers. Only ever used with AVDispositionFlags.ATTACHED_PIC.
    ***********************************************************/
    [CCode (cname="AV_DISPOSITION_TIMED_THUMBNAILS")]
    TIMED_THUMBNAILS,

    /***********************************************************
    @brief To specify text track kind (different from subtitles default).
    ***********************************************************/
    [CCode (cname="AV_DISPOSITION_CAPTIONS")]
    CAPTIONS,

    [CCode (cname="AV_DISPOSITION_DESCRIPTIONS")]
    DESCRIPTIONS,

    [CCode (cname="AV_DISPOSITION_METADATA")]
    METADATA,

    /***********************************************************
    @brief Dependent audio stream (mix_type=0 in mpegts)
    ***********************************************************/
    [CCode (cname="AV_DISPOSITION_DEPENDENT")]
    DEPENDENT,

    /***********************************************************
    @brief Still images in video stream (still_picture_flag=1 in mpegts)
    ***********************************************************/
    [CCode (cname="AV_DISPOSITION_STILL_IMAGE")]
    STILL_IMAGE;
}

/***********************************************************
@brief Options for behavior on timestamp wrap detection.
***********************************************************/
[CCode (cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public enum AVFormatParseTimestampWrapDetection {
    /***********************************************************
    @brief Ignore the wrap
    ***********************************************************/
    [CCode (cname="AV_PTS_WRAP_IGNORE")]
    IGNORE,

    /***********************************************************
    @brief Add the format specific offset on wrap detection
    ***********************************************************/
    [CCode (cname="AV_PTS_WRAP_ADD_OFFSET")]
    ADD_OFFSET,

    /***********************************************************
    @brief Subtract the format specific offset on wrap detection
    ***********************************************************/
    [CCode (cname="AV_PTS_WRAP_SUB_OFFSET")]
    SUB_OFFSET;
}

[Flags]
[CCode (cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public enum AVFormatStreamEventFlags {
    /***********************************************************
    @brief The call resulted in updated metadata.
    ***********************************************************/
    [CCode (cname="AVSTREAM_EVENT_FLAG_METADATA_UPDATED")]
    METADATA_UPDATED;
}

/***********************************************************
@brief Stream structure.
New fields can be added to the end with minor version bumps.
Removal, reordering and changes to existing fields require a major
version bump.
sizeof (LibAVFormat.Stream) must not be used outside libav*.
***********************************************************/
[CCode (cname="struct AVStream",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
[Compact]
public class LibAVFormat.Stream {
    /***********************************************************
    @brief Stream index in LibAVFormat.FormatContext
    ***********************************************************/
    [CCode (cname="")]
    public int index;

    /***********************************************************
    @brief Format-specific stream ID.

    - decoding: set by libavformat
    - encoding: set by the user, replaced by libavformat if left unset
    ***********************************************************/
    [CCode (cname="")]
    public int id;

    [CCode (cname="")]
    public void *priv_data;

    /***********************************************************
    @brief This is the fundamental unit of time (in seconds) in terms
    of which frame timestamps are represented.

    decoding: set by libavformat
    encoding: May be set by the caller before avformat_write_header () to
              provide a hint to the muxer about the desired timebase. In
              avformat_write_header (), the muxer will overwrite this field
              with the timebase that will actually be used for the timestamps
              written into the file (which may or may not be related to the
              user-provided one, depending on the format).
    ***********************************************************/
    [CCode (cname="")]
    public LibAVUtil.Rational time_base;

    /***********************************************************
    @brief Decoding: pts of the first frame of the stream in presentation order, in stream time base.
    Only set this if you are absolutely 100% sure that the value you set
    it to really is the pts of the first frame.
    This may be undefined (AV_NOPTS_VALUE).
    @note The ASF header does NOT contain a correct start_time the ASF
    demuxer must NOT set this.
    ***********************************************************/
    [CCode (cname="")]
    public int64 start_time;

    /***********************************************************
    @brief Decoding: duration of the stream, in stream time base.
    If a source file does not specify a duration, but does specify
    a bitrate, this value will be estimated from bitrate and file size.

    Encoding: May be set by the caller before avformat_write_header () to
    provide a hint to the muxer about the estimated duration.
    ***********************************************************/
    [CCode (cname="")]
    public int64 duration;

    /***********************************************************
    @brief Number of frames in this stream if known or 0
    ***********************************************************/
    [CCode (cname="")]
    public int64 nb_frames;

    /***********************************************************
    @brief AVDispositionFlags bit field
    ***********************************************************/
    [CCode (cname="")]
    public AVDispositionFlags disposition;

    /***********************************************************
    @brief Selects which packets can be discarded at will and do not need to be demuxed.
    ***********************************************************/
    [CCode (cname="")]
    public LibAVCodec.Discard discard;

    /***********************************************************
    @brief Sample aspect ratio (0 if unknown)

    - encoding: Set by user.
    - decoding: Set by libavformat.
    ***********************************************************/
    [CCode (cname="")]
    public LibAVUtil.Rational sample_aspect_ratio;

    [CCode (cname="")]
    public LibAVUtil.Dictionary metadata;

    /***********************************************************
    @brief Average framerate

    - demuxing: May be set by libavformat when creating the stream or in
                avformat_find_stream_info ().
    - muxing: May be set by the caller before avformat_write_header ().
    ***********************************************************/
    [CCode (cname="")]
    public LibAVUtil.Rational avg_frame_rate;

    /***********************************************************
    @brief For streams with AVDispositionFlags.ATTACHED_PIC disposition, this packet
    will contain the attached picture.

    decoding: set by libavformat, must not be modified by the caller.
    encoding: unused
    ***********************************************************/
    [CCode (cname="")]
    public LibAVCodec.Packet attached_pic;

    /***********************************************************
    @brief An array of side data that applies to the whole stream (i.e. the
    container does not allow it to change between packets).

    There may be no overlap between the side data in this array and side data
    in the packets. I.e. a given side data is either exported by the muxer
    (demuxing) / set by the caller (muxing) in this array, then it never
    appears in the packets, or the side data is exported / sent through
    the packets (always in the first packet where the value becomes known or
    changes), then it does not appear in this array.

    - demuxing: Set by libavformat when the stream is created.
    - muxing: May be set by the caller before avformat_write_header ().

    Freed by libavformat in avformat_free_context ().

    @see av_format_inject_global_side_data ()
    ***********************************************************/
    [CCode (cname="")]
    public LibAVCodec.PacketSideData[] side_data;

    /***********************************************************
    @brief The number of elements in the LibAVFormat.Stream.side_data array.
    ***********************************************************/
    [CCode (cname="")]
    public int nb_side_data;

    /***********************************************************
    @brief Flags for the user to detect events happening on the stream. Flags must
    be cleared by the user once the event has been handled.
    A combination of AVSTREAM_EVENT_FLAG_*.
    ***********************************************************/
    [CCode (cname="")]
    public AVFormatStreamEventFlags event_flags;

    /***********************************************************
    @brief Real base framerate of the stream.
    This is the lowest framerate with which all timestamps can be
    represented accurately (it is the least common multiple of all
    framerates in the stream). Note, this value is just a guess!
    For example, if the time base is 1/90000 and all frames have either
    approximately 3600 or 1800 timer ticks, then r_frame_rate will be 50/1.
    ***********************************************************/
    [CCode (cname="")]
    public LibAVUtil.Rational r_frame_rate;

    /***********************************************************
    @brief Codec parameters associated with this stream. Allocated and freed by
    libavformat in avformat_new_stream () and avformat_free_context ()
    respectively.

    - demuxing: filled by libavformat on stream creation or in
                avformat_find_stream_info ()
    - muxing: filled by the caller before avformat_write_header ()
    ***********************************************************/
    [CCode (cname="")]
    public LibAVCodec.CodecParameters codecpar;

    //  /***********************************************************
    //  All fields below this line are not part of the public API. They
    //  may not be used outside of libavformat and can be changed and
    //  removed at will.
    //  Internal note: be aware that physically removing these fields
    //  will break ABI. Replace removed fields with dummy fields, and
    //  add new fields to AVStreamInternal.
    //  ***********************************************************/

    //  /***********************************************************
    //  Stream information used internally by avformat_find_stream_info ()
    //  ***********************************************************/
    //  public public struct StreamInfo {
    //      public int64 last_dts;

    //      public int64 duration_gcd;

    //      public int duration_count;

    //      public int64 rfps_duration_sum;

    //      public public const int MAX_STD_TIMEBASES;

    //      public double duration_error)[2][MAX_STD_TIMEBASES];

    //      public int64 codec_info_duration;

    //      public int64 codec_info_duration_fields;

    //      public int frame_delay_evidence;

    //      /***********************************************************
    //      0 -> decoder has not been searched for yet.
    //      >0 -> decoder found
    //      <0 -> decoder with codec_id == -found_decoder has not been found
    //      ***********************************************************/
    //      public int found_decoder;

    //      public int64 last_duration;

    //      /***********************************************************
    //      Those are used for average framerate estimation.
    //      ***********************************************************/
    //      public int64 fps_first_dts;

    //      public int fps_first_dts_idx;

    //      public int64 fps_last_dts;

    //      public int fps_last_dts_idx;

    //  }
    //  /***********************************************************
    //  Stream information used internally by avformat_find_stream_info ()
    //  ***********************************************************/
    //  public StreamInfo info;

    //  /***********************************************************
    //  number of bits in pts (used for wrapping control)
    //  ***********************************************************/
    //  public int pts_wrap_bits;

    //  // Timestamp generation support:
    //  /***********************************************************
    //  Timestamp corresponding to the last dts sync point.

    //  Initialized when LibAVCodec.CodecParserContext.dts_sync_point >= 0 and
    //  a DTS is received from the underlying container. Otherwise set to
    //  AV_NOPTS_VALUE by default.
    //  ***********************************************************/
    //  public int64 first_dts;

    //  public int64 cur_dts;

    //  public int64 last_IP_pts;

    //  public int last_IP_duration;

    //  /***********************************************************
    //  Number of packets to buffer for codec probing
    //  ***********************************************************/
    //  public int probe_packets;

    //  /***********************************************************
    //  Number of frames that have been demuxed during avformat_find_stream_info ()
    //  ***********************************************************/
    //  public int codec_info_nb_frames;

    //  /***********************************************************
    //  av_read_frame () support
    //  ***********************************************************/
    //  public abstract AVStreamParseType need_parsing { public get; }
    //  public LibAVCodec.CodecParserContext parser;

    //  /***********************************************************
    //  last packet in packet_buffer for this stream when muxing.
    //  ***********************************************************/
    //  public LibAVFormat.PacketList last_in_packet_buffer;

    //  public LibAVFormat.ProbeData probe_data;

    //  public const int MAX_REORDER_DELAY;

    //  public int64 pts_buffer[MAX_REORDER_DELAY+1];

    //  /***********************************************************
    //  Only used if the format does not support seeking natively.
    //  ***********************************************************/
    //  public LibAVFormat.IndexEntry[] index_entries;

    //  public int nb_index_entries;

    //  public uint index_entries_allocated_size;

    //  /***********************************************************
    //  Stream Identifier
    //  This is the MPEG-TS stream identifier +1
    //  0 means unknown
    //  ***********************************************************/
    //  public int stream_identifier;

    //  /***********************************************************
    //  Details of the MPEG-TS program which created this stream.
    //  ***********************************************************/
    //  public int program_num;

    //  public int pmt_version;

    //  public int pmt_stream_idx;

    //  public int64 interleaver_chunk_size;

    //  public int64 interleaver_chunk_duration;

    //  /***********************************************************
    //  stream probing state
    //  -1 -> probing finished
    //   0 -> no probing requested
    //  rest -> perform probing with request_probe being the minimum score to accept.
    //  NOT PART OF PUBLIC API
    //  ***********************************************************/
    //  public int request_probe;

    //  /***********************************************************
    //  Indicates that everything up to the next keyframe
    //  should be discarded.
    //  ***********************************************************/
    //  public int skip_to_keyframe;

    //  /***********************************************************
    //  Number of samples to skip at the start of the frame decoded from the next packet.
    //  ***********************************************************/
    //  public int skip_samples;

    //  /***********************************************************
    //  If not 0, the number of samples that should be skipped from the start of
    //  the stream (the samples are removed from packets with pts==0, which also
    //  assumes negative timestamps do not happen).
    //  Intended for use with formats such as mp3 with ad-hoc gapless audio
    //  support.
    //  ***********************************************************/
    //  public int64 start_skip_samples;

    //  /***********************************************************
    //  If not 0, the first audio sample that should be discarded from the stream.
    //  This is broken by design (needs global sample count), but can't be
    //  avoided for broken by design formats such as mp3 with ad-hoc gapless
    //  audio support.
    //  ***********************************************************/
    //  public int64 first_discard_sample;

    //  /***********************************************************
    //  The sample after last sample that is intended to be discarded after
    //  first_discard_sample. Works on frame boundaries only. Used to prevent
    //  early EOF if the gapless info is broken (considered concatenated mp3s).
    //  ***********************************************************/
    //  public int64 last_discard_sample;

    //  /***********************************************************
    //  Number of internally decoded frames, used internally in libavformat, do not access
    //  its lifetime differs from info which is why it is not in that structure.
    //  ***********************************************************/
    //  public int nb_decoded_frames;

    //  /***********************************************************
    //  Timestamp offset added to timestamps before muxing
    //  NOT PART OF PUBLIC API
    //  ***********************************************************/
    //  public int64 mux_ts_offset;

    //  /***********************************************************
    //  Internal data to check for wrapping of the time stamp
    //  ***********************************************************/
    //  public int64 pts_wrap_reference;

    //  /***********************************************************
    //  Options for behavior, when a wrap is detected.

    //  Defined by AVFormatParseTimestampWrapDetection. values.

    //  If correction is enabled, there are two possibilities:
    //  If the first time stamp is near the wrap point, the wrap offset
    //  will be subtracted, which will create negative time stamps.
    //  Otherwise the offset will be added.
    //  ***********************************************************/
    //  public AVFormatParseTimestampWrapDetection pts_wrap_behavior;

    //  /***********************************************************
    //  Internal data to prevent doing update_initial_durations () twice
    //  ***********************************************************/
    //  public int update_initial_durations_done;

    //  /***********************************************************
    //  Internal data to generate dts from pts
    //  ***********************************************************/
    //  public int64 pts_reorder_error[MAX_REORDER_DELAY+1];

    //  public uint8 pts_reorder_error_count[MAX_REORDER_DELAY+1];

    //  /***********************************************************
    //  Internal data to analyze DTS and detect faulty mpeg streams
    //  ***********************************************************/
    //  public int64 last_dts_for_order_check;

    //  public uint8 dts_ordered;

    //  public uint8 dts_misordered;

    //  /***********************************************************
    //  Internal data to inject global side data
    //  ***********************************************************/
    //  public int inject_global_side_data;

    //  /***********************************************************
    //  display aspect ratio (0 if unknown)
    //  - encoding: unused
    //  - decoding: Set by libavformat to calculate sample_aspect_ratio internally
    //  ***********************************************************/
    //  public LibAVUtil.Rational display_aspect_ratio;

    //  /***********************************************************
    //  An opaque field for libavformat internal usage.
    //  Must not be accessed in any way by callers.
    //  ***********************************************************/
    //  public AVStreamInternal internal;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public LibAVCodec.CodecParserContext av_stream_get_parser (
    LibAVFormat.Stream stream
);

/***********************************************************
@brief Returns the pts of the last muxed packet + its duration

the retuned value is undefined when used with a demuxer.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public int64 av_stream_get_end_pts (
    LibAVFormat.Stream st
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public const int AV_PROGRAM_RUNNING;

/***********************************************************
@brief New fields can be added to the end with minor version bumps.
Removal, reordering and changes to existing fields require a major
version bump.
sizeof (LibAVFormat.Program) must not be used outside libav*.
***********************************************************/
[CCode (cname="struct AVProgram",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
[Compact]
public class LibAVFormat.Program {
    [CCode (cname="")]
    public int id;

    [CCode (cname="")]
    public int lags;

    /***********************************************************
    @brief Selects which program to discard and which to feed to the caller
    ***********************************************************/
    [CCode (cname="")]
    public LibAVCodec.Discard discard;

    [CCode (cname="")]
    public uint[] stream_index;

    [CCode (cname="")]
    public uint nb_stream_indexes;

    [CCode (cname="")]
    public LibAVUtil.Dictionary metadata;

    [CCode (cname="")]
    public int program_num;

    [CCode (cname="")]
    public int pmt_pid;

    [CCode (cname="")]
    public int pcr_pid;

    [CCode (cname="")]
    public int pmt_version;

    //  /***********************************************************
    //  All fields below this line are not part of the public API. They
    //  may not be used outside of libavformat and can be changed and
    //  removed at will.
    //  New public fields should be added right above.
    //  ***********************************************************/
    //  public int64 start_time;

    //  public int64 end_time;

    //  /***********************************************************
    //  reference dts for wrap detection
    //  ***********************************************************/
    //  public int64 pts_wrap_reference;

    //  /***********************************************************
    //  behavior on wrap detection
    //  ***********************************************************/
    //  public int pts_wrap_behavior;
}

[Flags]
[CCode (cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public enum AVFormatContextFlags {
    /***********************************************************
    @brief Signal that no header is present
    (streams are added dynamically)
    ***********************************************************/
    [CCode (cname="AVFMTCTX_NOHEADER")]
    NO_HEADER,

    /***********************************************************
    @brief Signal that the stream is definitely
    not seekable, and attempts to call the
    seek function will fail. For some
    network protocols (e.g. HLS), this can
    change dynamically at runtime.
    ***********************************************************/
    [CCode (cname="AVFMTCTX_UNSEEKABLE")]
    UNSEEKABLE;
}

[CCode (cname="struct AVChapter",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
[Compact]
public class LibAVFormat.Chapter {
    /***********************************************************
    unique ID to identify the chapter
    ***********************************************************/
    [CCode (cname="")]
    public int id;

    /***********************************************************
    @brief Time base in which the start/end timestamps are specified
    ***********************************************************/
    [CCode (cname="")]
    public LibAVUtil.Rational time_base;

    /***********************************************************
    @brief Chapter start time in time_base units
    ***********************************************************/
    [CCode (cname="")]
    public int64 start;

    /***********************************************************
    @brief Chapter end time in time_base units
    ***********************************************************/
    [CCode (cname="")]
    public int64 end;

    [CCode (cname="")]
    public LibAVUtil.Dictionary metadata;
}


/***********************************************************
@brief Callback used by devices to communicate with application.
***********************************************************/
[CCode (cname="av_format_control_message")]
public delegate int AVFormatControlMessage (
    LibAVFormat.FormatContext format_context,
    int type,
    void *data,
    size_t data_size
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/avformat.h")]
public delegate int AVOpenCallback (
    LibAVFormat.FormatContext format_context,
    out AVIOContext pb,
    string url,
    int flags,
    AVIOInterruptCB int_cb,
    LibAVUtil.Dictionary[] options
);

/***********************************************************
@brief The duration of a video can be estimated through various ways, and this enum can be used
to know how the duration was estimated.
***********************************************************/
[CCode (cname="enum AVDurationEstimationMethod",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public enum AVDurationEstimationMethod {
    /***********************************************************
    @brief Duration accurately estimated from PTSes
    ***********************************************************/
    [CCode (cname="AVFMT_DURATION_FROM_PTS")]
    FROM_PTS,

    /***********************************************************
    @brief Duration estimated from a stream with a known duration
    ***********************************************************/
    [CCode (cname="AVFMT_DURATION_FROM_STREAM")]
    FROM_STREAM,

    /***********************************************************
    @brief Duration estimated from bitrate (less accurate)
    ***********************************************************/
    [CCode (cname="AVFMT_DURATION_FROM_BITRATE")]
    FROM_BITRATE
}

[Flags]
[CCode (cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public enum AVFormatFlags {
    /***********************************************************
    @brief Generate missing pts even if it requires parsing future frames.
    ***********************************************************/
    [CCode (cname="AVFMT_FLAG_GENPTS")]
    GENERATE_MISSING_PTS,

    /***********************************************************
    @brief Ignore index.
    ***********************************************************/
    [CCode (cname="AVFMT_FLAG_IGNIDX")]
    IGNORE_INDEX,

    /***********************************************************
    @brief Do not block when reading packets from input.
    ***********************************************************/
    [CCode (cname="AVFMT_FLAG_NONBLOCK")]
    DO_NOT_BLOCK,

    /***********************************************************
    @brief Ignore DTS on frames that contain both DTS & PTS
    ***********************************************************/
    [CCode (cname="AVFMT_FLAG_IGNDTS")]
    IGNORE_DTS,

    /***********************************************************
    @brief Do not infer any values from other values, just return what is stored in the container
    ***********************************************************/
    [CCode (cname="AVFMT_FLAG_NOFILLIN")]
    DO_NOT_INFER,

    /***********************************************************
    @brief Do not use AVParsers, you also must set AVFormatFlags.DO_NOT_INFER as the fillin code works on frames and no parsing -> no frames. Also seeking to frames can not work if parsing to find frame boundaries has been disabled
    ***********************************************************/
    [CCode (cname="AVFMT_FLAG_NOPARSE")]
    DO_NOT_PARSE,

    /***********************************************************
    @brief Do not buffer frames when possible
    ***********************************************************/
    [CCode (cname="AVFMT_FLAG_NOBUFFER")]
    DO_NOT_BUFFER,

    /***********************************************************
    @brief The caller has supplied a custom AVIOContext, don't avio_close () it.
    ***********************************************************/
    [CCode (cname="AVFMT_FLAG_CUSTOM_IO")]
    CUSTOM_IO,

    /***********************************************************
    @brief Discard frames marked corrupted
    ***********************************************************/
    [CCode (cname="AVFMT_FLAG_DISCARD_CORRUPT")]
    DISCARD_CORRUPT,

    /***********************************************************
    @brief Flush the AVIOContext every packet.
    ***********************************************************/
    [CCode (cname="AVFMT_FLAG_FLUSH_PACKETS")]
    FLUSH_PACKETS,

    /***********************************************************
    @brief When muxing, try to avoid writing any random/volatile data to the output.
    This includes any random IDs, real-time timestamps/dates, muxer version, etc.

    This flag is mainly intended for testing.
    ***********************************************************/
    [CCode (cname="AVFMT_FLAG_BITEXACT")]
    BIT_EXACT,

    /***********************************************************
    @brief Try to interleave outputted packets by dts (using this flag can slow demuxing down)
    ***********************************************************/
    [CCode (cname="AVFMT_FLAG_SORT_DTS")]
    SORT_DTS,

    /***********************************************************
    @brief Enable use of private options by delaying codec open (this could be made default once all code is converted)
    ***********************************************************/
    [CCode (cname="AVFMT_FLAG_PRIV_OPT")]
    ENABLE_PRIVATE_OPTIONS,

    /***********************************************************
    @brief Enable fast, but inaccurate seeks for some formats
    ***********************************************************/
    [CCode (cname="AVFMT_FLAG_FAST_SEEK")]
    FAST_SEEK,

    /***********************************************************
    @brief Stop muxing when the shortest stream stops.
    ***********************************************************/
    [CCode (cname="AVFMT_FLAG_SHORTEST")]
    SHORTEST,

    /***********************************************************
    @brief Add bitstream filters as requested by the muxer
    ***********************************************************/
    [CCode (cname="AVFMT_FLAG_AUTO_BSF")]
    AUTO_BSF;
}

[Flags]
[CCode (cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public enum AVFormatDebugFlags {
    [CCode (cname="FF_FDEBUG_TS")]
    TS;
}

[Flags]
[CCode (cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public enum AVFormatEventFlags {
    /***********************************************************
    @brief The call resulted in updated metadata.
    ***********************************************************/
    [CCode (cname="AVFMT_EVENT_FLAG_METADATA_UPDATED")]
    METADATA_UPDATED;
}

[Flags]
[CCode (cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public enum AVFormatAvoidNegativeTimestampFlags {
    /***********************************************************
    @brief Enabled when required by target format
    ***********************************************************/
    [CCode (cname="AVFMT_AVOID_NEG_TS_AUTO")]
    AUTO,

    /***********************************************************
    @brief Shift timestamps so they are non negative
    ***********************************************************/
    [CCode (cname="AVFMT_AVOID_NEG_TS_MAKE_NON_NEGATIVE")]
    MAKE_NON_NEGATIVE,

    /***********************************************************
    @brief Shift timestamps so that they start at 0
    ***********************************************************/
    [CCode (cname="AVFMT_AVOID_NEG_TS_MAKE_ZERO")]
    MAKE_ZERO;
}

/***********************************************************
@brief Format I/O context.
New fields can be added to the end with minor version bumps.
Removal, reordering and changes to existing fields require a major
version bump.
sizeof (LibAVFormat.FormatContext) must not be used outside libav*, use
avformat_alloc_context () to create an LibAVFormat.FormatContext.

Fields can be accessed through AVOptions (av_opt*),
the name string used matches the associated command line parameter name and
can be found in libavformat/options_table.h.
The LibAVUtil.Option/command line parameter names differ in some cases from the C
structure field names for historic reasons or brevity.
***********************************************************/
[CCode (cname="struct AVFormatContext",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public abstract class LibAVFormat.FormatContext {
    /***********************************************************
    @brief A class for logging and @ref avoptions. Set by avformat_alloc_context ().
    Exports (de)muxer private options if they exist.
    ***********************************************************/
    [CCode (cname="")]
    public LibAVUtil.Log.Class av_class;

    /***********************************************************
    @brief The input container format.

    Demuxing only, set by avformat_open_input ().
    ***********************************************************/
    [CCode (cname="")]
    public LibAVFormat.InputFormat iformat;

    /***********************************************************
    @brief The output container format.

    Muxing only, must be set by the caller before avformat_write_header ().
    ***********************************************************/
    [CCode (cname="")]
    public LibAVFormat.OutputFormat oformat;

    /***********************************************************
    @brief Format private data. This is an AVOptions-enabled struct
    if and only if iformat/oformat.priv_class is not NULL.

    - muxing: set by avformat_write_header ()
    - demuxing: set by avformat_open_input ()
    ***********************************************************/
    [CCode (cname="")]
    public void *priv_data;

    /***********************************************************
    @brief I/O context.

    - demuxing: either set by the user before avformat_open_input () (then
                the user must close it manually) or set by avformat_open_input ().
    - muxing: set by the user before avformat_write_header (). The caller must
              take care of closing / freeing the IO context.

    Do NOT set this field if AVFormatFlags1.NO_FILE flag is set in
    iformat/oformat.flags. In such a case, the (de)muxer will handle
    I/O in some other way and this field will be NULL.
    ***********************************************************/
    [CCode (cname="")]
    public AVIOContext pb;

    /***********************************************************
    @brief Stream info
    ***********************************************************/

    /***********************************************************
    @brief Flags signalling stream properties. A combination of AVFormatContextFlags.
    Set by libavformat.
    ***********************************************************/
    [CCode (cname="")]
    public AVFormatContextFlags ctx_flags;

    /***********************************************************
    @brief A list of all streams in the file. New streams are created with
    avformat_new_stream ().

    - demuxing: streams are created by libavformat in avformat_open_input ().
                If AVFormatContextFlags.NO_HEADER is set in ctx_flags, then new streams may also
                appear in av_read_frame ().
    - muxing: streams are created by the user before avformat_write_header ().

    Freed by libavformat in avformat_free_context ().
    ***********************************************************/
    [CCode (cname="")]
    public LibAVFormat.Stream[] streams;

    /***********************************************************
    @brief Number of elements in LibAVFormat.FormatContext.streams.

    Set by avformat_new_stream (), must not be modified by any other code.
    ***********************************************************/
    [CCode (cname="")]
    public uint nb_streams;

    /***********************************************************
    @brief Input or output URL. Unlike the old filename field, this field has no
    length restriction.

    - demuxing: set by avformat_open_input (), initialized to an empty
                string if url parameter was NULL in avformat_open_input ().
    - muxing: may be set by the caller before calling avformat_write_header ()
              (or avformat_init_output () if that is called first) to a string
              which is freeable by av_free (). Set to an empty string if it
              was NULL in avformat_init_output ().

    Freed by libavformat in avformat_free_context ().
    ***********************************************************/
    [CCode (cname="")]
    public string url;

    /***********************************************************
    @brief Position of the first frame of the component, in
    AV_TIME_BASE fractional seconds. NEVER set this value directly:
    It is deduced from the LibAVFormat.Stream values.

    Demuxing only, set by libavformat.
    ***********************************************************/
    [CCode (cname="")]
    public int64 start_time;

    /***********************************************************
    @brief Duration of the stream, in AV_TIME_BASE fractional
    seconds. Only set this value if you know none of the individual stream
    durations and also do not set any of them. This is deduced from the
    LibAVFormat.Stream values if not set.

    Demuxing only, set by libavformat.
    ***********************************************************/
    [CCode (cname="")]
    public int64 duration;

    /***********************************************************
    @brief Total stream bitrate in bit/s, 0 if not
    available. Never set it directly if the file_size and the
    duration are known as FFmpeg can compute it automatically.
    ***********************************************************/
    [CCode (cname="")]
    public int64 bit_rate;

    [CCode (cname="")]
    public uint packet_size;

    [CCode (cname="")]
    public int max_delay;

    /***********************************************************
    @brief Flags modifying the (de)muxer behaviour. A combination of AVFormatFlags.*.
    Set by the user before avformat_open_input () / avformat_write_header ().
    ***********************************************************/
    [CCode (cname="")]
    public AVFormatFlags flags;

    /***********************************************************
    @brief Maximum size of the data read from input for determining
    the input container format.
    Demuxing only, set by the caller before avformat_open_input ().
    ***********************************************************/
    [CCode (cname="")]
    public int64 probesize;

    /***********************************************************
    @brief Maximum duration (in AV_TIME_BASE units) of the data read
    from input in avformat_find_stream_info ().
    Demuxing only, set by the caller before avformat_find_stream_info ().
    Can be set to 0 to let avformat choose using a heuristic.
    ***********************************************************/
    [CCode (cname="")]
    public int64 max_analyze_duration;

    [CCode (cname="")]
    public uint8[] key;

    [CCode (cname="")]
    public int keylen;

    [CCode (cname="")]
    public LibAVFormat.Program[] programs;

    [CCode (cname="")]
    public uint nb_programs;

    /***********************************************************
    @brief Forced video codec_id.
    Demuxing: Set by user.
    ***********************************************************/
    [CCode (cname="")]
    public LibAVCodec.CodecID video_codec_id;

    /***********************************************************
    @brief Forced audio codec_id.
    Demuxing: Set by user.
    ***********************************************************/
    [CCode (cname="")]
    public LibAVCodec.CodecID audio_codec_id;

    /***********************************************************
    @brief Forced subtitle codec_id.
    Demuxing: Set by user.
    ***********************************************************/
    [CCode (cname="")]
    public LibAVCodec.CodecID subtitle_codec_id;

    /***********************************************************
    @brief Maximum amount of memory in bytes to use for the index of each stream.
    If the index exceeds this size, entries will be discarded as
    needed to maintain a smaller size. This can lead to slower or less
    accurate seeking (depends on demuxer).
    Demuxers for which a full in-memory index is mandatory will ignore
    this.
    - muxing: unused
    - demuxing: set by user
    ***********************************************************/
    [CCode (cname="")]
    public uint max_index_size;

    /***********************************************************
    @brief Maximum amount of memory in bytes to use for buffering frames
    obtained from realtime capture devices.
    ***********************************************************/
    [CCode (cname="")]
    public uint max_picture_buffer;

    /***********************************************************
    @brief Number of chapters in LibAVFormat.Chapter array.
    When muxing, chapters are normally written in the file header,
    so nb_chapters should normally be initialized before write_header
    is called. Some muxers (e.g. mov and mkv) can also write chapters
    in the trailer.  To write chapters in the trailer, nb_chapters
    must be zero when write_header is called and non-zero when
    write_trailer is called.
    - muxing: set by user
    - demuxing: set by libavformat
    ***********************************************************/
    [CCode (cname="")]
    public LibAVFormat.Chapter[] chapters;

    [CCode (cname="")]
    public uint nb_chapters;

    /***********************************************************
    @brief Metadata that applies to the whole file.

    - demuxing: set by libavformat in avformat_open_input ()
    - muxing: may be set by the caller before avformat_write_header ()

    Freed by libavformat in avformat_free_context ().
    ***********************************************************/
    [CCode (cname="")]
    public LibAVUtil.Dictionary metadata;

    /***********************************************************
    @brief Start time of the stream in real world time, in microseconds
    since the Unix epoch (00:00 1st January 1970). That is, pts=0 in the
    stream was captured at this real world time.
    - muxing: Set by the caller before avformat_write_header (). If set to
              either 0 or AV_NOPTS_VALUE, then the current wall-time will
              be used.
    - demuxing: Set by libavformat. AV_NOPTS_VALUE if unknown. Note that
                the value may become known after some number of frames
                have been received.
    ***********************************************************/
    [CCode (cname="")]
    public int64 start_time_realtime;

    /***********************************************************
    @brief The number of frames used for determining the framerate in
    avformat_find_stream_info ().
    Demuxing only, set by the caller before avformat_find_stream_info ().
    ***********************************************************/
    [CCode (cname="")]
    public int fps_probe_size;

    /***********************************************************
    @brief Error recognition; higher values will detect more errors but may
    misdetect some more or less valid parts as errors.
    Demuxing only, set by the caller before avformat_open_input ().
    ***********************************************************/
    [CCode (cname="")]
    public int error_recognition;

    /***********************************************************
    @brief Custom interrupt callbacks for the I/O layer.

    demuxing: set by the user before avformat_open_input ().
    muxing: set by the user before avformat_write_header ()
    (mainly useful for AVFormatFlags1.NO_FILE formats). The callback
    should also be passed to avio_open2 () if it's used to
    open the file.
    ***********************************************************/
    [CCode (cname="")]
    public AVIOInterruptCB interrupt_callback;

    /***********************************************************
    @brief Flags to enable debugging.
    ***********************************************************/
    [CCode (cname="")]
    public AVFormatDebugFlags debug;

    /***********************************************************
    @brief Maximum buffering duration for interleaving.

    To ensure all the streams are interleaved correctly,
    av_interleaved_write_frame () will wait until it has at least one packet
    for each stream before actually writing any packets to the output file.
    When some streams are "sparse" (i.e. there are large gaps between
    successive packets), this can result in excessive buffering.

    This field specifies the maximum difference between the timestamps of the
    first and the last packet in the muxing queue, above which libavformat
    will output a packet regardless of whether it has queued a packet for all
    the streams.

    Muxing only, set by the caller before avformat_write_header ().
    ***********************************************************/
    [CCode (cname="")]
    public int64 max_interleave_delta;

    /***********************************************************
    @brief Allow non-standard and experimental extension
    @see LibAVCodec.CodecContext.strict_std_compliance
    ***********************************************************/
    [CCode (cname="")]
    public int strict_std_compliance;

    /***********************************************************
    @brief Flags for the user to detect events happening on the file. Flags must
    be cleared by the user once the event has been handled.
    A combination of AVFMT_EVENT_FLAG_*.
    ***********************************************************/
    [CCode (cname="")]
    public AVFormatEventFlags event_flags;

    /***********************************************************
    @brief Maximum number of packets to read while waiting for the first timestamp.
    Decoding only.
    ***********************************************************/
    [CCode (cname="")]
    public int max_ts_probe;

    /***********************************************************
    @brief Avoid negative timestamps during muxing.
    Any value of the AVFormatAvoidNegativeTimestampFlags.* constants.
    Note, this only works when using av_interleaved_write_frame. (interleave_packet_per_dts is in use)
    - muxing: Set by user
    - demuxing: unused
    ***********************************************************/
    [CCode (cname="")]
    public AVFormatAvoidNegativeTimestampFlags avoid_negative_ts;

    /***********************************************************
    @brief Transport stream id.
    This will be moved into demuxer private options. Thus no API/ABI compatibility
    ***********************************************************/
    [CCode (cname="")]
    public int ts_id;

    /***********************************************************
    @brief Audio preload in microseconds.
    Note, not all formats support this and unpredictable things may happen if it is used when not supported.
    - encoding: Set by user
    - decoding: unused
    ***********************************************************/
    [CCode (cname="")]
    public int audio_preload;

    /***********************************************************
    @brief Max chunk time in microseconds.
    Note, not all formats support this and unpredictable things may happen if it is used when not supported.
    - encoding: Set by user
    - decoding: unused
    ***********************************************************/
    [CCode (cname="")]
    public int max_chunk_duration;

    /***********************************************************
    @brief Max chunk size in bytes
    Note, not all formats support this and unpredictable things may happen if it is used when not supported.
    - encoding: Set by user
    - decoding: unused
    ***********************************************************/
    [CCode (cname="")]
    public int max_chunk_size;

    /***********************************************************
    @brief Forces the use of wallclock timestamps as pts/dts of packets
    This has undefined results in the presence of B frames.
    - encoding: unused
    - decoding: Set by user
    ***********************************************************/
    [CCode (cname="")]
    public int use_wallclock_as_timestamps;

    /***********************************************************
    @brief Avio flags, used to force AVIOOpenFlags.DIRECT.
    - encoding: unused
    - decoding: Set by user
    ***********************************************************/
    [CCode (cname="")]
    public int avio_flags;

    /***********************************************************
    @brief The duration field can be estimated through various ways, and this field can be used
    to know how the duration was estimated.
    - encoding: unused
    - decoding: Read by user
    ***********************************************************/
    [CCode (cname="")]
    public AVDurationEstimationMethod duration_estimation_method;

    /***********************************************************
    @brief Skip initial bytes when opening stream
    - encoding: unused
    - decoding: Set by user
    ***********************************************************/
    [CCode (cname="")]
    public int64 skip_initial_bytes;

    /***********************************************************
    @brief Correct single timestamp overflows
    - encoding: unused
    - decoding: Set by user
    ***********************************************************/
    [CCode (cname="")]
    public uint correct_ts_overflow;

    /***********************************************************
    @brief Force seeking to any (also non key) frames.
    - encoding: unused
    - decoding: Set by user
    ***********************************************************/
    [CCode (cname="")]
    public int seek2any;

    /***********************************************************
    @brief Flush the I/O context after each packet.
    - encoding: Set by user
    - decoding: unused
    ***********************************************************/
    [CCode (cname="")]
    public int flush_packets;

    /***********************************************************
    @brief Format probing score.
    The maximal score is AVPROBE_SCORE_MAX, its set when the demuxer probes
    the format.
    - encoding: unused
    - decoding: set by avformat, read by user
    ***********************************************************/
    [CCode (cname="")]
    public int probe_score;

    /***********************************************************
    @brief Number of bytes to read maximally to identify format.
    - encoding: unused
    - decoding: set by user
    ***********************************************************/
    [CCode (cname="")]
    public int format_probesize;

    /***********************************************************
    ',' separated list of allowed decoders.
    If NULL then all are allowed
    - encoding: unused
    - decoding: set by user
    ***********************************************************/
    [CCode (cname="")]
    public string codec_whitelist;

    /***********************************************************
    ',' separated list of allowed demuxers.
    If NULL then all are allowed
    - encoding: unused
    - decoding: set by user
    ***********************************************************/
    [CCode (cname="")]
    public string format_whitelist;

    /***********************************************************
    @brief An opaque field for libavformat internal usage.
    Must not be accessed in any way by callers.
    ***********************************************************/
    [CCode (cname="")]
    public AVFormatInternal internal;

    /***********************************************************
    @brief IO repositioned flag.
    This is set by avformat when the underlaying IO context read pointer
    is repositioned, for example when doing byte based seeking.
    Demuxers can use the flag to detect such changes.
    ***********************************************************/
    [CCode (cname="")]
    public int io_repositioned;

    /***********************************************************
    @brief Forced video codec.
    This allows forcing a specific decoder, even when there are multiple with
    the same codec_id.
    Demuxing: Set by user
    ***********************************************************/
    [CCode (cname="")]
    public abstract LibAVCodec.Codec video_codec { public get; }

    /***********************************************************
    @brief Forced audio codec.
    This allows forcing a specific decoder, even when there are multiple with
    the same codec_id.
    Demuxing: Set by user
    ***********************************************************/
    [CCode (cname="")]
    public abstract LibAVCodec.Codec audio_codec { public get; }

    /***********************************************************
    @brief Forced subtitle codec.
    This allows forcing a specific decoder, even when there are multiple with
    the same codec_id.
    Demuxing: Set by user
    ***********************************************************/
    [CCode (cname="")]
    public abstract LibAVCodec.Codec subtitle_codec { public get; }

    /***********************************************************
    @brief Forced data codec.
    This allows forcing a specific decoder, even when there are multiple with
    the same codec_id.
    Demuxing: Set by user
    ***********************************************************/
    [CCode (cname="")]
    public abstract LibAVCodec.Codec data_codec { public get; }

    /***********************************************************
    @brief Number of bytes to be written as padding in a metadata header.
    Demuxing: Unused.
    Muxing: Set by user via av_format_set_metadata_header_padding.
    ***********************************************************/
    [CCode (cname="")]
    public int metadata_header_padding;

    /***********************************************************
    User data.
    This is a place for some private data of the user.
    ***********************************************************/
    [CCode (cname="")]
    public void *opaque;

    /***********************************************************
    @brief Callback used by devices to communicate with application.
    ***********************************************************/
    [CCode (cname="")]
    public AVFormatControlMessage control_message_cb;

    /***********************************************************
    @brief Output timestamp offset, in microseconds.
    Muxing: set by user
    ***********************************************************/
    [CCode (cname="")]
    public int64 output_ts_offset;

    /***********************************************************
    @brief Dump format separator.
    can be ", " or "\n      " or anything else
    - muxing: Set by user.
    - demuxing: Set by user.
    ***********************************************************/
    [CCode (cname="")]
    public uint8[] dump_separator;

    /***********************************************************
    @brief Forced Data codec_id.
    Demuxing: Set by user.
    ***********************************************************/
    [CCode (cname="")]
    public LibAVCodec.CodecID data_codec_id;

    /***********************************************************
    ',' separated list of allowed protocols.
    - encoding: unused
    - decoding: set by user
    ***********************************************************/
    [CCode (cname="")]
    public string protocol_whitelist;

    /***********************************************************
    @brief A callback for opening new IO streams.

    Whenever a muxer or a demuxer needs to open an IO stream (typically from
    avformat_open_input () for demuxers, but for certain formats can happen at
    other times as well), it will call this callback to obtain an IO context.

    @param format_context the format context
    @param pb on success, the newly opened IO context should be returned here
    @param url the url to open
    @param flags a combination of AVIOOpenFlags.*
    @param options a dictionary of additional options, with the same
                   semantics as in avio_open2 ()
    @return 0 on success, a negative LibAVUtil.ErrorCode code on failure

    @note Certain muxers and demuxers do nesting, i.e. they open one or more
    additional internal format contexts. Thus the LibAVFormat.FormatContext pointer
    passed to this callback may be different from the one facing the caller.
    It will, however, have the same 'opaque' field.
    ***********************************************************/
    [CCode (cname="")]
    public abstract int io_open (
        LibAVFormat.FormatContext format_context,
        out AVIOContext pb,
        string url,
        int flags,
        out LibAVUtil.Dictionary options
    );

    /***********************************************************
    @brief A callback for closing the streams opened with LibAVFormat.FormatContext.io_open ().
    ***********************************************************/
    [CCode (cname="")]
    public abstract void io_close (
        LibAVFormat.FormatContext format_context,
        AVIOContext pb
    );

    /***********************************************************
    ',' separated list of disallowed protocols.
    - encoding: unused
    - decoding: set by user
    ***********************************************************/
    [CCode (cname="")]
    public string protocol_blacklist;

    /***********************************************************
    @brief The maximum number of streams.
    - encoding: unused
    - decoding: set by user
    ***********************************************************/
    [CCode (cname="")]
    public int max_streams;

    /***********************************************************
    @brief Skip duration calcuation in estimate_timings_from_pts.
    - encoding: unused
    - decoding: set by user
    ***********************************************************/
    [CCode (cname="")]
    public int skip_estimate_duration_from_pts;
}

/***********************************************************
@brief This function will cause global side data to be injected in the next packet
of each stream as well as after any subsequent seek.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public void av_format_inject_global_side_data (
    LibAVFormat.FormatContext format_context
);

/***********************************************************
@brief Returns the method used to set fomat_context.duration.

@return AVDurationEstimationMethod.FROM_PTS, AVDurationEstimationMethod.FROM_STREAM, or AVDurationEstimationMethod.FROM_BITRATE.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public AVDurationEstimationMethod av_fmt_ctx_get_duration_estimation_method (
    LibAVFormat.FormatContext fomat_context
);

[CCode (cname="struct AVPacketList",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
[Compact]
public class LibAVFormat.PacketList {
    [CCode (cname="")]
    public LibAVCodec.Packet packet;

    [CCode (cname="")]
    public LibAVFormat.PacketList? next;
}


/***********************************************************
@defgroup lavf_core Core functions
@ingroup libavf

Functions for querying libavformat capabilities, allocating core structures,
etc.
@{
***********************************************************/

/***********************************************************
@brief Return the LIBAVFORMAT_VERSION_INT constant.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public uint avformat_version ();

/***********************************************************
@brief Return the libavformat build-time configuration.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public string avformat_configuration ();

/***********************************************************
@brief Return the libavformat license.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public string avformat_license ();

/***********************************************************
@brief Do global initialization of network libraries. This is optional,
and not recommended anymore.

This functions only exists to work around thread-safety issues
with older GnuTLS or OpenSSL libraries. If libavformat is linked
to newer versions of those libraries, or if you do not use them,
calling this function is unnecessary. Otherwise, you need to call
this function before any other threads using them are started.

This function will be deprecated once support for older GnuTLS and
OpenSSL libraries is removed, and this function has no purpose
anymore.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public int avformat_network_init ();

/***********************************************************
@brief Undo the initialization done by avformat_network_init. Call it only
once for each time you called avformat_network_init.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public int avformat_network_deinit ();

/***********************************************************
@brief Iterate over all registered muxers.

@param opaque a pointer where libavformat will store the iteration state. Must
              point to NULL to start the iteration.

@return the next registered muxer or NULL when the iteration is
        finished
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public LibAVFormat.OutputFormat av_muxer_iterate (
    out void *opaque
);

/***********************************************************
@brief Iterate over all registered demuxers.

@param opaque a pointer where libavformat will store the iteration state. Must
              point to NULL to start the iteration.

@return the next registered demuxer or NULL when the iteration is
        finished
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public LibAVFormat.InputFormat av_demuxer_iterate (
    out void *opaque
);

/***********************************************************
@brief Allocate an LibAVFormat.FormatContext.
avformat_free_context () can be used to free the context and everything
allocated by the framework within it.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public LibAVFormat.FormatContext avformat_alloc_context ();

/***********************************************************
@brief Free an LibAVFormat.FormatContext and all its streams.
@param format_context context to free
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public void avformat_free_context (
    LibAVFormat.FormatContext format_context
);

/***********************************************************
@brief Get the LibAVUtil.Log.Class for LibAVFormat.FormatContext. It can be used in combination with
OptionSearchFlags.FAKE_OBJECT_PARAMETER for examining options.

@see av_opt_find ().
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public LibAVUtil.Log.Class avformat_get_class ();

/***********************************************************
@brief Add a new stream to a media file.

When demuxing, it is called by the demuxer in read_header (). If the
flag AVFormatContextFlags.NO_HEADER is set in format_context.ctx_flags, then it may also
be called in read_packet ().

When muxing, should be called by the user before avformat_write_header ().

User is required to call avcodec_close () and avformat_free_context () to
clean up the allocation by avformat_new_stream ().

@param format_context media file handle
@param codec If non-NULL, the LibAVCodec.CodecContext corresponding to the new stream
will be initialized to use this codec. This is needed for e.g. codec-specific
defaults to be set, so codec should be provided if it is known.

@return newly created stream or NULL on error.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public LibAVFormat.Stream avformat_new_stream (
    LibAVFormat.FormatContext format_context,
    LibAVCodec.Codec codec
);

/***********************************************************
@brief Wrap an existing array as stream side data.

@param st stream
@param type side information type
@param data the side data array. It must be allocated with the av_malloc ()
            family of functions. The ownership of the data is transferred to
            st.
@param size side information size
@return zero on success, a negative LibAVUtil.ErrorCode code on failure. On failure,
        the stream is unchanged and the data remains owned by the caller.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public int av_stream_add_side_data (
    LibAVFormat.Stream st,
    LibAVCodec.PacketSideDataType type,
    uint8[] data,
    size_t size
);

/***********************************************************
@brief Allocate new information from stream.

@param stream stream
@param type desired side information type
@param size side information size
@return pointer to fresh allocated data or NULL otherwise
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public uint8[] av_stream_new_side_data (
    LibAVFormat.Stream stream,
    LibAVCodec.PacketSideDataType type,
    int size
);

/***********************************************************
@brief Get side information from stream.

@param stream stream
@param type desired side information type
@param size pointer for side information size to store (optional)
@return pointer to data if present or NULL otherwise
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public uint8[] av_stream_get_side_data (
    LibAVFormat.Stream stream,
    LibAVCodec.PacketSideDataType type,
    int[] size
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public LibAVFormat.Program av_new_program (
    LibAVFormat.FormatContext format_context,
    int id
);

/***********************************************************
@}
***********************************************************/


/***********************************************************
@brief Allocate an LibAVFormat.FormatContext for an output format.
avformat_free_context () can be used to free the context and
everything allocated by the framework within it.

@param fomat_context is set to the created format context, or to NULL in
case of failure
@param oformat format to use for allocating the context, if NULL
format_name and filename are used instead
@param format_name the name of output format to use for allocating the
context, if NULL filename is used instead
@param filename the name of the filename to use for allocating the
context, may be NULL
@return >= 0 in case of success, a negative LibAVUtil.ErrorCode code in case of
failure
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public int avformat_alloc_output_context2 (
    out LibAVFormat.FormatContext fomat_context,
    LibAVFormat.OutputFormat oformat,
    string format_name,
    string filename
);

/***********************************************************
@addtogroup lavf_decoding
@{
***********************************************************/

/***********************************************************
@brief Find LibAVFormat.InputFormat based on the short name of the input format.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public LibAVFormat.InputFormat av_find_input_format (
    string short_name
);

/***********************************************************
@brief Guess the file format.

@param probe_data data to be probed
@param is_opened Whether the file is already opened; determines whether
                 demuxers with or without AVFormatFlags1.NO_FILE are probed.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public LibAVFormat.InputFormat av_probe_input_format (
    LibAVFormat.ProbeData probe_data,
    int is_opened
);

/***********************************************************
@brief Guess the file format.

@param probe_data data to be probed
@param is_opened Whether the file is already opened; determines whether
                 demuxers with or without AVFormatFlags1.NO_FILE are probed.
@param score_max A probe score larger that this is required to accept a
                 detection, the variable is set to the actual detection
                 score afterwards.
                 If the score is <= AVPROBE_SCORE_MAX / 4 it is recommended
                 to retry with a larger probe buffer.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public LibAVFormat.InputFormat av_probe_input_format2 (
    LibAVFormat.ProbeData probe_data,
    int is_opened,
    out int score_max
);

/***********************************************************
@brief Guess the file format.

@param is_opened Whether the file is already opened; determines whether
                 demuxers with or without AVFormatFlags1.NO_FILE are probed.
@param score_ret The score of the best detection.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public LibAVFormat.InputFormat av_probe_input_format3 (
    LibAVFormat.ProbeData probe_data,
    int is_opened,
    out int score_ret
);

/***********************************************************
@brief Probe a bytestream to determine the input format. Each time a probe returns
with a score that is too low, the probe buffer size is increased and another
attempt is made. When the maximum probe size is reached, the input format
with the highest score is returned.

@param pb the bytestream to probe
@param fmt the input format is put here
@param url the url of the stream
@param logctx the log context
@param offset the offset within the bytestream to probe from
@param max_probe_size the maximum probe buffer size (zero for default)
@return the score in case of success, a negative value corresponding to an
        the maximal score is AVPROBE_SCORE_MAX
LibAVUtil.ErrorCode code otherwise
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public int av_probe_input_buffer2 (
    AVIOContext pb,
    out LibAVFormat.InputFormat fmt,
    string url,
    void *logctx,
    uint offset,
    uint max_probe_size
);

/***********************************************************
@brief Like av_probe_input_buffer2 () but returns 0 on success
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public int av_probe_input_buffer (
    AVIOContext pb,
    out LibAVFormat.InputFormat fmt,
    string url,
    void *logctx,
    uint offset,
    uint max_probe_size
);

/***********************************************************
@brief Open an input stream and read the header. The codecs are not opened.
The stream must be closed with avformat_close_input ().

@param ps Pointer to user-supplied LibAVFormat.FormatContext (allocated by avformat_alloc_context).
          May be a pointer to NULL, in which case an LibAVFormat.FormatContext is allocated by this
          function and written into ps.
          Note that a user-supplied LibAVFormat.FormatContext will be freed on failure.
@param url URL of the stream to open.
@param fmt If non-NULL, this parameter forces a specific input format.
           Otherwise the format is autodetected.
@param options A dictionary filled with LibAVFormat.FormatContext and demuxer-private options.
                On return this parameter will be destroyed and replaced with a dict containing
                options that were not found. May be NULL.

@return 0 on success, a negative LibAVUtil.ErrorCode on failure.

@note If you want to use custom IO, preallocate the format context and set its pb field.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public int avformat_open_input (
    out LibAVFormat.FormatContext ps,
    string url,
    LibAVFormat.InputFormat fmt,
    out LibAVUtil.Dictionary options
);

/***********************************************************
@brief Read packets of a media file to get stream information. This
is useful for file formats with no headers such as MPEG. This
function also computes the real framerate in case of MPEG-2 repeat
frame mode.
The logical file position is not changed by this function;
examined packets may be buffered for later processing.

@param ic media file handle
@param options If non-NULL, an ic.nb_streams long array of pointers to
                dictionaries, where i-th member contains options for
                codec corresponding to i-th stream.
                On return each dictionary will be filled with options that were not found.
@return >=0 if OK, LibAVUtil.ErrorCode.xxx on error

@note this function isn't guaranteed to open all the codecs, so
      options being non-empty at return is a perfectly normal behavior.

@todo Let the user decide somehow what information is needed so that
      we do not waste time getting stuff the user does not need.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public int avformat_find_stream_info (
    LibAVFormat.FormatContext ic,
    out LibAVUtil.Dictionary options
);

/***********************************************************
@brief Find the programs which belong to a given stream.

@param ic media file handle
@param last the last found program, the search will start after this
             program, or from the beginning if it is NULL
@param stream_index stream index
@return the next program which belongs to stream_index, NULL if no program is found or
        the last program is not among the programs of ic.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public LibAVFormat.Program av_find_program_from_stream (
    LibAVFormat.FormatContext ic,
    LibAVFormat.Program last,
    int stream_index
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public void av_program_add_stream_index (
    LibAVFormat.FormatContext ac,
    int progid,
    uint idx
);

/***********************************************************
@brief Find the "best" stream in the file.
The best stream is determined according to various heuristics as the most
likely to be what the user expects.
If the decoder parameter is non-NULL, av_find_best_stream will find the
default decoder for the stream's codec; streams for which no decoder can
be found are ignored.

@param ic media file handle
@param type stream type: video, audio, subtitles, etc.
@param wanted_stream_nb user-requested stream number,
                         or -1 for automatic selection
@param related_stream try to find a stream related (eg. in the same
                         program) to this one, or -1 if none
@param decoder_ret if non-NULL, returns the decoder for the
                         selected stream
@param flags flags; none are currently defined
@return the non-negative stream number in case of success,
         LibAVUtil.ErrorCode.STREAM_NOT_FOUND if no stream with the requested type
         could be found,
         LibAVUtil.ErrorCode.DECODER_NOT_FOUND if streams were found but no decoder
@note If av_find_best_stream returns successfully and decoder_ret is not
       NULL, then decoder_ret is guaranteed to be set to a valid LibAVCodec.Codec.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public int av_find_best_stream (
    LibAVFormat.FormatContext ic,
    LibAVUtil.MediaType type,
    int wanted_stream_nb,
    int related_stream,
    out LibAVCodec.Codec decoder_ret,
    int flags
);

/***********************************************************
@brief Return the next frame of a stream.
This function returns what is stored in the file, and does not validate
that what is there are valid frames for the decoder. It will split what is
stored in the file into frames and return one for each call. It will not
omit invalid data between valid frames so as to give the decoder the maximum
information possible for decoding.

If packet.buffer is NULL, then the packet is valid until the next
av_read_frame () or until avformat_close_input (). Otherwise the packet
is valid indefinitely. In both cases the packet must be freed with
av_packet_unref when it is no longer needed. For video, the packet contains
exactly one frame. For audio, it contains an integer number of frames if each
frame has a known fixed size (e.g. PCM or ADPCM data). If the audio frames
have a variable size (e.g. MPEG audio), then it contains one frame.

packet.pts, packet.dts and packet.duration are always set to correct
values in LibAVFormat.Stream.time_base units (and guessed if the format cannot
provide them). packet.pts can be AV_NOPTS_VALUE if the video format
has B-frames, so it is better to rely on packet.dts if you do not
decompress the payload.

@return 0 if OK, < 0 on error or end of file
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public int av_read_frame (
    LibAVFormat.FormatContext format_context,
    LibAVCodec.Packet packet
);

/***********************************************************
@brief Seek to the keyframe at timestamp.
'timestamp' in 'stream_index'.

@param format_context media file handle
@param stream_index If stream_index is (-1), a default
stream is selected, and timestamp is automatically converted
from AV_TIME_BASE units to the stream specific time_base.
@param timestamp Timestamp in LibAVFormat.Stream.time_base units
       or, if no stream is specified, in AV_TIME_BASE units.
@param flags flags which select direction and seeking mode
@return >= 0 on success
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public int av_seek_frame (
    LibAVFormat.FormatContext format_context,
    int stream_index,
    int64 timestamp,
    int flags
);

/***********************************************************
@brief Seek to timestamp ts.
Seeking will be done so that the point from which all active streams
can be presented successfully will be closest to ts and within min/max_ts.
Active streams are all streams that have LibAVFormat.Stream.discard < AVDISCARD_ALL.

If flags contain AVFormatSeekFlags.BYTE, then all timestamps are in bytes and
are the file position (this may not be supported by all demuxers).
If flags contain AVFormatSeekFlags.FRAME, then all timestamps are in frames
in the stream with stream_index (this may not be supported by all demuxers).
Otherwise all timestamps are in units of the stream selected by stream_index
or if stream_index is -1, in AV_TIME_BASE units.
If flags contain AVFormatSeekFlags.ANY, then non-keyframes are treated as
keyframes (this may not be supported by all demuxers).
If flags contain AVFormatSeekFlags.BACKWARD, it is ignored.

@param format_context media file handle
@param stream_index index of the stream which is used as time base reference
@param min_ts smallest acceptable timestamp
@param ts target timestamp
@param max_ts largest acceptable timestamp
@param flags flags
@return >=0 on success, error code otherwise

@note This is part of the new seek API which is still under construction.
      Thus do not use this yet. It may change at any time, do not expect
      ABI compatibility yet!
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public int avformat_seek_file (
    LibAVFormat.FormatContext format_context,
    int stream_index,
    int64 min_ts,
    int64 ts,
    int64 max_ts,
    AVFormatSeekFlags flags
);

/***********************************************************
@brief Discard all internally buffered data. This can be useful when dealing with
discontinuities in the byte stream. Generally works only with formats that
can resync. This includes headerless formats like MPEG-TS/TS but should also
work with NUT, Ogg and in a limited way AVI for example.

The set of streams, the detected duration, stream parameters and codecs do
not change when calling this function. If you want a complete reset, it's
better to open a new LibAVFormat.FormatContext.

This does not flush the AVIOContext (format_context.pb). If necessary, call
avio_flush (format_context.pb) before calling this function.

@param format_context media file handle
@return >=0 on success, error code otherwise
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public int avformat_flush (
    LibAVFormat.FormatContext format_context
);

/***********************************************************
@brief Start playing a network-based stream (e.g. RTSP stream) at the
current position.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public int av_read_play (
    LibAVFormat.FormatContext format_context
);

/***********************************************************
@brief Pause a network-based stream (e.g. RTSP stream).

Use av_read_play () to resume it.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public int av_read_pause (
    LibAVFormat.FormatContext format_context
);

/***********************************************************
@brief Close an opened input LibAVFormat.FormatContext. Free it and all its contents
and set format_context to NULL.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public void avformat_close_input (
    out LibAVFormat.FormatContext format_context
);

/***********************************************************
@}
***********************************************************/

[Flags]
[CCode (cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public enum AVFormatSeekFlags {
    /***********************************************************
    @brief Seek backward
    ***********************************************************/
    [CCode (cname="AVSEEK_FLAG_BACKWARD")]
    BACKWARD,

    /***********************************************************
    @brief Seeking based on position in bytes
    ***********************************************************/
    [CCode (cname="AVSEEK_FLAG_BYTE")]
    BYTE,

    /***********************************************************
    @brief Seek to any frame, even non-keyframes
    ***********************************************************/
    [CCode (cname="AVSEEK_FLAG_ANY")]
    ANY,

    /***********************************************************
    @brief Seeking based on frame number
    ***********************************************************/
    [CCode (cname="AVSEEK_FLAG_FRAME")]
    FRAME;
}

/***********************************************************
@addtogroup lavf_encoding
@{
***********************************************************/

[Flags]
[CCode (cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public enum AVFormatStreamInitializationFlags {
    /***********************************************************
    @brief Stream parameters initialized in avformat_write_header
    ***********************************************************/
    [CCode (cname="AVSTREAM_INIT_IN_WRITE_HEADER")]
    WRITE_HEADER,

    /***********************************************************
    @brief Stream parameters initialized in avformat_init_output
    ***********************************************************/
    [CCode (cname="AVSTREAM_INIT_IN_INIT_OUTPUT")]
    INIT_OUTPUT;
}

/***********************************************************
@brief Allocate the stream private data and write the stream header to
an output media file.

@param format_context Media file handle, must be allocated with avformat_alloc_context ().
         Its oformat field must be set to the desired output format;
         Its pb field must be set to an already opened AVIOContext.
@param options An LibAVUtil.Dictionary filled with LibAVFormat.FormatContext and muxer-private options.
                On return this parameter will be destroyed and replaced with a dict containing
                options that were not found. May be NULL.

@return AVFormatStreamInitializationFlags.WRITE_HEADER on success if the codec had not already been fully initialized in avformat_init,
        AVFormatStreamInitializationFlags.INIT_OUTPUT on success if the codec had already been fully initialized in avformat_init,
        negative LibAVUtil.ErrorCode on failure.

@see av_opt_find, av_dict_set, avio_open, av_oformat_next, avformat_init_output.
***********************************************************/
//  av_warn_unused_result
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public int avformat_write_header (
    LibAVFormat.FormatContext format_context,
    out LibAVUtil.Dictionary options
);

/***********************************************************
@brief Allocate the stream private data and initialize the codec, but do not write the header.
May optionally be used before avformat_write_header to initialize stream parameters
before actually writing the header.
If using this function, do not pass the same options to avformat_write_header.

@param format_context Media file handle, must be allocated with avformat_alloc_context ().
         Its oformat field must be set to the desired output format;
         Its pb field must be set to an already opened AVIOContext.
@param options An LibAVUtil.Dictionary filled with LibAVFormat.FormatContext and muxer-private options.
                On return this parameter will be destroyed and replaced with a dict containing
                options that were not found. May be NULL.

@return AVFormatStreamInitializationFlags.WRITE_HEADER on success if the codec requires avformat_write_header to fully initialize,
        AVFormatStreamInitializationFlags.INIT_OUTPUT on success if the codec has been fully initialized,
        negative LibAVUtil.ErrorCode on failure.

@see av_opt_find, av_dict_set, avio_open, av_oformat_next, avformat_write_header.
***********************************************************/
//  av_warn_unused_result
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public int avformat_init_output (
    LibAVFormat.FormatContext format_context,
    out LibAVUtil.Dictionary options
);

/***********************************************************
@brief Write a packet to an output media file.

This function passes the packet directly to the muxer, without any buffering
or reordering. The caller is responsible for correctly interleaving the
packets if the format requires it. Callers that want libavformat to handle
the interleaving should call av_interleaved_write_frame () instead of this
function.

@param format_context media file handle
@param packet The packet containing the data to be written. Note that unlike
           av_interleaved_write_frame (), this function does not take
           ownership of the packet passed to it (though some muxers may make
           an internal reference to the input packet).
           <br>
           This parameter can be NULL (at any time, not just at the end), in
           order to immediately flush data buffered within the muxer, for
           muxers that buffer up data internally before writing it to the
           output.
           <br>
           Packet's @ref LibAVCodec.Packet.stream_index "stream_index" field must be
           set to the index of the corresponding stream in @ref
           LibAVFormat.FormatContext.streams "format_context.streams".
           <br>
           The timestamps (@ref LibAVCodec.Packet.pts "pts", @ref LibAVCodec.Packet.dts "dts")
           must be set to correct values in the stream's timebase (unless the
           output format is flagged with the AVFormatFlags1.NO_TIMESTAMPS flag, then
           they can be set to AV_NOPTS_VALUE).
           The dts for subsequent packets passed to this function must be strictly
           increasing when compared in their respective timebases (unless the
           output format is flagged with the AVFormatFlags1.ALLOW_NON_STRICT_TIMESTAMPS, then they
           merely have to be nondecreasing).  @ref LibAVCodec.Packet.duration
           "duration") should also be set if known.
@return < 0 on error, = 0 if OK, 1 if flushed and there is no more data to flush

@see av_interleaved_write_frame ()
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public int av_write_frame (
    LibAVFormat.FormatContext format_context,
    LibAVCodec.Packet packet
);

/***********************************************************
@brief Write a packet to an output media file ensuring correct interleaving.

This function will buffer the packets internally as needed to make sure the
packets in the output file are properly interleaved in the order of
increasing dts. Callers doing their own interleaving should call
av_write_frame () instead of this function.

Using this function instead of av_write_frame () can give muxers advance
knowledge of future packets, improving e.g. the behaviour of the mp4
muxer for VFR content in fragmenting mode.

@param format_context media file handle
@param packet The packet containing the data to be written.
           <br>
           If the packet is reference-counted, this function will take
           ownership of this reference and unreference it later when it sees
           fit.
           The caller must not access the data through this reference after
           this function returns. If the packet is not reference-counted,
           libavformat will make a copy.
           <br>
           This parameter can be NULL (at any time, not just at the end), to
           flush the interleaving queues.
           <br>
           Packet's @ref LibAVCodec.Packet.stream_index "stream_index" field must be
           set to the index of the corresponding stream in @ref
           LibAVFormat.FormatContext.streams "format_context.streams".
           <br>
           The timestamps (@ref LibAVCodec.Packet.pts "pts", @ref LibAVCodec.Packet.dts "dts")
           must be set to correct values in the stream's timebase (unless the
           output format is flagged with the AVFormatFlags1.NO_TIMESTAMPS flag, then
           they can be set to AV_NOPTS_VALUE).
           The dts for subsequent packets in one stream must be strictly
           increasing (unless the output format is flagged with the
           AVFormatFlags1.ALLOW_NON_STRICT_TIMESTAMPS, then they merely have to be nondecreasing).
           @ref LibAVCodec.Packet.duration "duration") should also be set if known.

@return 0 on success, a negative LibAVUtil.ErrorCode on error. Libavformat will always
        take care of freeing the packet, even if this function fails.

@see av_write_frame (), LibAVFormat.FormatContext.max_interleave_delta
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public int av_interleaved_write_frame (
    LibAVFormat.FormatContext format_context,
    LibAVCodec.Packet packet
);

/***********************************************************
@brief Write an uncoded frame to an output media file.

The frame must be correctly interleaved according to the container
specification; if not, then av_interleaved_write_frame () must be used.

See av_interleaved_write_frame () for details.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public int av_write_uncoded_frame (
    LibAVFormat.FormatContext format_context,
    int stream_index,
    LibAVUtil.Frame frame
);

/***********************************************************
@brief Write an uncoded frame to an output media file.

If the muxer supports it, this function makes it possible to write an LibAVUtil.Frame
structure directly, without encoding it into a packet.
It is mostly useful for devices and similar special muxers that use raw
video or PCM data and will not serialize it into a byte stream.

To test whether it is possible to use it with a given muxer and stream,
use av_write_uncoded_frame_query ().

The caller gives up ownership of the frame and must not access it
afterwards.

@return  >=0 for success, a negative code on error
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public int av_interleaved_write_uncoded_frame (
    LibAVFormat.FormatContext format_context,
    int stream_index,
    LibAVUtil.Frame frame
);

/***********************************************************
@brief Test whether a muxer supports uncoded frame.

@return  >=0 if an uncoded frame can be written to that muxer and stream,
         <0 if not
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public int av_write_uncoded_frame_query (
    LibAVFormat.FormatContext format_context,
    int stream_index
);

/***********************************************************
@brief Write the stream trailer to an output media file and free the
file private data.

May only be called after a successful call to avformat_write_header.

@param format_context media file handle
@return 0 if OK, LibAVUtil.ErrorCode.xxx on error
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public int av_write_trailer (
    LibAVFormat.FormatContext format_context
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
public LibAVFormat.OutputFormat av_guess_format (
    string short_name,
    string filename,
    string mime_type
);

/***********************************************************
@brief Guess the codec ID based upon muxer and filename.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public LibAVCodec.CodecID av_guess_codec (
    LibAVFormat.OutputFormat fmt,
    string short_name,
    string filename,
    string mime_type,
    LibAVUtil.MediaType type
);

/***********************************************************
@brief Get timing information for the data currently output.
The exact meaning of "currently output" depends on the format.
It is mostly relevant for devices that have an internal buffer and/or
work in real time.
@param format_context media file handle
@param stream stream in the media file
@param[out] dts DTS of the last packet output for the stream, in stream
                  time_base units
@param[out] wall absolute time when that packet whas output,
                  in microsecond
@return 0 if OK, LibAVUtil.ErrorCode (ENOSYS) if the format does not support it
Note: some formats or devices may not allow to measure dts and wall
atomically.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public int av_get_output_timestamp (
    LibAVFormat.FormatContext format_context,
    int stream,
    out int64 dts,
    out int64 wall
);


/***********************************************************
@}
***********************************************************/


/***********************************************************
@defgroup lavf_misc Utility functions
@ingroup libavf
@{

Miscellaneous utility functions related to both muxing and demuxing
(or neither).
***********************************************************/

/***********************************************************
@brief Send a nice hexadecimal dump of a buffer to the specified file stream.

@param file The file stream pointer where the dump should be sent to.
@param buffer buffer
@param size buffer size

@see av_hex_dump_log, av_pkt_dump2, av_pkt_dump_log2
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public void av_hex_dump (
    GLib.File file,
    uint8[] buffer,
    int size
);

/***********************************************************
@brief Send a nice hexadecimal dump of a buffer to the log.

@param avcl A pointer to an arbitrary struct of which the first field is a
pointer to an LibAVUtil.Log.Class struct.
@param level The importance level of the message, lower values signifying
higher importance.
@param buffer buffer
@param size buffer size

@see av_hex_dump, av_pkt_dump2, av_pkt_dump_log2
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public void av_hex_dump_log (
    void *avcl,
    int level,
    uint8[] buffer,
    int size
);

/***********************************************************
@brief Send a nice dump of a packet to the specified file stream.

@param file The file stream pointer where the dump should be sent to.
@param packet packet to dump
@param dump_payload True if the payload must be displayed, too.
@param st LibAVFormat.Stream that the packet belongs to
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public void av_pkt_dump2 (
    GLib.File file,
    LibAVCodec.Packet packet,
    int dump_payload,
    LibAVFormat.Stream st
);


/***********************************************************
@brief Send a nice dump of a packet to the log.

@param avcl A pointer to an arbitrary struct of which the first field is a
pointer to an LibAVUtil.Log.Class struct.
@param level The importance level of the message, lower values signifying
higher importance.
@param packet packet to dump
@param dump_payload True if the payload must be displayed, too.
@param st LibAVFormat.Stream that the packet belongs to
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public void av_pkt_dump_log2 (
    void *avcl,
    int level,
    LibAVCodec.Packet packet,
    int dump_payload,
    LibAVFormat.Stream st
);

/***********************************************************
@brief Get the LibAVCodec.CodecID for the given codec tag tag.
If no codec id is found returns LibAVCodec.CodecID.NONE.

@param tags list of supported codec_id-codec_tag_list pairs, as stored
in LibAVFormat.InputFormat.codec_tag_list and LibAVFormat.OutputFormat.codec_tag_list
@param tag codec tag to match to a codec ID
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public LibAVCodec.CodecID av_codec_get_id (
    AVCodecTag[] tags,
    uint tag
);

/***********************************************************
@brief Get the codec tag for the given codec id id.
If no codec tag is found returns 0.

@param tags list of supported codec_id-codec_tag_list pairs, as stored
in LibAVFormat.InputFormat.codec_tag_list and LibAVFormat.OutputFormat.codec_tag_list
@param id codec ID to match to a codec tag
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public uint av_codec_get_tag (
    AVCodecTag[] tags,
    LibAVCodec.CodecID id
);

/***********************************************************
@brief Get the codec tag for the given codec id.

@param tags list of supported codec_id - codec_tag_list pairs, as stored
in LibAVFormat.InputFormat.codec_tag_list and LibAVFormat.OutputFormat.codec_tag_list
@param id codec id that should be searched for in the list
@param tag A pointer to the found tag
@return 0 if id was not found in tags, > 0 if it was found
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public int av_codec_get_tag2 (
    AVCodecTag[] tags,
    LibAVCodec.CodecID id,
    out uint tag
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public int av_find_default_stream_index (
    LibAVFormat.FormatContext format_context
);

/***********************************************************
@brief Get the index for a specific timestamp.

@param st stream that the timestamp belongs to
@param timestamp timestamp to retrieve the index for
@param flags if AVFormatSeekFlags.BACKWARD then the returned index will correspond
                to the timestamp which is <= the requested one, if backward
                is 0, then it will be >=
             if AVFormatSeekFlags.ANY seek to any frame, only keyframes otherwise
@return < 0 if no such timestamp could be found
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public int av_index_search_timestamp (
    LibAVFormat.Stream st,
    int64 timestamp,
    AVFormatSeekFlags flags
);

/***********************************************************
@brief Add an index entry into a sorted list. Update the entry if the list
already contains it.

@param timestamp timestamp in the time base of the given stream
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public int av_add_index_entry (
    LibAVFormat.Stream st,
    int64 pos,
    int64 timestamp,
    int size,
    int distance,
    int flags
);


/***********************************************************
@brief Split a URL string into components.

The pointers to buffers for storing individual components may be null,
in order to ignore that component. Buffers for components not found are
set to empty strings. If the port is not found, it is set to a negative
value.

@param proto the buffer for the protocol
@param proto_size the size of the proto buffer
@param authorization the buffer for the authorization
@param authorization_size the size of the authorization buffer
@param hostname the buffer for the host name
@param hostname_size the size of the hostname buffer
@param port_ptr a pointer to store the port number in
@param path the buffer for the path
@param path_size the size of the path buffer
@param url the URL to split
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public void av_url_split (
    string proto,
    int proto_size,
    string authorization,
    int authorization_size,
    string hostname,
    int hostname_size,
    out int port_ptr,
    string path,
    int path_size,
    string url
);


/***********************************************************
@brief Print detailed information about the input or output format, such as
duration, bitrate, streams, container, programs, metadata, side data,
codec and time base.

@param ic the context to analyze
@param index index of the stream to dump information about
@param url the URL to print, such as source or destination file
@param is_output Select whether the specified context is an input (0) or output (1)
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public void av_dump_format (
    LibAVFormat.FormatContext ic,
    int index,
    string url,
    int is_output
);

[Flags]
[CCode (cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public enum AVFormatFrameFilenameFlags {
    /***********************************************************
    @brief Allow multiple %d
    ***********************************************************/
    [CCode (cname="AV_FRAME_FILENAME_FLAGS_MULTIPLE")]
    MULTIPLE;
}

/***********************************************************
@brief Return in 'buffer' the path with '%d' replaced by a number.

Also handles the '%0nd' format where 'n' is the total number
of digits and '%%'.

@param buffer destination buffer
@param buf_size destination buffer size
@param path numbered sequence string
@param number frame number
@param flags AVFormatFrameFilenameFlags.*
@return 0 if OK, -1 on format error
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public int av_get_frame_filename2 (
    string buffer,
    int buf_size,
    string path,
    int number,
    int flags
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public int av_get_frame_filename (
    string buffer,
    int buf_size,
    string path,
    int number
);

/***********************************************************
@brief Check whether filename actually is a numbered sequence generator.

@param filename possible numbered sequence string
@return 1 if a valid numbered sequence string, 0 otherwise
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public int av_filename_number_test (
    string filename
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
@brief Return a positive value if the given filename has one of the given
extensions, 0 otherwise.

@param filename file name to check against the given extensions
@param extensions a comma-separated list of filename extensions
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public int av_match_ext (
    string filename,
    string extensions
);

/***********************************************************
@brief Test if the given container can store a codec.

@param ofmt container to check for compatibility
@param codec_id codec to potentially store in container
@param std_compliance standards compliance level, one of StrictStandardsCompliance.*

@return 1 if codec with ID codec_id can be stored in ofmt, 0 if it cannot.
        A negative number if this information is not available.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public int avformat_query_codec (
    LibAVFormat.OutputFormat ofmt,
    LibAVCodec.CodecID codec_id,
    int std_compliance
);

/***********************************************************
@defgroup riff_fourcc RIFF FourCCs
@{
Get the tables mapping RIFF FourCCs to libavcodec AVCodecIDs. The tables are
meant to be passed to av_codec_get_id ()/av_codec_get_tag () as in the
following code:
@code
uint32 tag = MKTAG ('H', '2', '6', '4');
AVCodecTag table[] = { avformat_get_riff_video_tags (), 0 }
LibAVCodec.CodecID id = av_codec_get_id (table, tag);
@endcode
***********************************************************/
/***********************************************************
@return the table mapping RIFF FourCCs for video to libavcodec LibAVCodec.CodecID.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public AVCodecTag avformat_get_riff_video_tags ();

/***********************************************************
@return the table mapping RIFF FourCCs for audio to LibAVCodec.CodecID.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public AVCodecTag avformat_get_riff_audio_tags ();

/***********************************************************
@return the table mapping MOV FourCCs for video to libavcodec LibAVCodec.CodecID.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public AVCodecTag avformat_get_mov_video_tags ();

/***********************************************************
@return the table mapping MOV FourCCs for audio to LibAVCodec.CodecID.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public AVCodecTag avformat_get_mov_audio_tags ();

/***********************************************************
@}
***********************************************************/

/***********************************************************
@brief Guess the sample aspect ratio of a frame, based on both the stream and the
frame aspect ratio.

Since the frame aspect ratio is set by the codec but the stream aspect ratio
is set by the demuxer, these two may not be equal. This function tries to
return the value that you should use if you would like to display the frame.

Basic logic is to use the stream aspect ratio if it is set to something sane
otherwise use the frame aspect ratio. This way a container setting, which is
usually easy to modify can override the coded value in the frames.

@param format the format context which the stream is part of
@param stream the stream which the frame is part of
@param frame the frame with the aspect ratio to be determined
@return the guessed (valid) sample_aspect_ratio, 0/1 if no idea
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public LibAVUtil.Rational av_guess_sample_aspect_ratio (
    LibAVFormat.FormatContext format,
    LibAVFormat.Stream stream,
    LibAVUtil.Frame frame
);

/***********************************************************
@brief Guess the frame rate, based on both the container and codec information.

@param fomat_context the format context which the stream is part of
@param stream the stream which the frame is part of
@param frame the frame for which the frame rate should be determined, may be NULL
@return the guessed (valid) frame rate, 0/1 if no idea
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public LibAVUtil.Rational av_guess_frame_rate (
    LibAVFormat.FormatContext fomat_context,
    LibAVFormat.Stream stream,
    LibAVUtil.Frame frame
);

/***********************************************************
@brief Check if the stream st contained in format_context is matched by the stream specifier
spec.

See the "stream specifiers" chapter in the documentation for the syntax
of spec.

@return  >0 if st is matched by spec;
         0 if st is not matched by spec;
         LibAVUtil.ErrorCode code if spec is invalid

@note A stream specifier can match several streams in the format.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public int avformat_match_stream_specifier (
    LibAVFormat.FormatContext format_context,
    LibAVFormat.Stream st,
    string spec
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public int avformat_queue_attached_pictures (
    LibAVFormat.FormatContext format_context
);

[CCode (cname="enum AVTimebaseSource",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public enum AVTimebaseSource {
    [CCode (cname="AVFMT_TBCF_AUTO")]
    AUTO, // = -1,

    [CCode (cname="AVFMT_TBCF_DECODER")]
    DECODER,

    [CCode (cname="AVFMT_TBCF_DEMUXER")]
    DEMUXER,

#if FF_API_R_FRAME_RATE
    [CCode (cname="AVFMT_TBCF_R_FRAMERATE")]
    R_FRAMERATE
#endif
}

/***********************************************************
@brief Transfer internal timing information from one stream to another.

This function is useful when doing stream copy.

@param ofmt target output format for ost
@param ost output stream which needs timings copy and adjustments
@param ist reference input stream to copy timings from
@param copy_tb define from where the stream codec timebase needs to be imported
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public int avformat_transfer_internal_stream_timing_info (
    LibAVFormat.OutputFormat ofmt,
    LibAVFormat.Stream ost,
    LibAVFormat.Stream ist,
    AVTimebaseSource copy_tb
);

/***********************************************************
@brief Get the internal codec timebase from a stream.

@param st input stream to extract the timebase from
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public LibAVUtil.Rational av_stream_get_codec_timebase (
    LibAVFormat.Stream st
);

/***********************************************************
@}
***********************************************************/

} // namespace LibAVFormat
