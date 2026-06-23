/***********************************************************
@brief Chromaprint fingerprinting muxer
@copyright 2015 Rodger Combs
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
        name = "silence_threshold",
        short_help_text = "threshold for detecting silence",
        offsetof (
            ChromaprintMuxContext,
            silence_threshold
        ),
        {
            .i64 = -1
        },
        -1,
        32767,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "algorithm",
        short_help_text = "version of the fingerprint algorithm",
        offsetof (
            ChromaprintMuxContext,
            algorithm
        ),
        {
            .i64 = CHROMAPRINT_ALGORITHM_DEFAULT
        },
        CHROMAPRINT_ALGORITHM_TEST1,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.IntOption () {
        name = "fp_format",
        short_help_text = "fingerprint format to write",
        offsetof (
            ChromaprintMuxContext,
            fp_format
        ),
        {
            .i64 = FINGERPRINT_BASE64
        },
        FINGERPRINT_RAW,
        FINGERPRINT_BASE64,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM
    },
    new LibAVUtil.ConstOption () {
        name = "raw",
        short_help_text = "binary raw fingerprint",
        0,
        {
            .i64 = FINGERPRINT_RAW
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "fp_format"
    },
    new LibAVUtil.ConstOption () {
        name = "compressed",
        short_help_text = "binary compressed fingerprint",
        0,
        {
            .i64 = FINGERPRINT_COMPRESSED
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "fp_format"
    },
    new LibAVUtil.ConstOption () {
        name = "base64",
        short_help_text = "Base64 compressed fingerprint",
        0,
        {
            .i64 = FINGERPRINT_BASE64
        },
        int.MIN,
        int.MAX,
        .flags = LibAVUtil.OptionFlags.ENCODING_PARAM,
        "fp_format"
    },
    {
        NULL
    }

};

[CCode (cname="chromaprint_class",cheader_filename="ffmpeg/libformat/chromaprint.c")]
public class ChromaPrintMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="ffmpeg/libformat/chromaprint.c")]
    public override string class_name {
        public get {
            return "chromaprint muxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="ffmpeg/libformat/chromaprint.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options",cheader_filename="ffmpeg/libformat/chromaprint.c")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version",cheader_filename="ffmpeg/libformat/chromaprint.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="struct ChromaprintMuxContext",cheader_filename="ffmpeg/libformat/chromaprint.c")]
[Compact]
public class ChromaPrintMuxerPrivateData { }

[CCode (cname="ff_chromaprint_muxer",cheader_filename="ffmpeg/libformat/chromaprint.c")]
public class ChromaPrintMuxer : AVOutputFormat {
    [CCode (cname="name",cheader_filename="ffmpeg/libformat/chromaprint.c")]
    public override string name {
        public get {
            return "chromaprint";

        }

    }

    [CCode (cname="long_name",cheader_filename="ffmpeg/libformat/chromaprint.c")]
    public override string long_name {
        public get {
            return "Chromaprint";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="ffmpeg/libformat/chromaprint.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (ChromaPrintMuxerPrivateData);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="ffmpeg/libformat/chromaprint.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
        #if AV_HAVE_BIGENDIAN
            return LibAVCodec.CodecID.PCM_S16BE;
        #else
            return LibAVCodec.CodecID.PCM_S16LE;
        #endif
        }
    }

    [CCode (cname="write_header",cheader_filename="ffmpeg/libformat/chromaprint.c")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="write_packet",cheader_filename="ffmpeg/libformat/chromaprint.c")]
    public override int write_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="write_trailer",cheader_filename="ffmpeg/libformat/chromaprint.c")]
    public override int write_trailer (
        AVFormatContext format_context
    );

    [CCode (cname="flags",cheader_filename="ffmpeg/libformat/chromaprint.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_NOTIMESTAMPS;

        }

    }
    //  .priv_class = chromaprint_class;
}

} // namespace LibAVFormat
