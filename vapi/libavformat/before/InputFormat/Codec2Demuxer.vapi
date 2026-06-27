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
/***********************************************************
@brief Codec2 muxer and demuxers
@copyright 2017 Tomas Härdin
***********************************************************/
/***********************************************************
@brief Transcoding report2074.c2 to wav went from 7.391s to 5.322s
with -frames_per_packet 1000 compared to default, same sha1sum
***********************************************************/

#if CONFIG_CODEC2_DEMUXER

[CCode (cname="ff_codec2_demuxer",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
public class Codec2Demuxer : LibAVFormat.InputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override string name {
        public get {
            return "codec2";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override string long_name {
        public get {
            return "codec2 .c2 demuxer";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (Codec2Context);

        }

    }

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override string extensions {
        public get {
            return "c2";

        }

    }

    [CCode (cname="codec2_probe",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override int read_probe (
        LibAVFormat.ProbeData format_context
    );

    [CCode (cname="codec2_read_header",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override int read_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="codec2_read_packet",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override int read_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="ff_pcm_read_seek",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override int read_seek (
        LibAVFormat.FormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.USE_GENERIC_INDEX;

        }

    }

    [CCode (cname="raw_codec_id",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.CODEC2;

        }

    }
    //  .priv_class = codec2_demux_class;
}
#endif

#if CONFIG_CODEC2RAW_DEMUXER

[CCode (cname="ff_codec2raw_demuxer",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
public class Codec2RawDemuxer : LibAVFormat.InputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override string name {
        public get {
            return "codec2raw";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override string long_name {
        public get {
            return "raw codec2 demuxer";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (Codec2Context);

        }

    }

    [CCode (cname="codec2raw_read_header",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override int read_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="codec2_read_packet",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override int read_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="ff_pcm_read_seek",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override int read_seek (
        LibAVFormat.FormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.USE_GENERIC_INDEX;

        }

    }

    [CCode (cname="raw_codec_id",cheader_filename="subprojects/ffmpeg/libavformat/codec2.c")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.CODEC2;

        }

    }
    //  .priv_class = codec2raw_demux_class;
}
#endif

} // namespace LibAVFormat
