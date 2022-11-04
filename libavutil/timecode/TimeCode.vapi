/***********************************************************
@copyright 2006 Smartjog S.A.S, Baptiste Coudurier <baptiste.coudurier@gmail.com>
@copyright 2011-2012 Smartjog S.A.S, Clément Bœsch <clement.boesch@smartjog.com>

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
Timecode helpers header
***********************************************************/

[CCode (cname="struct AVTimecode", cheader_filename="ffmpeg/libavutil/timecode.h")]
public struct TimeCode {
    [CCode (cname="AV_TIMECODE_STR_SIZE", cheader_filename="ffmpeg/libavutil/timecode.h")]
    public const size_t SIZE;

    /***********************************************************
    @brief Timecode frame start (first base frame number)
    ***********************************************************/
    [CCode (cname="start")]
    public int start;

    /***********************************************************
    @brief Flags such as drop frame, +24 hours support, ...
    ***********************************************************/
    [CCode (cname="flags")]
    public uint32 flags;

    /***********************************************************
    @brief Frame rate in rational form
    ***********************************************************/
    [CCode (cname="rate")]
    public Rational rate;

    /***********************************************************
    @brief Frames per second; must be consistent with the rate field
    ***********************************************************/
    [CCode (cname="fps")]
    public uint fps;

    /***********************************************************
    @brief Adjust frame number for NTSC drop frame time code.

    @param framenum frame number to adjust
    @param fps frame per second, 30 or 60
    @return adjusted frame number
    @warning adjustment is only valid in NTSC 29.97 and 59.94
    ***********************************************************/
    [CCode (cname="av_timecode_adjust_ntsc_framenum2", cheader_filename="ffmpeg/libavutil/timecode.h")]
    public static int av_timecode_adjust_ntsc_framenum2 (
        int framenum,
        int fps
    );

    /***********************************************************
    @brief Convert frame number to SMPTE 12M binary representation.

    @param tc timecode data correctly initialized
    @param framenum frame number
    @return the SMPTE binary representation

    @note Frame number adjustment is automatically done in case of drop timecode,
        you do NOT have to call av_timecode_adjust_ntsc_framenum2 ().
    @note The frame number is relative to tc.start.
    @note Color frame (CF), binary group flags (BGF) and biphase mark polarity
        correction (PC) bits are set to zero.
    ***********************************************************/
    [CCode (cname="av_timecode_get_smpte_from_framenum", cheader_filename="ffmpeg/libavutil/timecode.h")]
    public uint32 av_timecode_get_smpte_from_framenum (
        TimeCode tc,
        int framenum
    );

    /***********************************************************
    @brief Load timecode string in buf.

    @param buf destination buffer, must be at least AV_TIMECODE_STR_SIZE long
    @param tc timecode data correctly initialized
    @param framenum frame number
    @return the buf parameter

    @note Timecode representation can be a negative timecode and have more than
        24 hours, but will only be honored if the flags are correctly set.
    @note The frame number is relative to tc.start.
    ***********************************************************/
    [CCode (cname="av_timecode_make_string", cheader_filename="ffmpeg/libavutil/timecode.h")]
    public string av_timecode_make_string (
        TimeCode tc,
        out string buf,
        int framenum
    );

    /***********************************************************
    @brief Get the timecode string from the SMPTE timecode format.

    @param buf destination buffer, must be at least AV_TIMECODE_STR_SIZE long
    @param tcsmpte the 32-bit SMPTE timecode
    @param prevent_df prevent the use of a drop flag when it is known the DF bit
        is arbitrary
    @return the buf parameter
    ***********************************************************/
    [CCode (cname="av_timecode_make_smpte_tc_string", cheader_filename="ffmpeg/libavutil/timecode.h")]
    public static string av_timecode_make_smpte_tc_string (
        out string buf,
        uint32 tcsmpte,
        int prevent_df
    );

    /***********************************************************
    @brief Get the timecode string from the 25-bit timecode format (MPEG GOP format).

    @param buf destination buffer, must be at least AV_TIMECODE_STR_SIZE long
    @param tc25bit the 25-bits timecode
    @return the buf parameter
    ***********************************************************/
    [CCode (cname="av_timecode_make_mpeg_tc_string", cheader_filename="ffmpeg/libavutil/timecode.h")]
    public static string av_timecode_make_mpeg_tc_string (
        out string buf,
        uint32 tc25bit
    );

    /***********************************************************
    @brief Init a timecode struct with the passed parameters.

    @param log_ctx a pointer to an arbitrary struct of which the first field
        is a pointer to an Class struct (used for av_log)
    @param tc pointer to an allocated TimeCode
    @param rate frame rate in rational form
    @param flags miscellaneous flags such as drop frame, +24 hours, ...
        (@link TimeCodeFlags)
    @param frame_start the first frame number
    @return 0 on success, LibAVUtil.ErrorCode otherwise
    ***********************************************************/
    [CCode (cname="av_timecode_init", cheader_filename="ffmpeg/libavutil/timecode.h")]
    public int av_timecode_init (
        TimeCode tc,
        Rational rate,
        TimeCodeFlags flags,
        int frame_start,
        void *log_ctx
    );

    /***********************************************************
    @brief Parse timecode representation (hh:mm:ss[:;.]ff).

    @param log_ctx a pointer to an arbitrary struct of which the first field is a
        pointer to an Class struct (used for av_log).
    @param tc pointer to an allocated TimeCode
    @param rate frame rate in rational form
    @param str timecode string which will determine the frame start
    @return 0 on success, LibAVUtil.ErrorCode otherwise
    ***********************************************************/
    [CCode (cname="av_timecode_init_from_string", cheader_filename="ffmpeg/libavutil/timecode.h")]
    public int av_timecode_init_from_string (
        TimeCode tc,
        Rational rate,
        string str,
        void *log_ctx
    );

    /***********************************************************
    @brief Check if the timecode feature is available for the given frame rate

    @return 0 if supported, <0 otherwise
    ***********************************************************/
    [CCode (cname="av_timecode_check_frame_rate", cheader_filename="ffmpeg/libavutil/timecode.h")]
    public static int av_timecode_check_frame_rate (
        Rational rate
    );
}

} // namespace LibAVUtil
