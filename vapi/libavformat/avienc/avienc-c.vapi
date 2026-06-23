/***********************************************************
@brief AVI muxer
@copyright 2000 Fabrice Bellard
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
static const LibAVUtil.Option options[] = {
    new LibAVUtil.IntOption () {
        name = "reserve_index_space",
        short_help_text = "reserve space (in bytes) at the beginning of the file for each stream index",
        offsetof (
            AVIContext,
            reserve_index_space
        ),
        {
            .i64 = 0
        },
        0,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.BoolOption () {
        name = "write_channel_mask",
        short_help_text = "write channel mask into wave format header",
        offsetof (
            AVIContext,
            write_channel_mask
        ),
        {
            .i64 = 1
        },
        0,
        1,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    {
        NULL
    }

};

[CCode (cname="avi_muxer_class",cheader_filename="ffmpeg/libformat/avienc.c")]
public class AVIMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="ffmpeg/libformat/avienc.c")]
    public override string class_name {
        public get {
            return "AVI muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="ffmpeg/libformat/avienc.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options",cheader_filename="ffmpeg/libformat/avienc.c")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version",cheader_filename="ffmpeg/libformat/avienc.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="struct AVIContext",cheader_filename="ffmpeg/libformat/avienc.c")]
[Compact]
public class AVIMuxerPrivateData { }

[CCode (cname="ff_avi_muxer",cheader_filename="ffmpeg/libformat/avienc.c")]
public class AVIMuxer : AVOutputFormat {
    [CCode (cname="name",cheader_filename="ffmpeg/libformat/avienc.c")]
    public override string name {
        public get {
            return "avi";

        }

    }

    [CCode (cname="long_name",cheader_filename="ffmpeg/libformat/avienc.c")]
    public override string long_name {
        public get {
            return "AVI (Audio Video Interleaved)";

        }

    }

    [CCode (cname="mime_type",cheader_filename="ffmpeg/libformat/avienc.c")]
    public override string mime_type {
        public get {
            return "video/x-msvideo";

        }

    }

    [CCode (cname="extensions",cheader_filename="ffmpeg/libformat/avienc.c")]
    public override string extensions {
        public get {
            return "avi";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="ffmpeg/libformat/avienc.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (AVIMuxerPrivateData);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="ffmpeg/libformat/avienc.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
        #if CONFIG_LIBMP3LAME
            return LibAVCodec.CodecID.MP3;
        #else
            return LibAVCodec.CodecID.AC3;
        #endif
        }
    }

    [CCode (cname="video_codec",cheader_filename="ffmpeg/libformat/avienc.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.MPEG4;

        }

    }

    [CCode (cname="avi_init",cheader_filename="ffmpeg/libformat/avienc.c")]
    public override int init (
        AVFormatContext format_context
    );

    [CCode (cname="avi_write_header",cheader_filename="ffmpeg/libformat/avienc.c")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="avi_write_packet",cheader_filename="ffmpeg/libformat/avienc.c")]
    public override int write_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="avi_write_trailer",cheader_filename="ffmpeg/libformat/avienc.c")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="codec_tag")]
    public override AVCodecTag[] codec_tag_list {
        public get {
            return  {
                ff_codec_bmp_tags,
                ff_codec_wav_tags,
                0
            };

        }

    }

    //  .priv_class = avi_muxer_class;
}

} // namespace LibAVFormat
