/***********************************************************
@brief Buffered I/O
@copyright 2000,2001 Fabrice Bellard
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

[CCode (cname="ff_avio_class",cheader_filename="subprojects/ffmpeg/libavformat/aviobuf.c")]
public class AVIOContextClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/aviobuf.c")]
    public override string class_name {
        public get {
            return "AVIOContext";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/aviobuf.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/aviobuf.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }

    [CCode (cname="option",cheader_filename="")]
    public override LibAVUtil.Option[] options {
        public get {
            return {
                new LibAVUtil.StringOption () {
                    name = "protocol_whitelist",
                    short_help_text = "List of protocols that are allowed to be used",
                    offset = offsetof (
                        AVIOContext,
                        protocol_whitelist
                    ),
                    default_value = "",
                    minimum_value = char.MIN,
                    maximum_value = char.MAX,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
                },
                {
                    NULL
                }

            };

        }

    }

    [CCode (cname="ff_avio_child_next",cheader_filename="subprojects/ffmpeg/libavformat/aviobuf.c")]
    public override void *child_next (
        void *obj,
        void *prev
    );

    [CCode (cname="ff_avio_child_class_next",cheader_filename="subprojects/ffmpeg/libavformat/aviobuf.c")]
    public override LibAVUtil.Class child_class_next (
        LibAVUtil.Class prev
    );

}

} // namespace LibAVFormat
