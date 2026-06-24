/***********************************************************
@brief WAV demuxer
@copyright 2001, 2002 Fabrice Bellard

Sony Wave64 demuxer
RF64 demuxer
@copyright 2009 Daniel Verkamp
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

#if CONFIG_WAV_DEMUXER
static const LibAVUtil.Option demux_options[] = {
    new LibAVUtil.BoolOption () {
        name = "ignore_length",
        short_help_text = "Ignore length",
        offset = offsetof (
            WAVDemuxContext,
            ignore_length
        ),
        default_value = 0,
        minimum_value = 0,
        maximum_value = 1,
        option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
    },
    {
        NULL
    }

};

[CCode (cname="wav_demuxer_class",cheader_filename="subprojects/ffmpeg/libavformat/wavdec.c")]
public class WAVDemuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/wavdec.c")]
    public override string class_name {
        public get {
            return "WAV demuxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/wavdec.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }
    //  .option = demux_options,

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/wavdec.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_wav_demuxer",cheader_filename="subprojects/ffmpeg/libavformat/wavdec.c")]
public class WAVDemuxer : AVInputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/wavdec.c")]
    public override string name {
        public get {
            return "wav";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/wavdec.c")]
    public override string long_name {
        public get {
            return "WAV / WAVE (Waveform Audio)";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/wavdec.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (WAVDemuxContext);

        }

    }

    [CCode (cname="wav_probe",cheader_filename="subprojects/ffmpeg/libavformat/wavdec.c")]
    public override int read_probe (
        AVProbeData format_context
    );

    [CCode (cname="wav_read_header",cheader_filename="subprojects/ffmpeg/libavformat/wavdec.c")]
    public override int read_header (
        AVFormatContext format_context
    );

    [CCode (cname="wav_read_packet",cheader_filename="subprojects/ffmpeg/libavformat/wavdec.c")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="wav_read_seek",cheader_filename="subprojects/ffmpeg/libavformat/wavdec.c")]
    public override int read_seek (
        AVFormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/wavdec.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.USE_GENERIC_INDEX;

        }

    }

    [CCode (cname="codec_tag")]
    public override AVCodecTag[] codec_tag_list {
        public get {
            return {
                ff_codec_wav_tags,
                0
            };

        }

    }

    //  .priv_class = wav_demuxer_class;
}
#endif // CONFIG_WAV_DEMUXER

#if CONFIG_W64_DEMUXER

[CCode (cname="ff_w64_demuxer",cheader_filename="subprojects/ffmpeg/libavformat/wavdec.c")]
public class Wave64Demuxer : AVInputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/wavdec.c")]
    public override string name {
        public get {
            return "w64";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/wavdec.c")]
    public override string long_name {
        public get {
            return "Sony Wave64";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/wavdec.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (WAVDemuxContext);

        }

    }

    [CCode (cname="w64_probe",cheader_filename="subprojects/ffmpeg/libavformat/wavdec.c")]
    public override int read_probe (
        AVProbeData format_context
    );

    [CCode (cname="w64_read_header",cheader_filename="subprojects/ffmpeg/libavformat/wavdec.c")]
    public override int read_header (
        AVFormatContext format_context
    );

    [CCode (cname="wav_read_packet",cheader_filename="subprojects/ffmpeg/libavformat/wavdec.c")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="wav_read_seek",cheader_filename="subprojects/ffmpeg/libavformat/wavdec.c")]
    public override int read_seek (
        AVFormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/wavdec.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.USE_GENERIC_INDEX;

        }

    }

    [CCode (cname="codec_tag")]
    public override AVCodecTag[] codec_tag_list {
        public get {
            return {
                ff_codec_wav_tags,
                0
            };

        }

    }

}
#endif // CONFIG_W64_DEMUXER

} // namespace LibAVFormat
