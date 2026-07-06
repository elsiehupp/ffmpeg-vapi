/***********************************************************
@brief RTP demuxer definitions
@copyright 2002 Fabrice Bellard
@copyright 2006 Ryan Martell <rdm4@martellventures.com>
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

[CCode (cname="struct RTPDemuxContext",cheader_filename="subprojects/ffmpeg/libavformat/rtpdec.h")]
[Compact]
public class RTPDemuxContext {
    [CCode (cname="")]
    public LibAVFormat.FormatContext ic;

    [CCode (cname="")]
    public LibAVFormat.Stream st;

    [CCode (cname="")]
    public int payload_type;

    [CCode (cname="")]
    public uint32 ssrc;

    [CCode (cname="")]
    public uint16 seq;

    [CCode (cname="")]
    public uint32 timestamp;

    [CCode (cname="")]
    public uint32 base_timestamp;

    [CCode (cname="")]
    public int64 unwrapped_timestamp;

    [CCode (cname="")]
    public int64 range_start_offset;

    [CCode (cname="")]
    public int max_payload_size;

    /***********************************************************
    used to send back RTCP RR
    ***********************************************************/
    [CCode (cname="")]
    public char hostname[256];

    [CCode (cname="")]
    public int srtp_enabled;

    [CCode (cname="")]
    public SRTPContext srtp;

    /***********************************************************
    @brief Statistics for this stream (used by RTCP receiver reports)
    ***********************************************************/
    [CCode (cname="")]
    public RTPStatistics statistics;

    /***********************************************************
    @brief Fields for packet reordering @{
    ***********************************************************/
    /***********************************************************
    @brief The return value of the actual parsing of the previous packet
    ***********************************************************/
    [CCode (cname="")]
    public int prev_ret;

    /***********************************************************
    @brief A sorted queue of buffered packets not yet returned
    ***********************************************************/
    [CCode (cname="")]
    public RTPPacket[] queue;

    /***********************************************************
    @brief The number of packets in queue
    ***********************************************************/
    [CCode (cname="")]
    public int queue_len;

    /***********************************************************
    @brief The size of queue, or 0 if reordering is disabled
    ***********************************************************/
    [CCode (cname="")]
    public int queue_size;
    /*@}*/

    /***********************************************************
    @brief Rtcp sender statistics receive
    ***********************************************************/
    [CCode (cname="")]
    public uint64 last_rtcp_ntp_time;

    [CCode (cname="")]
    public int64 last_rtcp_reception_time;

    [CCode (cname="")]
    public uint64 first_rtcp_ntp_time;

    [CCode (cname="")]
    public uint32 last_rtcp_timestamp;

    [CCode (cname="")]
    public int64 rtcp_ts_offset;

    /***********************************************************
    @brief Rtcp sender statistics
    ***********************************************************/
    [CCode (cname="")]
    public uint packet_count;

    [CCode (cname="")]
    public uint octet_count;

    [CCode (cname="")]
    public uint last_octet_count;

    [CCode (cname="")]
    public int64 last_feedback_time;

    /***********************************************************
    @brief Dynamic payload stuff
    ***********************************************************/
    [CCode (cname="")]
    public RTPDynamicProtocolHandler handler;

    [CCode (cname="")]
    public PayloadContext dynamic_protocol_context;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/rtpdec.h")]
    public RTPDemuxContext ff_rtp_parse_open (
        LibAVFormat.FormatContext s1,
        LibAVFormat.Stream st,
        int payload_type,
        int queue_size
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/rtpdec.h")]
    public void ff_rtp_parse_set_dynamic_protocol (
        RTPDemuxContext rtp_demux_context,
        PayloadContext payload_context,
        RTPDynamicProtocolHandler handler
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/rtpdec.h")]
    public void ff_rtp_parse_set_crypto (
        RTPDemuxContext rtp_demux_context,
        string suite,
        string params
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/rtpdec.h")]
    public int ff_rtp_parse_packet (
        RTPDemuxContext rtp_demux_context,
        LibAVCodec.Packet packet,
        out uint8[] buffer,
        int len
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/rtpdec.h")]
    public void ff_rtp_parse_close (
        RTPDemuxContext rtp_demux_context
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/rtpdec.h")]
    public int64 ff_rtp_queued_packet_time (
        RTPDemuxContext rtp_demux_context
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/rtpdec.h")]
    public void ff_rtp_reset_packet_queue (
        RTPDemuxContext rtp_demux_context
    );

    /***********************************************************
    @brief Some rtp servers assume client is dead if they don't hear from them...
    so we send a Receiver Report to the provided URLContext or LibAVFormat.IOContext
    (we don't have access to the rtcp handle from here)
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/rtpdec.h")]
    public int ff_rtp_check_and_send_back_rr (
        RTPDemuxContext rtp_demux_context,
        URLContext fd,
        LibAVFormat.IOContext avio,
        int count
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/rtpdec.h")]
    public int ff_rtp_send_rtcp_feedback (
        RTPDemuxContext rtp_demux_context,
        URLContext fd,
        LibAVFormat.IOContext avio
    );

}

} // namespace LibAVFormat
