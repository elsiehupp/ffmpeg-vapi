/***********************************************************
@brief ASF compatible demuxer
@copyright 2000, 2001 Fabrice Bellard
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

[CCode (cname="asf_class",cheader_filename="subprojects/ffmpeg/libavformat/asfdec_f.c")]
public class ASFClass : LibAVUtil.Log.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/asfdec_f.c")]
    public override string class_name {
        public get {
            return "asf demuxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/asfdec_f.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="option")]
    public override LibAVUtil.Option[] options {
        public get {
            return {

            };

        }

    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/asfdec_f.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="struct ASFContext",cheader_filename="subprojects/ffmpeg/libavformat/asfdec_f.c")]
[Compact]
public class ASFDemuxerPrivateData { }

[CCode (cname="ff_asf_demuxer",cheader_filename="subprojects/ffmpeg/libavformat/asfdec_f.c")]
public class ASFDemuxer : LibAVFormat.InputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/asfdec_f.c")]
    public override string name {
        public get {
            return "asf";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/asfdec_f.c")]
    public override string long_name {
        public get {
            return "ASF (Advanced / Active Streaming Format)";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/asfdec_f.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (ASFDemuxerPrivateData);

        }

    }

    [CCode (cname="asf_probe",cheader_filename="subprojects/ffmpeg/libavformat/asfdec_f.c")]
    public override int read_probe (
        LibAVFormat.ProbeData format_context
    );

    [CCode (cname="asf_read_header",cheader_filename="subprojects/ffmpeg/libavformat/asfdec_f.c")]
    public override int read_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="asf_read_packet",cheader_filename="subprojects/ffmpeg/libavformat/asfdec_f.c")]
    public override int read_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="asf_read_close",cheader_filename="subprojects/ffmpeg/libavformat/asfdec_f.c")]
    public override int read_close (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="asf_read_seek",cheader_filename="subprojects/ffmpeg/libavformat/asfdec_f.c")]
    public override int read_seek (
        LibAVFormat.FormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="asf_read_pts",cheader_filename="subprojects/ffmpeg/libavformat/asfdec_f.c")]
    public override int64 read_timestamp (
        LibAVFormat.FormatContext format_context,
        int stream_index,
        int64[] pos,
        int64 pos_limit
    );

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/asfdec_f.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.NO_BINARY_SEARCH | AVFormatFlags1.NO_GENERIC_SEARCH;

        }

    }
    //  .priv_class = asf_class;
}

} // namespace LibAVFormat
