/***********************************************************
GXF demuxer
@copyright 2006 Reimar Doeffinger

This file is part of FFmpeg.

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

public enum GXFPktType {
    PKT_MAP,
    PKT_MEDIA,
    PKT_EOS,
    PKT_FLT,
    PKT_UMF,
}

public enum GXFMatTag {
    MAT_NAME,
    MAT_FIRST_FIELD,
    MAT_LAST_FIELD,
    MAT_MARK_IN,
    MAT_MARK_OUT,
    MAT_SIZE,
}

public enum GXFTrackTag {
    TRACK_NAME,
    TRACK_AUX,
    TRACK_VER,
    TRACK_MPG_AUX,
    TRACK_FPS,
    TRACK_LINES,
    TRACK_FPF,
}

} // namespace LibAVFormat
