/*
 * ACM demuxer
 * Copyright (c) 2015 Paul B Mahol
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

FF_RAW_DEMUXER_CLASS(acm)

[CCode (cname="ff_acm_demuxer", cheader="")]
public class InputFormat : AVInputFormat ff_acm_demuxer = {
    //  .name           = "acm",
    //  .long_name      = "Interplay ACM",
    [CCode (cname="acm_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="acm_read_header", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );
    [CCode (cname="ff_raw_read_partial_packet", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    //  .flags          = AVFMT_NOBINSEARCH | AVFMT_NOGENSEARCH | AVFMT_NO_BYTE_SEEK | AVFMT_NOTIMESTAMPS,
    //  .extensions     = "acm",
    //  .raw_codec_id   = AV_CODEC_ID_INTERPLAY_ACM,
    //  .priv_data_size = sizeof(FFRawDemuxerContext),
    //  .priv_class     = &acm_demuxer_class,
};
