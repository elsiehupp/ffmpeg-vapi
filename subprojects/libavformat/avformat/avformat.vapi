/***********************************************************
Copyright (c) 2001 Fabrice Bellard

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

namespace LibAVFormat {

/***********************************************************
@file
@ingroup libavf
Main libavformat public API header
***********************************************************/

/***********************************************************
@defgroup libavf libavformat
I/O and Muxing/Demuxing Library

Libavformat (lavf) is a library for dealing with various media container
formats. Its main two purposes are demuxing - i.e. splitting a media file
into component streams, and the reverse process of muxing - writing supplied
data in a specified container format. It also has an @ref lavf_io
"I/O module" which supports a number of protocols for accessing the data (e.g.
file, tcp, http and others).
Unless you are absolutely sure you won't use libavformat's network
capabilities, you should also call avformat_network_init ().

A supported input format is described by an LibAVFormat.InputFormat struct, conversely
an output format is described by LibAVFormat.OutputFormat. You can iterate over all
input/output formats using the  av_demuxer_iterate / av_muxer_iterate () functions.
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
with an LibAVFormat.FormatFlags1.NO_FILE format).

@section lavf_options Passing options to (de)muxers
It is possible to configure lavf muxers and demuxers using the @ref avoptions
mechanism. Generic (format-independent) libavformat options are provided by
LibAVFormat.FormatContext, they can be examined from a user program by calling
av_opt_next () / av_opt_find () on an allocated LibAVFormat.FormatContext (or its LibAVUtil.Log.Class
from avformat_get_class ()). Private (format-specific) options are provided by
LibAVFormat.FormatContext.priv_data if and only if LibAVFormat.InputFormat.priv_class /
LibAVFormat.OutputFormat.priv_class of the corresponding format struct is non-NULL.
Further options may be provided by the @ref LibAVFormat.FormatContext.pb "I/O context",
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
const char    *url = "file:in.mp3";
LibAVFormat.FormatContext *s = NULL;
int ret = avformat_open_input (&s, url, NULL, NULL);
if (ret < 0)
    abort ();
@endcode
The above code attempts to allocate an LibAVFormat.FormatContext, open the
specified file (autodetecting the format) and read the header, exporting the
information stored there into s. Some formats do not have a header or do not
store enough information there, so it is recommended that you call the
avformat_find_stream_info () function which tries to read and decode a few
frames to find missing information.

In some cases you might want to preallocate an LibAVFormat.FormatContext yourself with
avformat_alloc_context () and do some tweaking on it before passing it to
avformat_open_input (). One such case is when you want to use custom functions
for reading input data instead of lavf internal I/O layer.
To do that, create your own LibAVFormat.IOContext with avio_alloc_context (), passing
your reading callbacks to it. Then set the @em pb field of your
LibAVFormat.FormatContext to newly created LibAVFormat.IOContext.

Since the format of the opened file is in general not known until after
avformat_open_input () has returned, it is not possible to set demuxer private
options on a preallocated context. Instead, the options should be passed to
avformat_open_input () wrapped in an LibAVUtil.Dictionary:
@code
LibAVUtil.Dictionary *options = NULL;
av_dict_set (&options, "video_size", "640x480", 0);
av_dict_set (&options, "pixel_format", "rgb24", 0);

if (avformat_open_input (&s, url, NULL, &options) < 0)
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
const LibAVUtil.DictionaryEntry *e;
if ((e = av_dict_iterate (options, NULL))) {
    fprintf (stderr, "Option %s not recognized by the demuxer.\n", e->key);
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
- Unless the format is of the LibAVFormat.FormatFlags1.NO_FILE type, the @ref LibAVFormat.FormatContext.pb
  "pb" field must be set to an opened IO context, either returned from
  avio_open2 () or a custom one.
- Unless the format is of the LibAVFormat.FormatFlags1.NO_STREAMS type, at least one stream must
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
integer and allocates LibAVFormat.IODirContext on success.

@code
LibAVFormat.IODirContext *ctx = NULL;
if (avio_open_dir (&ctx, "smb://example.com/some_dir", NULL) < 0) {
    fprintf (stderr, "Cannot open directory.\n");
    abort ();
}
@endcode

This code tries to open a sample directory using smb protocol without
any additional parameters.

@subsection lavf_io_dirlist_read Reading entries
Each directory's entry (i.e. file, another directory, anything else
within ::LibAVFormat.IODirEntryType) is represented by LibAVFormat.IODirEntry.
Reading consecutive entries from an opened LibAVFormat.IODirContext is done by
repeatedly calling avio_read_dir () on it. Each call returns zero or
positive integer if successful. Reading can be stopped right after the
NULL entry has been read -- it means there are no entries left to be
read. The following code reads all entries from a directory associated
with ctx and prints their names to standard output.
@code
LibAVFormat.IODirEntry *entry = NULL;
for (;;) {
    if (avio_read_dir (ctx, &entry) < 0) {
        fprintf (stderr, "Cannot list directory.\n");
        abort ();
    }
    if (!entry)
        break;
    printf ("%s\n", entry->name);
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

//  #ifndef HAVE_AV_CONFIG_H
//  /* When included as part of the ffmpeg build, only include the major version
//  to avoid unnecessary rebuilds. When included externally, keep including
//  the full version information. */
//  #include "libavformat/version.h"

