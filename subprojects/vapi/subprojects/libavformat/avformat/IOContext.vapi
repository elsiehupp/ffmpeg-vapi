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
Bytestream IO Context.
New fields can be added to the end with minor version bumps.
Removal, reordering and changes to existing fields require a major
version bump.
sizeof (LibAVFormat.IOContext) must not be used outside libav*.

@note LibAVFormat.IOContext is an opaque class outside of LibAVFormat.
    None of the function pointers in LibAVFormat.IOContext
    should be called directly, they should only be set by the
    client application when implementing custom I/O. Normally
    these are set to the function pointers specified in
    avio_alloc_context ().
***********************************************************/
[CCode (cname="struct AVIOContext",cheader_filename="subprojects/ffmpeg/libavformat/avio.h")]
[Compact]
public class LibAVFormat.IOContext {
    // note: the fields of this class are all internal

    /***********************************************************
    @addtogroup lavf_decoding
    @{
    ***********************************************************/

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
    [CCode (cname="av_probe_input_buffer2",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public int av_probe_input_buffer2 (
        LibAVFormat.IOContext? pb,
        out LibAVFormat.InputFormat? fmt,
        string url,
        void *logctx,
        uint offset,
        uint max_probe_size
    );

    /***********************************************************
    @brief Like av_probe_input_buffer2 () but returns 0 on success
    ***********************************************************/
    [CCode (cname="av_probe_input_buffer",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public int av_probe_input_buffer (
        LibAVFormat.IOContext? pb,
        out LibAVFormat.InputFormat? fmt,
        string url,
        void *logctx,
        uint offset,
        uint max_probe_size
    );

    /***********************************************************
    @}
    ***********************************************************/

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
        LibAVFormat.IOContext? io_context,
        LibAVCodec.Packet? packet,
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
        LibAVFormat.IOContext? io_context,
        LibAVCodec.Packet? packet,
        int size
    );

}

} // namespace LibAVFormat
