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

/***********************************************************
@file Options definition for AVFormatContext.
***********************************************************/

[CCode (cname="av_format_context_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "AVFormatContext"
        }
    }
    //  .item_name = format_to_name,
    //  .option = avformat_options,
    [CCode (cname="version", cheader="")]
    public override int version {
        public get {
            return LIBAVUTIL_VERSION_INT;
        }
    }
    [CCode (cname="", cheader="")]
    public override void *child_next (
        void *obj,
        void *prev
    ); // = format_child_next,
    [CCode (cname="", cheader="")]
    public override Class child_class_next (
        Class prev
    ); // = format_child_class_next,
    //  .category = AV_CLASS_CATEGORY_MUXER,
    [CCode (cname="", cheader="")]
    public override ClassCategory get_category (
        void *class_context
    ); // = get_category,
}
