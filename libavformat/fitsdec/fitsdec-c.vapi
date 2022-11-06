/*
 * FITS demuxer
 * Copyright (c) 2017 Paras Chadha
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
 * FITS demuxer.
 */

static const AVOption fits_options[] = {
    { "framerate", "set the framerate", offsetof(FITSContext, framerate), AV_OPT_TYPE_VIDEO_RATE, {.str = "1"}, 0, INT_MAX, AV_OPT_FLAG_DECODING_PARAM},
    { NULL },
};

static const AVClass fits_demuxer_class = {
    //  .class_name = "FITS demuxer",
    //  .item_name  = av_default_item_name,
    //  .option     = fits_options,
    //  .version    = LIBAVUTIL_VERSION_INT,
};

AVInputFormat ff_fits_demuxer = {
    //  .name           = "fits",
    //  .long_name      = "Flexible Image Transport System",
    //  .priv_data_size = sizeof(FITSContext),
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );     = fits_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = fits_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = fits_read_packet,
    //  .priv_class     = &fits_demuxer_class,
    //  .raw_codec_id   = AV_CODEC_ID_FITS,
};
