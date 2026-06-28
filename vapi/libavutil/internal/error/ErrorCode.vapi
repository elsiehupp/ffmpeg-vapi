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
@file error code definitions
***********************************************************/

/***********************************************************
@addtogroup LibAVUtil.ErrorCode
***********************************************************/

/***********************************************************
@brief Error handling
***********************************************************/
[CCode (cprefix="AVERROR_",cheader_filename="subprojects/ffmpeg/libavutil/error.h")]
public errordomain ErrorCode {
    /***********************************************************
    @brief Bitstream filter not found
    ***********************************************************/
    [CCode (cname="AVERROR_BSF_NOT_FOUND")]
    BITSTREAM_FILTER_NOT_FOUND,

    /***********************************************************
    @brief Internal bug, also see LibAVUtil.ErrorCode.BUG2
    ***********************************************************/
    BUG,

    /***********************************************************
    @brief Buffer too small
    ***********************************************************/
    BUFFER_TOO_SMALL,

    /***********************************************************
    @brief Decoder not found
    ***********************************************************/
    DECODER_NOT_FOUND,

    /***********************************************************
    @brief Demuxer not found
    ***********************************************************/
    DEMUXER_NOT_FOUND,

    /***********************************************************
    @brief Encoder not found
    ***********************************************************/
    ENCODER_NOT_FOUND,

    /***********************************************************
    @brief End of file
    ***********************************************************/
    [CCode (cname="AVERROR_EOF")]
    END_OF_FILE,

    /***********************************************************
    @brief Immediate exit was requested; the called function should not
    be restarted.
    ***********************************************************/
    EXIT,

    /***********************************************************
    @brief Generic error in an external library
    ***********************************************************/
    EXTERNAL,

    /***********************************************************
    @brief Filter not found
    ***********************************************************/
    FILTER_NOT_FOUND,

    /***********************************************************
    @brief Invalid data found when processing input
    ***********************************************************/
    [CCode (cname="AVERROR_INVALIDDATA")]
    INVALID_DATA,

    /***********************************************************
    @brief Muxer not found
    ***********************************************************/
    MUXER_NOT_FOUND,

    /***********************************************************
    @brief Option not found
    ***********************************************************/
    OPTION_NOT_FOUND,

    /***********************************************************
    @brief Not yet implemented in FFmpeg, patches welcome
    ***********************************************************/
    [CCode (cname="AVERROR_PATCHWELCOME")]
    PATCH_WELCOME,

    /***********************************************************
    @brief Protocol not found
    ***********************************************************/
    PROTOCOL_NOT_FOUND,

    /***********************************************************
    @brief Stream not found
    ***********************************************************/
    STREAM_NOT_FOUND,

    /***********************************************************
    @brief This is semantically identical to LibAVUtil.ErrorCode.BUG; it has been
    public introduced in Libav after our LibAVUtil.ErrorCode.BUG and with a
    modified value.
    ***********************************************************/
    BUG2,

    /***********************************************************
    @brief Unknown error, typically from an external library
    ***********************************************************/
    UNKNOWN,

    /***********************************************************
    @brief Requested feature is flagged experimental. Set
    strict_std_compliance if you really want to use it.
    ***********************************************************/
    EXPERIMENTAL,

    /***********************************************************
    @brief Input changed between calls. Reconfiguration is required.
    (can be OR-ed with LibAVUtil.ErrorCode.OUTPUT_CHANGED)
    ***********************************************************/
    INPUT_CHANGED,

    /***********************************************************
    @brief Output changed between calls. Reconfiguration is required.
    (can be OR-ed with LibAVUtil.ErrorCode.INPUT_CHANGED)
    ***********************************************************/
    OUTPUT_CHANGED,

    /***********************************************************
    @brief HTTP & RTSP error
    ***********************************************************/
    HTTP_BAD_REQUEST,

    /***********************************************************
    @brief HTTP & RTSP error
    ***********************************************************/
    HTTP_UNAUTHORIZED,

    /***********************************************************
    @brief HTTP & RTSP error
    ***********************************************************/
    HTTP_FORBIDDEN,

    /***********************************************************
    @brief HTTP & RTSP error
    ***********************************************************/
    HTTP_NOT_FOUND,

    /***********************************************************
    @brief HTTP & RTSP error
    ***********************************************************/
    HTTP_OTHER_4XX,

    /***********************************************************
    @brief HTTP & RTSP error
    ***********************************************************/
    HTTP_SERVER_ERROR;
}

/***********************************************************
@brief Put a description of the LibAVUtil.ErrorCode code errnum in errbuf.
In case of failure the global variable errno is set to indicate the
error. Even in case of failure av_strerror () will print a generic
error message indicating the errnum provided to errbuf.

@param errnum error code to describe
@param errbuf buffer to which description is written
@param errbuf_size the size in bytes of errbuf
@return 0 on success, a negative value if a description for errnum
cannot be found
***********************************************************/
[CCode (cname="av_strerror",cheader_filename="subprojects/ffmpeg/libavutil/error.h")]
public int av_strerror (
    int errnum,
    string errbuf,
    size_t errbuf_size
);

/***********************************************************
@brief Fill the provided buffer with a string containing an error string
corresponding to the LibAVUtil.ErrorCode code errnum.

@param errbuf a buffer
@param errbuf_size size in bytes of errbuf
@param errnum error code to describe
@return the buffer in input, filled with the error description
@see @link av_strerror ()
***********************************************************/
[CCode (cname="av_make_error_string",cheader_filename="subprojects/ffmpeg/libavutil/error.h")]
public static string av_make_error_string (
    string errbuf,
    size_t errbuf_size,
    int errnum
);

/***********************************************************
@brief Convenience macro, the return value should be used only directly in
function arguments but never stand-alone.
***********************************************************/
[CCode (cname="av_err2str",cheader_filename="subprojects/ffmpeg/libavutil/error.h")]
public static string av_err2str (
    ErrorCode errnum
);

} // namespace LibAVUtil
