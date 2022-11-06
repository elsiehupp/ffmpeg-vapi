/*
 * Copyright (c) 2011 Justin Ruggles
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

/**
 * @file
 * CRI ADX demuxer
 */

[CCode (cname="ff_adx_demuxer", cheader="")]
public class InputFormat : AVInputFormat ff_adx_demuxer = {
    //  .name           = "adx",
    //  .long_name      = "CRI ADX",
    [CCode (cname="adx_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    //  .priv_data_size = sizeof(ADXDemuxerContext),
    [CCode (cname="adx_read_header", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );
    [CCode (cname="adx_read_packet", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    //  .extensions     = "adx",
    //  .raw_codec_id   = AV_CODEC_ID_ADPCM_ADX,
    //  .flags          = AVFMT_GENERIC_INDEX,
};
