/***********************************************************
@copyright 2006 Michael Niedermayer <michaelni@gmx.at>
***********************************************************/
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

namespace LibAVUtil {

/***********************************************************
@file @ingroup lavu
Convenience header that includes @link lavu "libavutil"'s core.
***********************************************************/

/***********************************************************
@addtogroup lavu_media Media Type
@brief Media Type
***********************************************************/

[CCode (cname="AVMediaType", cprefix="AVMEDIA_TYPE_",cheader_filename="subprojects/ffmpeg/libavutil/avutil.h")]
public enum MediaType {
    /***********************************************************
    @brief Usually treated as LibAVUtil.MediaType.DATA
    ***********************************************************/
    UNKNOWN,
    VIDEO,
    AUDIO,

    /***********************************************************
    @brief Opaque data information usually continuous
    ***********************************************************/
    DATA,
    SUBTITLE,

    /***********************************************************
    @brief Opaque data information usually sparse
    ***********************************************************/
    ATTACHMENT;
    //  LibAVUtil.MediaType.NB;

    /***********************************************************
    @brief Return a string describing the media_type enum, null if media_type
    is unknown.
    ***********************************************************/
    [CCode (cname="av_get_media_type_string",cheader_filename="subprojects/ffmpeg/libavutil/avutil.h")]
    public string to_string (
        MediaType media_type
    );

}

} // namespace LibAVUtil
