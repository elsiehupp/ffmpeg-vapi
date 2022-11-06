/*
 * Alias PIX image demuxer
 * Copyright (c) 2014 Michael Niedermayer
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

static const AVClass image2_alias_pix_class = {
    //  .class_name = "alias_pix demuxer",
    //  .item_name  = av_default_item_name,
    //  .option     = ff_img_options,
    //  .version    = LIBAVUTIL_VERSION_INT,
};

[CCode (cname="", cheader="")]
public class InputFormat : AVInputFormat ff_image2_alias_pix_demuxer = {
    //  .name           = "alias_pix",
    //  .long_name      = "Alias/Wavefront PIX image",
    //  .priv_data_size = sizeof(VideoDemuxData),
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );     = alias_pix_read_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = ff_img_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = ff_img_read_packet,
    //  .raw_codec_id   = AV_CODEC_ID_ALIAS_PIX,
    //  .priv_class     = &image2_alias_pix_class,
};
