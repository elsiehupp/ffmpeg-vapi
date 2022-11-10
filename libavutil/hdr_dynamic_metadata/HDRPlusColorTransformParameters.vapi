/***********************************************************
@copyright 2018 Mohammad Izadi <moh.izadi at gmail.com>
***********************************************************/
/***********************************************************
This file is part of FFmpeg.

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
@brief Color transform parameters at a processing window in a dynamic metadata for
SMPTE 2094-40.
***********************************************************/
[CCode (cname="struct AVHDRPlusColorTransformParams", cheader_filename="ffmpeg/libavutil/hdr_dynamic_metadata.h")]
public struct HDRPlusColorTransformParameters {
    /***********************************************************
    @brief The relative x coordinate of the top left pixel of the processing
    window. The value shall be in the range of 0 and 1, inclusive and
    in multiples of 1/(width of Picture - 1). The value 1 corresponds
    to the absolute coordinate of width of Picture - 1. The value for
    first processing window shall be 0.
    ***********************************************************/
    [CCode (cname="window_upper_left_corner_x")]
    public Rational window_upper_left_corner_x;

    /***********************************************************
    @brief The relative y coordinate of the top left pixel of the processing
    window. The value shall be in the range of 0 and 1, inclusive and
    in multiples of 1/(height of Picture - 1). The value 1 corresponds
    to the absolute coordinate of height of Picture - 1. The value for
    first processing window shall be 0.
    ***********************************************************/
    [CCode (cname="window_upper_left_corner_y")]
    public Rational window_upper_left_corner_y;

    /***********************************************************
    @brief The relative x coordinate of the bottom right pixel of the processing
    window. The value shall be in the range of 0 and 1, inclusive and
    in multiples of 1/(width of Picture - 1). The value 1 corresponds
    to the absolute coordinate of width of Picture - 1. The value for
    first processing window shall be 1.
    ***********************************************************/
    [CCode (cname="window_lower_right_corner_x")]
    public Rational window_lower_right_corner_x;

    /***********************************************************
    @brief The relative y coordinate of the bottom right pixel of the processing
    window. The value shall be in the range of 0 and 1, inclusive and
    in multiples of 1/(height of Picture - 1). The value 1 corresponds
    to the absolute coordinate of height of Picture - 1. The value for
    first processing window shall be 1.
    ***********************************************************/
    [CCode (cname="window_lower_right_corner_y")]
    public Rational window_lower_right_corner_y;

    /***********************************************************
    @brief The x coordinate of the center position of the concentric internal and
    external ellipses of the elliptical pixel selector in the processing
    window. The value shall be in the range of 0 to (width of Picture - 1),
    inclusive and in multiples of 1 pixel.
    ***********************************************************/
    [CCode (cname="center_of_ellipse_x")]
    public uint16 center_of_ellipse_x;

    /***********************************************************
    @brief The y coordinate of the center position of the concentric internal and
    external ellipses of the elliptical pixel selector in the processing
    window. The value shall be in the range of 0 to (height of Picture - 1),
    inclusive and in multiples of 1 pixel.
    ***********************************************************/
    [CCode (cname="center_of_ellipse_y")]
    public uint16 center_of_ellipse_y;

    /***********************************************************
    @brief The clockwise rotation angle in degree of arc with respect to the
    positive direction of the x-axis of the concentric internal and external
    ellipses of the elliptical pixel selector in the processing window. The
    value shall be in the range of 0 to 180, inclusive and in multiples of 1.
    ***********************************************************/
    [CCode (cname="rotation_angle")]
    public uint8 rotation_angle;

    /***********************************************************
    @brief The semi-major axis value of the internal ellipse of the elliptical pixel
    selector in amount of pixels in the processing window. The value shall be
    in the range of 1 to 65535, inclusive and in multiples of 1 pixel.
    ***********************************************************/
    [CCode (cname="semimajor_axis_internal_ellipse")]
    public uint16 semimajor_axis_internal_ellipse;

    /***********************************************************
    @brief The semi-major axis value of the external ellipse of the elliptical pixel
    selector in amount of pixels in the processing window. The value
    shall not be less than semimajor_axis_internal_ellipse of the current
    processing window. The value shall be in the range of 1 to 65535,
    inclusive and in multiples of 1 pixel.
    ***********************************************************/
    [CCode (cname="semimajor_axis_external_ellipse")]
    public uint16 semimajor_axis_external_ellipse;

