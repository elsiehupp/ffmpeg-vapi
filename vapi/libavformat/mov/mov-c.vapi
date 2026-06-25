/***********************************************************
@brief MOV demuxer
@copyright 2001 Fabrice Bellard
@copyright 2009 Baptiste Coudurier <baptiste dot coudurier at gmail dot com>

first version by Francois Revol <revol@free.fr>
seek function by Gael Chardon <gael.dev@4now.net>
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

[CCode (cname="mov_class",cheader_filename="subprojects/ffmpeg/libavformat/mov.c")]
public class MOVDemuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/mov.c")]
    public override string class_name {
        public get {
            return "mov,mp4,m4a,3gp,3g2,mj2";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/mov.c")]
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
                    name = "use_absolute_path",
                    short_help_text = "allow using absolute path when opening alias, this is a possible security issue",
                    offset = offsetof (
                        MOVContext,
                        use_absolute_path
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = (
                        LibAVUtil.OptionFlags.VIDEO_PARAM |
                        LibAVUtil.OptionFlags.DECODING_PARAM
                    )
                },
                new LibAVUtil.BoolOption () {
                    name = "seek_streams_individually",
                    short_help_text = "Seek each stream individually to the to the closest point",
                    offset = offsetof (
                        MOVContext,
                        seek_individually
                    ),
                    default_value = 1,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = (
                        LibAVUtil.OptionFlags.VIDEO_PARAM |
                        LibAVUtil.OptionFlags.DECODING_PARAM
                    )
                },
                new LibAVUtil.BoolOption () {
                    name = "ignore_editlist",
                    short_help_text = "Ignore the edit list atom.",
                    offset = offsetof (
                        MOVContext,
                        ignore_editlist
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = (
                        LibAVUtil.OptionFlags.VIDEO_PARAM |
                        LibAVUtil.OptionFlags.DECODING_PARAM
                    )
                },
                new LibAVUtil.BoolOption () {
                    name = "advanced_editlist",
                    short_help_text = "Modify the AVIndex according to the editlists. Use this option to decode in the order specified by the edits.",
                    offset = offsetof (
                        MOVContext,
                        advanced_editlist
                    ),
                    default_value = 1,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = (
                        LibAVUtil.OptionFlags.VIDEO_PARAM |
                        LibAVUtil.OptionFlags.DECODING_PARAM
                    )
                },
                new LibAVUtil.BoolOption () {
                    name = "ignore_chapters",
                    short_help_text = "",
                    offset = offsetof (
                        MOVContext,
                        ignore_chapters
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = (
                        LibAVUtil.OptionFlags.VIDEO_PARAM |
                        LibAVUtil.OptionFlags.DECODING_PARAM
                    )
                },
                new LibAVUtil.IntOption () {
                    name = "use_mfra_for",
                    short_help_text = "use mfra for fragment timestamps",
                    offset = offsetof (
                        MOVContext,
                        use_mfra_for
                    ),
                    default_value = MOVFlags.MFRA_AUTO,
                    minimum_value = -1,
                    maximum_value = MOVFlags.MFRA_PTS,
                    option_flags = (
                        LibAVUtil.OptionFlags.VIDEO_PARAM |
                        LibAVUtil.OptionFlags.DECODING_PARAM
                    ),
                    unit = "use_mfra_for"
                },
                new LibAVUtil.ConstOption () {
                    name = "auto",
                    short_help_text = "auto",
                    offset = 0,
                    default_value = MOVFlags.MFRA_AUTO,
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = (
                        LibAVUtil.OptionFlags.VIDEO_PARAM |
                        LibAVUtil.OptionFlags.DECODING_PARAM
                    ),
                    unit = "use_mfra_for"
                },
                new LibAVUtil.ConstOption () {
                    name = "dts",
                    short_help_text = "dts",
                    offset = 0,
                    default_value = MOVFlags.MFRA_DTS,
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = (
                        LibAVUtil.OptionFlags.VIDEO_PARAM |
                        LibAVUtil.OptionFlags.DECODING_PARAM
                    ),
                    unit = "use_mfra_for"
                },
                new LibAVUtil.ConstOption () {
                    name = "pts",
                    short_help_text = "pts",
                    offset = 0,
                    default_value = MOVFlags.MFRA_PTS,
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = (
                        LibAVUtil.OptionFlags.VIDEO_PARAM |
                        LibAVUtil.OptionFlags.DECODING_PARAM
                    ),
                    unit = "use_mfra_for"
                },
                new LibAVUtil.BoolOption () {
                    name = "export_all",
                    short_help_text = "Export unrecognized metadata entries",
                    offset = offsetof (
                        MOVContext,
                        export_all
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = (
                        LibAVUtil.OptionFlags.VIDEO_PARAM |
                        LibAVUtil.OptionFlags.DECODING_PARAM
                    )
                },
                new LibAVUtil.BoolOption () {
                    name = "export_xmp",
                    short_help_text = "Export full XMP metadata",
                    offset = offsetof (
                        MOVContext,
                        export_xmp
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = (
                        LibAVUtil.OptionFlags.VIDEO_PARAM |
                        LibAVUtil.OptionFlags.DECODING_PARAM
                    )
                },
                new LibAVUtil.BinaryOption () {
                    name = "activation_bytes",
                    short_help_text = "Secret bytes for Audible AAX files",
                    offset = offsetof (
                        MOVContext,
                        activation_bytes
                    ),
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
                },
                new LibAVUtil.BinaryOption () {
                    name = "audible_fixed_key",
                    // extracted from libAAX_SDK.so and AAXSDKWin.dll files!
                    short_help_text = "Fixed key used for handling Audible AAX files",
                    offset = offsetof (
                        MOVContext,
                        audible_fixed_key
                    ),
                    default_value = "77214d4b196a87cd520045fd20a51d67",
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
                },
                new LibAVUtil.BinaryOption () {
                    name = "decryption_key",
                    short_help_text = "The media decryption key (hex)",
                    offset = offsetof (
                        MOVContext,
                        decryption_key
                    ),
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
                },
                new LibAVUtil.BoolOption () {
                    name = "enable_drefs",
                    short_help_text = "Enable external track support.",
                    offset = offsetof (
                        MOVContext,
                        enable_drefs
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = (
                        LibAVUtil.OptionFlags.VIDEO_PARAM |
                        LibAVUtil.OptionFlags.DECODING_PARAM
                    )
                },
                {
                    NULL
                }

            };

        }

    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/mov.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_mov_demuxer",cheader_filename="subprojects/ffmpeg/libavformat/mov.c")]
public class MOVDemuxer : LibAVFormat.InputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/mov.c")]
    public override string name {
        public get {
            return "mov,mp4,m4a,3gp,3g2,mj2";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/mov.c")]
    public override string long_name {
        public get {
            return "QuickTime / MOV";

        }

    }
    //  .priv_class = mov_class,

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/mov.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MOVContext);

        }

    }

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/mov.c")]
    public override string extensions {
        public get {
            return "mov,mp4,m4a,3gp,3g2,mj2";

        }

    }

    [CCode (cname="mov_probe",cheader_filename="subprojects/ffmpeg/libavformat/mov.c")]
    public override int read_probe (
        LibAVFormat.ProbeData format_context
    );

    [CCode (cname="mov_read_header",cheader_filename="subprojects/ffmpeg/libavformat/mov.c")]
    public override int read_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="mov_read_packet",cheader_filename="subprojects/ffmpeg/libavformat/mov.c")]
    public override int read_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="mov_read_close",cheader_filename="subprojects/ffmpeg/libavformat/mov.c")]
    public override int read_close (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="mov_read_seek",cheader_filename="subprojects/ffmpeg/libavformat/mov.c")]
    public override int read_seek (
        LibAVFormat.FormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/mov.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.NO_BYTE_SEEK | AVFormatFlags1.SEEK_TO_PTS;

        }

    }
}

} // namespace LibAVFormat
