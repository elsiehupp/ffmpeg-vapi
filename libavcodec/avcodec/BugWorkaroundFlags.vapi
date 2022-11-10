/***********************************************************
@copyright 2001 Fabrice Bellard
***********************************************************/
/***********************************************************
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
@file @ingroup libavc
LibAVCodec external API header
***********************************************************/

[Flags]
[CCode (cprefix="", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public enum BugWorkaroundFlags {
    /***********************************************************
    @brief Autodetection
    ***********************************************************/
    FF_BUG_AUTODETECT,
    FF_BUG_XVID_ILACE,
    FF_BUG_UMP4,
    FF_BUG_NO_PADDING,
    FF_BUG_AMV,
    FF_BUG_QPEL_CHROMA,
    FF_BUG_STD_QPEL,
    FF_BUG_QPEL_CHROMA2,
    FF_BUG_DIRECT_BLOCKSIZE,
    FF_BUG_EDGE,
    FF_BUG_HPEL_CHROMA,
    FF_BUG_DC_CLIP,
    /***********************************************************
    @brief Workaround various bugs in Microsoft's broken decoders.
    ***********************************************************/
    FF_BUG_MS,
    FF_BUG_TRUNCATED,
    FF_BUG_IEDGE;
}

} // namespace LibAVCodec
