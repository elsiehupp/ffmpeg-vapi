/***********************************************************
@brief Dynamic Adaptive Streaming over HTTP demux
@copyright 2017 samsamsam@o2.pl based on HLS demux
@copyright 2017 Steven Liu
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

//  #define OFFSET(x) offsetof(DASHContext, x)
//  #define FLAGS AV_OPT_FLAG_DECODING_PARAM
//  static const LibAVUtil.Option dash_options[] = {
//      {"allowed_extensions", "List of file extensions that dash is allowed to access"
//          OFFSET(allowed_extensions), AV_OPT_TYPE_STRING,
//          {.str = "aac,m4a,m4s,m4v,mov,mp4,webm"},
//          INT_MIN, INT_MAX, FLAGS},
//      {NULL}
//  }

[CCode (cname="dash_class", cheader_filename="")]
public class DashDemuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "dash";
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
    //  .option = dash_options,
    [CCode (cname="version", cheader_filename="")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;
        }
    }
}

[CCode (cname="struct DASHContext", cheader_filename="")]
public struct DashDemuxerPrivateData { }

[CCode (cname="ff_dash_demuxer", cheader_filename="")]
public class DashDemuxer : AVInputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "dash";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "Dynamic Adaptive Streaming over HTTP";
        }
    }
    //  .priv_class = dash_class,
    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (DashDemuxerPrivateData);
        }
    }

    [CCode (cname="dash_probe", cheader_filename="")]
    public override int read_probe (
        AVProbeData format_context
    );

    [CCode (cname="dash_read_header", cheader_filename="")]
    public override int read_header (
        AVFormatContext format_context
    );

    [CCode (cname="dash_read_packet", cheader_filename="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="dash_close", cheader_filename="")]
    public override int read_close (
        AVFormatContext format_context
    );

    [CCode (cname="dash_read_seek", cheader_filename="")]
    public override int read_seek (
        AVFormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="flags", cheader_filename="")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_NO_BYTE_SEEK;
        }
    }
}

} // namespace LibAVFormat
