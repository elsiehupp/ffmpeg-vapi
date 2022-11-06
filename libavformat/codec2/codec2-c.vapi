/*
 * codec2 muxer and demuxers
 * Copyright (c) 2017 Tomas Härdin
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

//transcoding report2074.c2 to wav went from 7.391s to 5.322s with -frames_per_packet 1000 compared to default, same sha1sum
#define FRAMES_PER_PACKET \
    { "frames_per_packet", "Number of frames to read at a time. Higher = faster decoding, lower granularity", \
      offsetof(Codec2Context, frames_per_packet), AV_OPT_TYPE_INT, {.i64 = 1}, 1, INT_MAX, AV_OPT_FLAG_DECODING_PARAM}

static const AVOption codec2_options[] = {
    FRAMES_PER_PACKET,
    { NULL },
};

static const AVOption codec2raw_options[] = {
    AVPRIV_CODEC2_AVOPTIONS("codec2 mode [mandatory]", Codec2Context, -1, -1, AV_OPT_FLAG_DECODING_PARAM),
    FRAMES_PER_PACKET,
    { NULL },
};

static const AVClass codec2_mux_class = {
    //  .class_name = "codec2 muxer",
    //  .item_name  = av_default_item_name,
    //  .version    = LIBAVUTIL_VERSION_INT,
    //  .category   = AV_CLASS_CATEGORY_DEMUXER,
};

static const AVClass codec2_demux_class = {
    //  .class_name = "codec2 demuxer",
    //  .item_name  = av_default_item_name,
    //  .option     = codec2_options,
    //  .version    = LIBAVUTIL_VERSION_INT,
    //  .category   = AV_CLASS_CATEGORY_DEMUXER,
};

static const AVClass codec2raw_demux_class = {
    //  .class_name = "codec2raw demuxer",
    //  .item_name  = av_default_item_name,
    //  .option     = codec2raw_options,
    //  .version    = LIBAVUTIL_VERSION_INT,
    //  .category   = AV_CLASS_CATEGORY_DEMUXER,
};

#if CONFIG_CODEC2_DEMUXER
public class InputFormat : AVInputFormat ff_codec2_demuxer = {
    //  .name           = "codec2",
    //  .long_name      = "codec2 .c2 demuxer",
    //  .priv_data_size = sizeof(Codec2Context),
    //  .extensions     = "c2",
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );     = codec2_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = codec2_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = codec2_read_packet,
    [CCode (cname="", cheader="")]
    public override int read_seek (
        AVFormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );      = ff_pcm_read_seek,
    //  .flags          = AVFMT_GENERIC_INDEX,
    //  .raw_codec_id   = AV_CODEC_ID_CODEC2,
    //  .priv_class     = &codec2_demux_class,
};
#endif

#if CONFIG_CODEC2_MUXER
public class OutputFormat : AVOutputFormat ff_codec2_muxer = {
    //  .name           = "codec2",
    //  .long_name      = "codec2 .c2 muxer",
    //  .priv_data_size = sizeof(Codec2Context),
    //  .extensions     = "c2",
    //  .audio_codec    = AV_CODEC_ID_CODEC2,
    //  .video_codec    = AV_CODEC_ID_NONE,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );   = codec2_write_header,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );   = ff_raw_write_packet,
    //  .flags          = AVFMT_NOTIMESTAMPS,
    //  .priv_class     = &codec2_mux_class,
};
#endif

#if CONFIG_CODEC2RAW_DEMUXER
public class InputFormat : AVInputFormat ff_codec2raw_demuxer = {
    //  .name           = "codec2raw",
    //  .long_name      = "raw codec2 demuxer",
    //  .priv_data_size = sizeof(Codec2Context),
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = codec2raw_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = codec2_read_packet,
    [CCode (cname="", cheader="")]
    public override int read_seek (
        AVFormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );      = ff_pcm_read_seek,
    //  .flags          = AVFMT_GENERIC_INDEX,
    //  .raw_codec_id   = AV_CODEC_ID_CODEC2,
    //  .priv_class     = &codec2raw_demux_class,
};
#endif