//  #include "libavutil/frame.h"
//  #include "libavcodec/codec.h"
//  #endif






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
   -  sorting  -- a modified version of a tag that should be used for
      sorting will have '-sort' appended. E.g. artist="The Beatles",
      artist-sort="Beatles, The".
- Some protocols and demuxers support metadata updates. After a successful
  call to av_read_frame (), LibAVFormat.FormatContext.event_flags or LibAVFormat.Stream.event_flags
  will be updated to indicate if metadata changed. In order to detect metadata
  changes on a stream, you need to loop through all streams in the LibAVFormat.FormatContext
  and check their individual event_flags.

-  Demuxers attempt to export metadata in a generic format, however tags
   with no generic equivalents are left as they are stored in the container.
   Follows a list of generic tag names:

 @verbatim
 album        -- name of the set this work belongs to
 album_artist -- main creator of the set/album, if different from artist.
                 e.g. "Various Artists" for compilation albums.
 artist       -- main creator of the work
 comment      -- any additional description of the file.
 composer     -- who composed the work, if different from artist.
 copyright    -- name of copyright holder.
 creation_time-- date when the file was created, preferably in ISO 8601.
 date         -- date when the work was created, preferably in ISO 8601.
 disc         -- number of a subset, e.g. disc in a multi-disc collection.
 encoder      -- name/settings of the software/hardware that produced the file.
 encoded_by   -- person/group who created the file.
 filename     -- original name of the file.
 genre        -- <self-evident>.
 language     -- main language in which the work is performed, preferably
                 in ISO 639-2 format. Multiple languages can be specified by
                 separating them with commas.
 performer    -- artist who performed the work, if different from artist.
                 E.g for "Also sprach Zarathustra", artist would be "Richard
                 Strauss" and performer "London Philharmonic Orchestra".
 publisher    -- name of the label/publisher.
 service_name     -- name of the service in broadcasting (channel name).
 service_provider -- name of the service provider in broadcasting.
 title        -- name of the work.
 track        -- number of this work in the set, can be in form current/total.
 variant_bitrate -- the total bitrate of the bitrate variant that the current stream is part of
 @endverbatim

Look in the examples section for an application example how to use the Metadata API.

@}
***********************************************************/

/* packet functions */

