/***********************************************************
@copyright 2012 Nicolas George
***********************************************************/
/***********************************************************
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
along with FFmpeg; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
***********************************************************/

//  #define OFFSET(x) offsetof(ConcatContext, x)
//  #define DEC AV_OPT_FLAG_DECODING_PARAM
//  static const AVOption options[] = {
//      { "safe", "enable safe mode",
//        OFFSET(safe), AV_OPT_TYPE_BOOL, {.i64 = 1}, -1, 1, DEC },
//      { "auto_convert", "automatically convert bitstream format",
//        OFFSET(auto_convert), AV_OPT_TYPE_BOOL, {.i64 = 1}, 0, 1, DEC },
//      { "segment_time_metadata", "output file segment start time and duration as packet metadata",
//        OFFSET(segment_time_metadata), AV_OPT_TYPE_BOOL, {.i64 = 0}, 0, 1, DEC },
//      { NULL }
//  }

[CCode (cname="concat_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "concat demuxer";
        }
    }
    [CCode (cname="item_name", cheader="")]
    public override string item_name (
        void *class_context
    ) {
        return av_default_item_name (
            class_context
        );
    }
    [CCode (cname="options", cheader="")]
    public override AVOption[] option { public get; }
    [CCode (cname="version", cheader="")]
    public override int version {
        public get {
            return LIBAVUTIL_VERSION_INT;
        }
    }
}

[CCode (cname="ff_concat_demuxer", cheader="")]
public class InputDemuxer : AVInputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "concat";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "Virtual concatenation script";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (ConcatContext);
        }
    }
    [CCode (cname="concat_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="concat_read_header", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );
    [CCode (cname="concat_read_packet", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    [CCode (cname="concat_read_close", cheader="")]
    public override int read_close (
        AVFormatContext format_context
    );
    [CCode (cname="concat_seek", cheader="")]
    public override int read_seek2 (
        AVFormatContext format_context,
        int stream_index,
        int64 min_ts,
        int64 ts,
        int64 max_ts,
        int flags
    );
    //  .priv_class = concat_class,
}
