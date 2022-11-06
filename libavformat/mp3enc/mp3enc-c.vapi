/*
 * MP3 muxer
 * Copyright (c) 2003 Fabrice Bellard
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

static const AVOption options[] = {
    { "id3v2_version", "Select ID3v2 version to write. Currently 3 and 4 are supported.",
      offsetof(MP3Context, id3v2_version), AV_OPT_TYPE_INT, {.i64 = 4}, 0, 4, AV_OPT_FLAG_ENCODING_PARAM},
    { "write_id3v1", "Enable ID3v1 writing. ID3v1 tags are written in UTF-8 which may not be supported by most software.",
      offsetof(MP3Context, write_id3v1), AV_OPT_TYPE_BOOL, {.i64 = 0}, 0, 1, AV_OPT_FLAG_ENCODING_PARAM},
    { "write_xing",  "Write the Xing header containing file duration.",
      offsetof(MP3Context, write_xing),  AV_OPT_TYPE_BOOL, {.i64 = 1}, 0, 1, AV_OPT_FLAG_ENCODING_PARAM},
    { NULL },
};

static const AVClass mp3_muxer_class = {
    //  .class_name     = "MP3 muxer",
    //  .item_name      = av_default_item_name,
    //  .option         = options,
    //  .version        = LIBAVUTIL_VERSION_INT,
};

AVOutputFormat ff_mp3_muxer = {
    //  .name              = "mp3",
    //  .long_name         = "MP3 (MPEG audio layer 3)",
    //  .mime_type         = "audio/mpeg",
    //  .extensions        = "mp3",
    //  .priv_data_size    = sizeof(MP3Context),
    //  .audio_codec       = AV_CODEC_ID_MP3,
    //  .video_codec       = AV_CODEC_ID_PNG,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );      = mp3_write_header,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );      = mp3_write_packet,
    [CCode (cname="", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    );     = mp3_write_trailer,
    [CCode (cname="", cheader="")]
    public override int query_codec (
        LibAVCodec.CodecID id,
        int std_compliance
    );       = query_codec,
    //  .flags             = AVFMT_NOTIMESTAMPS,
    //  .priv_class        = &mp3_muxer_class,
};
