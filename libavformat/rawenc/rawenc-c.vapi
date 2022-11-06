/*
 * RAW muxers
 * Copyright (c) 2001 Fabrice Bellard
 * Copyright (c) 2005 Alex Beregszaszi
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

#if CONFIG_AC3_MUXER
public class OutputFormat : AVOutputFormat ff_ac3_muxer = {
    //  .name              = "ac3",
    //  .long_name         = "raw AC-3",
    //  .mime_type         = "audio/x-ac3",
    //  .extensions        = "ac3",
    //  .audio_codec       = AV_CODEC_ID_AC3,
    //  .video_codec       = AV_CODEC_ID_NONE,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );      = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );      = ff_raw_write_packet,
    //  .flags             = AVFMT_NOTIMESTAMPS,
};
#endif

#if CONFIG_ADX_MUXER

[CCode (cname="", cheader="")]
public class OutputFormat : AVOutputFormat ff_adx_muxer = {
    //  .name              = "adx",
    //  .long_name         = "CRI ADX",
    //  .extensions        = "adx",
    //  .audio_codec       = AV_CODEC_ID_ADPCM_ADX,
    //  .video_codec       = AV_CODEC_ID_NONE,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );      = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );      = ff_raw_write_packet,
    [CCode (cname="", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    );     = adx_write_trailer,
    //  .flags             = AVFMT_NOTIMESTAMPS,
};
#endif

#if CONFIG_APTX_MUXER
public class OutputFormat : AVOutputFormat ff_aptx_muxer = {
    //  .name              = "aptx",
    //  .long_name         = "raw aptX (Audio Processing Technology for Bluetooth)",
    //  .extensions        = "aptx",
    //  .audio_codec       = AV_CODEC_ID_APTX,
    //  .video_codec       = AV_CODEC_ID_NONE,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );      = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );      = ff_raw_write_packet,
    //  .flags             = AVFMT_NOTIMESTAMPS,
};
#endif

#if CONFIG_APTX_HD_MUXER
public class OutputFormat : AVOutputFormat ff_aptx_hd_muxer = {
    //  .name              = "aptx_hd",
    //  .long_name         = "raw aptX HD (Audio Processing Technology for Bluetooth)",
    //  .extensions        = "aptxhd",
    //  .audio_codec       = AV_CODEC_ID_APTX_HD,
    //  .video_codec       = AV_CODEC_ID_NONE,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );      = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );      = ff_raw_write_packet,
    //  .flags             = AVFMT_NOTIMESTAMPS,
};
#endif

#if CONFIG_AVS2_MUXER
public class OutputFormat : AVOutputFormat ff_avs2_muxer = {
    //  .name              = "avs2",
    //  .long_name         = "raw AVS2-P2/IEEE1857.4 video",
    //  .extensions        = "avs,avs2",
    //  .audio_codec       = AV_CODEC_ID_NONE,
    //  .video_codec       = AV_CODEC_ID_AVS2,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );      = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );      = ff_raw_write_packet,
    //  .flags             = AVFMT_NOTIMESTAMPS,
};
#endif

#if CONFIG_CAVSVIDEO_MUXER
public class OutputFormat : AVOutputFormat ff_cavsvideo_muxer = {
    //  .name              = "cavsvideo",
    //  .long_name         = "raw Chinese AVS (Audio Video Standard) video",
    //  .extensions        = "cavs",
    //  .audio_codec       = AV_CODEC_ID_NONE,
    //  .video_codec       = AV_CODEC_ID_CAVS,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );      = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );      = ff_raw_write_packet,
    //  .flags             = AVFMT_NOTIMESTAMPS,
};
#endif

#if CONFIG_CODEC2RAW_MUXER
public class OutputFormat : AVOutputFormat ff_codec2raw_muxer = {
    //  .name              = "codec2raw",
    //  .long_name         = "raw codec2 muxer",
    //  .audio_codec       = AV_CODEC_ID_CODEC2,
    //  .video_codec       = AV_CODEC_ID_NONE,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );      = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );      = ff_raw_write_packet,
    //  .flags             = AVFMT_NOTIMESTAMPS,
};
#endif


#if CONFIG_DATA_MUXER
public class OutputFormat : AVOutputFormat ff_data_muxer = {
    //  .name              = "data",
    //  .long_name         = "raw data",
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );      = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );      = ff_raw_write_packet,
    //  .flags             = AVFMT_NOTIMESTAMPS,
};
#endif

#if CONFIG_DIRAC_MUXER
public class OutputFormat : AVOutputFormat ff_dirac_muxer = {
    //  .name              = "dirac",
    //  .long_name         = "raw Dirac",
    //  .extensions        = "drc,vc2",
    //  .audio_codec       = AV_CODEC_ID_NONE,
    //  .video_codec       = AV_CODEC_ID_DIRAC,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );      = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );      = ff_raw_write_packet,
    //  .flags             = AVFMT_NOTIMESTAMPS,
};
#endif

#if CONFIG_DNXHD_MUXER
public class OutputFormat : AVOutputFormat ff_dnxhd_muxer = {
    //  .name              = "dnxhd",
    //  .long_name         = "raw DNxHD (SMPTE VC-3)",
    //  .extensions        = "dnxhd,dnxhr",
    //  .audio_codec       = AV_CODEC_ID_NONE,
    //  .video_codec       = AV_CODEC_ID_DNXHD,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );      = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );      = ff_raw_write_packet,
    //  .flags             = AVFMT_NOTIMESTAMPS,
};
#endif

#if CONFIG_DTS_MUXER
public class OutputFormat : AVOutputFormat ff_dts_muxer = {
    //  .name              = "dts",
    //  .long_name         = "raw DTS",
    //  .mime_type         = "audio/x-dca",
    //  .extensions        = "dts",
    //  .audio_codec       = AV_CODEC_ID_DTS,
    //  .video_codec       = AV_CODEC_ID_NONE,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );      = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );      = ff_raw_write_packet,
    //  .flags             = AVFMT_NOTIMESTAMPS,
};
#endif

#if CONFIG_EAC3_MUXER
public class OutputFormat : AVOutputFormat ff_eac3_muxer = {
    //  .name              = "eac3",
    //  .long_name         = "raw E-AC-3",
    //  .mime_type         = "audio/x-eac3",
    //  .extensions        = "eac3",
    //  .audio_codec       = AV_CODEC_ID_EAC3,
    //  .video_codec       = AV_CODEC_ID_NONE,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );      = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );      = ff_raw_write_packet,
    //  .flags             = AVFMT_NOTIMESTAMPS,
};
#endif

#if CONFIG_G722_MUXER
public class OutputFormat : AVOutputFormat ff_g722_muxer = {
    //  .name              = "g722",
    //  .long_name         = "raw G.722",
    //  .mime_type         = "audio/G722",
    //  .extensions        = "g722",
    //  .audio_codec       = AV_CODEC_ID_ADPCM_G722,
    //  .video_codec       = AV_CODEC_ID_NONE,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );      = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );      = ff_raw_write_packet,
    //  .flags             = AVFMT_NOTIMESTAMPS,
};
#endif

#if CONFIG_G723_1_MUXER
public class OutputFormat : AVOutputFormat ff_g723_1_muxer = {
    //  .name              = "g723_1",
    //  .long_name         = "raw G.723.1",
    //  .mime_type         = "audio/g723",
    //  .extensions        = "tco,rco",
    //  .audio_codec       = AV_CODEC_ID_G723_1,
    //  .video_codec       = AV_CODEC_ID_NONE,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );      = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );      = ff_raw_write_packet,
    //  .flags             = AVFMT_NOTIMESTAMPS,
};
#endif

#if CONFIG_G726_MUXER
public class OutputFormat : AVOutputFormat ff_g726_muxer = {
    //  .name              = "g726",
    //  .long_name         = "raw big-endian G.726 (\"left-justified\")",
    //  .audio_codec       = AV_CODEC_ID_ADPCM_G726,
    //  .video_codec       = AV_CODEC_ID_NONE,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );      = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );      = ff_raw_write_packet,
    //  .flags             = AVFMT_NOTIMESTAMPS,
};
#endif

#if CONFIG_G726LE_MUXER
public class OutputFormat : AVOutputFormat ff_g726le_muxer = {
    //  .name              = "g726le",
    //  .long_name         = "raw little-endian G.726 (\"right-justified\")",
    //  .audio_codec       = AV_CODEC_ID_ADPCM_G726LE,
    //  .video_codec       = AV_CODEC_ID_NONE,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );      = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );      = ff_raw_write_packet,
    //  .flags             = AVFMT_NOTIMESTAMPS,
};
#endif

#if CONFIG_GSM_MUXER
public class OutputFormat : AVOutputFormat ff_gsm_muxer = {
    //  .name              = "gsm",
    //  .long_name         = "raw GSM",
    //  .mime_type         = "audio/x-gsm",
    //  .extensions        = "gsm",
    //  .audio_codec       = AV_CODEC_ID_GSM,
    //  .video_codec       = AV_CODEC_ID_NONE,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );      = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );      = ff_raw_write_packet,
    //  .flags             = AVFMT_NOTIMESTAMPS,
};
#endif

#if CONFIG_H261_MUXER
public class OutputFormat : AVOutputFormat ff_h261_muxer = {
    //  .name              = "h261",
    //  .long_name         = "raw H.261",
    //  .mime_type         = "video/x-h261",
    //  .extensions        = "h261",
    //  .audio_codec       = AV_CODEC_ID_NONE,
    //  .video_codec       = AV_CODEC_ID_H261,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );      = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );      = ff_raw_write_packet,
    //  .flags             = AVFMT_NOTIMESTAMPS,
};
#endif

#if CONFIG_H263_MUXER
public class OutputFormat : AVOutputFormat ff_h263_muxer = {
    //  .name              = "h263",
    //  .long_name         = "raw H.263",
    //  .mime_type         = "video/x-h263",
    //  .extensions        = "h263",
    //  .audio_codec       = AV_CODEC_ID_NONE,
    //  .video_codec       = AV_CODEC_ID_H263,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );      = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );      = ff_raw_write_packet,
    //  .flags             = AVFMT_NOTIMESTAMPS,
};
#endif

#if CONFIG_H264_MUXER
static int h264_check_bitstream(struct AVFormatContext *s, const AVPacket *pkt)
{
    AVStream *st = s->streams[0];
    if (pkt->size >= 5 && AV_RB32(pkt->data) != 0x0000001 &&
                          AV_RB24(pkt->data) != 0x000001)
        return ff_stream_add_bitstream_filter(st, "h264_mp4toannexb", NULL);
    return 1;
}

[CCode (cname="", cheader="")]
public class OutputFormat : AVOutputFormat ff_h264_muxer = {
    //  .name              = "h264",
    //  .long_name         = "raw H.264 video",
    //  .extensions        = "h264,264",
    //  .audio_codec       = AV_CODEC_ID_NONE,
    //  .video_codec       = AV_CODEC_ID_H264,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );      = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );      = ff_raw_write_packet,
    [CCode (cname="", cheader="")]
    public override int check_bitstream (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );   = h264_check_bitstream,
    //  .flags             = AVFMT_NOTIMESTAMPS,
};
#endif

#if CONFIG_HEVC_MUXER
static int hevc_check_bitstream(struct AVFormatContext *s, const AVPacket *pkt)
{
    AVStream *st = s->streams[0];
    if (pkt->size >= 5 && AV_RB32(pkt->data) != 0x0000001 &&
                          AV_RB24(pkt->data) != 0x000001)
        return ff_stream_add_bitstream_filter(st, "hevc_mp4toannexb", NULL);
    return 1;
}

[CCode (cname="", cheader="")]
public class OutputFormat : AVOutputFormat ff_hevc_muxer = {
    //  .name              = "hevc",
    //  .long_name         = "raw HEVC video",
    //  .extensions        = "hevc,h265,265",
    //  .audio_codec       = AV_CODEC_ID_NONE,
    //  .video_codec       = AV_CODEC_ID_HEVC,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );      = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );      = ff_raw_write_packet,
    [CCode (cname="", cheader="")]
    public override int check_bitstream (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );   = hevc_check_bitstream,
    //  .flags             = AVFMT_NOTIMESTAMPS,
};
#endif

#if CONFIG_M4V_MUXER
public class OutputFormat : AVOutputFormat ff_m4v_muxer = {
    //  .name              = "m4v",
    //  .long_name         = "raw MPEG-4 video",
    //  .extensions        = "m4v",
    //  .audio_codec       = AV_CODEC_ID_NONE,
    //  .video_codec       = AV_CODEC_ID_MPEG4,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );      = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );      = ff_raw_write_packet,
    //  .flags             = AVFMT_NOTIMESTAMPS,
};
#endif

#if CONFIG_MJPEG_MUXER
public class OutputFormat : AVOutputFormat ff_mjpeg_muxer = {
    //  .name              = "mjpeg",
    //  .long_name         = "raw MJPEG video",
    //  .mime_type         = "video/x-mjpeg",
    //  .extensions        = "mjpg,mjpeg",
    //  .audio_codec       = AV_CODEC_ID_NONE,
    //  .video_codec       = AV_CODEC_ID_MJPEG,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );      = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );      = ff_raw_write_packet,
    //  .flags             = AVFMT_NOTIMESTAMPS,
};
#endif

#if CONFIG_SINGLEJPEG_MUXER
public class OutputFormat : AVOutputFormat ff_singlejpeg_muxer = {
    //  .name              = "singlejpeg",
    //  .long_name         = "JPEG single image",
    //  .mime_type         = "image/jpeg",
    //  .audio_codec       = AV_CODEC_ID_NONE,
    //  .video_codec       = AV_CODEC_ID_MJPEG,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );      = ff_raw_write_packet,
    //  .flags             = AVFMT_NOTIMESTAMPS,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );      = force_one_stream,
};
#endif

#if CONFIG_MLP_MUXER
public class OutputFormat : AVOutputFormat ff_mlp_muxer = {
    //  .name              = "mlp",
    //  .long_name         = "raw MLP",
    //  .extensions        = "mlp",
    //  .audio_codec       = AV_CODEC_ID_MLP,
    //  .video_codec       = AV_CODEC_ID_NONE,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );      = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );      = ff_raw_write_packet,
    //  .flags             = AVFMT_NOTIMESTAMPS,
};
#endif

#if CONFIG_MP2_MUXER
public class OutputFormat : AVOutputFormat ff_mp2_muxer = {
    //  .name              = "mp2",
    //  .long_name         = "MP2 (MPEG audio layer 2)",
    //  .mime_type         = "audio/mpeg",
    //  .extensions        = "mp2,m2a,mpa",
    //  .audio_codec       = AV_CODEC_ID_MP2,
    //  .video_codec       = AV_CODEC_ID_NONE,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );      = ff_raw_write_packet,
    //  .flags             = AVFMT_NOTIMESTAMPS,
};
#endif

#if CONFIG_MPEG1VIDEO_MUXER
public class OutputFormat : AVOutputFormat ff_mpeg1video_muxer = {
    //  .name              = "mpeg1video",
    //  .long_name         = "raw MPEG-1 video",
    //  .mime_type         = "video/mpeg",
    //  .extensions        = "mpg,mpeg,m1v",
    //  .audio_codec       = AV_CODEC_ID_NONE,
    //  .video_codec       = AV_CODEC_ID_MPEG1VIDEO,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );      = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );      = ff_raw_write_packet,
    //  .flags             = AVFMT_NOTIMESTAMPS,
};
#endif

#if CONFIG_MPEG2VIDEO_MUXER
public class OutputFormat : AVOutputFormat ff_mpeg2video_muxer = {
    //  .name              = "mpeg2video",
    //  .long_name         = "raw MPEG-2 video",
    //  .extensions        = "m2v",
    //  .audio_codec       = AV_CODEC_ID_NONE,
    //  .video_codec       = AV_CODEC_ID_MPEG2VIDEO,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );      = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );      = ff_raw_write_packet,
    //  .flags             = AVFMT_NOTIMESTAMPS,
};
#endif

#if CONFIG_RAWVIDEO_MUXER
public class OutputFormat : AVOutputFormat ff_rawvideo_muxer = {
    //  .name              = "rawvideo",
    //  .long_name         = "raw video",
    //  .extensions        = "yuv,rgb",
    //  .audio_codec       = AV_CODEC_ID_NONE,
    //  .video_codec       = AV_CODEC_ID_RAWVIDEO,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );      = ff_raw_write_packet,
    //  .flags             = AVFMT_NOTIMESTAMPS,
};
#endif

#if CONFIG_SBC_MUXER
public class OutputFormat : AVOutputFormat ff_sbc_muxer = {
    //  .name              = "sbc",
    //  .long_name         = "raw SBC",
    //  .mime_type         = "audio/x-sbc",
    //  .extensions        = "sbc,msbc",
    //  .audio_codec       = AV_CODEC_ID_SBC,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );      = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );      = ff_raw_write_packet,
    //  .flags             = AVFMT_NOTIMESTAMPS,
};
#endif

#if CONFIG_TRUEHD_MUXER
public class OutputFormat : AVOutputFormat ff_truehd_muxer = {
    //  .name              = "truehd",
    //  .long_name         = "raw TrueHD",
    //  .extensions        = "thd",
    //  .audio_codec       = AV_CODEC_ID_TRUEHD,
    //  .video_codec       = AV_CODEC_ID_NONE,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );      = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );      = ff_raw_write_packet,
    //  .flags             = AVFMT_NOTIMESTAMPS,
};
#endif

#if CONFIG_VC1_MUXER
public class OutputFormat : AVOutputFormat ff_vc1_muxer = {
    //  .name              = "vc1",
    //  .long_name         = "raw VC-1 video",
    //  .extensions        = "vc1",
    //  .audio_codec       = AV_CODEC_ID_NONE,
    //  .video_codec       = AV_CODEC_ID_VC1,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );      = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );      = ff_raw_write_packet,
    //  .flags             = AVFMT_NOTIMESTAMPS,
};
#endif
