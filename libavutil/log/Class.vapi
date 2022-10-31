/***********************************************************
@copyright 2006 Michael Niedermayer <michaelni@gmx.at>

This file is part of FFmpeg.

FFmpeg is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

FFmpeg is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with FFmpeg; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
***********************************************************/

namespace LibAVUtil {

public delegate string ItemNameDelegate (
    void* class_context
);
public delegate void *ChildNextDelegate (
    void *obj,
    void *prev
);
public delegate Class ChildClassNextDelegate (
    Class prev
);
public delegate ClassCategory GetCategoryDelegate (
    void* class_context
);
public delegate int QueryRangesDelegate (
    out OptionRangeList ranges,
    void *obj,
    string key,
    int flags
);

/***********************************************************
@brief Describe the class of an Class context structure. That is an
arbitrary struct of which the first field is a pointer to an
Class struct (e.g. LibAVCodec.CodecContext, AVFormatContext etc.).
***********************************************************/
[CCode (cname="struct AVClass", cheader_filename="libavcodec/log.h")]
public struct Class {
    /***********************************************************
    @brief The name of the class; usually it is the same name as the
    context structure type to which the Class is associated.
    ***********************************************************/
    [CCode (cname="class_name")]
    public string class_name;

    /***********************************************************
    @brief A pointer to a function which returns the name of a context
    instance class_context associated with the class.
    ***********************************************************/
    [CCode (cname="item_name")]
    public ItemNameDelegate item_name;

    /***********************************************************
    @brief A pointer to the first option specified in the class if any or null

    @see @link av_set_default_options ()
    ***********************************************************/
    [CCode (cname="option")]
    public Option option;

    /***********************************************************
    @brief LIBAVUTIL_VERSION with which this structure was created.
    This is used to allow fields to be added without requiring major
    version bumps everywhere.
    ***********************************************************/
    [CCode (cname="version")]
    public int version;

    /***********************************************************
    @brief Offset in the structure where log_level_offset is stored.
    0 means there is no such variable
    ***********************************************************/
    [CCode (cname="log_level_offset_offset")]
    public int log_level_offset_offset;

    /***********************************************************
    @brief Offset in the structure where a pointer to the parent context for
    logging is stored. For example a decoder could pass its LibAVCodec.CodecContext
    to eval as such a parent context, which an av_log () implementation
    could then leverage to display the parent context.
    The offset can be null.
    ***********************************************************/
    [CCode (cname="parent_log_context_offset")]
    public int parent_log_context_offset;

    /***********************************************************
    @brief Return next LibAVUtil.Options-enabled child or null
    ***********************************************************/
    [CCode (cname="child_next")]
    public ChildNextDelegate child_next;

    /***********************************************************
    @brief Return an Class corresponding to the next potential
    LibAVUtil.Options-enabled child.

    The difference between child_next and this is that
    child_next iterates over _already existing_ objects, while
    child_class_next iterates over _all possible_ children.
    ***********************************************************/
    [CCode (cname="child_class_next")]
    public ChildClassNextDelegate child_class_next;

    /***********************************************************
    @brief Category used for visualization (like color)
    This is only set if the category is equal for all objects using this class.
    available since version (51 << 16 | 56 << 8 | 100)
    ***********************************************************/
    [CCode (cname="category")]
    public ClassCategory category;

    /***********************************************************
    @brief Callback to return the category.
    available since version (51 << 16 | 59 << 8 | 100)
    ***********************************************************/
    [CCode (cname="get_category")]
    public GetCategoryDelegate get_category;

    /***********************************************************
    @brief Callback to return the supported/allowed ranges.
    available since version (52.12)
    ***********************************************************/
    [CCode (cname="query_ranges")]
    public QueryRangesDelegate query_ranges;
}

/***********************************************************
@brief Iterate over potential LibAVUtil.Options-enabled children of parent.

@param prev result of a previous call to this function or null
@return Class corresponding to next potential child or null
***********************************************************/
[CCode (cname="av_opt_child_class_next", cheader_filename="libavcodec/opt.h")]
public Class av_opt_child_class_next (
    Class parent,
    Class prev
);

} // namespace LibAVUtil
