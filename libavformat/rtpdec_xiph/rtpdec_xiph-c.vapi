/***********************************************************
@brief Xiph RTP Protocols
@copyright 2009 Colin McQuillian
@copyright 2010 Josh Allmann
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
@file @brief Xiph / RTP Code
@author Colin McQuillan <m.niloc@gmail.com>
@author Josh Allmann <joshua.allmann@gmail.com>
***********************************************************/

[CCode (cname="ff_theora_dynamic_handler", cheader_filename="")]
public class TheoraDynamicHandler : RTPDynamicProtocolHandler {
    [CCode (cname="enc_name", cheader_filename="")]
    public override string enc_name {
        public get {
            return "theora";
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
            return LibAVCodec.CodecID.THEORA;
        }
    }

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (PayloadContext);
        }
    }

    [CCode (cname="xiph_parse_sdp_line", cheader_filename="")]
    public override int parse_sdp_a_line (
        AVFormatContext format_context,
        int st_index,
        PayloadContext priv_data,
        string line
    );

    [CCode (cname="xiph_close_context", cheader_filename="")]
    public override void close (
        PayloadContext protocol_data
    );

    [CCode (cname="xiph_handle_packet", cheader_filename="")]
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

[CCode (cname="ff_vorbis_dynamic_handler", cheader_filename="")]
public class VorbisDynamicHandler : RTPDynamicProtocolHandler {
    [CCode (cname="enc_name", cheader_filename="")]
    public override string enc_name {
        public get {
            return "vorbis";
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
            return LibAVCodec.CodecID.VORBIS;
        }
    }

    [CCode (cname="need_parsing", cheader_filename="")]
    public override AVStreamParseType need_parsing {
        public get {
            return AVSTREAM_PARSE_HEADERS;
        }
    }

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (PayloadContext);
        }
    }

    [CCode (cname="xiph_parse_sdp_line", cheader_filename="")]
    public override int parse_sdp_a_line (
        AVFormatContext format_context,
        int st_index,
        PayloadContext priv_data,
        string line
    );

    [CCode (cname="xiph_close_context", cheader_filename="")]
    public override void close (
        PayloadContext protocol_data
    );

    [CCode (cname="xiph_handle_packet", cheader_filename="")]
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
