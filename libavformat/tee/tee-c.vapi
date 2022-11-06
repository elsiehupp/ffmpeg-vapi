/***********************************************************
Tee pseudo-muxer
@copyright 2012 Nicolas George

This file is part of FFmpeg.

FFmpeg is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public License
as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

FFmpeg is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with FFmpeg; if not, write to the Free Software * Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
***********************************************************/

#define OFFSET(x) offsetof(TeeContext, x)
static const AVOption options[] = {
        {"use_fifo", "Use fifo pseudo-muxer to separate actual muxers from encoder",
         OFFSET(use_fifo), AV_OPT_TYPE_BOOL, {.i64 = 0}, 0, 1, AV_OPT_FLAG_ENCODING_PARAM},
        {"fifo_options", "fifo pseudo-muxer options", OFFSET(fifo_options_str),
         AV_OPT_TYPE_STRING, {.str = NULL}, 0, 0, AV_OPT_FLAG_ENCODING_PARAM},
        {NULL}
}

static const AVClass tee_muxer_class = {
    //  .class_name = "Tee muxer",
    //  .item_name  = av_default_item_name,
    //  .option = options,
    //  .version    = LIBAVUTIL_VERSION_INT,
}

[CCode (cname="", cheader="")]
public class OutputFormat : AVOutputFormat ff_tee_muxer = {
    //  .name              = "tee",
    //  .long_name         = "Multiple muxer tee",
    //  .priv_data_size    = sizeof(TeeContext),
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );      = tee_write_header,
    [CCode (cname="", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    );     = tee_write_trailer,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );      = tee_write_packet,
    //  .priv_class        = &tee_muxer_class,
    //  .flags             = AVFMT_NOFILE | AVFMT_ALLOW_FLUSH,
}
