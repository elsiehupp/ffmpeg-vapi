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
[CCode (cheader_filename="subprojects/ffmpeg/libavcodec/avcodec.h")]
public enum DebugFlags {
    [CCode (cname="FF_DEBUG_PICT_INFO")]
    PICT_INFO,

    [CCode (cname="FF_DEBUG_RC")]
    RC,

    [CCode (cname="FF_DEBUG_BITSTREAM")]
    BITSTREAM,

    [CCode (cname="FF_DEBUG_MB_TYPE")]
    MB_TYPE,

    [CCode (cname="FF_DEBUG_QP")]
    QP,

    [CCode (cname="FF_DEBUG_DCT_COEFF")]
    DCT_COEFF,

    [CCode (cname="FF_DEBUG_SKIP")]
    SKIP,

    [CCode (cname="FF_DEBUG_STARTCODE")]
    STARTCODE,

    [CCode (cname="FF_DEBUG_ER")]
    ER,

    [CCode (cname="FF_DEBUG_MMCO")]
    MMCO,

    [CCode (cname="FF_DEBUG_BUGS")]
    BUGS,

#if FF_API_DEBUG_MV
    [CCode (cname="FF_DEBUG_VIS_QP")]
    VIS_QP,

    [CCode (cname="FF_DEBUG_VIS_MB_TYPE")]
    VIS_MB_TYPE,
#endif

    [CCode (cname="FF_DEBUG_BUFFERS")]
    BUFFERS,

    [CCode (cname="FF_DEBUG_THREADS")]
    THREADS,

    [CCode (cname="FF_DEBUG_GREEN_MD")]
    GREEN_MD,

    [CCode (cname="FF_DEBUG_NOMC")]
    NOMC;
}

} // namespace LibAVCodec
