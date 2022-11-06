/***********************************************************
 raw FLAC muxer
 @copyright 2006-2009 Justin Ruggles

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

static const AVOption flacenc_options[] = {
    { "write_header", "Write the file header", offsetof(FlacMuxerContext, write_header), AV_OPT_TYPE_BOOL, {.i64 = 1}, 0, 1, AV_OPT_FLAG_ENCODING_PARAM },
    { NULL },
}

static const AVClass flac_muxer_class = {
    //  .class_name = "flac muxer",
    //  .item_name  = av_default_item_name,
    //  .option     = flacenc_options,
    //  .version    = LIBAVUTIL_VERSION_INT,
}

[CCode (cname="", cheader="")]
public class OutputFormat : AVOutputFormat ff_flac_muxer = {
    //  .name              = "flac",
    //  .long_name         = "raw FLAC",
    //  .priv_data_size    = sizeof(FlacMuxerContext),
    //  .mime_type         = "audio/x-flac",
    //  .extensions        = "flac",
    //  .audio_codec       = AV_CODEC_ID_FLAC,
    //  .video_codec       = AV_CODEC_ID_PNG,
    [CCode (cname="", cheader="")]
    public override int init (
        AVFormatContext format_context
    );              = flac_init,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );      = flac_write_header,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );      = flac_write_packet,
    [CCode (cname="", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    );     = flac_write_trailer,
    //  .flags             = AVFMT_NOTIMESTAMPS,
    //  .priv_class        = &flac_muxer_class,
}
