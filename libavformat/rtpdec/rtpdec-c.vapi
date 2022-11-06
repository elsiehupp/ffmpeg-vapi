/*
 * RTP input format
 * Copyright (c) 2002 Fabrice Bellard
 *
 * This file is part of FFmpeg.
 *
 * FFmpeg is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * FFmpeg is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with FFmpeg; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 */

static RTPDynamicProtocolHandler l24_dynamic_handler = {
    //  .enc_name   = "L24",
    //  .codec_type = AVMEDIA_TYPE_AUDIO,
    //  .codec_id   = AV_CODEC_ID_PCM_S24BE,
};

static RTPDynamicProtocolHandler gsm_dynamic_handler = {
    //  .enc_name   = "GSM",
    //  .codec_type = AVMEDIA_TYPE_AUDIO,
    //  .codec_id   = AV_CODEC_ID_GSM,
};

static RTPDynamicProtocolHandler realmedia_mp3_dynamic_handler = {
    //  .enc_name   = "X-MP3-draft-00",
    //  .codec_type = AVMEDIA_TYPE_AUDIO,
    //  .codec_id   = AV_CODEC_ID_MP3ADU,
};

static RTPDynamicProtocolHandler speex_dynamic_handler = {
    //  .enc_name   = "speex",
    //  .codec_type = AVMEDIA_TYPE_AUDIO,
    //  .codec_id   = AV_CODEC_ID_SPEEX,
};

static RTPDynamicProtocolHandler opus_dynamic_handler = {
    //  .enc_name   = "opus",
    //  .codec_type = AVMEDIA_TYPE_AUDIO,
    //  .codec_id   = AV_CODEC_ID_OPUS,
};

static RTPDynamicProtocolHandler t140_dynamic_handler = { /* RFC 4103 */
    //  .enc_name   = "t140",
    //  .codec_type = AVMEDIA_TYPE_SUBTITLE,
    //  .codec_id   = AV_CODEC_ID_TEXT,
};

extern RTPDynamicProtocolHandler ff_rdt_video_handler;
extern RTPDynamicProtocolHandler ff_rdt_audio_handler;
extern RTPDynamicProtocolHandler ff_rdt_live_video_handler;
extern RTPDynamicProtocolHandler ff_rdt_live_audio_handler;

static const RTPDynamicProtocolHandler *rtp_dynamic_protocol_handler_list[] = {
    /* rtp */
    &ff_ac3_dynamic_handler,
    &ff_amr_nb_dynamic_handler,
    &ff_amr_wb_dynamic_handler,
    &ff_dv_dynamic_handler,
    &ff_g726_16_dynamic_handler,
    &ff_g726_24_dynamic_handler,
    &ff_g726_32_dynamic_handler,
    &ff_g726_40_dynamic_handler,
    &ff_g726le_16_dynamic_handler,
    &ff_g726le_24_dynamic_handler,
    &ff_g726le_32_dynamic_handler,
    &ff_g726le_40_dynamic_handler,
    &ff_h261_dynamic_handler,
    &ff_h263_1998_dynamic_handler,
    &ff_h263_2000_dynamic_handler,
    &ff_h263_rfc2190_dynamic_handler,
    &ff_h264_dynamic_handler,
    &ff_hevc_dynamic_handler,
    &ff_ilbc_dynamic_handler,
    &ff_jpeg_dynamic_handler,
    &ff_mp4a_latm_dynamic_handler,
    &ff_mp4v_es_dynamic_handler,
    &ff_mpeg_audio_dynamic_handler,
    &ff_mpeg_audio_robust_dynamic_handler,
    &ff_mpeg_video_dynamic_handler,
    &ff_mpeg4_generic_dynamic_handler,
    &ff_mpegts_dynamic_handler,
    &ff_ms_rtp_asf_pfa_handler,
    &ff_ms_rtp_asf_pfv_handler,
    &ff_qcelp_dynamic_handler,
    &ff_qdm2_dynamic_handler,
    &ff_qt_rtp_aud_handler,
    &ff_qt_rtp_vid_handler,
    &ff_quicktime_rtp_aud_handler,
    &ff_quicktime_rtp_vid_handler,
    &ff_rfc4175_rtp_handler,
    &ff_svq3_dynamic_handler,
    &ff_theora_dynamic_handler,
    &ff_vc2hq_dynamic_handler,
    &ff_vorbis_dynamic_handler,
    &ff_vp8_dynamic_handler,
    &ff_vp9_dynamic_handler,
    &gsm_dynamic_handler,
    &l24_dynamic_handler,
    &opus_dynamic_handler,
    &realmedia_mp3_dynamic_handler,
    &speex_dynamic_handler,
    &t140_dynamic_handler,
    /* rdt */
    &ff_rdt_video_handler,
    &ff_rdt_audio_handler,
    &ff_rdt_live_video_handler,
    &ff_rdt_live_audio_handler,
    NULL,
};
