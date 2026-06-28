/***********************************************************
@brief RAW video demuxer
@copyright 2001 Fabrice Bellard
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

[CCode (cname="rawvideo_demuxer_class",cheader_filename="subprojects/ffmpeg/libavformat/rawvideodec.c")]
public class RawVideoDemuxerClass : LibAVUtil.Log.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/rawvideodec.c")]
    public override string class_name {
        public get {
            return "rawvideo demuxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/rawvideodec.c")]
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
                new LibAVUtil.ImageSizeOption () {
                    name = "video_size",
                    short_help_text = "set frame size",
                    offset = offsetof (
                        RawVideoDemuxerContext,
                        width
                    ),
                    default_value = "",
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
                },
                new LibAVUtil.StringOption () {
                    name = "pixel_format",
                    short_help_text = "set pixel format",
                    offset = offsetof (
                        RawVideoDemuxerContext,
                        pixel_format
                    ),
                    default_value = "yuv420p",
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
                },
                new LibAVUtil.VideoRateOption () {
                    name = "framerate",
                    short_help_text = "set frame rate",
                    offset = offsetof (
                        RawVideoDemuxerContext,
                        framerate
                    ),
                    default_value = "25",
                    minimum_value = 0,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
                },
                {
                    NULL
                }

            };

        }

    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/rawvideodec.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="struct RawVideoDemuxerContext",cheader_filename="subprojects/ffmpeg/libavformat/rawvideodec.c")]
[Compact]
public class RawVideoDemuxerPrivateData { }

[CCode (cname="ff_rawvideo_demuxer",cheader_filename="subprojects/ffmpeg/libavformat/rawvideodec.c")]
public class RawVideoDemuxer : LibAVFormat.InputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/rawvideodec.c")]
    public override string name {
        public get {
            return "rawvideo";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/rawvideodec.c")]
    public override string long_name {
        public get {
            return "raw video";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/rawvideodec.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (RawVideoDemuxerPrivateData);

        }

    }

    [CCode (cname="rawvideo_read_header",cheader_filename="subprojects/ffmpeg/libavformat/rawvideodec.c")]
    public override int read_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="rawvideo_read_packet",cheader_filename="subprojects/ffmpeg/libavformat/rawvideodec.c")]
    public override int read_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/rawvideodec.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.USE_GENERIC_INDEX;

        }

    }

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/rawvideodec.c")]
    public override string extensions {
        public get {
            return "yuv,cif,qcif,rgb";

        }

    }

    [CCode (cname="raw_codec_id",cheader_filename="subprojects/ffmpeg/libavformat/rawvideodec.c")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.RAWVIDEO;

        }

    }
    //  .priv_class = rawvideo_demuxer_class;
}

} // namespace LibAVFormat
