/*
 * RAW demuxers
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

#define OFFSET(x) offsetof(FFRawVideoDemuxerContext, x)
#define DEC AV_OPT_FLAG_DECODING_PARAM
const AVOption ff_rawvideo_options[] = {
    { "framerate", "", OFFSET(framerate), AV_OPT_TYPE_VIDEO_RATE, {.str = "25"}, 0, INT_MAX, DEC},
    { "raw_packet_size", "", OFFSET(raw_packet_size), AV_OPT_TYPE_INT, {.i64 = RAW_PACKET_SIZE }, 1, INT_MAX, DEC},
    { NULL },
};
#undef OFFSET
#define OFFSET(x) offsetof(FFRawDemuxerContext, x)
const AVOption ff_raw_options[] = {
    { "raw_packet_size", "", OFFSET(raw_packet_size), AV_OPT_TYPE_INT, {.i64 = RAW_PACKET_SIZE }, 1, INT_MAX, DEC},
    { NULL },
};

#if CONFIG_DATA_DEMUXER
FF_RAW_DEMUXER_CLASS(raw_data)

[CCode (cname="", cheader="")]
public class InputFormat : AVInputFormat ff_data_demuxer = {
    //  .name           = "data",
    //  .long_name      = "raw data",
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = ff_raw_data_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = ff_raw_read_partial_packet,
    //  .raw_codec_id   = AV_CODEC_ID_NONE,
    //  .flags          = AVFMT_NOTIMESTAMPS,
    //  .priv_data_size = sizeof(FFRawDemuxerContext),\
    //  .priv_class     = &raw_data_demuxer_class,\
};
#endif
