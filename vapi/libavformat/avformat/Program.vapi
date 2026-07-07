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

    [CCode (cname="lags")]
    public int lags;

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
    public LibAVUtil.Dictionary metadata;

    [CCode (cname="program_num")]
    public int program_num;

    [CCode (cname="pmt_pid")]
    public int pmt_pid;

    [CCode (cname="pcr_pid")]
    public int pcr_pid;

    [CCode (cname="pmt_version")]
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

/***********************************************************
New fields can be added to the end with minor version bumps.
Removal, reordering and changes to existing fields require a major
version bump.
sizeof (LibAVFormat.Program) must not be used outside libav*.
***********************************************************/
typedef struct LibAVFormat.Program {
    int            id;
    int            flags;
    enum LibAVCodec.Discard discard;        ///< selects which program to discard and which to feed to the caller
    uint   *stream_index;
    uint   nb_stream_indexes;
    LibAVUtil.Dictionary *metadata;

    int program_num;
    int pmt_pid;
    int pcr_pid;
    int pmt_version;

    /*****************************************************************
    All fields below this line are not part of the public API. They
    may not be used outside of libavformat and can be changed and
    removed at will.
    New public fields should be added right above.
     *****************************************************************
    ***********************************************************/
    int64_t start_time;
    int64_t end_time;

    int64_t pts_wrap_reference;    ///< reference dts for wrap detection
    int pts_wrap_behavior;         ///< behavior on wrap detection
}

} // namespace LibAVFormat
