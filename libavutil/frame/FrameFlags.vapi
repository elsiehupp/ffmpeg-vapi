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
@file
@ingroup lavu_frame
reference-counted frame API
***********************************************************/

/***********************************************************
@defgroup lavu_frame_flags AV_FRAME_FLAGS
@ingroup lavu_frame
Flags describing additional frame properties.
***********************************************************/
[Flags]
[CCode (cprefix="", cheader_filename="ffmpeg/libavutil/frame.h")]
public enum FrameFlags {
    /***********************************************************
    @brief The frame data may be corrupted, e.g. due to decoding errors.
    ***********************************************************/
    AV_FRAME_FLAG_CORRUPT,
    /***********************************************************
    @brief A flag to mark the frames which need to be decoded, but shouldn't be output.
    ***********************************************************/
    AV_FRAME_FLAG_DISCARD,
}
} // namespace LibAVUtil
