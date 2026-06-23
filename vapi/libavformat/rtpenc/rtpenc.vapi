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

[CCode (cname="struct RTPMuxContext",cheader_filename="subprojects/ffmpeg/libformat/rtpenc.h")]
[Compact]
public class RTPMuxContext {
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/rtpenc.h")]
    public LibAVUtil.Class av_class;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/rtpenc.h")]
    public AVFormatContext ic;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/rtpenc.h")]
    public AVStream st;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/rtpenc.h")]
    public int payload_type;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/rtpenc.h")]
    public uint32 ssrc;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/rtpenc.h")]
    public string cname;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/rtpenc.h")]
    public int seq;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/rtpenc.h")]
    public uint32 timestamp;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/rtpenc.h")]
    public uint32 base_timestamp;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/rtpenc.h")]
    public uint32 cur_timestamp;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/rtpenc.h")]
    public int max_payload_size;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/rtpenc.h")]
    public int num_frames;

    /***********************************************************
    @brief Rtcp sender statistics
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/rtpenc.h")]
    public int64 last_rtcp_ntp_time;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/rtpenc.h")]
    public int64 first_rtcp_ntp_time;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/rtpenc.h")]
    public uint packet_count;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/rtpenc.h")]
    public uint octet_count;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/rtpenc.h")]
    public uint last_octet_count;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/rtpenc.h")]
    public int first_packet;

    /***********************************************************
    @brief Buffer for output
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/rtpenc.h")]
    public uint8[] buffer;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/rtpenc.h")]
    public uint8[] buf_ptr;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/rtpenc.h")]
    public int max_frames_per_packet;

    /***********************************************************
    @brief Number of bytes used for H.264 NAL length, if the MP4 syntax is used
    (1, 2 or 4)
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/rtpenc.h")]
    public int nal_length_size;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/rtpenc.h")]
    public int buffered_nals;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/rtpenc.h")]
    public int flags;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/rtpenc.h")]
    public uint frame_count;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/rptenc.h")]
[Flags]
public enum RTPEncoderFlags {
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/rptenc.h")]
    FF_RTP_FLAG_MP4A_LATM,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/rptenc.h")]
    FF_RTP_FLAG_RFC2190,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/rptenc.h")]
    FF_RTP_FLAG_SKIP_RTCP,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/rptenc.h")]
    FF_RTP_FLAG_H264_MODE0,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/rptenc.h")]
    FF_RTP_FLAG_SEND_BYE;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/rptenc.h")]
public define FF_RTP_FLAG_OPTS (
    context,
    fieldname
) {
    return {
        new LibAVUtil.FlagsOption () {
            "rtpflags",
            "RTP muxer flags",
            offsetof (
                context, fieldname
            ),
            {
                .i64 = 0
            },
            int.MIN,
            int.MAX, LibAVUtil.OptionFlags.ENCODING_PARAM,
            "rtpflags"
        },
        new LibAVUtil.ConstOption () {
            "latm",
            "Use MP4A-LATM packetization instead of MPEG4-GENERIC for AAC",
            0,
            {
                .i64 = FF_RTP_FLAG_MP4A_LATM
            },
            int.MIN,
            int.MAX, LibAVUtil.OptionFlags.ENCODING_PARAM,
            "rtpflags"
        },
        new LibAVUtil.ConstOption () {
            "rfc2190",
            "Use RFC 2190 packetization instead of RFC 4629 for H.263",
            0,
            {
                .i64 = FF_RTP_FLAG_RFC2190
            },
            int.MIN,
            int.MAX, LibAVUtil.OptionFlags.ENCODING_PARAM,
            "rtpflags"
        },
        new LibAVUtil.ConstOption () {
            "skip_rtcp",
            "Don't send RTCP sender reports",
            0,
            {
                .i64 = FF_RTP_FLAG_SKIP_RTCP
            },
            int.MIN,
            int.MAX, LibAVUtil.OptionFlags.ENCODING_PARAM,
            "rtpflags"
        },
        new LibAVUtil.ConstOption () {
            "h264_mode0",
            "Use mode 0 for H.264 in RTP",
            0,
            {
                .i64 = FF_RTP_FLAG_H264_MODE0
            },
            int.MIN,
            int.MAX, LibAVUtil.OptionFlags.ENCODING_PARAM,
            "rtpflags"
        },
        new LibAVUtil.ConstOption () {
            "send_bye",
            "Send RTCP BYE packets when finishing",
            0,
            {
                .i64 = FF_RTP_FLAG_SEND_BYE
            },
            int.MIN,
            int.MAX, LibAVUtil.OptionFlags.ENCODING_PARAM,
            "rtpflags"
        }

    };

}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/rtpenc.h")]
public void ff_rtp_send_data (
    AVFormatContext s1,
    uint8[] buf1,
    int len,
    int m
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/rtpenc.h")]
public void ff_rtp_send_h264_hevc (
    AVFormatContext s1,
    uint8[] buf1,
    int size
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/rtpenc.h")]
public void ff_rtp_send_h261 (
    AVFormatContext s1,
    uint8[] buf1,
    int size
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/rtpenc.h")]
public void ff_rtp_send_h263 (
    AVFormatContext s1,
    uint8[] buf1,
    int size
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/rtpenc.h")]
public void ff_rtp_send_h263_rfc2190 (
    AVFormatContext s1,
    uint8[] buf1,
    int size,
    uint8[] mb_info,
    int mb_info_size
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/rtpenc.h")]
public void ff_rtp_send_aac (
    AVFormatContext s1,
    uint8[] buff,
    int size
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/rtpenc.h")]
public void ff_rtp_send_latm (
    AVFormatContext s1,
    uint8[] buff,
    int size
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/rtpenc.h")]
public void ff_rtp_send_amr (
    AVFormatContext s1,
    uint8[] buff,
    int size
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/rtpenc.h")]
public void ff_rtp_send_mpegvideo (
    AVFormatContext s1,
    uint8[] buf1,
    int size
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/rtpenc.h")]
public void ff_rtp_send_xiph (
    AVFormatContext s1,
    uint8[] buff,
    int size
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/rtpenc.h")]
public void ff_rtp_send_vc2hq (
    AVFormatContext s1,
    uint8[] buffer,
    int size,
    int interlaced
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/rtpenc.h")]
public void ff_rtp_send_vp8 (
    AVFormatContext s1,
    uint8[] buff,
    int size
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/rtpenc.h")]
public void ff_rtp_send_vp9 (
    AVFormatContext s1,
    uint8[] buff,
    int size
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/rtpenc.h")]
public void ff_rtp_send_jpeg (
    AVFormatContext s1,
    uint8[] buff,
    int size
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libformat/rtpenc.h")]
public uint8[] ff_h263_find_resync_marker_reverse (
    uint8[] start, // av_restrict
    uint8[] end // av_restrict
);

} // namespace LibAVFormat
