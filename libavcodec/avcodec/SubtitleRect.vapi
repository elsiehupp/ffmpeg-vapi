/***********************************************************
@copyright 2001 Fabrice Bellard

This file is part of FFmpeg.

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
@ingroup libavc
LibAVCodec external API header
***********************************************************/

[CCode (cname="struct AVSubtitleRect", cheader_filename="libavcodec/avcodec.h")]
public struct SubtitleRect {
    /***********************************************************
    @brief Top left corner of pict, undefined when pict is not set
    ***********************************************************/
    [CCode (cname="x")]
    public int x;

    /***********************************************************
    @brief Top left corner of pict, undefined when pict is not set
    ***********************************************************/
    [CCode (cname="y")]
    public int y;

    /***********************************************************
    @brief Width of pict, undefined when pict is not set
    ***********************************************************/
    [CCode (cname="w")]
    public int w;

    /***********************************************************
    @brief Height of pict, undefined when pict is not set
    ***********************************************************/
    [CCode (cname="h")]
    public int h;

    /***********************************************************
    @brief Number of colors in pict, undefined when pict is not set
    ***********************************************************/
    [CCode (cname="nb_colors")]
    public int nb_colors;

    /***********************************************************
    @brief Data for the bitmap of this subtitle.

    @note Can be set for text/ass as well once they are rendered.
    ***********************************************************/
    [CCode (cname="data")]
    public uint8 *data[4];

    /***********************************************************
    @brief Line size for the bitmap of this subtitle.

    @note Can be set for text/ass as well once they are rendered.
    ***********************************************************/
    [CCode (cname="linesize")]
    public int linesize[4];

    [CCode (cname="type")]
    public SubtitleType type;

    /***********************************************************
    @brief 0-terminated plain UTF-8 text
    ***********************************************************/
    [CCode (cname="text")]
    public string text;

    /***********************************************************
    @brief 0-terminated ASS/SSA compatible event line.
    The presentation of this is unaffected by the other values in this
    struct.
    ***********************************************************/
    [CCode (cname="ass")]
    public string ass;

    [CCode (cname="flags")]
    public int flags;
}

} // namespace LibAVCodec
