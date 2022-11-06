/*
 * RAW AC-3 and E-AC-3 demuxer
 * Copyright (c) 2007 Justin Ruggles <justin.ruggles@gmail.com>
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

#if CONFIG_AC3_DEMUXER
static int ac3_probe(const AVProbeData *p)
{
    return ac3_eac3_probe(p, AV_CODEC_ID_AC3);
}

FF_RAW_DEMUXER_CLASS(ac3)
AVInputFormat ff_ac3_demuxer = {
    //  .name           = "ac3",
    //  .long_name      = "raw AC-3",
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );     = ac3_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = ff_raw_audio_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = ff_raw_read_partial_packet,
    //  .flags = AVFMT_GENERIC_INDEX,
    //  .extensions = "ac3",
    //  .raw_codec_id   = AV_CODEC_ID_AC3,
    //  .priv_data_size = sizeof(FFRawDemuxerContext),
    //  .priv_class     = &ac3_demuxer_class,
};
#endif

#if CONFIG_EAC3_DEMUXER
static int eac3_probe(const AVProbeData *p)
{
    return ac3_eac3_probe(p, AV_CODEC_ID_EAC3);
}

FF_RAW_DEMUXER_CLASS(eac3)
AVInputFormat ff_eac3_demuxer = {
    //  .name           = "eac3",
    //  .long_name      = "raw E-AC-3",
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );     = eac3_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = ff_raw_audio_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = ff_raw_read_partial_packet,
    //  .flags          = AVFMT_GENERIC_INDEX,
    //  .extensions     = "eac3",
    //  .raw_codec_id   = AV_CODEC_ID_EAC3,
    //  .priv_data_size = sizeof(FFRawDemuxerContext),
    //  .priv_class     = &eac3_demuxer_class,
};
#endif
