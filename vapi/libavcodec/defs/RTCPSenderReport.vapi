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
namespace LibAVCodec {
using LibAVUtil;

/***********************************************************
@file @ingroup libavc
Misc types and constants that do not belong anywhere else.
***********************************************************/

/***********************************************************
@brief RTCP SR (Sender Report) information

The received sender report information for an RTSP
stream, exposed as AV_PKT_DATA_RTCP_SR side data.
***********************************************************/
[CCode (cname="struct AVRTCPSenderReport",cheader_filename="subprojects/ffmpeg/libavcodec/defs.h")]
[Compact]
public class RTCPSenderReport {
    /***********************************************************
    @brief Synchronization source identifier
    ***********************************************************/
    [CCode (cname="")]
    public uint32 ssrc;

    /***********************************************************
    @brief NTP time when the report was sent
    ***********************************************************/
    [CCode (cname="")]
    public uint64 ntp_timestamp;

    /***********************************************************
    @brief RTP time when the report was sent
    ***********************************************************/
    [CCode (cname="")]
    public uint32 rtp_timestamp;

    /***********************************************************
    @brief Total number of packets sent
    ***********************************************************/
    [CCode (cname="")]
    public uint32 sender_nb_packets;

    /***********************************************************
    @brief Total number of bytes sent (excluding headers or padding)
    ***********************************************************/
    [CCode (cname="")]
    public uint32 sender_nb_bytes;
}

} // namespace LibAVCodec
