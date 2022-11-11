/***********************************************************
buffered I/O
@copyright 2000,2001 Fabrice Bellard
***********************************************************/
/***********************************************************
This file is part of FFmpeg.

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

//  #define OFFSET(x) offsetof(AVIOContext,x)
//  #define E AV_OPT_FLAG_ENCODING_PARAM
//  #define D AV_OPT_FLAG_DECODING_PARAM
//  static const LibAVUtil.Option ff_avio_options[] = {
//      {"protocol_whitelist", "List of protocols that are allowed to be used", OFFSET(protocol_whitelist), AV_OPT_TYPE_STRING, { .str = NULL },  CHAR_MIN, CHAR_MAX, D },
//      { NULL },
//  }

[CCode (cname="ff_avio_class", cheader="")]
public class AVIOContextClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "AVIOContext";
        }
    }
    [CCode (cname="item_name", cheader="")]
    public override string item_name (
        void *class_context
    ) {
        return av_default_item_name (
            class_context
        );
    }
    [CCode (cname="version", cheader="")]
    public override int version {
        public get {
            return LIBAVUTIL_VERSION_INT;
        }
    }
    //  .option = ff_avio_options,
    [CCode (cname="ff_avio_child_next", cheader="")]
    public override void *child_next (
        void *obj,
        void *prev
    );
    [CCode (cname="ff_avio_child_class_next", cheader="")]
    public override Class child_class_next (
        Class prev
    );
}

} // namespace LibAVFormat
