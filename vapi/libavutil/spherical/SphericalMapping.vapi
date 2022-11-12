/***********************************************************
@copyright 2016 Vittorio Giovara <vittorio.giovara@gmail.com>
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
@file Spherical video
***********************************************************/

/***********************************************************
@addtogroup LibAVUtil.Video

@defgroup lavu_video_spherical Spherical video mapping
***********************************************************/

/***********************************************************
@addtogroup lavu_video_spherical
A spherical video file contains surfaces that need to be mapped onto a
sphere. Depending on how the frame was converted, a different distortion
transformation or surface recomposition function needs to be applied before
the video should be mapped and displayed.
***********************************************************/

/***********************************************************
@brief This structure describes how to handle spherical videos, outlining
information about projection, initial layout, and any other view modifier.

@note The struct must be allocated with av_spherical_alloc () and
      its size is not a part of the public ABI.
***********************************************************/
[CCode (cname="struct AVSphericalMapping", cheader_filename="ffmpeg/libavutil/spherical.h")]
public struct SphericalMapping {
    /***********************************************************
    @brief Projection type.
        ***********************************************************/
    [CCode (cname="projection")]
    public SphericalProjection projection;

    /***********************************************************
    @name Initial orientation
    There fields describe additional rotations applied to the sphere after
    the video frame is mapped onto it. The sphere is rotated around the
    viewer, who remains stationary. The order of transformation is always
    yaw, followed by pitch, and finally by roll.

    The coordinate system matches the one defined in OpenGL, where the
    forward vector (z) is coming out of screen, and it is equivalent to
    a rotation matrix of R = r_y (yaw) * r_x (pitch) * r_z (roll).

    A positive yaw rotates the portion of the sphere in front of the viewer
    toward their right. A positive pitch rotates the portion of the sphere
    in front of the viewer upwards. A positive roll tilts the portion of
    the sphere in front of the viewer to the viewer's right.

    These values are exported as 16.16 fixed point.

    See this equirectangular projection as example:

    @code {.unparsed}
        Yaw
        -180 0 180
      90 +-------------+-------------+  180
         |             |             |        up
    P    |             |             |        y|    forward
    i    |             ^             |         |   /z
    t 0 +-------------X-------------+    0 Roll        |  /
    c    |             |             |         | /
    h    |             |             |        0|/_____right
         |             |             |        x
     -90 +-------------+-------------+ -180

    X - the default camera center
    ^ - the default up vector
    @endcode
        ***********************************************************/
    /***********************************************************
    @brief Rotation around the up vector [-180, 180].
        ***********************************************************/
    [CCode (cname="yaw")]
    public int32 yaw;

    /***********************************************************
    @brief Rotation around the right vector [-90, 90].
        ***********************************************************/
    [CCode (cname="pitch")]
    public int32 pitch;

    /***********************************************************
    @brief Rotation around the forward vector [-180, 180].
        ***********************************************************/
    [CCode (cname="roll")]
    public int32 roll;

    /***********************************************************
    @name Bounding rectangle
    @anchor bounding
    These fields indicate the location of the current tile, and where
    it should be mapped relative to the original surface. They are
    exported as 0.32 fixed point, and can be converted to classic
    pixel values with av_spherical_bounds ().

    @code {.unparsed}
                      Yaw
        -180 0 180
      90 +-------------+-------------+  180
         |             |             |                  up
    P    |             |             |                 y|    forward
    i    |             ^             |                  |   /z
    t 0 +-------------X-------------+    0 Roll        |  /
    c    |             |             |                  | /
    h    |             |             |                 0|/_____right
         |             |             |                        x
     -90 +-------------+-------------+ -180

    X - the default camera center
    ^ - the default up vector
    @endcode

    If needed, the original video surface dimensions can be derived
    by adding the current stream or frame size to the related bounds,
    like in the following example:

    @code {c}
        original_width = tile.width  + bound_left + bound_right;
        original_height = tile.height + bound_top  + bound_bottom;
    @endcode

    @note These values are valid only for the tiled equirectangular
        projection type (@link SphericalProjection.EQUIRECTANGULAR_TILE),
        and should be ignored in all other cases.
        ***********************************************************/
    /***********************************************************
    @brief Distance from the left edge
        ***********************************************************/
    [CCode (cname="bound_left")]
    public uint32 bound_left;

    /***********************************************************
    @brief Distance from the top edge
        ***********************************************************/
    [CCode (cname="bound_top")]
    public uint32 bound_top;

    /***********************************************************
    @brief Distance from the right edge
        ***********************************************************/
    [CCode (cname="bound_right")]
    public uint32 bound_right;

    /***********************************************************
    @brief Distance from the bottom edge
        ***********************************************************/
    [CCode (cname="bound_bottom")]
    public uint32 bound_bottom;

    /***********************************************************
    @brief Number of pixels to pad from the edge of each cube face.

    @note This value is valid for only for the cubemap projection type
        (@link SphericalProjection.CUBEMAP), and should be ignored in all other
        cases.
        ***********************************************************/
    [CCode (cname="padding")]
    public uint32 padding;

    /***********************************************************
    @brief Allocate a AVSphericalVideo structure and initialize its fields to default
    values.

    @return the newly allocated struct or null on failure
        ***********************************************************/
    [CCode (cname="av_spherical_alloc", cheader_filename="ffmpeg/libavutil/spherical.h")]
    public SphericalMapping av_spherical_alloc (
        size_t size
    );

    /***********************************************************
    @brief Convert the @link bounding fields from an AVSphericalVideo
    from 0.32 fixed point to pixels.

    @param map The AVSphericalVideo map to read bound values from.
    @param width Width of the current frame or stream.
    @param height Height of the current frame or stream.
    @param left Pixels from the left edge.
    @param top Pixels from the top edge.
    @param right Pixels from the right edge.
    @param bottom Pixels from the bottom edge.
        ***********************************************************/
    [CCode (cname="av_spherical_tile_bounds", cheader_filename="ffmpeg/libavutil/spherical.h")]
    public void av_spherical_tile_bounds (
        SphericalMapping map,
        size_t width,
        size_t height,
        out size_t left,
        out size_t top,
        out size_t right,
        out size_t bottom
    );

    /***********************************************************
    @brief Provide a human-readable name of a given SphericalProjection.

    @param projection The input SphericalProjection.

    @return The name of the SphericalProjection, or "unknown".
        ***********************************************************/
    [CCode (cname="av_spherical_projection_name", cheader_filename="ffmpeg/libavutil/spherical.h")]
    public string av_spherical_projection_name (
        SphericalProjection projection
    );

    /***********************************************************
    @brief Get the SphericalProjection form a human-readable name.

    @param name The input string.

    @return The SphericalProjection value, or -1 if not found.
        ***********************************************************/
    [CCode (cname="av_spherical_from_name", cheader_filename="ffmpeg/libavutil/spherical.h")]
    public int av_spherical_from_name (
        string name
    );
}

} // namespace LibAVUtil
