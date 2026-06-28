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
namespace Log {

[CCode (cname="enum AVClassCategory",cprefix="AV_CLASS_CATEGORY_",cheader_filename="subprojects/ffmpeg/libavutil/log.h")]
public enum LibAVUtil.Log.ClassCategory {
    [CCode (cname="AV_CLASS_CATEGORY_NA")]
    NOT_APPLICABLE,
    INPUT,
    OUTPUT,
    MUXER,
    DEMUXER,
    ENCODER,
    DECODER,
    FILTER,
    BITSTREAM_FILTER,

    [CCode (cname="AV_CLASS_CATEGORY_SWSCALER")]
    SOFTWARE_SCALER,

    [CCode (cname="AV_CLASS_CATEGORY_SWRESAMPLER")]
    SOFTWARE_RESAMPLER,
    DEVICE_VIDEO_OUTPUT,
    DEVICE_VIDEO_INPUT,
    DEVICE_AUDIO_OUTPUT,
    DEVICE_AUDIO_INPUT,
    DEVICE_OUTPUT,
    DEVICE_INPUT;

    /***********************************************************
    @brief Not part of ABI/API
    ***********************************************************/
    //  LibAVUtil.Log.ClassCategory.NB

    [CCode (cname="AV_IS_INPUT_DEVICE",cheader_filename="subprojects/ffmpeg/libavutil/log.h")]
    public static bool is_input_device (
        LibAVUtil.Log.ClassCategory category
    );

    [CCode (cname="AV_IS_OUTPUT_DEVICE",cheader_filename="subprojects/ffmpeg/libavutil/log.h")]
    public static bool output_device (
        LibAVUtil.Log.ClassCategory category
    );

    [CCode (cname="av_default_get_category",cheader_filename="subprojects/ffmpeg/libavutil/log.h")]
    public static LibAVUtil.Log.ClassCategory av_default_get_category (
        void *ptr
    );

}

} // namespace Log
} // namespace LibAVUtil
