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
@file
An API-specific header for AV_HWDEVICE_TYPE_VIDEOTOOLBOX.

This API currently does not support frame allocation, as the raw VideoToolbox
API does allocation, and FFmpeg itself never has the need to allocate frames.

If the API user sets a custom pool, HardwareFrameContext.pool must return
LibAVUtil.BufferRef(s) whose data pointer is a CVImageBufferRef or CVPixelBufferRef.

Currently HardwareDeviceContext.hwctx and HardwareFrameContext.hwctx are always
null.
***********************************************************/

/***********************************************************
@brief Convert a VideoToolbox (actually CoreVideo) format to PixelFormat.
Returns PixelFormat.NONE if no known equivalent was found.
***********************************************************/
[CCode (cname="av_map_videotoolbox_format_to_pixfmt", cheader_filename="ffmpeg/libavutil/hwcontext_videotoolbox.h")]
public PixelFormat av_map_videotoolbox_format_to_pixfmt (
    uint32 cv_fmt
);

/***********************************************************
@brief Convert an PixelFormat to a VideoToolbox (actually CoreVideo) format.
Returns 0 if no known equivalent was found.
***********************************************************/
[CCode (cname="av_map_videotoolbox_format_from_pixfmt", cheader_filename="ffmpeg/libavutil/hwcontext_videotoolbox.h")]
public uint32 av_map_videotoolbox_format_from_pixfmt (
    PixelFormat pixel_format
);

} // namespace LibAVUtil
