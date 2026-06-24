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
/***********************************************************
@brief APNG demuxer
@copyright 2014 Benoit Fouet
***********************************************************/
namespace LibAVFormat {

/***********************************************************
@file APNG demuxer.
@see https://wiki.mozilla.org/APNG_Specification
@see http://www.w3.org/TR/PNG
***********************************************************/

static const LibAVUtil.Option options[] = {
    new LibAVUtil.BoolOption () {
        name = "ignore_loop",
        short_help_text = "ignore loop setting",
        offset = offsetof (
            APNGDemuxContext,
            ignore_loop
        ),
        default_value = 1,
        minimum_value = 0,
        maximum_value = 1,
        option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "max_fps",
        short_help_text = "maximum framerate (0 is no limit)",
        offset = offsetof (
            APNGDemuxContext,
            max_fps
        ),
        default_value = 0,
        minimum_value = 0,
        maximum_value = int.MAX,
        option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "default_fps",
        short_help_text = "default framerate (0 is as fast as possible)",
        offset = offsetof (
            APNGDemuxContext,
            default_fps
        ),
        default_value = DEFAULT_APNG_FPS,
        minimum_value = 0,
        maximum_value = int.MAX,
        option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
    },
    {
        NULL
    }

};

[CCode (cname="demuxer_class",cheader_filename="ffmpeg/libformat/apngdec.c")]
public class APNGDemuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="ffmpeg/libformat/apngdec.c")]
    public override string class_name {
        public get {
            return "APNG demuxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="ffmpeg/libformat/apngdec.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options",cheader_filename="ffmpeg/libformat/apngdec.c")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version",cheader_filename="ffmpeg/libformat/apngdec.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
    //  .category = LibAVUtil.ClassCategory.DEMUXER;
}

[CCode (cname="struct APNGDemuxContext",cheader_filename="ffmpeg/libformat/apngdec.c")]
[Compact]
public class APNGDemuxerPrivateData { }

[CCode (cname="ff_apng_demuxer",cheader_filename="ffmpeg/libformat/apngdec.c")]
public class APNGDemuxer : AVInputFormat {
    [CCode (cname="name",cheader_filename="ffmpeg/libformat/apngdec.c")]
    public override string name {
        public get {
            return "apng";

        }

    }

    [CCode (cname="long_name",cheader_filename="ffmpeg/libformat/apngdec.c")]
    public override string long_name {
        public get {
            return "Animated Portable Network Graphics";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="ffmpeg/libformat/apngdec.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (APNGDemuxerPrivateData);

        }

    }

    [CCode (cname="apng_probe",cheader_filename="ffmpeg/libformat/apngdec.c")]
    public override int read_probe (
        AVProbeData format_context
    );

    [CCode (cname="apng_read_header",cheader_filename="ffmpeg/libformat/apngdec.c")]
    public override int read_header (
        AVFormatContext format_context
    );

    [CCode (cname="apng_read_packet",cheader_filename="ffmpeg/libformat/apngdec.c")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="flags",cheader_filename="ffmpeg/libformat/apngdec.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.USE_GENERIC_INDEX;

        }

    }
    //  .priv_class = demuxer_class;
}

} // namespace LibAVFormat
