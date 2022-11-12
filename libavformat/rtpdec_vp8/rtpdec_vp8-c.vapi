/***********************************************************
RTP VP8 Depacketizer
@copyright 2010 Josh Allmann
@copyright 2012 Martin Storsjo
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
@file @brief RTP support for the VP8 payload
@author Josh Allmann <joshua.allmann@gmail.com>
@see http://tools.ietf.org/html/draft-ietf-payload-vp8-05
***********************************************************/

[CCode (cname="ff_vp8_dynamic_handler", cheader_filename="")]
public class VP8DynamicHandler : RTPDynamicProtocolHandler {
    [CCode (cname="enc_name", cheader_filename="")]
    public override string enc_name {
        public get {
            return "VP8";
        }
    }
    [CCode (cname="codec_type", cheader_filename="")]
    public override LibAVUtil.MediaType codec_type {
        public get {
            return AVMEDIA_TYPE_VIDEO;
        }
    }
    [CCode (cname="codec_id", cheader_filename="")]
    public override LibAVCodec.CodecID codec_id {
        public get {
            return LibAVCodec.CodecID.VP8;
        }
    }
    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (PayloadContext);
        }
    }
    [CCode (cname="vp8_init", cheader_filename="")]
    public override int init (
        AVFormatContext format_context,
        int st_index,
        PayloadContext priv_data
    );
    [CCode (cname="vp8_close_context", cheader_filename="")]
    public override void close (
        PayloadContext protocol_data
    );
    [CCode (cname="vp8_handle_packet", cheader_filename="")]
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
    [CCode (cname="vp8_need_keyframe", cheader_filename="")]
    public override int need_keyframe (
        PayloadContext context
    );
}

} // namespace LibAVFormat
