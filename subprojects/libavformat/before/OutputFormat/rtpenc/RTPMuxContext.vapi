/***********************************************************
@brief RTP muxer definitions
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

[CCode (cname="struct RTPMuxContext",cheader_filename="subprojects/ffmpeg/libavformat/rtpenc.h")]
[Compact]
public class RTPMuxContext {
    [CCode (cname="")]
    public LibAVUtil.Log.Class av_class;

    [CCode (cname="")]
    public LibAVFormat.FormatContext ic;

    [CCode (cname="st")]
    public LibAVFormat.Stream stream;

    [CCode (cname="")]
    public int payload_type;

    [CCode (cname="")]
    public uint32 ssrc;

    [CCode (cname="")]
    public string cname;

    [CCode (cname="")]
    public int seq;

    [CCode (cname="")]
    public uint32 timestamp;

    [CCode (cname="")]
    public uint32 base_timestamp;

    [CCode (cname="")]
    public uint32 cur_timestamp;

    [CCode (cname="")]
    public int max_payload_size;

    [CCode (cname="")]
    public int num_frames;

    /***********************************************************
    @brief Rtcp sender statistics
    ***********************************************************/
    [CCode (cname="")]
    public int64 last_rtcp_ntp_time;

    [CCode (cname="")]
    public int64 first_rtcp_ntp_time;

    [CCode (cname="")]
    public uint packet_count;

    [CCode (cname="")]
    public uint octet_count;

    [CCode (cname="")]
    public uint last_octet_count;

    [CCode (cname="")]
    public int first_packet;

    /***********************************************************
    @brief Buffer for output
    ***********************************************************/
    [CCode (cname="")]
    public uint8[] buffer;

    [CCode (cname="")]
    public uint8[] buf_ptr;

    [CCode (cname="")]
    public int max_frames_per_packet;

    /***********************************************************
    @brief Number of bytes used for H.264 NAL length, if the MP4 syntax is used
    (1, 2 or 4)
    ***********************************************************/
    [CCode (cname="")]
    public int nal_length_size;

    [CCode (cname="")]
    public int buffered_nals;

    [CCode (cname="")]
    public int flags;

    [CCode (cname="")]
    public uint frame_count;
}

[Flags]
[CCode (cprefix="FF_RTP_FLAG_",cheader_filename="subprojects/ffmpeg/libavformat/rptenc.h")]
public enum RTPEncoderFlags {
    MP4A_LATM,
    RFC2190,
    SKIP_RTCP,
    H264_MODE0,
    SEND_BYE;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/rptenc.h")]
public static LibAVUtil.Option[] FF_RTP_FLAG_OPTS (
    void *context,
    void *fieldname
) {
    return {
        new LibAVUtil.FlagsOption () {
            name = "rtpflags",
            short_help_text = "RTP muxer flags",
            offset = offsetof (
                context,
                fieldname
            ),
            default_value = 0,
            minimum_value = int.MIN,
            maximum_value = int.MIN,
            option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
            unit = "rtpflags"
        },
        new LibAVUtil.ConstOption () {
            name = "latm",
            short_help_text = "Use MP4A-LATM packetization instead of MPEG4-GENERIC for AAC",
            offset = 0,
            default_value = RTPEncoderFlags.MP4A_LATM,
            minimum_value = int.MIN,
            maximum_value = int.MIN,
            option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
            unit = "rtpflags"
        },
        new LibAVUtil.ConstOption () {
            name = "rfc2190",
            short_help_text = "Use RFC 2190 packetization instead of RFC 4629 for H.263",
            offset = 0,
            default_value = RTPEncoderFlags.RFC2190,
            minimum_value = int.MIN,
            maximum_value = int.MIN,
            option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
            unit = "rtpflags"
        },
        new LibAVUtil.ConstOption () {
            name = "skip_rtcp",
            short_help_text = "Don't send RTCP sender reports",
            offset = 0,
            default_value = RTPEncoderFlags.SKIP_RTCP,
            minimum_value = int.MIN,
            maximum_value = int.MIN,
            option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
            unit = "rtpflags"
        },
        new LibAVUtil.ConstOption () {
            name = "h264_mode0",
            short_help_text = "Use mode 0 for H.264 in RTP",
            offset = 0,
            default_value = RTPEncoderFlags.H264_MODE0,
            minimum_value = int.MIN,
            maximum_value = int.MIN,
            option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
            unit = "rtpflags"
        },
        new LibAVUtil.ConstOption () {
            name = "send_bye",
            short_help_text = "Send RTCP BYE packets when finishing",
            offset = 0,
            default_value = RTPEncoderFlags.SEND_BYE,
            minimum_value = int.MIN,
            maximum_value = int.MIN,
            option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
            unit = "rtpflags"
        }

    };

}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/rtpenc.h")]
public void ff_rtp_send_data (
    LibAVFormat.FormatContext s1,
    uint8[] buf1,
    int len,
    int m
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/rtpenc.h")]
public void ff_rtp_send_h264_hevc (
    LibAVFormat.FormatContext s1,
    uint8[] buf1,
    int size
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/rtpenc.h")]
public void ff_rtp_send_h261 (
    LibAVFormat.FormatContext s1,
    uint8[] buf1,
    int size
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/rtpenc.h")]
public void ff_rtp_send_h263 (
    LibAVFormat.FormatContext s1,
    uint8[] buf1,
    int size
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/rtpenc.h")]
public void ff_rtp_send_h263_rfc2190 (
    LibAVFormat.FormatContext s1,
    uint8[] buf1,
    int size,
    uint8[] mb_info,
    int mb_info_size
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/rtpenc.h")]
public void ff_rtp_send_aac (
    LibAVFormat.FormatContext s1,
    uint8[] buff,
    int size
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/rtpenc.h")]
public void ff_rtp_send_latm (
    LibAVFormat.FormatContext s1,
    uint8[] buff,
    int size
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/rtpenc.h")]
public void ff_rtp_send_amr (
    LibAVFormat.FormatContext s1,
    uint8[] buff,
    int size
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/rtpenc.h")]
public void ff_rtp_send_mpegvideo (
    LibAVFormat.FormatContext s1,
    uint8[] buf1,
    int size
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/rtpenc.h")]
public void ff_rtp_send_xiph (
    LibAVFormat.FormatContext s1,
    uint8[] buff,
    int size
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/rtpenc.h")]
public void ff_rtp_send_vc2hq (
    LibAVFormat.FormatContext s1,
    uint8[] buffer,
    int size,
    int interlaced
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/rtpenc.h")]
public void ff_rtp_send_vp8 (
    LibAVFormat.FormatContext s1,
    uint8[] buff,
    int size
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/rtpenc.h")]
public void ff_rtp_send_vp9 (
    LibAVFormat.FormatContext s1,
    uint8[] buff,
    int size
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/rtpenc.h")]
public void ff_rtp_send_jpeg (
    LibAVFormat.FormatContext s1,
    uint8[] buff,
    int size
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/rtpenc.h")]
public uint8[] ff_h263_find_resync_marker_reverse (
    uint8[] start, // av_restrict
    uint8[] end // av_restrict
);

} // namespace LibAVFormat
