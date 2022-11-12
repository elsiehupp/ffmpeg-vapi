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

[CCode (cname="struct AVMotionVector", cheader_filename="ffmpeg/libavutil/motion_vector.h")]
public struct MotionVector {
    /***********************************************************
    @brief Where the current macroblock comes from; negative value when it comes
    from the past, positive value when it comes from the future.
    XXX: set exact relative ref frame reference instead of a +/- 1 "direction".
        ***********************************************************/
    [CCode (cname="source")]
    public int32 source;

    /***********************************************************
    @brief Width of the block.
        ***********************************************************/
    [CCode (cname="w")]
    public uint8 block_width;

    /***********************************************************
    @brief Height of the block.
        ***********************************************************/
    [CCode (cname="h")]
    public uint8 block_height;

    /***********************************************************
    @brief Absolute source position x. Can be outside the frame area.
        ***********************************************************/
    [CCode (cname="src_x")]
    public int16 absolute_source_x;

    /***********************************************************
    @brief Absolute source position y. Can be outside the frame area.
        ***********************************************************/
    [CCode (cname="src_y")]
    public int16 absolute_source_y;

    /***********************************************************
    @brief Absolute destination position x. Can be outside the frame area.
        ***********************************************************/
    [CCode (cname="dst_x")]
    public int16 absolute_destination_x;

    /***********************************************************
    @brief Absolute destination position y. Can be outside the frame area.
        ***********************************************************/
    [CCode (cname="dst_y")]
    public int16 absolute_destination_y;

    /***********************************************************
    @brief Extra flag information. Currently unused.
        ***********************************************************/
    [CCode (cname="flags")]
    public uint64 flags;

    /***********************************************************
    @brief Motion vector
    input_x = output_x + motion_x / motion_scale
        ***********************************************************/
    [CCode (cname="motion_x")]
    public int32 motion_x;

    /***********************************************************
    @brief Motion vector
    input_y = output_y + motion_y / motion_scale
        ***********************************************************/
    [CCode (cname="motion_y")]
    public int32 motion_y;

    /***********************************************************
    @brief Motion vector
    input_y = output_y + motion_y / motion_scale
        ***********************************************************/
    [CCode (cname="motion_scale")]
    public uint16 motion_scale;
}

} // namespace LibAVUtil
