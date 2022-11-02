/***********************************************************
@copyright 2006 Michael Niedermayer <michaelni@gmx.at>
@copyright 2008 Peter Ross

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
@file
audio channel layout utility functions
***********************************************************/

/***********************************************************
@addtogroup LibAVUtil.Audio
***********************************************************/

/***********************************************************
public enum ChannelLayoutFlags

@description A channel layout is a 64-bit uint integer
    with a bit set for every channel. The number of bits set
    must be equal to the number of channels. The value 0
    means that the channel layout is not known.

@note This data structure is not powerful enough to handle
    channels combinations that have the same channel
    multiple times, such as dual-mono.
***********************************************************/
[Flags]
[CCode (cprefix="AV_CH_", cheader_filename="ffmpeg/libavutil/channel_layout.h")]
public enum ChannelLayoutFlags {
    FRONT_LEFT,
    FRONT_RIGHT,
    FRONT_CENTER,
    LOW_FREQUENCY,
    BACK_LEFT,
    BACK_RIGHT,
    FRONT_LEFT_OF_CENTER,
    FRONT_RIGHT_OF_CENTER,
    BACK_CENTER,
    SIDE_LEFT,
    SIDE_RIGHT,
    TOP_CENTER,
    TOP_FRONT_LEFT,
    TOP_FRONT_CENTER,
    TOP_FRONT_RIGHT,
    TOP_BACK_LEFT,
    TOP_BACK_CENTER,
    TOP_BACK_RIGHT,
    /***********************************************************
    @brief Stereo downmix left
    ***********************************************************/
    STEREO_LEFT,
    /***********************************************************
    @brief Stereo downmix right
    ***********************************************************/
    STEREO_RIGHT,
    WIDE_LEFT,
    WIDE_RIGHT,
    SURROUND_DIRECT_LEFT,
    SURROUND_DIRECT_RIGHT,
    LOW_FREQUENCY_2,

    /***********************************************************
    @brief Channel mask value used for LibAVCodec.CodecContext.request_channel_layout
    to indicate that the user requests the channel order of the
    decoder output to be the native codec channel order.
    ***********************************************************/
    LAYOUT_NATIVE,

    /***********************************************************
    @defgroup channel_mask_c Audio channel layouts
    ***********************************************************/
    LAYOUT_MONO,
    LAYOUT_STEREO,
    LAYOUT_2POINT1,
    LAYOUT_2_1,
    LAYOUT_SURROUND,
    LAYOUT_3POINT1,
    LAYOUT_4POINT0,
    LAYOUT_4POINT1,
    LAYOUT_2_2,
    LAYOUT_QUAD,
    LAYOUT_5POINT0,
    LAYOUT_5POINT1,
    LAYOUT_5POINT0_BACK,
    LAYOUT_5POINT1_BACK,
    LAYOUT_6POINT0,
    LAYOUT_6POINT0_FRONT,
    LAYOUT_HEXAGONAL,
    LAYOUT_6POINT1,
    LAYOUT_6POINT1_BACK,
    LAYOUT_6POINT1_FRONT,
    LAYOUT_7POINT0,
    LAYOUT_7POINT0_FRONT,
    LAYOUT_7POINT1,
    LAYOUT_7POINT1_WIDE,
    LAYOUT_7POINT1_WIDE_BACK,
    LAYOUT_OCTAGONAL,
    LAYOUT_HEXADECAGONAL,
    LAYOUT_STEREO_DOWNMIX;


    /***********************************************************
    @brief Return a channel layout id that matches name, or 0 if no match is found.
    
    @param name can be one or several of the following notations,
        separated by '+' or '|':
        - the name of an usual channel layout (mono, stereo, 4.0, quad, 5.0,
            5.0 (side), 5.1, 5.1 (side), 7.1, 7.1 (wide), downmix);
        - the name of a single channel (FL, FR, FC, LFE, BL, BR, FLC, FRC, BC,
            SL, SR, TC, TFL, TFC, TFR, TBL, TBC, TBR, DL, DR);
        - a number of channels, in decimal, followed by 'c', yielding
            the default channel layout for that number of channels (@see
            av_get_default_channel_layout);
        - a channel layout mask, in hexadecimal starting with "0x" (@see
            ChannelLayoutFlags).
        
        Example: "stereo+FC" = "2c+FC" = "2c+1c" = "0x7"
    ***********************************************************/
    [CCode (cname="av_get_channel_layout", cheader_filename="ffmpeg/libavutil/channel_layout.h")]
    public static ChannelLayoutFlags av_get_channel_layout (
        string name
    );
    
