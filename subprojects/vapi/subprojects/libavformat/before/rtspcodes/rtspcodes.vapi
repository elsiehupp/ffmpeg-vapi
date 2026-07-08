/***********************************************************
@brief RTSP definitions
@copyright 2002 Fabrice Bellard
@copyright 2014 Samsung Electronics. All rights reserved.
    @Author: Reynaldo H. Verdejo Pinochet <r.verdejo@sisa.samsung.com>
***********************************************************/
/***********************************************************
@brief This file is part of FFmpeg.

FFmpeg is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

FFmpeg is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with FFmpeg; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
***********************************************************/

namespace LibAVFormat {

/***********************************************************
@brief RTSP handling
***********************************************************/
[CCode (cname="enum RTSPStatusCode",cprefix="RTSP_STATUS_",cheader_filename="subprojects/ffmpeg/libavformat/rtspcodes.h")]
public enum RTSPStatusCode {
    /***********************************************************
    @brief Continue
    ***********************************************************/
    CONTINUE,

    /***********************************************************
    @brief OK
    ***********************************************************/
    OK,

    /***********************************************************
    @brief Created
    ***********************************************************/
    CREATED,

    /***********************************************************
    @brief Low on Storage Space
    ***********************************************************/
    LOW_ON_STORAGE_SPACE,

    /***********************************************************
    @brief Multiple Choices
    ***********************************************************/
    MULTIPLE_CHOICES,

    /***********************************************************
    @brief Moved Permanently
    ***********************************************************/
    MOVED_PERMANENTLY,

    /***********************************************************
    @brief Moved Temporarily
    ***********************************************************/
    MOVED_TEMPORARILY,

    /***********************************************************
    @brief See Other
    ***********************************************************/
    SEE_OTHER,

    /***********************************************************
    @brief Not Modified
    ***********************************************************/
    NOT_MODIFIED,

    /***********************************************************
    @brief Use Proxy
    ***********************************************************/
    USE_PROXY,

    /***********************************************************
    @brief Bad Request
    ***********************************************************/
    BAD_REQUEST,

    /***********************************************************
    @brief Unauthorized
    ***********************************************************/
    UNAUTHORIZED,

    /***********************************************************
    @brief Payment Required
    ***********************************************************/
    PAYMENT_REQUIRED,

    /***********************************************************
    @brief Forbidden
    ***********************************************************/
    FORBIDDEN,

    /***********************************************************
    @brief Not Found
    ***********************************************************/
    NOT_FOUND,

    /***********************************************************
    @brief Method Not Allowed
    ***********************************************************/
    METHOD,

    /***********************************************************
    @brief Not Acceptable
    ***********************************************************/
    NOT_ACCEPTABLE,

    /***********************************************************
    @brief Proxy Authentication Required
    ***********************************************************/
    PROXY_AUTH_REQUIRED,

    /***********************************************************
    @brief Request Time-out
    ***********************************************************/
    [CCode (cname="RTSP_STATUS_REQ_TIME_OUT")]
    REQUEST_TIMED_OUT,

    /***********************************************************
    @brief Gone
    ***********************************************************/
    GONE,

    /***********************************************************
    @brief Length Required
    ***********************************************************/
    LENGTH_REQUIRED,

    /***********************************************************
    @brief Precondition Failed
    ***********************************************************/
    PRECONDITION_FAILED,

    /***********************************************************
    @brief Request Entity Too Large
    ***********************************************************/
    [CCode (cname="RTSP_STATUS_REQ_ENTITY_2LARGE")]
    REQUEST_ENTITY_TOO_LARGE,

    /***********************************************************
    @brief Request URI Too Large
    ***********************************************************/
    [CCode (cname="RTSP_STATUS_REQ_URI_2LARGE")]
    REQUEST_URI_TOO_LARGE,

    /***********************************************************
    @brief Unsupported Media Type
    ***********************************************************/
    [CCode (cname="RTSP_STATUS_UNSUPPORTED_MTYPE")]
    UNSUPPORTED_MEDIA_TYPE,

    /***********************************************************
    @brief Parameter Not Understood
    ***********************************************************/
    [CCode (cname="RTSP_STATUS_PARAM_NOT_UNDERSTOOD")]
    PARAMETER_NOT_UNDERSTOOD,

