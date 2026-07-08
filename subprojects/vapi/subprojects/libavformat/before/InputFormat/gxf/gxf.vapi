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

[CCode (cname="enum GXFPktType",cheader_filename="subprojects/ffmpeg/libavformat/gfx.h")]
public enum GXFPktType {
    [CCode (cname="PKT_MAP")]
    MAP,

    [CCode (cname="PKT_MEDIA")]
    MEDIA,

    [CCode (cname="PKT_EOS")]
    EOS,

    [CCode (cname="PKT_FLT")]
    FLT,

    [CCode (cname="PKT_UMF")]
    UMF;
}

[CCode (cname="enum GXFMatTag",cprefix="MAT_",cheader_filename="subprojects/ffmpeg/libavformat/gfx.h")]
public enum GXFMatTag {
    NAME,
    FIRST_FIELD,
    LAST_FIELD,
    MARK_IN,
    MARK_OUT,
    SIZE;
}

[CCode (cname="enum GXFTrackTag",cprefix="TRACK_",cheader_filename="subprojects/ffmpeg/libavformat/gfx.h")]
public enum GXFTrackTag {
    NAME,
    AUX,

    [CCode (cname="TRACK_VER")]
    VERSION,
    MPG_AUX,
    FPS,
    LINES,
    FPF;
}

} // namespace LibAVFormat