[CCode (cname="AV_PROGRAM_RUNNING",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public const int AV_PROGRAM_RUNNING;

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
[CCode (cname="avformat_version",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public static uint avformat_version ();

/***********************************************************
@brief Return the libavformat build-time configuration.
***********************************************************/
[CCode (cname="avformat_configuration",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public static string avformat_configuration ();

/***********************************************************
@brief Return the libavformat license.
***********************************************************/
[CCode (cname="avformat_license",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public static string avformat_license ();

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
[CCode (cname="avformat_network_init",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public static int avformat_network_init ();

/***********************************************************
@brief Undo the initialization done by avformat_network_init. Call it only
once for each time you called avformat_network_init.
***********************************************************/
[CCode (cname="avformat_network_deinit",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public static int avformat_network_deinit ();

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
[CCode (cname="av_hex_dump",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public static void av_hex_dump (
    GLib.File? file,
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
[CCode (cname="av_hex_dump_log",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public static void av_hex_dump_log (
    void *avcl,
    int level,
    uint8[] buffer,
    int size
);

/***********************************************************
@brief Get the LibAVCodec.CodecID for the given codec tag tag.
If no codec id is found returns LibAVCodec.CodecID.NONE.

@param tags list of supported codec_id-codec_tag_list pairs, as stored
in LibAVFormat.InputFormat.codec_tag_list and LibAVFormat.OutputFormat.codec_tag_list
@param tag codec tag to match to a codec ID
***********************************************************/
[CCode (cname="av_codec_get_id",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public static LibAVCodec.CodecID av_codec_get_id (
    LibAVFormat.CodecTag[] tags,
    uint tag
);

/***********************************************************
@brief Get the codec tag for the given codec id id.
If no codec tag is found returns 0.

@param tags list of supported codec_id-codec_tag_list pairs, as stored
in LibAVFormat.InputFormat.codec_tag_list and LibAVFormat.OutputFormat.codec_tag_list
@param id codec ID to match to a codec tag
***********************************************************/
[CCode (cname="av_codec_get_tag",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public static uint av_codec_get_tag (
    LibAVFormat.CodecTag[] tags,
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
[CCode (cname="av_codec_get_tag2",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public static int av_codec_get_tag2 (
    LibAVFormat.CodecTag[] tags,
    LibAVCodec.CodecID id,
    out uint tag
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
[CCode (cname="av_url_split",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public static void av_url_split (
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
@brief Return in 'buffer' the path with '%d' replaced by a number.

Also handles the '%0nd' format where 'n' is the total number
of digits and '%%'.

@param buffer destination buffer
@param buf_size destination buffer size
@param path numbered sequence string
@param number frame number
@param flags LibAVFormat.FormatFrameFilenameFlags.*
@return 0 if OK, -1 on format error
***********************************************************/
[CCode (cname="av_get_frame_filename2",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public static int av_get_frame_filename2 (
    string buffer,
    int buf_size,
    string path,
    int number,
    int flags
);

[CCode (cname="av_get_frame_filename",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public static int av_get_frame_filename (
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
[CCode (cname="av_filename_number_test",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public static int av_filename_number_test (
    string filename
);

/***********************************************************
@brief Return a positive value if the given filename has one of the given
extensions, 0 otherwise.

@param filename file name to check against the given extensions
@param extensions a comma-separated list of filename extensions
***********************************************************/
[CCode (cname="av_match_ext",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public static int av_match_ext (
    string filename,
    string extensions
);

/***********************************************************
@defgroup riff_fourcc RIFF FourCCs
@{
Get the tables mapping RIFF FourCCs to libavcodec AVCodecIDs. The tables are
meant to be passed to av_codec_get_id ()/av_codec_get_tag () as in the
following code:
@code
uint32 tag = MKTAG ('H', '2', '6', '4');
LibAVFormat.CodecTag table[] = { avformat_get_riff_video_tags (), 0 }
LibAVCodec.CodecID id = av_codec_get_id (table, tag);
@endcode
***********************************************************/
/***********************************************************
@return the table mapping RIFF FourCCs for video to libavcodec LibAVCodec.CodecID.
***********************************************************/
[CCode (cname="avformat_get_riff_video_tags",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public static LibAVFormat.CodecTag? avformat_get_riff_video_tags ();

/***********************************************************
@return the table mapping RIFF FourCCs for audio to LibAVCodec.CodecID.
***********************************************************/
[CCode (cname="avformat_get_riff_audio_tags",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public static LibAVFormat.CodecTag? avformat_get_riff_audio_tags ();

/***********************************************************
@return the table mapping MOV FourCCs for video to libavcodec LibAVCodec.CodecID.
***********************************************************/
[CCode (cname="avformat_get_mov_video_tags",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public static LibAVFormat.CodecTag? avformat_get_mov_video_tags ();

/***********************************************************
@return the table mapping MOV FourCCs for audio to LibAVCodec.CodecID.
***********************************************************/
[CCode (cname="avformat_get_mov_audio_tags",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public static LibAVFormat.CodecTag? avformat_get_mov_audio_tags ();

/***********************************************************
@}
***********************************************************/

/***********************************************************
@}
***********************************************************/

} // namespace LibAVFormat
