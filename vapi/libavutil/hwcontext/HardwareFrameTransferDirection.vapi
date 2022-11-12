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

[CCode (cprefix="AV_HWFRAME_TRANSFER_DIRECTION_", cheader_filename="ffmpeg/libavutil/hwcontext.h")]
public enum HardwareFrameTransferDirection {
    /***********************************************************
    @brief Transfer the data from the queried hw frame.
        ***********************************************************/
    FROM,

    /***********************************************************
    @brief Transfer the data to the queried hw frame.
        ***********************************************************/
    TO;

    /***********************************************************
    @brief Get a list of possible source or target formats usable in
    av_hwframe_transfer_data ().

    @param hwframe_ctx the frame context to obtain the information for
    @param dir the direction of the transfer
    @param formats the pointer to the output format list will be written here.
        The list is terminated with PixelFormat.NONE and must be freed
        by the caller when no longer needed using av_free ().
        If this function returns successfully, the format list will
        have at least one item (not counting the terminator).
        On failure, the contents of this pointer are unspecified.
    @param flags currently unused, should be set to zero
    @return 0 on success, a negative LibAVUtil.ErrorCode code on failure.
        ***********************************************************/
    [CCode (cname="av_hwframe_transfer_get_formats", cheader_filename="ffmpeg/libavutil/hwcontext.h")]
    public int av_hwframe_transfer_get_formats (
        LibAVUtil.BufferRef hwframe_ctx,
        HardwareFrameTransferDirection dir,
        out PixelFormat[] formats,
        int flags
    );

}

} // namespace LibAVUtil
