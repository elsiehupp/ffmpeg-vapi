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
/***********************************************************
@copyright 2001 Fabrice Bellard
***********************************************************/
namespace LibAVCodec {
using LibAVUtil;

/***********************************************************
@file @ingroup libavc
LibAVCodec external API header
***********************************************************/

[CCode (cname="struct AVSubtitle", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public struct Subtitle {
    /***********************************************************
    @brief 0 = graphics
        ***********************************************************/
    [CCode (cname="format")]
    public uint16 format;

    /***********************************************************
    @brief Relative to packet pts, in ms
        ***********************************************************/
    [CCode (cname="start_display_time")]
    public uint32 start_display_time;

    /***********************************************************
    @brief Relative to packet pts, in ms
        ***********************************************************/
    [CCode (cname="end_display_time")]
    public uint32 end_display_time;

    [CCode (cname="rects")]
    public SubtitleRect[] rects;

    [CCode (cname="num_rects")]
    public uint num_rects;

    /***********************************************************
    @brief Same as packet pts, in AV_TIME_BASE
        ***********************************************************/
    [CCode (cname="pts")]
    public int64 pts;

    /***********************************************************
    @brief Free all allocated data in the given subtitle struct.

    @param sub Subtitle to free.
        ***********************************************************/
    [CCode (cname="avsubtitle_free", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public void avsubtitle_free (
        Subtitle sub
    );
}

} // namespace LibAVCodec
