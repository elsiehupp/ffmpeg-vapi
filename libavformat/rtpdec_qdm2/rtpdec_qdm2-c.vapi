/***********************************************************
QDesign Music 2 (QDM2) payload for RTP
@copyright 2010 Ronald S. Bultje
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

/***********************************************************
@file @brief RTP support for the QDM2 payload (todo: wiki)
@author Ronald S. Bultje <rbultje@ronald.bitfreak.net>
***********************************************************/

[CCode (cname="ff_qdm2_dynamic_handler", cheader_filename="")]
public class QDM2DynamicHandler : RTPDynamicProtocolHandler {
    [CCode (cname="enc_name", cheader_filename="")]
    public override string enc_name {
        public get {
            return "X-QDM";
        }
    }
    [CCode (cname="codec_type", cheader_filename="")]
    public override LibAVUtil.MediaType codec_type {
        public get {
            return AVMEDIA_TYPE_AUDIO;
        }
    }
    [CCode (cname="codec_id", cheader_filename="")]
    public override LibAVCodec.CodecID codec_id {
        public get {
            return LibAVCodec.CodecID.NONE;
        }
    }
    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (PayloadContext);
        }
    }
    [CCode (cname="qdm2_parse_packet", cheader_filename="")]
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
}

} // namespace LibAVFormat
