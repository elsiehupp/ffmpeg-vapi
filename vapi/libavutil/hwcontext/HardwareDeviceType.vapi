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

[CCode (cprefix="", cheader_filename="ffmpeg/libavutil/hwcontext.h")]
public enum HardwareDeviceType {
    AV_HWDEVICE_TYPE_NONE,
    AV_HWDEVICE_TYPE_VDPAU,
    AV_HWDEVICE_TYPE_CUDA,
    AV_HWDEVICE_TYPE_VAAPI,
    AV_HWDEVICE_TYPE_DXVA2,
    AV_HWDEVICE_TYPE_QSV,
    AV_HWDEVICE_TYPE_VIDEOTOOLBOX,
    AV_HWDEVICE_TYPE_D3D11VA,
    AV_HWDEVICE_TYPE_DRM,
    AV_HWDEVICE_TYPE_OPENCL,
    AV_HWDEVICE_TYPE_MEDIACODEC;

    /***********************************************************
    @brief Look up an HardwareDeviceType by name.

    @param name String name of the device type (case-insensitive).
    @return The type from enum HardwareDeviceType, or AV_HWDEVICE_TYPE_NONE if
        not found.
        ***********************************************************/
    [CCode (cname="av_hwdevice_find_type_by_name", cheader_filename="ffmpeg/libavutil/hwcontext.h")]
    public static HardwareDeviceType av_hwdevice_find_type_by_name (
        string name
    );

    /***********************************************************
    @brief Get the string name of an HardwareDeviceType.

    @param type Type from enum HardwareDeviceType.
    @return Pointer to a static string containing the name, or null if the type
        is not valid.
        ***********************************************************/
    [CCode (cname="av_hwdevice_get_type_name", cheader_filename="ffmpeg/libavutil/hwcontext.h")]
    public static string av_hwdevice_get_type_name (
        HardwareDeviceType type
    );

    /***********************************************************
    @brief Iterate over supported device types.

    @param type AV_HWDEVICE_TYPE_NONE initially, then the previous type
        returned by this function in subsequent iterations.
    @return The next usable device type from enum HardwareDeviceType, or
        AV_HWDEVICE_TYPE_NONE if there are no more.
        ***********************************************************/
    [CCode (cname="av_hwdevice_iterate_types", cheader_filename="ffmpeg/libavutil/hwcontext.h")]
    public static HardwareDeviceType av_hwdevice_iterate_types (
        HardwareDeviceType prev
    );

}

} // namespace LibAVUtil
