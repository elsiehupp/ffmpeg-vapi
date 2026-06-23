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
@brief APNG muxer
@copyright 2015 Donny Yang

first version by Donny Yang <work@kota.moe>
***********************************************************/
namespace LibAVFormat {

[CCode (cname="",cheader_filename="")]
static const LibAVUtil.Option options[] = {
    new LibAVUtil.IntOption () {
        name = "plays",
        short_help_text = "Number of times to play the output: 0 - infinite loop, 1 - no loop",
        offsetof (
            APNGMuxContext,
            plays
        ),
        {
            .i64 = 1
        },
        0,
        UINT_MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.RationalOption () {
        name = "final_delay",
        short_help_text = "Force delay after the last frame",
        offsetof (
            APNGMuxContext,
            last_delay
        ),
        {
            .dbl = 0
        },
        0,
        USHRT_MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    {
        NULL
    }

};

[CCode (cname="apng_muxer_class",cheader_filename="ffmpeg/libformat/apngenc.c")]
public class APNGMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="ffmpeg/libformat/apngenc.c")]
    public override string class_name {
        public get {
            return "APNG muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="ffmpeg/libformat/apngenc.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="version",cheader_filename="ffmpeg/libformat/apngenc.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }

    [CCode (cname="options",cheader_filename="ffmpeg/libformat/apngenc.c")]
    public override LibAVUtil.Option[] option { public get; }
}

[CCode (cname="struct APNGMuxContext",cheader_filename="ffmpeg/libformat/apngenc.c")]
[Compact]
public class APNGMuxerPrivateData { }

[CCode (cname="ff_apng_muxer",cheader_filename="ffmpeg/libformat/apngenc.c")]
public class APNGMuxer : AVOutputFormat {
    [CCode (cname="name",cheader_filename="ffmpeg/libformat/apngenc.c")]
    public override string name {
        public get {
            return "apng";

        }

    }

    [CCode (cname="long_name",cheader_filename="ffmpeg/libformat/apngenc.c")]
    public override string long_name {
        public get {
            return "Animated Portable Network Graphics";

        }

    }

    [CCode (cname="mime_type",cheader_filename="ffmpeg/libformat/apngenc.c")]
    public override string mime_type {
        public get {
            return "image/png";

        }

    }

    [CCode (cname="extensions",cheader_filename="ffmpeg/libformat/apngenc.c")]
    public override string extensions {
        public get {
            return "apng";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="ffmpeg/libformat/apngenc.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (APNGMuxerPrivateData);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="ffmpeg/libformat/apngenc.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.NONE;

        }

    }

    [CCode (cname="video_codec",cheader_filename="ffmpeg/libformat/apngenc.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.APNG;

        }

    }

    [CCode (cname="apng_write_header",cheader_filename="ffmpeg/libformat/apngenc.c")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="apng_write_packet",cheader_filename="ffmpeg/libformat/apngenc.c")]
    public override int write_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="apng_write_trailer",cheader_filename="ffmpeg/libformat/apngenc.c")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="apng_deinit",cheader_filename="ffmpeg/libformat/apngenc.c")]
    public override void deinit (
        AVFormatContext format_context
    );
    //  .priv_class = apng_muxer_class,

    [CCode (cname="flags",cheader_filename="ffmpeg/libformat/apngenc.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_VARIABLE_FPS;

        }

    }
}

} // namespace LibAVFormat
