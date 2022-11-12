/***********************************************************
SBG (SBaGen) file format decoder
@copyright 2011 Nicolas George
***********************************************************/
/***********************************************************
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

namespace LibAVFormat {

//  static const LibAVUtil.Option sbg_options[] = {
//      { "sample_rate", "", offsetof(sbg_demuxer, sample_rate),
//        AV_OPT_TYPE_INT, { .i64 = 0 }, 0, INT_MAX,
//        AV_OPT_FLAG_DECODING_PARAM },
//      { "frame_size", "", offsetof(sbg_demuxer, frame_size),
//        AV_OPT_TYPE_INT, { .i64 = 0 }, 0, INT_MAX,
//        AV_OPT_FLAG_DECODING_PARAM },
//      { "max_file_size", "", offsetof(sbg_demuxer, max_file_size),
//        AV_OPT_TYPE_INT, { .i64 = 5000000 }, 0, INT_MAX,
//        AV_OPT_FLAG_DECODING_PARAM },
//      { NULL },
//  }

[CCode (cname="sbg_demuxer_class", cheader_filename="")]
public class SBGDemuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "sbg_demuxer";
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
    //  .option = sbg_options,
    [CCode (cname="version", cheader_filename="")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;
        }
    }
}

[CCode (cname="struct sbg_demuxer", cheader_filename="")]
public struct SBGDemuxerPrivateData { }

[CCode (cname="ff_sbg_demuxer", cheader_filename="")]
public class SBGDemuxer : AVInputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "sbg";
        }
    }
    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "SBaGen binaural beats script";
        }
    }
    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (SBGDemuxerPrivateData);
        }
    }
    [CCode (cname="sbg_read_probe", cheader_filename="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="sbg_read_header", cheader_filename="")]
    public override int read_header (
        AVFormatContext format_context
    );
    [CCode (cname="sbg_read_packet", cheader_filename="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    [CCode (cname="sbg_read_seek", cheader_filename="")]
    public override int read_seek (
        AVFormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );
    [CCode (cname="sbg_read_seek2", cheader_filename="")]
    public override int read_seek2 (
        AVFormatContext format_context,
        int stream_index,
        int64 min_ts,
        int64 ts,
        int64 max_ts,
        int flags
    );
    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "sbg";
        }
    }
    //  .priv_class = sbg_demuxer_class,
}

} // namespace LibAVFormat
