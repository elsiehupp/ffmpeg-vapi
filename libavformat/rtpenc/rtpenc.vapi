/***********************************************************
RTP muxer definitions
@copyright 2002 Fabrice Bellard
***********************************************************/
/***********************************************************
This file is part of FFmpeg.

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

public struct RTPMuxContext {
    public LibAVUtil.Class av_class;
    public AVFormatContext ic;
    public AVStream st;
    public int payload_type;
    public uint32 ssrc;
    public string cname;
    public int seq;
    public uint32 timestamp;
    public uint32 base_timestamp;
    public uint32 cur_timestamp;
    public int max_payload_size;
    public int num_frames;

    /***********************************************************
    rtcp sender statistics
    ***********************************************************/
    public int64 last_rtcp_ntp_time;
    public int64 first_rtcp_ntp_time;
    public uint packet_count;
    public uint octet_count;
    public uint last_octet_count;
    public int first_packet;

    /***********************************************************
    buffer for output
    ***********************************************************/
    public uint8[] buffer;
    public uint8 *buf_ptr;

    public int max_frames_per_packet;

    /***********************************************************
    Number of bytes used for H.264 NAL length, if the MP4 syntax is used
    (1, 2 or 4)
    ***********************************************************/
    public int nal_length_size;
    public int buffered_nals;

    public int flags;

    public uint frame_count;
}

[Flags]
public enum RTPEncoderFlags {
    FF_RTP_FLAG_MP4A_LATM,
    FF_RTP_FLAG_RFC2190,
    FF_RTP_FLAG_SKIP_RTCP,
    FF_RTP_FLAG_H264_MODE0,
    FF_RTP_FLAG_SEND_BYE,
}

//  #define FF_RTP_FLAG_OPTS (context, fieldname)
//      { "rtpflags", "RTP muxer flags", offsetof (context, fieldname), AV_OPT_TYPE_FLAGS, {.i64 = 0}, INT_MIN, int.MAX, AV_OPT_FLAG_ENCODING_PARAM, "rtpflags" },
//      { "latm", "Use MP4A-LATM packetization instead of MPEG4-GENERIC for AAC", 0, AV_OPT_TYPE_CONST, {.i64 = FF_RTP_FLAG_MP4A_LATM}, INT_MIN, int.MAX, AV_OPT_FLAG_ENCODING_PARAM, "rtpflags" },
//      { "rfc2190", "Use RFC 2190 packetization instead of RFC 4629 for H.263", 0, AV_OPT_TYPE_CONST, {.i64 = FF_RTP_FLAG_RFC2190}, INT_MIN, int.MAX, AV_OPT_FLAG_ENCODING_PARAM, "rtpflags" },
//      { "skip_rtcp", "Don't send RTCP sender reports", 0, AV_OPT_TYPE_CONST, {.i64 = FF_RTP_FLAG_SKIP_RTCP}, INT_MIN, int.MAX, AV_OPT_FLAG_ENCODING_PARAM, "rtpflags" },
//      { "h264_mode0", "Use mode 0 for H.264 in RTP", 0, AV_OPT_TYPE_CONST, {.i64 = FF_RTP_FLAG_H264_MODE0}, INT_MIN, int.MAX, AV_OPT_FLAG_ENCODING_PARAM, "rtpflags" },
//      { "send_bye", "Send RTCP BYE packets when finishing", 0, AV_OPT_TYPE_CONST, {.i64 = FF_RTP_FLAG_SEND_BYE}, INT_MIN, int.MAX, AV_OPT_FLAG_ENCODING_PARAM, "rtpflags" }

public void ff_rtp_send_data (
    AVFormatContext s1,
    uint8[] buf1,
    int len,
    int m
);

public void ff_rtp_send_h264_hevc (
    AVFormatContext s1,
    uint8[] buf1,
    int size
);

public void ff_rtp_send_h261 (
    AVFormatContext s1,
    uint8[] buf1,
    int size
);

public void ff_rtp_send_h263 (
    AVFormatContext s1,
    uint8[] buf1,
    int size
);

public void ff_rtp_send_h263_rfc2190 (
    AVFormatContext s1,
    uint8[] buf1,
    int size,
    uint8[] mb_info,
    int mb_info_size
);

public void ff_rtp_send_aac (
    AVFormatContext s1,
    uint8[] buff,
    int size
);

public void ff_rtp_send_latm (
    AVFormatContext s1,
    uint8[] buff,
    int size
);

public void ff_rtp_send_amr (
    AVFormatContext s1,
    uint8[] buff,
    int size
);

public void ff_rtp_send_mpegvideo (
    AVFormatContext s1,
    uint8[] buf1,
    int size
);

public void ff_rtp_send_xiph (
    AVFormatContext s1,
    uint8[] buff,
    int size
);

public void ff_rtp_send_vc2hq (
    AVFormatContext s1,
    uint8[] buffer,
    int size,
    int interlaced
);

public void ff_rtp_send_vp8 (
    AVFormatContext s1,
    uint8[] buff,
    int size
);

public void ff_rtp_send_vp9 (
    AVFormatContext s1,
    uint8[] buff,
    int size
);

public void ff_rtp_send_jpeg (
    AVFormatContext s1,
    uint8[] buff,
    int size
);

public uint8[] ff_h263_find_resync_marker_reverse (
    uint8[] start, // av_restrict
    uint8[] end // av_restrict
);

} // namespace LibAVFormat
