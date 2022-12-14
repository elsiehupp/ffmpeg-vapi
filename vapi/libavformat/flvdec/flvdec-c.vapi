/***********************************************************
@brief FLV demuxer
@copyright 2003 The FFmpeg Project

This demuxer will generate a 1 byte extradata for VP6F content.
It is composed of:
- upper 4 bits: difference between encoded width and visible width
- lower 4 bits: difference between encoded height and visible height
***********************************************************/
/***********************************************************
@brief This file is part of FFmpeg.

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

namespace LibAVFormat {

[CCode (cname="struct FLVContext", cheader_filename="")]
public struct FLVDemuxerClassPrivateData { }

//  #define OFFSET (x) offsetof (FLVContext, x)
//  #define VD AV_OPT_FLAG_VIDEO_PARAM | AV_OPT_FLAG_DECODING_PARAM
//  static const LibAVUtil.Option options[] = {
//      { "flv_metadata", "Allocate streams according to the onMetaData array", OFFSET (trust_metadata), AV_OPT_TYPE_BOOL, { .i64 = 0 }, 0, 1, VD },
//      { "flv_full_metadata", "Dump full metadata of the onMetadata", OFFSET (dump_full_metadata), AV_OPT_TYPE_BOOL, { .i64 = 0 }, 0, 1, VD },
//      { "flv_ignore_prevtag", "Ignore the Size of previous tag", OFFSET (trust_datasize), AV_OPT_TYPE_BOOL, { .i64 = 0 }, 0, 1, VD },
//      { "missing_streams", "", OFFSET (missing_streams), AV_OPT_TYPE_INT, { .i64 = 0 }, 0, 0xFF, VD | AV_OPT_FLAG_EXPORT | AV_OPT_FLAG_READONLY },
//      { NULL }
//  }

[CCode (cname="flv_class", cheader_filename="")]
public class FLVDemuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "flvdec";
        }
    }

    [CCode (cname="item_name", cheader_filename="")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options", cheader_filename="")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version", cheader_filename="")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;
        }
    }
}

[CCode (cname="ff_flv_demuxer", cheader_filename="")]
public class FLVDemuxer : AVInputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "flv";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "FLV (Flash Video)";
        }
    }

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (FLVDemuxerClassPrivateData);
        }
    }

    [CCode (cname="flv_probe", cheader_filename="")]
    public override int read_probe (
        AVProbeData format_context
    );

    [CCode (cname="flv_read_header", cheader_filename="")]
    public override int read_header (
        AVFormatContext format_context
    );

    [CCode (cname="flv_read_packet", cheader_filename="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="flv_read_seek", cheader_filename="")]
    public override int read_seek (
        AVFormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="flv_read_close", cheader_filename="")]
    public override int read_close (
        AVFormatContext format_context
    );

    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "flv";
        }
    }
    //  .priv_class = flv_class,
}

[CCode (cname="live_flv_class", cheader_filename="")]
public class LiveFLVDemuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "live_flvdec";
        }
    }

    [CCode (cname="item_name", cheader_filename="")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options", cheader_filename="")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version", cheader_filename="")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;
        }
    }
}

[CCode (cname="ff_live_flv_demuxer", cheader_filename="")]
public class LiveFLVDemuxer : AVInputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "live_flv";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "live RTMP FLV (Flash Video)";
        }
    }

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (FLVDemuxerClassPrivateData);
        }
    }

    [CCode (cname="live_flv_probe", cheader_filename="")]
    public override int read_probe (
        AVProbeData format_context
    );

    [CCode (cname="flv_read_header", cheader_filename="")]
    public override int read_header (
        AVFormatContext format_context
    );

    [CCode (cname="flv_read_packet", cheader_filename="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="flv_read_seek", cheader_filename="")]
    public override int read_seek (
        AVFormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="flv_read_close", cheader_filename="")]
    public override int read_close (
        AVFormatContext format_context
    );

    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "flv";
        }
    }
    //  .priv_class = live_flv_class,
    [CCode (cname="flags", cheader_filename="")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_TS_DISCONT;
        }
    }
}

[CCode (cname="kux_class", cheader_filename="")]
public class KUXDemuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "kuxdec";
        }
    }

    [CCode (cname="item_name", cheader_filename="")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options", cheader_filename="")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version", cheader_filename="")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;
        }
    }
}

[CCode (cname="ff_kux_demuxer", cheader_filename="")]
public class KUXDemuxer : AVInputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "kux";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "KUX (YouKu)";
        }
    }

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (FLVDemuxerClassPrivateData);
        }
    }

    [CCode (cname="kux_probe", cheader_filename="")]
    public override int read_probe (
        AVProbeData format_context
    );

    [CCode (cname="flv_read_header", cheader_filename="")]
    public override int read_header (
        AVFormatContext format_context
    );

    [CCode (cname="flv_read_packet", cheader_filename="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="flv_read_seek", cheader_filename="")]
    public override int read_seek (
        AVFormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="flv_read_close", cheader_filename="")]
    public override int read_close (
        AVFormatContext format_context
    );

    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "kux";
        }
    }
    //  .priv_class = kux_class,
}

} // namespace LibAVFormat
