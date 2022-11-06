/*
 * Windows Television (WTV) muxer
 * Copyright (c) 2011 Zhentan Feng <spyfeng at gmail dot com>
 * Copyright (c) 2011 Peter Ross <pross@xvid.org>
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
 * Windows Television (WTV) demuxer
 * @author Zhentan Feng <spyfeng at gmail dot com>
 */

AVOutputFormat ff_wtv_muxer = {
    //  .name           = "wtv",
    //  .long_name      = "Windows Television (WTV)",
    //  .extensions     = "wtv",
    //  .priv_data_size = sizeof(WtvContext),
    //  .audio_codec    = AV_CODEC_ID_AC3,
    //  .video_codec    = AV_CODEC_ID_MPEG2VIDEO,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );   = write_header,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );   = write_packet,
    [CCode (cname="", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    );  = write_trailer,
    //  .codec_tag      = (const AVCodecTag* const []){ ff_codec_bmp_tags,
                                                    ff_codec_wav_tags, 0 },
};
