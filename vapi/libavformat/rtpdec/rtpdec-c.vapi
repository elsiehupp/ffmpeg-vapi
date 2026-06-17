/***********************************************************
@brief RTP input format
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


[CCode (cname="l24_dynamic_handler", cheader_filename="")]
public class L24DynamicHandler : RTPDynamicProtocolHandler {
    [CCode (cname="enc_name", cheader_filename="")]
    public override string enc_name {
        public get {
            return "L24";
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
            return LibAVCodec.CodecID.PCM_S24BE;
        }
    }
}


[CCode (cname="gsm_dynamic_handler", cheader_filename="")]
public class GSMDynamicHandler : RTPDynamicProtocolHandler {
    [CCode (cname="enc_name", cheader_filename="")]
    public override string enc_name {
        public get {
            return "GSM";
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
            return LibAVCodec.CodecID.GSM;
        }
    }
}


[CCode (cname="realmedia_mp3_dynamic_handler", cheader_filename="")]
public class RealMediaMP3DynamicHandler : RTPDynamicProtocolHandler {
    [CCode (cname="enc_name", cheader_filename="")]
    public override string enc_name {
        public get {
            return "X-MP3-draft-00";
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
            return LibAVCodec.CodecID.MP3ADU;
        }
    }
}


[CCode (cname="speex_dynamic_handler", cheader_filename="")]
public class SpeexDynamicHandler : RTPDynamicProtocolHandler {
    [CCode (cname="enc_name", cheader_filename="")]
    public override string enc_name {
        public get {
            return "speex";
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
            return LibAVCodec.CodecID.SPEEX;
        }
    }
}


[CCode (cname="opus_dynamic_handler", cheader_filename="")]
public class OpusDynamicHandler : RTPDynamicProtocolHandler {
    [CCode (cname="enc_name", cheader_filename="")]
    public override string enc_name {
        public get {
            return "opus";
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
            return LibAVCodec.CodecID.OPUS;
        }
    }
}


[CCode (cname="t140_dynamic_handler", cheader_filename="")]
public class T140DynamicHandler : RTPDynamicProtocolHandler {
    /***********************************************************
    @brief RFC 4103
    ***********************************************************/
    [CCode (cname="enc_name", cheader_filename="")]
    public override string enc_name {
        public get {
            return "t140";
        }
    }

    [CCode (cname="codec_type", cheader_filename="")]
    public override LibAVUtil.MediaType codec_type {
        public get {
            return AVMEDIA_TYPE_SUBTITLE;
        }
    }

    [CCode (cname="codec_id", cheader_filename="")]
    public override LibAVCodec.CodecID codec_id {
        public get {
            return LibAVCodec.CodecID.TEXT;
        }
    }
}

//  extern RTPDynamicProtocolHandler ff_rdt_video_handler;
//  extern RTPDynamicProtocolHandler ff_rdt_audio_handler;
//  extern RTPDynamicProtocolHandler ff_rdt_live_video_handler;
//  extern RTPDynamicProtocolHandler ff_rdt_live_audio_handler;

//  static const RTPDynamicProtocolHandler *rtp_dynamic_protocol_handler_list[] = {
//      /***********************************************************
//      rtp
//      ***********************************************************/
//      &ff_ac3_dynamic_handler,
//      &ff_amr_nb_dynamic_handler,
//      &ff_amr_wb_dynamic_handler,
//      &ff_dv_dynamic_handler,
//      &ff_g726_16_dynamic_handler,
//      &ff_g726_24_dynamic_handler,
//      &ff_g726_32_dynamic_handler,
//      &ff_g726_40_dynamic_handler,
//      &ff_g726le_16_dynamic_handler,
//      &ff_g726le_24_dynamic_handler,
//      &ff_g726le_32_dynamic_handler,
//      &ff_g726le_40_dynamic_handler,
//      &ff_h261_dynamic_handler,
//      &ff_h263_1998_dynamic_handler,
//      &ff_h263_2000_dynamic_handler,
//      &ff_h263_rfc2190_dynamic_handler,
//      &ff_h264_dynamic_handler,
//      &ff_hevc_dynamic_handler,
//      &ff_ilbc_dynamic_handler,
//      &ff_jpeg_dynamic_handler,
//      &ff_mp4a_latm_dynamic_handler,
//      &ff_mp4v_es_dynamic_handler,
//      &ff_mpeg_audio_dynamic_handler,
//      &ff_mpeg_audio_robust_dynamic_handler,
//      &ff_mpeg_video_dynamic_handler,
//      &ff_mpeg4_generic_dynamic_handler,
//      &ff_mpegts_dynamic_handler,
//      &ff_ms_rtp_asf_pfa_handler,
//      &ff_ms_rtp_asf_pfv_handler,
//      &ff_qcelp_dynamic_handler,
//      &ff_qdm2_dynamic_handler,
//      &ff_qt_rtp_aud_handler,
//      &ff_qt_rtp_vid_handler,
//      &ff_quicktime_rtp_aud_handler,
//      &ff_quicktime_rtp_vid_handler,
//      &ff_rfc4175_rtp_handler,
//      &ff_svq3_dynamic_handler,
//      &ff_theora_dynamic_handler,
//      &ff_vc2hq_dynamic_handler,
//      &ff_vorbis_dynamic_handler,
//      &ff_vp8_dynamic_handler,
//      &ff_vp9_dynamic_handler,
//      &gsm_dynamic_handler,
//      &l24_dynamic_handler,
//      &opus_dynamic_handler,
//      &realmedia_mp3_dynamic_handler,
//      &speex_dynamic_handler,
//      &t140_dynamic_handler,
//      /***********************************************************
//      rdt
//      ***********************************************************/
//      &ff_rdt_video_handler,
//      &ff_rdt_audio_handler,
//      &ff_rdt_live_video_handler,
//      &ff_rdt_live_audio_handler,
//      NULL,
//  }

} // namespace LibAVFormat
