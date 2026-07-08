/***********************************************************
@brief MP3 demuxer
@copyright 2003 Fabrice Bellard
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

[CCode (cname="demuxer_class",cheader_filename="subprojects/ffmpeg/libavformat/mp3dec.c")]
public class MP3DemuxerClass : LibAVUtil.Log.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/mp3dec.c")]
    public override string class_name {
        public get {
            return "mp3";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/mp3dec.c")]
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
                new LibAVUtil.BoolOption () {
                    name = "usetoc",
                    short_help_text = "use table of contents",
                    offset = offsetof (
                        MP3DecContext, usetoc
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    LibAVUtil.OptionFlags.DECODING_PARAM
                },
                {
                    NULL
                }

            };

        }

    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/mp3dec.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
    //  .category = LibAVUtil.Log.ClassCategory.DEMUXER;
}

[CCode (cname="struct MP3DecContext",cheader_filename="subprojects/ffmpeg/libavformat/mp3dec.c")]
[Compact]
public class MP3DemuxerPrivateData { }

[CCode (cname="ff_mp3_demuxer",cheader_filename="subprojects/ffmpeg/libavformat/mp3dec.c")]
public class MP3Demuxer : LibAVFormat.InputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/mp3dec.c")]
    public override string name {
        public get {
            return "mp3";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/mp3dec.c")]
    public override string long_name {
        public get {
            return "MP2/3 (MPEG audio layer 2/3)";

        }

    }

    [CCode (cname="mp3_read_probe",cheader_filename="subprojects/ffmpeg/libavformat/mp3dec.c")]
    public override int read_probe (
        LibAVFormat.ProbeData format_context
    );

    [CCode (cname="mp3_read_header",cheader_filename="subprojects/ffmpeg/libavformat/mp3dec.c")]
    public override int read_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="mp3_read_packet",cheader_filename="subprojects/ffmpeg/libavformat/mp3dec.c")]
    public override int read_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="mp3_seek",cheader_filename="subprojects/ffmpeg/libavformat/mp3dec.c")]
    public override int read_seek (
        LibAVFormat.FormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/mp3dec.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MP3DemuxerPrivateData);

        }

    }

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/mp3dec.c")]
    public override LibAVFormat.FormatFlags1 flags {
        public get {
            return LibAVFormat.FormatFlags1.USE_GENERIC_INDEX;

        }

    }

    /***********************************************************
    @brief XXX: use probe
    ***********************************************************/
    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/mp3dec.c")]
    public override string extensions {
        public get {
            return "mp2,mp3,m2a,mpa";

        }

    }
    //  .priv_class = demuxer_class;
}

} // namespace LibAVFormat
