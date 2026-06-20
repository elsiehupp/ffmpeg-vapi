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
[CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
public enum RTSPStatusCode {
    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    RTSP_STATUS_CONTINUE,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    RTSP_STATUS_OK,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    RTSP_STATUS_CREATED,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    RTSP_STATUS_LOW_ON_STORAGE_SPACE,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    RTSP_STATUS_MULTIPLE_CHOICES,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    RTSP_STATUS_MOVED_PERMANENTLY,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    RTSP_STATUS_MOVED_TEMPORARILY,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    RTSP_STATUS_SEE_OTHER,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    RTSP_STATUS_NOT_MODIFIED,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    RTSP_STATUS_USE_PROXY,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    RTSP_STATUS_BAD_REQUEST,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    RTSP_STATUS_UNAUTHORIZED,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    RTSP_STATUS_PAYMENT_REQUIRED,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    RTSP_STATUS_FORBIDDEN,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    RTSP_STATUS_NOT_FOUND,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    RTSP_STATUS_METHOD,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    RTSP_STATUS_NOT_ACCEPTABLE,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    RTSP_STATUS_PROXY_AUTH_REQUIRED,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    RTSP_STATUS_REQ_TIME_OUT,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    RTSP_STATUS_GONE,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    RTSP_STATUS_LENGTH_REQUIRED,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    RTSP_STATUS_PRECONDITION_FAILED,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    RTSP_STATUS_REQ_ENTITY_2LARGE,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    RTSP_STATUS_REQ_URI_2LARGE,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    RTSP_STATUS_UNSUPPORTED_MTYPE,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    RTSP_STATUS_PARAM_NOT_UNDERSTOOD,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    RTSP_STATUS_CONFERENCE_NOT_FOUND,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    RTSP_STATUS_BANDWIDTH,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    RTSP_STATUS_SESSION,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    RTSP_STATUS_STATE,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    RTSP_STATUS_INVALID_HEADER_FIELD,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    RTSP_STATUS_INVALID_RANGE,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    RTSP_STATUS_RONLY_PARAMETER,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    RTSP_STATUS_AGGREGATE,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    RTSP_STATUS_ONLY_AGGREGATE,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    RTSP_STATUS_TRANSPORT,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    RTSP_STATUS_UNREACHABLE,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    RTSP_STATUS_INTERNAL,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    RTSP_STATUS_NOT_IMPLEMENTED,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    RTSP_STATUS_BAD_GATEWAY,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    RTSP_STATUS_SERVICE,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    RTSP_STATUS_GATEWAY_TIME_OUT,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    RTSP_STATUS_VERSION,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    RTSP_STATUS_UNSUPPORTED_OPTION;
}

//  public const av_unused string const rtsp_status_strings[] = {
//  [RTSP_STATUS_CONTINUE]               ="Continue",
//  [RTSP_STATUS_OK]                     ="OK",
//  [RTSP_STATUS_CREATED]                ="Created",
//  [RTSP_STATUS_LOW_ON_STORAGE_SPACE]   ="Low on Storage Space",
//  [RTSP_STATUS_MULTIPLE_CHOICES]       ="Multiple Choices",
//  [RTSP_STATUS_MOVED_PERMANENTLY]      ="Moved Permanently",
//  [RTSP_STATUS_MOVED_TEMPORARILY]      ="Moved Temporarily",
//  [RTSP_STATUS_SEE_OTHER]              ="See Other",
//  [RTSP_STATUS_NOT_MODIFIED]           ="Not Modified",
//  [RTSP_STATUS_USE_PROXY]              ="Use Proxy",
//  [RTSP_STATUS_BAD_REQUEST]            ="Bad Request",
//  [RTSP_STATUS_UNAUTHORIZED]           ="Unauthorized",
//  [RTSP_STATUS_PAYMENT_REQUIRED]       ="Payment Required",
//  [RTSP_STATUS_FORBIDDEN]              ="Forbidden",
//  [RTSP_STATUS_NOT_FOUND]              ="Not Found",
//  [RTSP_STATUS_METHOD]                 ="Method Not Allowed",
//  [RTSP_STATUS_NOT_ACCEPTABLE]         ="Not Acceptable",
//  [RTSP_STATUS_PROXY_AUTH_REQUIRED]    ="Proxy Authentication Required",
//  [RTSP_STATUS_REQ_TIME_OUT]           ="Request Time-out",
//  [RTSP_STATUS_GONE]                   ="Gone",
//  [RTSP_STATUS_LENGTH_REQUIRED]        ="Length Required",
//  [RTSP_STATUS_PRECONDITION_FAILED]    ="Precondition Failed",
//  [RTSP_STATUS_REQ_ENTITY_2LARGE]      ="Request Entity Too Large",
//  [RTSP_STATUS_REQ_URI_2LARGE]         ="Request URI Too Large",
//  [RTSP_STATUS_UNSUPPORTED_MTYPE]      ="Unsupported Media Type",
//  [RTSP_STATUS_PARAM_NOT_UNDERSTOOD]   ="Parameter Not Understood",
//  [RTSP_STATUS_CONFERENCE_NOT_FOUND]   ="Conference Not Found",
//  [RTSP_STATUS_BANDWIDTH]              ="Not Enough Bandwidth",
//  [RTSP_STATUS_SESSION]                ="Session Not Found",
//  [RTSP_STATUS_STATE]                  ="Method Not Valid in This State",
//  [RTSP_STATUS_INVALID_HEADER_FIELD]   ="Header Field Not Valid for Resource",
//  [RTSP_STATUS_INVALID_RANGE]          ="Invalid Range",
//  [RTSP_STATUS_RONLY_PARAMETER]        ="Parameter Is Read-Only",
//  [RTSP_STATUS_AGGREGATE]              ="Aggregate Operation no Allowed",
//  [RTSP_STATUS_ONLY_AGGREGATE]         ="Only Aggregate Operation Allowed",
//  [RTSP_STATUS_TRANSPORT]              ="Unsupported Transport",
//  [RTSP_STATUS_UNREACHABLE]            ="Destination Unreachable",
//  [RTSP_STATUS_INTERNAL]               ="Internal Server Error",
//  [RTSP_STATUS_NOT_IMPLEMENTED]        ="Not Implemented",
//  [RTSP_STATUS_BAD_GATEWAY]            ="Bad Gateway",
//  [RTSP_STATUS_SERVICE]                ="Service Unavailable",
//  [RTSP_STATUS_GATEWAY_TIME_OUT]       ="Gateway Time-out",
//  [RTSP_STATUS_VERSION]                ="RTSP Version not Supported",
//  [RTSP_STATUS_UNSUPPORTED_OPTION]     ="Option not supported",
//  }

[CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
public static string RTSP_STATUS_CODE2STRING (
    RTSPStatusCode x
);

[CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
public enum RTSPMethod {
    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    DESCRIBE,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    ANNOUNCE,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    OPTIONS,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    SETUP,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    PLAY,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    PAUSE,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    TEARDOWN,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    GET_PARAMETER,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    SET_PARAMETER,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    REDIRECT,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    RECORD,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
    UNKNOWN;
}

[CCode (cname="",cheader_filename="ffmpeg/libformat/rtspcodes.h")]
public static int ff_rtsp_averror (
    RTSPStatusCode status_code,
    int default_averror
);

} // namespace LibAVFormat
