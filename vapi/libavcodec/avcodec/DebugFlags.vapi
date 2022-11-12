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
[CCode (cprefix="", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public enum DebugFlags {
    FF_DEBUG_PICT_INFO,
    FF_DEBUG_RC,
    FF_DEBUG_BITSTREAM,
    FF_DEBUG_MB_TYPE,
    FF_DEBUG_QP,

    FF_DEBUG_DCT_COEFF,
    FF_DEBUG_SKIP,
    FF_DEBUG_STARTCODE,
    FF_DEBUG_ER,
    FF_DEBUG_MMCO,
    FF_DEBUG_BUGS,
#if FF_API_DEBUG_MV
    FF_DEBUG_VIS_QP,
    FF_DEBUG_VIS_MB_TYPE,
#endif
    FF_DEBUG_BUFFERS,
    FF_DEBUG_THREADS,
    FF_DEBUG_GREEN_MD,
    FF_DEBUG_NOMC;
}

} // namespace LibAVCodec
