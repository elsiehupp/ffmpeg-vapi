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
@brief New fields can be added to the end with minor version bumps.
Removal, reordering and changes to existing fields require a major
version bump.
sizeof (LibAVFormat.Program) must not be used outside libav*.
***********************************************************/
[CCode (cname="struct AVProgram",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
[Compact]
public class LibAVFormat.Program {
    [CCode (cname="id")]
    public int id;

    [CCode (cname="flags")]
    public int flags;

    /***********************************************************
    @brief Selects which program to discard and which to feed to the caller
    ***********************************************************/
    [CCode (cname="discard")]
    public LibAVCodec.Discard discard;

    [CCode (cname="stream_index")]
    public uint[] stream_index;

    [CCode (cname="nb_stream_indexes")]
    public uint nb_stream_indexes;

    [CCode (cname="metadata")]
    public LibAVUtil.Dictionary? metadata;

    [CCode (cname="program_num")]
    public int program_num;

    [CCode (cname="pmt_pid")]
    public int pmt_pid;

    [CCode (cname="pcr_pid")]
    public int pcr_pid;

    [CCode (cname="pmt_version")]
    public int pmt_version;

    /***********************************************************
    All fields below this line are not part of the public API. They
    may not be used outside of libavformat and can be changed and
    removed at will.
    New public fields should be added right above.
    ***********************************************************/
    [CCode (cname="start_time")]
    internal int64 start_time;

    [CCode (cname="end_time")]
    internal int64 end_time;

    /***********************************************************
    @brief reference dts for wrap detection
    ***********************************************************/
    [CCode (cname="pts_wrap_reference")]
    internal int64 pts_wrap_reference;

    /***********************************************************
    @brief behavior on wrap detection
    ***********************************************************/
    [CCode (cname="pts_wrap_behavior")]
    internal int pts_wrap_behavior;

    /***********************************************************
    @defgroup lavf_core Core functions
    @ingroup libavf

    Functions for querying libavformat capabilities, allocating core structures,
    etc.
    @{
    ***********************************************************/

    [CCode (cname="av_new_program",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public LibAVFormat.Program? av_new_program (
        LibAVFormat.FormatContext? format_context,
        int id
    );

    /***********************************************************
    @}
    ***********************************************************/

}

} // namespace LibAVFormat
