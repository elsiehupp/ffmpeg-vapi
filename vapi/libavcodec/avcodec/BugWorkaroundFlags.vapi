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

[Flags]
[CCode (cname="enum ",cheader_filename="subprojects/ffmpeg/libavcodec/avcodec.h")]
public enum BugWorkaroundFlags {
    /***********************************************************
    @brief Autodetection
    ***********************************************************/
    [CCode (cname="FF_BUG_AUTODETECT")]
    AUTODETECT,

    [CCode (cname="FF_BUG_XVID_ILACE")]
    XVID_INTERLACE,
    UMP4,
    NO_PADDING,
    AMV,
    QPEL_CHROMA,
    STD_QPEL,
    QPEL_CHROMA2,

    [CCode (cname="FF_BUG_DIRECT_BLOCKSIZE")]
    DIRECT_BLOCK_SIZE,
    EDGE,
    HPEL_CHROMA,
    DC_CLIP,

    /***********************************************************
    @brief Workaround various bugs in Microsoft's broken decoders.
    ***********************************************************/
    [CCode (cname="FF_BUG_MS")]
    MS,
    TRUNCATED,

    [CCode (cname="FF_BUG_IEDGE")]
    IEDGE;
}

} // namespace LibAVCodec
