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
@brief ADTS muxer.
@copyright 2006 Baptiste Coudurier <baptiste.coudurier@smartjog.com>
@copyright 2006 Mans Rullgard <mans@mansr.com>
***********************************************************/
namespace LibAVFormat {

[CCode (cname="",cheader_filename="")]
static const LibAVUtil.Option options[] = {
    new LibAVUtil.BoolOption () {
        name = "write_id3v2",
        short_help_text = "Enable ID3v2 tag writing",
        offsetof (
            ADTSContext,
            id3v2tag
        ),
        {
            .i64 = 0
        },
        0,
        1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.BoolOption () {
        name = "write_apetag",
        short_help_text = "Enable APE tag writing",
        offsetof (
            ADTSContext,
            apetag
        ),
        {
            .i64 = 0
        },
        0,
        1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    {
        NULL
    }

};

[CCode (cname="adts_muxer_class",cheader_filename="ffmpeg/libformat/adtsenc.c")]
public class ADTSMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="ffmpeg/libformat/adtsenc.c")]
    public override string class_name {
        public get {
            return "ADTS muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="ffmpeg/libformat/adtsenc.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }
    //  .option = options,

    [CCode (cname="version",cheader_filename="ffmpeg/libformat/adtsenc.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="struct ADTSContext",cheader_filename="ffmpeg/libformat/adtsenc.c")]
[Compact]
public class ADTSMuxerPrivateData { }

[CCode (cname="ff_adts_muxer",cheader_filename="ffmpeg/libformat/adtsenc.c")]
public class ADTSMuxer : AVOutputFormat {
    [CCode (cname="name",cheader_filename="ffmpeg/libformat/adtsenc.c")]
    public override string name {
        public get {
            return "adts";

        }

    }

    [CCode (cname="long_name",cheader_filename="ffmpeg/libformat/adtsenc.c")]
    public override string long_name {
        public get {
            return "ADTS AAC (Advanced Audio Coding)";

        }

    }

    [CCode (cname="mime_type",cheader_filename="ffmpeg/libformat/adtsenc.c")]
    public override string mime_type {
        public get {
            return "audio/aac";

        }

    }

    [CCode (cname="extensions",cheader_filename="ffmpeg/libformat/adtsenc.c")]
    public override string extensions {
        public get {
            return "aac,adts";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="ffmpeg/libformat/adtsenc.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (ADTSMuxerPrivateData);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="ffmpeg/libformat/adtsenc.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.AAC;

        }

    }

    [CCode (cname="video_codec",cheader_filename="ffmpeg/libformat/adtsenc.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.NONE;

        }

    }

    [CCode (cname="adts_init",cheader_filename="ffmpeg/libformat/adtsenc.c")]
    public override int init (
        AVFormatContext format_context
    );

    [CCode (cname="adts_write_header",cheader_filename="ffmpeg/libformat/adtsenc.c")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="adts_write_packet",cheader_filename="ffmpeg/libformat/adtsenc.c")]
    public override int write_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="adts_write_trailer",cheader_filename="ffmpeg/libformat/adtsenc.c")]
    public override int write_trailer (
        AVFormatContext format_context
    );
    //  .priv_class = adts_muxer_class,

    [CCode (cname="flags",cheader_filename="ffmpeg/libformat/adtsenc.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_NOTIMESTAMPS;

        }

    }
}

} // namespace LibAVFormat
