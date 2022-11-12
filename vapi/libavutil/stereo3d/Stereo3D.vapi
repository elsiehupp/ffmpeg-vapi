/***********************************************************
@copyright 2013 Vittorio Giovara <vittorio.giovara@gmail.com>
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
@file Stereoscopic video
***********************************************************/

/***********************************************************
@addtogroup LibAVUtil.Video

@defgroup lavu_video_stereo3d Stereo3D types and functions
***********************************************************/

/***********************************************************
@addtogroup lavu_video_stereo3d
A stereoscopic video file consists in multiple views embedded in a single
frame, usually describing two views of a scene. This file describes all
possible codec-independent view arrangements.
***********************************************************/

/***********************************************************
@brief Stereo 3D type: this structure describes how two videos are packed
within a single video surface, with additional information as needed.

@note The struct must be allocated with av_stereo3d_alloc () and
      its size is not a part of the public ABI.
***********************************************************/
[CCode (cname="struct AVStereo3D", cheader_filename="ffmpeg/libavutil/stereo3d.h")]
public struct Stereo3D {
    /***********************************************************
    @brief How views are packed within the video.
        ***********************************************************/
    [CCode (cname="type")]
    public Stereo3DType type;

    /***********************************************************
    @brief Additional information about the frame packing.
        ***********************************************************/
    [CCode (cname="flags")]
    public int flags;

    /***********************************************************
    @brief Determines which views are packed.
        ***********************************************************/
    [CCode (cname="view")]
    public Stereo3DView view;

    /***********************************************************
    @brief Allocate an Stereo3D structure and set its fields to default values.
    The resulting struct can be freed using av_freep ().

    @return An Stereo3D filled with default values or null on failure.
        ***********************************************************/
    [CCode (cname="av_stereo3d_alloc", cheader_filename="ffmpeg/libavutil/stereo3d.h")]
    public Stereo3D av_stereo3d_alloc ();

    /***********************************************************
    @brief Allocate a complete FrameSideData and add it to the frame.

    @param frame The frame which side data is added to.

    @return The Stereo3D structure to be filled by caller.
        ***********************************************************/
    [CCode (cname="av_stereo3d_create_side_data", cheader_filename="ffmpeg/libavutil/stereo3d.h")]
    public Stereo3D av_stereo3d_create_side_data (
        Frame frame
    );

    /***********************************************************
    @brief Provide a human-readable name of a given stereo3d type.

    @param type The input stereo3d type value.

    @return The name of the stereo3d value, or "unknown".
        ***********************************************************/
    [CCode (cname="av_stereo3d_type_name", cheader_filename="ffmpeg/libavutil/stereo3d.h")]
    public string av_stereo3d_type_name (
        uint type
    );

    /***********************************************************
    @brief Get the Stereo3DType form a human-readable name.

    @param name The input string.

    @return The Stereo3DType value, or -1 if not found.
        ***********************************************************/
    [CCode (cname="av_stereo3d_from_name", cheader_filename="ffmpeg/libavutil/stereo3d.h")]
    public int av_stereo3d_from_name (
        string name
    );

}

} // namespace LibAVUtil
