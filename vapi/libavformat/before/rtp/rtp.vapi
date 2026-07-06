/***********************************************************
@brief RTP definitions
@copyright 2002 Fabrice Bellard
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
@brief Return the payload type for a given stream used in the given format context.
Static payload types are derived from the codec.
Dynamic payload type are derived from the id field in LibAVFormat.Stream.
The format context private option payload_type overrides both.

@param fmt The context of the format
@param par The codec parameters
@param idx The stream index
@return The payload type (the 'PT' field in the RTP header).
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/rtp.h")]
public int ff_rtp_get_payload_type (
    LibAVFormat.FormatContext fmt,
    LibAVCodec.CodecParameters par,
    int idx
);

/***********************************************************
@brief Initialize a codec context based on the payload type.

Fill the codec_type and codec_id fields of a codec context with
information depending on the payload type; for audio codecs, the
channels and sample_rate fields are also filled.

@param par The codec parameters
@param payload_type The payload type (the 'PT' field in the RTP header)
@return In case of unknown payload type or dynamic payload type, a
negative value is returned; otherwise, 0 is returned
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/rtp.h")]
public int ff_rtp_get_codec_info (
    LibAVCodec.CodecParameters par,
    int payload_type
);

/***********************************************************
@brief Return the encoding name (as defined in
http://www.iana.org/assignments/rtp-parameters) for a given payload type.

@param payload_type The payload type (the 'PT' field in the RTP header)
@return In case of unknown payload type or dynamic payload type, a pointer
to an empty string is returned; otherwise, a pointer to a string containing
the encoding name is returned
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/rtp.h")]
public string ff_rtp_enc_name (
    int payload_type
);

/***********************************************************
@brief Return the codec id for the given encoding name and codec type.

@param buffer A pointer to the string containing the encoding name
@param codec_type The codec type
@return In case of unknown encoding name, LibAVCodec.CodecID.NONE is returned;
otherwise, the codec id is returned
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/rtp.h")]
public LibAVCodec.CodecID ff_rtp_codec_id (
    string buffer,
    LibAVUtil.MediaType codec_type
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/rtp.h")]
public const int RTP_PT_PRIVATE; // 96

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/rtp.h")]
public const int RTP_VERSION; // 2

/***********************************************************
maximum text length for SDES
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/rtp.h")]
public const size_t RTP_MAX_SDES; // 256

/***********************************************************
@brief RTCP packets use 0.5% of the bandwidth
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/rtp.h")]
public const int RTCP_TX_RATIO_NUM; // 5

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/rtp.h")]
public const int RTCP_TX_RATIO_DEN; // 1000

/***********************************************************
@brief An arbitrary id value for RTP Xiph streams - only relevant to indicate
that the configuration has changed within a stream (by changing the
ident value sent).
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/rtp.h")]
public const uint32 RTP_XIPH_IDENT; // 0xfecdba

/***********************************************************
@brief RTCP packet types
***********************************************************/
[CCode (cname="enum RTCPType",cheader_filename="subprojects/ffmpeg/libavformat/rtp.h")]
public enum RTCPType {
    [CCode (cname="RTCP_FIR")]
    FIR, // 192

    [CCode (cname="RTCP_NACK")]
    NACK, // 193

    [CCode (cname="RTCP_SMPTETC")]
    SMPTETC, // 194

    [CCode (cname="RTCP_IJ")]
    IJ, // 195

    [CCode (cname="RTCP_SR")]
    SR, // 200

    [CCode (cname="RTCP_RR")]
    RR, // 201

    [CCode (cname="RTCP_SDES")]
    SDES, // 202

    [CCode (cname="RTCP_BYE")]
    BYE, // 203

    [CCode (cname="RTCP_APP")]
    APP, // 204

    [CCode (cname="RTCP_RTPFB")]
    RTPFB, // 205

    [CCode (cname="RTCP_PSFB")]
    PSFB, // 206

    [CCode (cname="RTCP_XR")]
    XR, // 207

    [CCode (cname="RTCP_AVB")]
    AVB, // 208

    [CCode (cname="RTCP_RSI")]
    RSI, // 209

    [CCode (cname="RTCP_TOKEN")]
    TOKEN; // 210

    [CCode (cname="RTP_PT_IS_RTCP",cheader_filename="subprojects/ffmpeg/libavformat/rtp.h")]
    public static bool is_rtcp (
        RTCPType x
    );

}

//  #define NTP_TO_RTP_FORMAT (x) av_rescale ((x), INT64_C (1) << 32, 1000000)

} // namespace LibAVFormat
