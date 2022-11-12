/***********************************************************
@brief RTP MPEG2TS depacketizer
@copyright 2003 Fabrice Bellard
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

[CCode (cname="ff_mpegts_dynamic_handler", cheader_filename="")]
public class MpegTSDynamicHandler : RTPDynamicProtocolHandler {
    [CCode (cname="codec_type", cheader_filename="")]
    public override LibAVUtil.MediaType codec_type {
        public get {
            return AVMEDIA_TYPE_DATA;
        }
    }

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (PayloadContext);
        }
    }

    [CCode (cname="mpegts_handle_packet", cheader_filename="")]
    public override int parse_packet (
        AVFormatContext format_context,
        PayloadContext payload_context,
        AVStream st,
        LibAVCodec.Packet packet,
        uint32[] timestamp,
        uint8[] buffer,
        int len,
        uint16 seq,
        int flags
    );

    [CCode (cname="mpegts_init", cheader_filename="")]
    public override int init (
        AVFormatContext format_context,
        int st_index,
        PayloadContext priv_data
    );

    [CCode (cname="mpegts_close_context", cheader_filename="")]
    public override void close (
        PayloadContext protocol_data
    );
    //  .static_payload_id = 33,
}

} // namespace LibAVFormat
