/***********************************************************
@copyright 2016 Neil Birkbeck <neil.birkbeck@gmail.com>
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
@brief Mastering display metadata capable of representing the color volume of
the display used to master the content (SMPTE 2086:2014).

To be used as payload of a FrameSideData or LibAVCodec.PacketSideData with the
appropriate type.

@note The struct should be allocated with av_mastering_display_metadata_alloc ()
      and its size is not a part of the public ABI.
***********************************************************/
[CCode (cname="struct AVMasteringDisplayMetadata", cheader_filename="ffmpeg/libavutil/mastering_display_metadata.h")]
public struct MasteringDisplayMetadata {
    /***********************************************************
    @brief CIE 1931 xy chromaticity coords of color primaries (r, g, b order).
    ***********************************************************/
    [CCode (cname="display_primaries")]
    public Rational display_primaries[3 * 2];

    /***********************************************************
    @brief CIE 1931 xy chromaticity coords of white point.
    ***********************************************************/
    [CCode (cname="white_point")]
    public Rational white_point[2];

    /***********************************************************
    @brief Min luminance of mastering display (cd/m^2).
    ***********************************************************/
    [CCode (cname="min_luminance")]
    public Rational min_luminance;

    /***********************************************************
    @brief Max luminance of mastering display (cd/m^2).
    ***********************************************************/
    [CCode (cname="max_luminance")]
    public Rational max_luminance;

    /***********************************************************
    @brief Flag indicating whether the display primaries (and white point) are set.
    ***********************************************************/
    [CCode (cname="has_primaries")]
    public int has_primaries;

    /***********************************************************
    @brief Flag indicating whether the luminance (min_ and max_) have been set.
    ***********************************************************/
    [CCode (cname="has_luminance")]
    public int has_luminance;

    /***********************************************************
    @brief Allocate an MasteringDisplayMetadata structure and set its fields to
    default values. The resulting struct can be freed using av_freep ().

    @return An MasteringDisplayMetadata filled with default values or null
        on failure.
    ***********************************************************/
    [CCode (cname="av_mastering_display_metadata_alloc", cheader_filename="ffmpeg/libavutil/mastering_display_metadata.h")]
    public MasteringDisplayMetadata av_mastering_display_metadata_alloc ();

    /***********************************************************
    @brief Allocate a complete MasteringDisplayMetadata and add it to the frame.

    @param frame The frame which side data is added to.

    @return The MasteringDisplayMetadata structure to be filled by caller.
    ***********************************************************/
    [CCode (cname="av_mastering_display_metadata_create_side_data", cheader_filename="ffmpeg/libavutil/mastering_display_metadata.h")]
    public MasteringDisplayMetadata av_mastering_display_metadata_create_side_data (
        Frame frame
    );
}

} // namespace LibAVUtil
