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
[CCode (cname="struct AVStreamGroup",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
[Compact]
public class LibAVFormat.StreamGroup {
    /***********************************************************
    A class for @ref avoptions. Set by avformat_stream_group_create ().
    ***********************************************************/
    public LibAVUtil.Log.Class? av_class;

    public void *priv_data;

    /***********************************************************
    Group index in LibAVFormat.FormatContext.
    ***********************************************************/
    public uint index;

    /***********************************************************
    Group type-specific group ID.

    decoding: set by libavformat
    encoding: may set by the user
    ***********************************************************/
    public int64_t id;

    /***********************************************************
    Group type

    decoding: set by libavformat on group creation
    encoding: set by avformat_stream_group_create ()
    ***********************************************************/
    public LibAVFormat.StreamGroupParamsType type;

    /***********************************************************
    Group type-specific parameters
    ***********************************************************/
    union {
        struct LibAVFormat.IAMFAudioElement *iamf_audio_element;
        struct LibAVFormat.IAMFMixPresentation *iamf_mix_presentation;
        struct LibAVFormat.StreamGroupTileGrid *tile_grid;
        struct LibAVFormat.StreamGroupLCEVC *lcevc;
    } params;

    /***********************************************************
    Metadata that applies to the whole group.

    - demuxing: set by libavformat on group creation
    - muxing: may be set by the caller before avformat_write_header ()

    Freed by libavformat in avformat_free_context ().
    ***********************************************************/
    public LibAVUtil.Dictionary? metadata;

    /***********************************************************
    Number of elements in LibAVFormat.StreamGroup.streams.

    Set by avformat_stream_group_add_stream () must not be modified by any other code.
    ***********************************************************/
    public uint nb_streams;

    /***********************************************************
    A list of streams in the group. New entries are created with
    avformat_stream_group_add_stream ().

    - demuxing: entries are created by libavformat on group creation.
                If LibAVFormat.FormatContextFlags.NO_HEADER is set in ctx_flags, then new entries may also
                appear in av_read_frame ().
    - muxing: entries are created by the user before avformat_write_header ().

    Freed by libavformat in avformat_free_context ().
    ***********************************************************/
    public LibAVFormat.Stream **streams;

    /***********************************************************
    Stream group disposition - a combination of LibAVFormat.DispositionFlags flags.
    This field currently applies to all defined LibAVFormat.StreamGroupParamsType.

    - demuxing: set by libavformat when creating the group or in
                avformat_find_stream_info ().
    - muxing: may be set by the caller before avformat_write_header ().
    ***********************************************************/
    public LibAVFormat.DispositionFlags disposition;


    /***********************************************************
    @defgroup lavf_core Core functions
    @ingroup libavf

    Functions for querying libavformat capabilities, allocating core structures,
    etc.
    @{
    ***********************************************************/

    /***********************************************************
    Get the LibAVUtil.Log.Class for LibAVFormat.StreamGroup. It can be used in combination with
    AV_OPT_SEARCH_FAKE_OBJ for examining options.

    @see av_opt_find ().
    ***********************************************************/
    [CCode (cname="av_stream_group_get_class",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public static LibAVUtil.Log.Class? av_stream_group_get_class ();

    /***********************************************************
    Add a new empty stream group to a media file.

    When demuxing, it may be called by the demuxer in read_header (). If the
    flag LibAVFormat.FormatContextFlags.NO_HEADER is set in s.ctx_flags, then it may also
    be called in read_packet ().

    When muxing, may be called by the user before avformat_write_header ().

    User is required to call avformat_free_context () to clean up the allocation
    by avformat_stream_group_create ().

    New streams can be added to the group with avformat_stream_group_add_stream ().

    @param s media file handle

    @return newly created group or NULL on error.
    @see avformat_new_stream, avformat_stream_group_add_stream.
    ***********************************************************/
    [CCode (cname="avformat_stream_group_create",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public static LibAVFormat.StreamGroup? avformat_stream_group_create (
        LibAVFormat.FormatContext? s,
        enum LibAVFormat.StreamGroupParamsType type,
        ref LibAVUtil.Dictionary? options
    );

    /***********************************************************
    Add an already allocated stream to a stream group.

    When demuxing, it may be called by the demuxer in read_header (). If the
    flag LibAVFormat.FormatContextFlags.NO_HEADER is set in s.ctx_flags, then it may also
    be called in read_packet ().

    When muxing, may be called by the user before avformat_write_header () after
    having allocated a new group with avformat_stream_group_create () and stream with
    avformat_new_stream ().

    User is required to call avformat_free_context () to clean up the allocation
    by avformat_stream_group_add_stream ().

    @param stream_group stream group belonging to a media file.
    @param st  stream in the media file to add to the group.

    @retval 0                 success
    @retval AVERROR (EEXIST)   the stream was already in the group
    @retval "another negative error code" legitimate errors

    @see avformat_new_stream, avformat_stream_group_create.
    ***********************************************************/
    public int avformat_stream_group_add_stream (
        LibAVFormat.StreamGroup? stream_group,
        LibAVFormat.Stream? st
    );


    /***********************************************************
    @}
    ***********************************************************/

}

} // namespace LibAVFormat
