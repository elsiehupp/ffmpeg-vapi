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
@brief Projection of the video surface (s) on a sphere.
***********************************************************/
[CCode (cheader_filename="ffmpeg/libavutil/spherical.h")]
public enum SphericalProjection {
    /***********************************************************
    @brief Video represents a sphere mapped on a flat surface using
    equirectangular projection.
    ***********************************************************/
    [CCode (cname="AV_SPHERICAL_EQUIRECTANGULAR")]
    EQUIRECTANGULAR,

    /***********************************************************
    @brief Video frame is split into 6 faces of a cube, and arranged on a
    3x2 layout. Faces are oriented upwards for the front, left, right,
    and back faces. The up face is oriented so the top of the face is
    forwards and the down face is oriented so the top of the face is
    to the back.
    ***********************************************************/
    [CCode (cname="AV_SPHERICAL_CUBEMAP")]
    CUBEMAP,

    /***********************************************************
    @brief Video represents a portion of a sphere mapped on a flat surface
    using equirectangular projection. The @link bounding fields indicate
    the position of the current video in a larger surface.
    ***********************************************************/
    [CCode (cname="AV_SPHERICAL_EQUIRECTANGULAR_TILE")]
    EQUIRECTANGULAR_TILE,
}

} // namespace LibAVUtil