    /***********************************************************
    @brief The semi-minor axis value of the external ellipse of the elliptical pixel
    selector in amount of pixels in the processing window. The value shall be
    in the range of 1 to 65535, inclusive and in multiples of 1 pixel.
    ***********************************************************/
    [CCode (cname="semiminor_axis_external_ellipse")]
    public uint16 semiminor_axis_external_ellipse;

    /***********************************************************
    @brief Overlap process option indicates one of the two methods of combining
    rendered pixels in the processing window in an image with at least one
    elliptical pixel selector. For overlapping elliptical pixel selectors
    in an image, overlap_process_option shall have the same value.
    ***********************************************************/
    [CCode (cname="overlap_process_option")]
    public HDRPlusOverlapProcessOption overlap_process_option;

    /***********************************************************
    @brief The maximum of the color components of linearized RGB values in the
    processing window in the scene. The values should be in the range of 0 to
    1, inclusive and in multiples of 0.00001. maxscl[ 0 ], maxscl[ 1 ], and
    maxscl[ 2 ] are corresponding to R, G, B color components respectively.
    ***********************************************************/
    [CCode (cname="maxscl")]
    public Rational maxscl[3];

    /***********************************************************
    @brief The average of linearized maxRGB values in the processing window in the
    scene. The value should be in the range of 0 to 1, inclusive and in
    multiples of 0.00001.
    ***********************************************************/
    [CCode (cname="average_maxrgb")]
    public Rational average_maxrgb;

    /***********************************************************
    @brief The number of linearized maxRGB values at given percentiles in the
    processing window in the scene. The maximum value shall be 15.
    ***********************************************************/
    [CCode (cname="num_distribution_maxrgb_percentiles")]
    public uint8 num_distribution_maxrgb_percentiles;

    /***********************************************************
    @brief The linearized maxRGB values at given percentiles in the
    processing window in the scene.
    ***********************************************************/
    [CCode (cname="distribution_maxrgb")]
    public HDRPlusPercentile distribution_maxrgb[15];

    /***********************************************************
    @brief The fraction of selected pixels in the image that contains the brightest
    pixel in the scene. The value shall be in the range of 0 to 1, inclusive
    and in multiples of 0.001.
    ***********************************************************/
    [CCode (cname="fraction_bright_pixels")]
    public Rational fraction_bright_pixels;

    /***********************************************************
    @brief This flag indicates that the metadata for the tone mapping function in
    the processing window is present (for value of 1).
    ***********************************************************/
    [CCode (cname="tone_mapping_flag")]
    public uint8 tone_mapping_flag;

    /***********************************************************
    @brief The x coordinate of the separation point between the linear part and the
    curved part of the tone mapping function. The value shall be in the range
    of 0 to 1, excluding 0 and in multiples of 1/4095.
    ***********************************************************/
    [CCode (cname="knee_point_x")]
    public Rational knee_point_x;

    /***********************************************************
    @brief The y coordinate of the separation point between the linear part and the
    curved part of the tone mapping function. The value shall be in the range
    of 0 to 1, excluding 0 and in multiples of 1/4095.
    ***********************************************************/
    [CCode (cname="knee_point_y")]
    public Rational knee_point_y;

    /***********************************************************
    @brief The intermediate anchor parameters of the tone mapping function in the
    processing window in the scene. The values should be in the range of 0
    to 1, inclusive and in multiples of 1/1023.
    ***********************************************************/
    [CCode (cname="bezier_curve_anchors")]
    public Rational bezier_curve_anchor_list[15];

    /***********************************************************
    @brief The number of the intermediate anchor parameters of the tone mapping
    function in the processing window. The maximum value shall be 15.
    ***********************************************************/
    [CCode (cname="num_bezier_curve_anchors")]
    public uint8 bezier_curve_anchor_acount;

    /***********************************************************
    @brief This flag shall be equal to 0 in bitstreams conforming to this version of
    this Specification. Other values are reserved for future use.
    ***********************************************************/
    [CCode (cname="color_saturation_mapping_flag")]
    public uint8 color_saturation_mapping_flag;

    /***********************************************************
    @brief The color saturation gain in the processing window in the scene. The
    value shall be in the range of 0 to 63/8, inclusive and in multiples of
    1/8. The default value shall be 1.
    ***********************************************************/
    [CCode (cname="color_saturation_weight")]
    public Rational color_saturation_weight;
}

} // namespace LibAVUtil
