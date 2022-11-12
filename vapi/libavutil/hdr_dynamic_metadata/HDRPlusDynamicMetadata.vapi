/***********************************************************
@copyright 2018 Mohammad Izadi <moh.izadi at gmail.com>
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
@brief This struct represents dynamic metadata for color volume transform -
application 4 of SMPTE 2094-40:2016 standard.

To be used as payload of a FrameSideData or LibAVCodec.PacketSideData with the
appropriate type.

@note The struct should be allocated with
av_dynamic_hdr_plus_alloc () and its size is not a part of
the public ABI.
***********************************************************/
[CCode (cname="struct AVDynamicHDRPlus", cheader_filename="ffmpeg/libavutil/hdr_dynamic_metadata.h")]
public struct HDRPlusDynamicMetadata {
    /***********************************************************
    @brief Country code by Rec. ITU-T T.35 Annex A. The value shall be 0xB5.
        ***********************************************************/
    [CCode (cname="itu_t_t35_country_code", cheader_filename="ffmpeg/libavutil/hdr_dynamic_metadata.h")]
    public uint8 itu_t_t35_country_code;

    /***********************************************************
    @brief Application version in the application defining document in ST-2094
    suite. The value shall be set to 0.
        ***********************************************************/
    [CCode (cname="application_version", cheader_filename="ffmpeg/libavutil/hdr_dynamic_metadata.h")]
    public uint8 application_version;

    /***********************************************************
    @brief The number of processing windows. The value shall be in the range
    of 1 to 3, inclusive.
        ***********************************************************/
    [CCode (cname="num_windows", cheader_filename="ffmpeg/libavutil/hdr_dynamic_metadata.h")]
    public uint8 num_windows;

    /***********************************************************
    @brief The color transform parameters for every processing window.
        ***********************************************************/
    [CCode (cname="params", cheader_filename="ffmpeg/libavutil/hdr_dynamic_metadata.h")]
    public HDRPlusColorTransformParameters params[3];

    /***********************************************************
    @brief The nominal maximum display luminance of the targeted system display,
    in units of 0.0001 candelas per square metre. The value shall be in
    the range of 0 to 10000, inclusive.
        ***********************************************************/
    [CCode (cname="targeted_system_display_maximum_luminance", cheader_filename="ffmpeg/libavutil/hdr_dynamic_metadata.h")]
    public Rational targeted_system_display_maximum_luminance;

    /***********************************************************
    @brief This flag shall be equal to 0 in bit streams conforming to this version
    of this Specification. The value 1 is reserved for future use.
        ***********************************************************/
    [CCode (cname="targeted_system_display_actual_peak_luminance_flag", cheader_filename="ffmpeg/libavutil/hdr_dynamic_metadata.h")]
    public uint8 targeted_system_display_actual_peak_luminance_flag;

    /***********************************************************
    @brief The number of rows in the targeted system_display_actual_peak_luminance
    array. The value shall be in the range of 2 to 25, inclusive.
        ***********************************************************/
    [CCode (cname="num_rows_targeted_system_display_actual_peak_luminance", cheader_filename="ffmpeg/libavutil/hdr_dynamic_metadata.h")]
    public uint8 num_rows_targeted_system_display_actual_peak_luminance;

    /***********************************************************
    @brief The number of columns in the
    targeted_system_display_actual_peak_luminance array. The value shall be
    in the range of 2 to 25, inclusive.
        ***********************************************************/
    [CCode (cname="num_cols_targeted_system_display_actual_peak_luminance", cheader_filename="ffmpeg/libavutil/hdr_dynamic_metadata.h")]
    public uint8 num_cols_targeted_system_display_actual_peak_luminance;

    /***********************************************************
    @brief The normalized actual peak luminance of the targeted system display. The
    values should be in the range of 0 to 1, inclusive and in multiples of
    1/15.
        ***********************************************************/
    [CCode (cname="targeted_system_display_actual_peak_luminance", cheader_filename="ffmpeg/libavutil/hdr_dynamic_metadata.h")]
    public Rational targeted_system_display_actual_peak_luminance[25 * 25];

    /***********************************************************
    @brief This flag shall be equal to 0 in bitstreams conforming to this version of
    this Specification. The value 1 is reserved for future use.
        ***********************************************************/
    [CCode (cname="mastering_display_actual_peak_luminance_flag", cheader_filename="ffmpeg/libavutil/hdr_dynamic_metadata.h")]
    public uint8 mastering_display_actual_peak_luminance_flag;

    /***********************************************************
    @brief The number of rows in the mastering_display_actual_peak_luminance array.
    The value shall be in the range of 2 to 25, inclusive.
        ***********************************************************/
    [CCode (cname="num_rows_mastering_display_actual_peak_luminance", cheader_filename="ffmpeg/libavutil/hdr_dynamic_metadata.h")]
    public uint8 num_rows_mastering_display_actual_peak_luminance;

    /***********************************************************
    @brief The number of columns in the mastering_display_actual_peak_luminance
    array. The value shall be in the range of 2 to 25, inclusive.
        ***********************************************************/
    [CCode (cname="num_cols_mastering_display_actual_peak_luminance", cheader_filename="ffmpeg/libavutil/hdr_dynamic_metadata.h")]
    public uint8 num_cols_mastering_display_actual_peak_luminance;

    /***********************************************************
    @brief The normalized actual peak luminance of the mastering display used for
    mastering the image essence. The values should be in the range of 0 to 1,
    inclusive and in multiples of 1/15.
        ***********************************************************/
    [CCode (cname="mastering_display_actual_peak_luminance", cheader_filename="ffmpeg/libavutil/hdr_dynamic_metadata.h")]
    public Rational mastering_display_actual_peak_luminance[25 * 25];

    /***********************************************************
    @brief Allocate an HDRPlusDynamicMetadata structure and set its fields to
    default values. The resulting struct can be freed using av_freep ().

    @return An HDRPlusDynamicMetadata filled with default values or null
        on failure.
        ***********************************************************/
    [CCode (cname="av_dynamic_hdr_plus_alloc", cheader_filename="ffmpeg/libavutil/hdr_dynamic_metadata.h")]
    public HDRPlusDynamicMetadata av_dynamic_hdr_plus_alloc (
        out size_t size
    );

    /***********************************************************
    @brief Allocate a complete HDRPlusDynamicMetadata and add it to the frame.
    @param frame The frame which side data is added to.

    @return The HDRPlusDynamicMetadata structure to be filled by caller or null
        on failure.
        ***********************************************************/
    [CCode (cname="av_dynamic_hdr_plus_create_side_data", cheader_filename="ffmpeg/libavutil/hdr_dynamic_metadata.h")]
    public HDRPlusDynamicMetadata av_dynamic_hdr_plus_create_side_data (
        Frame frame
    );

}

} // namespace LibAVUtil
