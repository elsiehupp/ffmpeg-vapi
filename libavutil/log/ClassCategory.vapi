/***********************************************************
@copyright 2006 Michael Niedermayer <michaelni@gmx.at>
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

[CCode (cprefix="", cheader_filename="ffmpeg/libavutil/log.h")]
public enum ClassCategory {
    AV_CLASS_CATEGORY_NA,
    AV_CLASS_CATEGORY_INPUT,
    AV_CLASS_CATEGORY_OUTPUT,
    AV_CLASS_CATEGORY_MUXER,
    AV_CLASS_CATEGORY_DEMUXER,
    AV_CLASS_CATEGORY_ENCODER,
    AV_CLASS_CATEGORY_DECODER,
    AV_CLASS_CATEGORY_FILTER,
    AV_CLASS_CATEGORY_BITSTREAM_FILTER,
    AV_CLASS_CATEGORY_SWSCALER,
    AV_CLASS_CATEGORY_SWRESAMPLER,
    AV_CLASS_CATEGORY_DEVICE_VIDEO_OUTPUT,
    AV_CLASS_CATEGORY_DEVICE_VIDEO_INPUT,
    AV_CLASS_CATEGORY_DEVICE_AUDIO_OUTPUT,
    AV_CLASS_CATEGORY_DEVICE_AUDIO_INPUT,
    AV_CLASS_CATEGORY_DEVICE_OUTPUT,
    AV_CLASS_CATEGORY_DEVICE_INPUT;

    /***********************************************************
    @brief Not part of ABI/API
    ***********************************************************/
    //  AV_CLASS_CATEGORY_NB

    [CCode (cname="AV_IS_INPUT_DEVICE", cheader_filename="ffmpeg/libavutil/log.h")]
    public static bool av_is_input_device (
        ClassCategory category
    );

    [CCode (cname="AV_IS_OUTPUT_DEVICE", cheader_filename="ffmpeg/libavutil/log.h")]
    public static bool av_is_output_device (
        ClassCategory category
    );

    [CCode (cname="av_default_get_category", cheader_filename="ffmpeg/libavutil/log.h")]
    public static ClassCategory av_default_get_category (
        void *ptr
    );

}

} // namespace LibAVUtil
