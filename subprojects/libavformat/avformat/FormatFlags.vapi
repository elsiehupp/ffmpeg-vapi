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

[Flags]
[CCode (cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public enum LibAVFormat.FormatFlags {
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
    @brief Do not use AVParsers, you also must set LibAVFormat.FormatFlags.DO_NOT_INFER as the fillin code works on frames and no parsing -> no frames. Also seeking to frames can not work if parsing to find frame boundaries has been disabled
    ***********************************************************/
    [CCode (cname="AVFMT_FLAG_NOPARSE")]
    DO_NOT_PARSE,

    /***********************************************************
    @brief Do not buffer frames when possible
    ***********************************************************/
    [CCode (cname="AVFMT_FLAG_NOBUFFER")]
    DO_NOT_BUFFER,

    /***********************************************************
    @brief The caller has supplied a custom LibAVFormat.IOContext, don't avio_close () it.
    ***********************************************************/
    [CCode (cname="AVFMT_FLAG_CUSTOM_IO")]
    CUSTOM_IO,

    /***********************************************************
    @brief Discard frames marked corrupted
    ***********************************************************/
    [CCode (cname="AVFMT_FLAG_DISCARD_CORRUPT")]
    DISCARD_CORRUPT,

    /***********************************************************
    @brief Flush the LibAVFormat.IOContext every packet.
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

} // namespace LibAVFormat
