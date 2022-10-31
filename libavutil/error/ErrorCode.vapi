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
error code definitions
***********************************************************/

/***********************************************************
@addtogroup LibAVUtil.ErrorCode
***********************************************************/

/***********************************************************
@brief Error handling
***********************************************************/
[CCode (cprefix="", cheader_filename="libavcodec/error.h")]
public errordomain ErrorCode {
    /***********************************************************
    @brief Bitstream filter not found
    ***********************************************************/
    AVERROR_BSF_NOT_FOUND,
    /***********************************************************
    @brief Internal bug, also see AVERROR_BUG2
    ***********************************************************/
    AVERROR_BUG,
    /***********************************************************
    @brief Buffer too small
    ***********************************************************/
    AVERROR_BUFFER_TOO_SMALL,
    /***********************************************************
    @brief Decoder not found
    ***********************************************************/
    AVERROR_DECODER_NOT_FOUND,
    /***********************************************************
    @brief Demuxer not found
    ***********************************************************/
    AVERROR_DEMUXER_NOT_FOUND,
    /***********************************************************
    @brief Encoder not found
    ***********************************************************/
    AVERROR_ENCODER_NOT_FOUND,
    /***********************************************************
    @brief End of file
    ***********************************************************/
    AVERROR_EOF,
    /***********************************************************
    @brief Immediate exit was requested; the called function should not
    be restarted.
    ***********************************************************/
    AVERROR_EXIT,
    /***********************************************************
    @brief Generic error in an external library
    ***********************************************************/
    AVERROR_EXTERNAL,
    /***********************************************************
    @brief Filter not found
    ***********************************************************/
    AVERROR_FILTER_NOT_FOUND,
    /***********************************************************
    @brief Invalid data found when processing input
    ***********************************************************/
    AVERROR_INVALIDDATA,
    /***********************************************************
    @brief Muxer not found
    ***********************************************************/
    AVERROR_MUXER_NOT_FOUND,
    /***********************************************************
    @brief Option not found
    ***********************************************************/
    AVERROR_OPTION_NOT_FOUND,
    /***********************************************************
    @brief Not yet implemented in FFmpeg, patches welcome
    ***********************************************************/
    AVERROR_PATCHWELCOME,
    /***********************************************************
    @brief Protocol not found
    ***********************************************************/
    AVERROR_PROTOCOL_NOT_FOUND,
    /***********************************************************
    @brief Stream not found
    ***********************************************************/
    AVERROR_STREAM_NOT_FOUND,
    /***********************************************************
    @brief This is semantically identical to AVERROR_BUG; it has been
    introduced in Libav after our AVERROR_BUG and with a
    modified value.
    ***********************************************************/
    AVERROR_BUG2,
    /***********************************************************
    @brief Unknown error, typically from an external library
    ***********************************************************/
    AVERROR_UNKNOWN,
    /***********************************************************
    @brief Requested feature is flagged experimental. Set
    strict_std_compliance if you really want to use it.
    ***********************************************************/
    AVERROR_EXPERIMENTAL,
    /***********************************************************
    @brief Input changed between calls. Reconfiguration is required.
    (can be OR-ed with AVERROR_OUTPUT_CHANGED)
    ***********************************************************/
    AVERROR_INPUT_CHANGED,
    /***********************************************************
    @brief Output changed between calls. Reconfiguration is required.
    (can be OR-ed with AVERROR_INPUT_CHANGED)
    ***********************************************************/
    AVERROR_OUTPUT_CHANGED,
    /***********************************************************
    @brief HTTP & RTSP error
    ***********************************************************/
    AVERROR_HTTP_BAD_REQUEST,
    /***********************************************************
    @brief HTTP & RTSP error
    ***********************************************************/
    AVERROR_HTTP_UNAUTHORIZED,
    /***********************************************************
    @brief HTTP & RTSP error
    ***********************************************************/
    AVERROR_HTTP_FORBIDDEN,
    /***********************************************************
    @brief HTTP & RTSP error
    ***********************************************************/
    AVERROR_HTTP_NOT_FOUND,
    /***********************************************************
    @brief HTTP & RTSP error
    ***********************************************************/
    AVERROR_HTTP_OTHER_4XX,
    /***********************************************************
    @brief HTTP & RTSP error
    ***********************************************************/
    AVERROR_HTTP_SERVER_ERROR,
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
[CCode (cname="av_strerror", cheader_filename="libavcodec/error.h")]
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
[CCode (cname="av_make_error_string", cheader_filename="libavcodec/error.h")]
public static string av_make_error_string (
    string errbuf,
    size_t errbuf_size,
    int errnum
);

/***********************************************************
@brief Convenience macro, the return value should be used only directly in
function arguments but never stand-alone.
***********************************************************/
[CCode (cname="av_err2str", cheader_filename="libavcodec/error.h")]
public static string av_err2str (
    ErrorCode errnum
);

} // namespace LibAVUtil
