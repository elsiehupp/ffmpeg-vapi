/***********************************************************
@brief Live HDS fragmenter
@copyright 2013 Martin Storsjo
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

[CCode (cname="options",cheader_filename="")]
static const LibAVUtil.Option options[] = {
    new LibAVUtil.IntOption () {
        name = "window_size",
        short_help_text = "number of fragments kept in the manifest",
        offset = offsetof (
            HDSContext,
            window_size
        ),
        default_value = 0,
        minimum_value = 0,
        maximum_value = int.MAX,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "extra_window_size",
        short_help_text = "number of fragments kept outside of the manifest before removing from disk",
        offset = offsetof (
            HDSContext,
            extra_window_size
        ),
        default_value = 5,
        minimum_value = 0,
        maximum_value = int.MAX,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.Int64Option () {
        name = "min_frag_duration",
        short_help_text = "minimum fragment duration (in microseconds)",
        offset = offsetof (
            HDSContext,
            min_frag_duration
        ),
        default_value = 10000000,
        minimum_value = 0,
        maximum_value = int.MAX,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.BoolOption () {
        name = "remove_at_exit",
        short_help_text = "remove all fragments when finished",
        offset = offsetof (
            HDSContext,
            remove_at_exit
        ),
        default_value = 0,
        minimum_value = 0,
        maximum_value = 1,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    {
        NULL
    }

};

[CCode (cname="hds_class",cheader_filename="ffmpeg/libformat/hdsenc.c")]
public class HDSMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="ffmpeg/libformat/hdsenc.c")]
    public override string class_name {
        public get {
            return "HDS muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="ffmpeg/libformat/hdsenc.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options",cheader_filename="ffmpeg/libformat/hdsenc.c")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version",cheader_filename="ffmpeg/libformat/hdsenc.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="struct HDSContext",cheader_filename="ffmpeg/libformat/hdsenc.c")]
[Compact]
public class HDSMuxerPrivateData { }

[CCode (cname="ff_hds_muxer",cheader_filename="ffmpeg/libformat/hdsenc.c")]
public class HDSMuxer : AVOutputFormat {
    [CCode (cname="name",cheader_filename="ffmpeg/libformat/hdsenc.c")]
    public override string name {
        public get {
            return "hds";

        }

    }

    [CCode (cname="long_name",cheader_filename="ffmpeg/libformat/hdsenc.c")]
    public override string long_name {
        public get {
            return "HDS Muxer";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="ffmpeg/libformat/hdsenc.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (HDSMuxerPrivateData);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="ffmpeg/libformat/hdsenc.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.AAC;

        }

    }

    [CCode (cname="video_codec",cheader_filename="ffmpeg/libformat/hdsenc.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.H264;

        }

    }

    [CCode (cname="flags",cheader_filename="ffmpeg/libformat/hdsenc.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.WANTS_GLOBAL_HEADER | AVFormatFlags1.NO_FILE;

        }

    }

    [CCode (cname="hds_write_header",cheader_filename="ffmpeg/libformat/hdsenc.c")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="hds_write_packet",cheader_filename="ffmpeg/libformat/hdsenc.c")]
    public override int write_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="hds_write_trailer",cheader_filename="ffmpeg/libformat/hdsenc.c")]
    public override int write_trailer (
        AVFormatContext format_context
    );
    //  .priv_class = hds_class;
}

} // namespace LibAVFormat