    /***********************************************************
    @brief Conference Not Found
    ***********************************************************/
    CONFERENCE_NOT_FOUND,

    /***********************************************************
    @brief Not Enough Bandwidth
    ***********************************************************/
    [CCode (cname="RTSP_STATUS_BANDWIDTH")]
    NOT_ENOUGH_BANDWIDTH,

    /***********************************************************
    @brief Session Not Found
    ***********************************************************/
    [CCode (cname="RTSP_STATUS_SESSION")]
    SESSION_NOT_FOUND,

    /***********************************************************
    @brief Method Not Valid in This State
    ***********************************************************/
    [CCode (cname="RTSP_STATUS_STATE")]
    METHOD_NOT_AVAILABLE_IN_THIS_STATE,

    /***********************************************************
    @brief Header Field Not Valid for Resource
    ***********************************************************/
    [CCode (cname="RTSP_STATUS_INVALID_HEADER_FIELD")]
    HEADER_FIELD_INVALID_FOR_RESOURCE,

    /***********************************************************
    @brief Invalid Range
    ***********************************************************/
    INVALID_RANGE,

    /***********************************************************
    @brief Parameter Is Read-Only
    ***********************************************************/
    [CCode (cname="RTSP_STATUS_RONLY_PARAMETER")]
    READ_ONLY_PARAMETER,

    /***********************************************************
    @brief Aggregate Operation no Allowed
    ***********************************************************/
    [CCode (cname="RTSP_STATUS_AGGREGATE")]
    AGGREGATE_OPERATION_DISALLOWED,

    /***********************************************************
    @brief Only Aggregate Operation Allowed
    ***********************************************************/
    [CCode (cname="RTSP_STATUS_ONLY_AGGREGATE")]
    AGGREGATE_OPERATION_ONLY,

    /***********************************************************
    @brief Unsupported Transport
    ***********************************************************/
    [CCode (cname="RTSP_STATUS_TRANSPORT")]
    UNSUPPORTED_TRANSPORT,

    /***********************************************************
    @brief Destination Unreachable
    ***********************************************************/
    [CCode (cname="RTSP_STATUS_UNREACHABLE")]
    DESTINATION_UNREACHABLE,

    /***********************************************************
    @brief Internal Server Error
    ***********************************************************/
    [CCode (cname="RTSP_STATUS_INTERNAL")]
    INTERNAL_SERVER_ERROR,

    /***********************************************************
    @brief Not Implemented
    ***********************************************************/
    NOT_IMPLEMENTED,

    /***********************************************************
    @brief Bad Gateway
    ***********************************************************/
    BAD_GATEWAY,

    /***********************************************************
    @brief Service Unavailable
    ***********************************************************/
    [CCode (cname="RTSP_STATUS_SERVICE")]
    SERVICE_UNAVAILABLE,

    /***********************************************************
    @brief Gateway Time-out
    ***********************************************************/
    [CCode (cname="RTSP_STATUS_GATEWAY_TIME_OUT")]
    GATEWAY_TIMEOUT,

    /***********************************************************
    @brief RTSP Version not Supported
    ***********************************************************/
    [CCode (cname="RTSP_STATUS_VERSION")]
    VERSION,

    /***********************************************************
    @brief LibAVUtil.Option not supported
    ***********************************************************/
    UNSUPPORTED_OPTION;

    [CCode (cname="RTSP_STATUS_CODE2STRING",cheader_filename="subprojects/ffmpeg/libavformat/rtspcodes.h")]
    public static string to_string (
        RTSPStatusCode rtsp_status_code
    );

    [CCode (cname="ff_rtsp_averror",cheader_filename="subprojects/ffmpeg/libavformat/rtspcodes.h")]
    public static int to_averror (
        RTSPStatusCode status_code,
        int default_averror
    );

}

[CCode (cname="enum RTSPMethod",cheader_filename="subprojects/ffmpeg/libavformat/rtspcodes.h")]
public enum RTSPMethod {
    DESCRIBE,
    ANNOUNCE,
    OPTIONS,
    SETUP,
    PLAY,
    PAUSE,
    TEARDOWN,
    GET_PARAMETER,
    SET_PARAMETER,
    REDIRECT,
    RECORD,
    UNKNOWN;
}

} // namespace LibAVFormat
