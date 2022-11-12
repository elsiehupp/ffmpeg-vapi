/***********************************************************
@copyright 2000, 2001, 2002 Fabrice Bellard
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

/***********************************************************
@file Options definition for AVFormatContext.
***********************************************************/

[CCode (cname="av_format_context_class", cheader_filename="")]
public class AVFormatContextClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "AVFormatContext";
        }
    }
    //  .item_name = format_to_name,
    //  .option = avformat_options,
    [CCode (cname="version", cheader_filename="")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;
        }
    }
    [CCode (cname="format_child_next", cheader_filename="")]
    public override void *child_next (
        void *obj,
        void *prev
    );
    [CCode (cname="format_child_class_next", cheader_filename="")]
    public override LibAVUtil.Class child_class_next (
        LibAVUtil.Class prev
    );
    //  .category = AV_CLASS_CATEGORY_MUXER,
    [CCode (cname="get_category", cheader_filename="")]
    public override LibAVUtil.ClassCategory get_category (
        void *class_context
    );
}

} // namespace LibAVFormat