    /***********************************************************
    @brief Return a channel layout and the number of channels
        based on the specified name.
    
    @note This function is similar to (@link av_get_channel_layout), but can also parse
        unknown channel layout specifications.
    
    @param[in] name channel layout specification string
    @param[out] channel_layout parsed channel layout (0 if unknown)
    @param[out] nb_channels number of channels
    
    @return 0 on success, LibAVUtil.ErrorCode (EINVAL) if the parsing fails.
    ***********************************************************/
    [CCode (cname="av_get_extended_channel_layout", cheader_filename="ffmpeg/libavutil/channel_layout.h")]
    public static int av_get_extended_channel_layout (
        string name,
        out ChannelLayoutFlags channel_layout,
        out int channel_count
    );
    
    /***********************************************************
    @brief Return a description of a channel layout.
    If nb_channels is <= 0, it is guessed from the channel_layout.
    
    @param buf put here the string containing the channel layout
    @param buf_size size in bytes of the buffer
    ***********************************************************/
    [CCode (cname="av_get_channel_layout_string", cheader_filename="ffmpeg/libavutil/channel_layout.h")]
    public static void av_get_channel_layout_string (
        string buf,
        int buf_size,
        out int channel_count,
        out ChannelLayoutFlags channel_layout
    );
    
    /***********************************************************
    @brief Return the number of channels in the channel layout.
    ***********************************************************/
    [CCode (cname="av_get_channel_layout_nb_channels", cheader_filename="ffmpeg/libavutil/channel_layout.h")]
    public static int av_get_channel_layout_nb_channels (
        ChannelLayoutFlags channel_layout
    );
    
    /***********************************************************
    @brief Return default channel layout for a given number of channels.
    ***********************************************************/
    [CCode (cname="av_get_default_channel_layout", cheader_filename="ffmpeg/libavutil/channel_layout.h")]
    public static ChannelLayoutFlags av_get_default_channel_layout (
        int channel_count
    );
    
    /***********************************************************
    @brief Get the index of a channel in channel_layout.
    
    @param channel_layout a channel layout
    @param channel a channel layout describing exactly one channel which must be
        present in channel_layout.
    
    @return index of channel in channel_layout on success, a negative LibAVUtil.ErrorCode
        on error.
    ***********************************************************/
    [CCode (cname="av_get_channel_layout_channel_index", cheader_filename="ffmpeg/libavutil/channel_layout.h")]
    public static int av_get_channel_layout_channel_index (
        ChannelLayoutFlags channel_layout,
        ChannelLayoutFlags channel
    );
    
    /***********************************************************
    @brief Get the channel with the given index in channel_layout.
    ***********************************************************/
    [CCode (cname="av_channel_layout_extract_channel", cheader_filename="ffmpeg/libavutil/channel_layout.h")]
    public static uint64 av_channel_layout_extract_channel (
        ChannelLayoutFlags channel_layout,
        int index
    );
    
    /***********************************************************
    @brief Get the name of a given channel.
    
    @return channel name on success, null on error.
    ***********************************************************/
    [CCode (cname="av_get_channel_name", cheader_filename="ffmpeg/libavutil/channel_layout.h")]
    public static string av_get_channel_name (
        ChannelLayoutFlags channel
    );
    
    /***********************************************************
    @brief Get the description of a given channel.
    
    @param channel a channel layout with a single channel
    @return channel description on success, null on error
    ***********************************************************/
    [CCode (cname="av_get_channel_description", cheader_filename="ffmpeg/libavutil/channel_layout.h")]
    public static string av_get_channel_description (
        ChannelLayoutFlags channel
    );
    
    /***********************************************************
    @brief Get the value and name of a standard channel layout.
    
    @param[in] index index in an internal list, starting at 0
    @param[out] layout channel layout mask
    @param[out] name name of the layout
    @return 0 if the layout exists,
        <0 if index is beyond the limits
    ***********************************************************/
    [CCode (cname="av_get_standard_channel_layout", cheader_filename="ffmpeg/libavutil/channel_layout.h")]
    public static int av_get_standard_channel_layout (
        uint index,
        out ChannelLayoutFlags layout,
        out string name
    );
}

} // namespace LibAVUtil
