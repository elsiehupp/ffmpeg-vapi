/***********************************************************
@brief Common code for the RTP depacketization of MPEG-1/2 formats.
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

[CCode (cname="ff_mpeg_audio_dynamic_handler", cheader_filename="")]
public class MpegAudioDynamicHandler : RTPDynamicProtocolHandler {
    [CCode (cname="codec_type", cheader_filename="")]
    public override LibAVUtil.MediaType codec_type {
        public get {
            return AVMEDIA_TYPE_AUDIO;
        }
    }

    [CCode (cname="codec_id", cheader_filename="")]
    public override LibAVCodec.CodecID codec_id {
        public get {
            return LibAVCodec.CodecID.MP3;
        }
    }

    [CCode (cname="need_parsing", cheader_filename="")]
    public override AVStreamParseType need_parsing {
        public get {
            return AVSTREAM_PARSE_FULL;
        }
    }

    [CCode (cname="mpeg_parse_packet", cheader_filename="")]
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
    //  .static_payload_id = 14,
}

[CCode (cname="ff_mpeg_video_dynamic_handler", cheader_filename="")]
public class MpegVideoDynamicHandler : RTPDynamicProtocolHandler {
    [CCode (cname="codec_type", cheader_filename="")]
    public override LibAVUtil.MediaType codec_type {
        public get {
            return AVMEDIA_TYPE_VIDEO;
        }
    }

    [CCode (cname="codec_id", cheader_filename="")]
    public override LibAVCodec.CodecID codec_id {
        public get {
            return LibAVCodec.CodecID.MPEG2VIDEO;
        }
    }

    [CCode (cname="need_parsing", cheader_filename="")]
    public override AVStreamParseType need_parsing {
        public get {
            return AVSTREAM_PARSE_FULL;
        }
    }

    [CCode (cname="mpeg_parse_packet", cheader_filename="")]
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
    //  .static_payload_id = 32,
}

} // namespace LibAVFormat
