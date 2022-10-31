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

namespace LibAVCodec {
using LibAVUtil;

/***********************************************************
@file
A public API for Vorbis parsing

Determines the duration for each packet.
***********************************************************/

[CCode (cname="struct AVVorbisParseContext", cheader_filename="ffmpeg/libavcodec/vorbis_parser.h")]
public struct VorbisParseContext {

    /***********************************************************
    @brief Allocate and initialize the Vorbis parser using headers in the extradata.
    ***********************************************************/
    VorbisParseContext av_vorbis_parse_init (
        uint8[] extra_data,
        int extra_data_size
    );

    /***********************************************************
    @brief Free the parser and everything associated with it.
    ***********************************************************/
    [CCode (cname="av_vorbis_parse_free", cheader_filename="ffmpeg/libavcodec/vorbis_parser.h")]
    public void av_vorbis_parse_free (
        VorbisParseContext s
    );

    /***********************************************************
    @brief Get the duration for a Vorbis packet.

    If @p flags is @c null,
    special frames are considered invalid.

    @param s Vorbis parser context
    @param buf buffer containing a Vorbis frame
    @param buf_size size of the buffer
    @param flags flags for special frames
    ***********************************************************/
    [CCode (cname="av_vorbis_parse_frame_flags", cheader_filename="ffmpeg/libavcodec/vorbis_parser.h")]
    public int av_vorbis_parse_frame_flags (
        VorbisParseContext s,
        uint8[] buf,
        int buf_size,
        VorbisFlags flags
    );

    /***********************************************************
    @brief Get the duration for a Vorbis packet.

    @param s Vorbis parser context
    @param buf buffer containing a Vorbis frame
    @param buf_size size of the buffer
    ***********************************************************/
    [CCode (cname="av_vorbis_parse_frame", cheader_filename="ffmpeg/libavcodec/vorbis_parser.h")]
    public int av_vorbis_parse_frame (
        VorbisParseContext s,
        uint8[] buf,
        int buf_size
    );

    [CCode (cname="av_vorbis_parse_reset", cheader_filename="ffmpeg/libavcodec/vorbis_parser.h")]
    public void av_vorbis_parse_reset (
        VorbisParseContext s
    );
}

} // namespace LibAVCodec
