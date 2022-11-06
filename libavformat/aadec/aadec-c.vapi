/*
 * Audible AA demuxer
 * Copyright (c) 2015 Vesselin Bontchev
 *
 * Header parsing is borrowed from https://github.com/jteeuwen/audible project.
 * Copyright (c) 2001-2014, Jim Teeuwen
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice, this
 *    list of conditions and the following disclaimer.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 * ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

static const AVClass aa_class = {
    //  .class_name = "aa",
    //  .item_name  = av_default_item_name,
    //  .option     = aa_options,
    //  .version    = LIBAVUTIL_VERSION_INT,
};

[CCode (cname="ff_aa_demuxer", cheader="")]
public class InputFormat : AVInputFormat ff_aa_demuxer = {
    //  .name           = "aa",
    //  .long_name      = "Audible AA format files",
    //  .priv_class     = &aa_class,
    //  .priv_data_size = sizeof(AADemuxContext),
    //  .extensions     = "aa",
    [CCode (cname="aa_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="aa_read_header", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );
    [CCode (cname="aa_read_packet", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    [CCode (cname="aa_read_seek", cheader="")]
    public override int read_seek (
        AVFormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );
    [CCode (cname="aa_read_close", cheader="")]
    public override int read_close (
        AVFormatContext format_context
    );
    //  .flags          = AVFMT_NO_BYTE_SEEK | AVFMT_NOGENSEARCH,
};
