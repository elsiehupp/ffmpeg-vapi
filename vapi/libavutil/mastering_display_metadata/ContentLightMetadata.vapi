/***********************************************************
@copyright 2016 Neil Birkbeck <neil.birkbeck@gmail.com>
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
@brief Content light level needed by to transmit HDR over HDMI (CTA-861.3).

To be used as payload of a FrameSideData or LibAVCodec.PacketSideData with the
appropriate type.

@note The struct should be allocated with av_content_light_metadata_alloc ()
    and its size is not a part of the public ABI.
***********************************************************/
[CCode (cname="struct AVContentLightMetadata", cheader_filename="ffmpeg/libavutil/mastering_display_metadata.h")]
public struct ContentLightMetadata {
    /***********************************************************
    @brief Max content light level (cd/m^2).
        ***********************************************************/
    [CCode (cname="MaxCLL", cheader_filename="ffmpeg/libavutil/mastering_display_metadata.h")]
    public uint max_content_light_level;

    /***********************************************************
    @brief Max average light level per frame (cd/m^2).
        ***********************************************************/
    [CCode (cname="MaxFALL", cheader_filename="ffmpeg/libavutil/mastering_display_metadata.h")]
    public uint max_frame_light_level;

    /***********************************************************
    @brief Allocate an ContentLightMetadata structure and set its fields to
    default values. The resulting struct can be freed using av_freep ().

    @return An ContentLightMetadata filled with default values or null
        on failure.
        ***********************************************************/
    [CCode (cname="av_content_light_metadata_alloc", cheader_filename="ffmpeg/libavutil/mastering_display_metadata.h")]
    public ContentLightMetadata av_content_light_metadata_alloc (
        out size_t size
    );

    /***********************************************************
    @brief Allocate a complete ContentLightMetadata and add it to the frame.

    @param frame The frame which side data is added to.

    @return The ContentLightMetadata structure to be filled by caller.
        ***********************************************************/
    [CCode (cname="av_content_light_metadata_create_side_data", cheader_filename="ffmpeg/libavutil/mastering_display_metadata.h")]
    public ContentLightMetadata av_content_light_metadata_create_side_data (
        Frame frame
    );
}

} // namespace LibAVUtil
