/***********************************************************
@brief Unbuffered I/O
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

/***********************************************************
@name Logging context.
***********************************************************/
/*@{*/

[CCode (cname="options",cheader_filename="subprojects/ffmpeg/libavformat/avio.c")]
static const LibAVUtil.Option options[] = {
    new LibAVUtil.StringOption () {
        name = "protocol_whitelist",
        short_help_text = "List of protocols that are allowed to be used",
        offset = offsetof (
            URLContext,
            protocol_whitelist
        ),
        default_value = "",
        minimum_value = char.MIN,
        maximum_value = char.MAX,
        option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
    },
    new LibAVUtil.StringOption () {
        name = "protocol_blacklist",
        short_help_text = "List of protocols that are not allowed to be used",
        offset = offsetof (
            URLContext,
            protocol_blacklist
        ),
        default_value = "",
        minimum_value = char.MIN,
        maximum_value = char.MAX,
        option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
    },
    new LibAVUtil.Int64Option () {
        name = "rw_timeout",
        short_help_text = "Timeout for IO operations (in microseconds)",
        offset = offsetof (
            URLContext,
            rw_timeout
        ),
        default_value = 0,
        minimum_value = 0,
        maximum_value = int64.MAX,
        option_flags = LibAVUtil.OptionFlags.ENCODING_PARAM | LibAVUtil.OptionFlags.DECODING_PARAM
    },
    {
        NULL
    }
}

[CCode (cname="ffurl_context_class",cheader_filename="subprojects/ffmpeg/libavformat/avio.c")]
public class URLContextClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/avio.c")]
    public override string class_name {
        public get {
            return "URLContext";

        }

    }
    //  .item_name = urlcontext_to_name,
    //  .option = options,

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/avio.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }

    [CCode (cname="urlcontext_child_next",cheader_filename="subprojects/ffmpeg/libavformat/avio.c")]
    public override void *child_next (
        void *obj,
        void *prev
    );

    [CCode (cname="ff_urlcontext_child_class_next",cheader_filename="subprojects/ffmpeg/libavformat/avio.c")]
    public override LibAVUtil.Class child_class_next (
        LibAVUtil.Class prev
    );

}
/*@}*/

} // namespace LibAVFormat
