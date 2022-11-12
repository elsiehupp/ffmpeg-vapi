/***********************************************************
@copyright 2014 Tim Walker <tdskywalker@gmail.com>
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
@file audio downmix medatata
***********************************************************/

/***********************************************************
@addtogroup LibAVUtil.Audio
***********************************************************/

/***********************************************************
@defgroup downmix_info Audio downmix metadata
***********************************************************/

/***********************************************************
@brief This structure describes optional metadata relevant to a downmix procedure.

All fields are set by the decoder to the value indicated in the audio
bitstream (if present), or to a "sane" default otherwise.
***********************************************************/
[CCode (cname="struct AVDownmixInfo", cheader_filename="ffmpeg/libavutil/downmix_info.h")]
public struct DownMixInfo {
    /***********************************************************
    @brief Type of downmix preferred by the mastering engineer.
        ***********************************************************/
    [CCode (cname="preferred_downmix_type")]
    public DownMixType preferred_downmix_type;

    /***********************************************************
    @brief Absolute scale factor representing the nominal level of the center
    channel during a regular downmix.
        ***********************************************************/
    [CCode (cname="center_mix_level")]
    public double center_mix_level;

    /***********************************************************
    @brief Absolute scale factor representing the nominal level of the center
    channel during an Lt/Rt compatible downmix.
        ***********************************************************/
    [CCode (cname="center_mix_level_ltrt")]
    public double center_mix_level_ltrt;

    /***********************************************************
    @brief Absolute scale factor representing the nominal level of the surround
    channels during a regular downmix.
        ***********************************************************/
    [CCode (cname="surround_mix_level")]
    public double surround_mix_level;

    /***********************************************************
    @brief Absolute scale factor representing the nominal level of the surround
    channels during an Lt/Rt compatible downmix.
        ***********************************************************/
    [CCode (cname="surround_mix_level_ltrt")]
    public double surround_mix_level_ltrt;

    /***********************************************************
    @brief Absolute scale factor representing the level at which the LFE data is
    mixed into L/R channels during downmixing.
        ***********************************************************/
    [CCode (cname="lfe_mix_level")]
    public double lfe_mix_level;


    /***********************************************************
    @brief Get a frame's AV_FRAME_DATA_DOWNMIX_INFO side data for editing.

    If the side data is absent, it is created and added to the frame.

    @param frame the frame for which the side data is to be obtained or created

    @return the DownMixInfo structure to be edited by the caller, or null if
            the structure cannot be allocated.
        ***********************************************************/
    [CCode (cname="av_downmix_info_update_side_data", cheader_filename="ffmpeg/libavutil/downmix_info.h")]
    public DownMixInfo av_downmix_info_update_side_data (
        Frame frame
    );

}

} // namespace LibAVUtil
