/***********************************************************
@brief TED Talks captions format decoder
@copyright 2012 Nicolas George
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

//  static const LibAVUtil.Option tedcaptions_options[] = {
//      { "start_time", "set the start time (offset) of the subtitles, in ms",
//        offsetof(TEDCaptionsDemuxer, start_time), AV_OPT_TYPE_INT64,
//        { .i64 = 15000 }, INT64_MIN, INT64_MAX,
//        AV_OPT_FLAG_SUBTITLE_PARAM | AV_OPT_FLAG_DECODING_PARAM },
//      { NULL },
//  }

[CCode (cname="tedcaptions_demuxer_class", cheader_filename="")]
public class TedCaptionsDemuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "tedcaptions_demuxer";
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
    //  .option = tedcaptions_options,
    [CCode (cname="version", cheader_filename="")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;
        }
    }
}

[CCode (cname="struct TEDCaptionsDemuxer", cheader_filename="")]
public struct TedCaptionsDemuxerPrivateData { }

[CCode (cname="ff_tedcaptions_demuxer", cheader_filename="")]
public class TedCaptionsDemuxer : AVInputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "tedcaptions";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "TED Talks captions";
        }
    }

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (TedCaptionsDemuxerPrivateData);
        }
    }
    //  .priv_class = tedcaptions_demuxer_class,
    [CCode (cname="tedcaptions_read_header", cheader_filename="")]
    public override int read_header (
        AVFormatContext format_context
    );

    [CCode (cname="tedcaptions_read_packet", cheader_filename="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="tedcaptions_read_close", cheader_filename="")]
    public override int read_close (
        AVFormatContext format_context
    );

    [CCode (cname="tedcaptions_read_probe", cheader_filename="")]
    public override int read_probe (
        AVProbeData format_context
    );

    [CCode (cname="tedcaptions_read_seek", cheader_filename="")]
    public override int read_seek2 (
        AVFormatContext format_context,
        int stream_index,
        int64 min_ts,
        int64 ts,
        int64 max_ts,
        int flags
    );
}

} // namespace LibAVFormat
