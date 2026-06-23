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

[CCode (cname="",cheader_filename="")]
static const LibAVUtil.Option rawvideo_options[] = {
    new LibAVUtil.ImageSizeOption () {
        name = "video_size",
        short_help_text = "set frame size",
        offsetof (
            RawVideoDemuxerContext,
            width
        ),
        {
            .str = NULL
        },
        0,
        0,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM
    },
    new LibAVUtil.StringOption () {
        name = "pixel_format",
        short_help_text = "set pixel format",
        offsetof (
            RawVideoDemuxerContext,
            pixel_format
        ),
        {
            .str = "yuv420p"
        },
        0,
        0,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM
    },
    new LibAVUtil.VideoRateOption () {
        name = "framerate",
        short_help_text = "set frame rate",
        offsetof (
            RawVideoDemuxerContext,
            framerate
        ),
        {
            .str = "25"
        },
        0,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.DECODING_PARAM
    },
    {
        NULL
    }

};

[CCode (cname="rawvideo_demuxer_class",cheader_filename="ffmpeg/libformat/rawvideodec.c")]
public class RawVideoDemuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="ffmpeg/libformat/rawvideodec.c")]
    public override string class_name {
        public get {
            return "rawvideo demuxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="ffmpeg/libformat/rawvideodec.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }
    //  .option = rawvideo_options,

    [CCode (cname="version",cheader_filename="ffmpeg/libformat/rawvideodec.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="struct RawVideoDemuxerContext",cheader_filename="ffmpeg/libformat/rawvideodec.c")]
[Compact]
public class RawVideoDemuxerPrivateData { }

[CCode (cname="ff_rawvideo_demuxer",cheader_filename="ffmpeg/libformat/rawvideodec.c")]
public class RawVideoDemuxer : AVInputFormat {
    [CCode (cname="name",cheader_filename="ffmpeg/libformat/rawvideodec.c")]
    public override string name {
        public get {
            return "rawvideo";

        }

    }

    [CCode (cname="long_name",cheader_filename="ffmpeg/libformat/rawvideodec.c")]
    public override string long_name {
        public get {
            return "raw video";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="ffmpeg/libformat/rawvideodec.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (RawVideoDemuxerPrivateData);

        }

    }

    [CCode (cname="rawvideo_read_header",cheader_filename="ffmpeg/libformat/rawvideodec.c")]
    public override int read_header (
        AVFormatContext format_context
    );

    [CCode (cname="rawvideo_read_packet",cheader_filename="ffmpeg/libformat/rawvideodec.c")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="flags",cheader_filename="ffmpeg/libformat/rawvideodec.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_GENERIC_INDEX;

        }

    }

    [CCode (cname="extensions",cheader_filename="ffmpeg/libformat/rawvideodec.c")]
    public override string extensions {
        public get {
            return "yuv,cif,qcif,rgb";

        }

    }

    [CCode (cname="raw_codec_id",cheader_filename="ffmpeg/libformat/rawvideodec.c")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.RAWVIDEO;

        }

    }
    //  .priv_class = rawvideo_demuxer_class;
}

} // namespace LibAVFormat
