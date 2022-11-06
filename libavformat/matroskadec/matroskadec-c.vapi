/*
 * Matroska file demuxer
 * Copyright (c) 2003-2008 The FFmpeg Project
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
 * Matroska file demuxer
 * @author Ronald Bultje <rbultje@ronald.bitfreak.net>
 * @author with a little help from Moritz Bunkus <moritz@bunkus.org>
 * @author totally reworked by Aurelien Jacobs <aurel@gnuage.org>
 * @see specs available on the Matroska project page: http://www.matroska.org/
 */

#define OFFSET(x) offsetof(MatroskaDemuxContext, x)
static const AVOption options[] = {
    { "live", "flag indicating that the input is a live file that only has the headers.", OFFSET(is_live), AV_OPT_TYPE_BOOL, {.i64 = 0}, 0, 1, AV_OPT_FLAG_DECODING_PARAM },
    { "bandwidth", "bandwidth of this stream to be specified in the DASH manifest.", OFFSET(bandwidth), AV_OPT_TYPE_INT, {.i64 = 0}, 0, INT_MAX, AV_OPT_FLAG_DECODING_PARAM },
    { NULL },
};

static const AVClass webm_dash_class = {
    //  .class_name = "WebM DASH Manifest demuxer",
    //  .item_name  = av_default_item_name,
    //  .option     = options,
    //  .version    = LIBAVUTIL_VERSION_INT,
};

[CCode (cname="", cheader="")]
public class InputFormat : AVInputFormat ff_matroska_demuxer = {
    //  .name           = "matroska,webm",
    //  .long_name      = "Matroska / WebM",
    //  .extensions     = "mkv,mk3d,mka,mks",
    //  .priv_data_size = sizeof(MatroskaDemuxContext),
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );     = matroska_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = matroska_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = matroska_read_packet,
    [CCode (cname="", cheader="")]
    public override int read_close (
        AVFormatContext format_context
    );     = matroska_read_close,
    [CCode (cname="", cheader="")]
    public override int read_seek (
        AVFormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );      = matroska_read_seek,
    //  .mime_type      = "audio/webm,audio/x-matroska,video/webm,video/x-matroska"
};

[CCode (cname="", cheader="")]
public class InputFormat : AVInputFormat ff_webm_dash_manifest_demuxer = {
    //  .name           = "webm_dash_manifest",
    //  .long_name      = "WebM DASH Manifest",
    //  .priv_data_size = sizeof(MatroskaDemuxContext),
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = webm_dash_manifest_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = webm_dash_manifest_read_packet,
    [CCode (cname="", cheader="")]
    public override int read_close (
        AVFormatContext format_context
    );     = matroska_read_close,
    //  .priv_class     = &webm_dash_class,
};
