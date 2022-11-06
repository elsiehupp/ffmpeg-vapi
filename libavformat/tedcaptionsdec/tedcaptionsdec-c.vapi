/*
 * TED Talks captions format decoder
 * Copyright (c) 2012 Nicolas George
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

static const AVOption tedcaptions_options[] = {
    { "start_time", "set the start time (offset) of the subtitles, in ms",
      offsetof(TEDCaptionsDemuxer, start_time), AV_OPT_TYPE_INT64,
      { .i64 = 15000 }, INT64_MIN, INT64_MAX,
      AV_OPT_FLAG_SUBTITLE_PARAM | AV_OPT_FLAG_DECODING_PARAM },
    { NULL },
};

static const AVClass tedcaptions_demuxer_class = {
    //  .class_name = "tedcaptions_demuxer",
    //  .item_name  = av_default_item_name,
    //  .option     = tedcaptions_options,
    //  .version    = LIBAVUTIL_VERSION_INT,
};

[CCode (cname="", cheader="")]
public class InputFormat : AVInputFormat ff_tedcaptions_demuxer = {
    //  .name           = "tedcaptions",
    //  .long_name      = "TED Talks captions",
    //  .priv_data_size = sizeof(TEDCaptionsDemuxer),
    //  .priv_class     = &tedcaptions_demuxer_class,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = tedcaptions_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = tedcaptions_read_packet,
    [CCode (cname="", cheader="")]
    public override int read_close (
        AVFormatContext format_context
    );     = tedcaptions_read_close,
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );     = tedcaptions_read_probe,
    [CCode (cname="", cheader="")]
    public override int read_seek2 (
        AVFormatContext format_context,
        int stream_index,
        int64 min_ts,
        int64 ts,
        int64 max_ts,
        int flags
    );     = tedcaptions_read_seek,
};
