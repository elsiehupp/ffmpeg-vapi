/***********************************************************
@brief GXF demuxer
@copyright 2006 Reimar Doeffinger
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

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/gfx.h")]
public enum GXFPktType {

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/gfx.h")]
    PKT_MAP,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/gfx.h")]
    PKT_MEDIA,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/gfx.h")]
    PKT_EOS,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/gfx.h")]
    PKT_FLT,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/gfx.h")]
    PKT_UMF;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/gfx.h")]
public enum GXFMatTag {
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/gfx.h")]
    MAT_NAME,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/gfx.h")]
    MAT_FIRST_FIELD,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/gfx.h")]
    MAT_LAST_FIELD,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/gfx.h")]
    MAT_MARK_IN,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/gfx.h")]
    MAT_MARK_OUT,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/gfx.h")]
    MAT_SIZE;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/gfx.h")]
public enum GXFTrackTag {
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/gfx.h")]
    TRACK_NAME,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/gfx.h")]
    TRACK_AUX,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/gfx.h")]
    TRACK_VER,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/gfx.h")]
    TRACK_MPG_AUX,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/gfx.h")]
    TRACK_FPS,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/gfx.h")]
    TRACK_LINES,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/gfx.h")]
    TRACK_FPF;
}

} // namespace LibAVFormat
