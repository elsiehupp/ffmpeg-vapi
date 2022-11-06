/*
 * MLP and TrueHD demuxer
 * Copyright (c) 2001 Fabrice Bellard
 * Copyright (c) 2005 Alex Beregszaszi
 * Copyright (c) 2015 Carl Eugen Hoyos
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

#if CONFIG_MLP_DEMUXER
FF_RAW_DEMUXER_CLASS(mlp)
public class InputFormat : AVInputFormat ff_mlp_demuxer = {
    //  .name           = "mlp",
    //  .long_name      = "raw MLP",
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );     = mlp_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = ff_raw_audio_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = ff_raw_read_partial_packet,
    //  .flags          = AVFMT_GENERIC_INDEX | AVFMT_NOTIMESTAMPS,
    //  .extensions     = "mlp",
    //  .raw_codec_id   = AV_CODEC_ID_MLP,
    //  .priv_data_size = sizeof(FFRawDemuxerContext),
    //  .priv_class     = &mlp_demuxer_class,
};
#endif

#if CONFIG_TRUEHD_DEMUXER
FF_RAW_DEMUXER_CLASS(truehd)
public class InputFormat : AVInputFormat ff_truehd_demuxer = {
    //  .name           = "truehd",
    //  .long_name      = "raw TrueHD",
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );     = thd_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = ff_raw_audio_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = ff_raw_read_partial_packet,
    //  .flags          = AVFMT_GENERIC_INDEX | AVFMT_NOTIMESTAMPS,
    //  .extensions     = "thd",
    //  .raw_codec_id   = AV_CODEC_ID_TRUEHD,
    //  .priv_data_size = sizeof(FFRawDemuxerContext),
    //  .priv_class     = &truehd_demuxer_class,
};
#endif

