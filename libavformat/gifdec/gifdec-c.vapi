/***********************************************************
GIF demuxer
@copyright 2012 Vitaliy E Sugrobov

This file is part of FFmpeg.

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

/**
@file
GIF demuxer.
***********************************************************/

static const AVOption options[] = {
    { "min_delay"    , "minimum valid delay between frames (in hundredths of second)", offsetof(GIFDemuxContext, min_delay)    , AV_OPT_TYPE_INT, {.i64 = GIF_MIN_DELAY}    , 0, 100 * 60, AV_OPT_FLAG_DECODING_PARAM },
    { "max_gif_delay", "maximum valid delay between frames (in hundredths of seconds)", offsetof(GIFDemuxContext, max_delay)   , AV_OPT_TYPE_INT, {.i64 = 65535}            , 0, 65535   , AV_OPT_FLAG_DECODING_PARAM },
    { "default_delay", "default delay between frames (in hundredths of second)"      , offsetof(GIFDemuxContext, default_delay), AV_OPT_TYPE_INT, {.i64 = GIF_DEFAULT_DELAY}, 0, 100 * 60, AV_OPT_FLAG_DECODING_PARAM },
    { "ignore_loop"  , "ignore loop setting (netscape extension)"                    , offsetof(GIFDemuxContext, ignore_loop)  , AV_OPT_TYPE_BOOL,{.i64 = 1}                , 0,        1, AV_OPT_FLAG_DECODING_PARAM },
    { NULL },
}

static const AVClass demuxer_class = {
    //  .class_name = "GIF demuxer",
    //  .item_name  = av_default_item_name,
    //  .option     = options,
    //  .version    = LIBAVUTIL_VERSION_INT,
    //  .category   = AV_CLASS_CATEGORY_DEMUXER,
}

[CCode (cname="", cheader="")]
public class InputFormat : AVInputFormat ff_gif_demuxer = {
    //  .name           = "gif",
    //  .long_name      = "CompuServe Graphics Interchange Format (GIF)",
    //  .priv_data_size = sizeof(GIFDemuxContext),
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );     = gif_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = gif_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = gif_read_packet,
    //  .flags          = AVFMT_GENERIC_INDEX,
    //  .priv_class     = &demuxer_class,
}
