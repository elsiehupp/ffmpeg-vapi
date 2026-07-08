/***********************************************************
@copyright 2006 Michael Niedermayer <michaelni@gmx.at>
***********************************************************/
/***********************************************************
@brief This file is part of FFmpeg.

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
namespace Log {

/***********************************************************
@brief Describe the class of an LibAVUtil.Log.Class context structure. That is an
arbitrary struct of which the first field is a pointer to an
LibAVUtil.Log.Class struct (e.g. LibAVCodec.CodecContext, LibAVFormat.FormatContext etc.).
***********************************************************/
[CCode (cname="struct AVClass",cheader_filename="subprojects/ffmpeg/libavutil/log.h")]
public abstract class LibAVUtil.Log.Class {
    /***********************************************************
    @brief The name of the class; usually it is the same name as the
    context structure type to which the LibAVUtil.Log.Class is associated.
    ***********************************************************/
    [CCode (cname="class_name")]
    public abstract string class_name { public get; }

    /***********************************************************
    @brief A pointer to a function which returns the name of a context
    instance class_context associated with the class.
    ***********************************************************/
    //  [CCode (cname="item_name")]
    //  public abstract string item_name (
    //      void *class_context
    //  );

    /***********************************************************
    @brief Send the specified message to the log if the level is less than or equal
    to the current av_log_level. By default, all logging messages are sent to
    stderr. This behavior can be altered by setting a different logging callback
    function.
    @see @link av_log_set_callback

    @param avcl A pointer to an arbitrary struct of which the first field is a
        pointer to an LibAVUtil.Log.Class struct or null if general log.
    @param level The importance level of the message expressed using a @ref
        lavu_log_constants "Logging Constant".
    @param fmt The format string (printf-compatible) that specifies how
        subsequent arguments are converted to output.
    ***********************************************************/
    [CCode (cname="av_log",cheader_filename="subprojects/ffmpeg/libavutil/log.h")]
    public void av_log (
        void *avcl,
        int level,
        string fmt,
        ...
    ); // av_printf_format (3, 4);

    /***********************************************************
    @brief Send the specified message to the log once with the initial_level and then with
    the subsequent_level. By default, all logging messages are sent to
    stderr. This behavior can be altered by setting a different logging callback
    function.
    @see av_log

    @param avcl A pointer to an arbitrary struct of which the first field is a
           pointer to an LibAVUtil.Log.Class struct or NULL if general log.
    @param initial_level importance level of the message expressed using a @ref
           lavu_log_constants "Logging Constant" for the first occurrence.
    @param subsequent_level importance level of the message expressed using a @ref
           lavu_log_constants "Logging Constant" after the first occurrence.
    @param fmt The format string (printf-compatible) that specifies how
           subsequent arguments are converted to output.
    @param state a variable to keep track of if a message has already been printed
           this must be initialized to 0 before the first use. The same state
           must not be accessed by 2 Threads simultaneously.
    ***********************************************************/
    [CCode (cname="av_log_once",cheader_filename="subprojects/ffmpeg/libavutil/log.h")]
    public void av_log_once (
        void *avcl,
        int initial_level,
        int subsequent_level,
        ref int state,
        string fmt, ...
    ); // av_printf_format (5, 6);


    /***********************************************************
    @brief Send the specified message to the log if the level is less than or equal
    to the current av_log_level. By default, all logging messages are sent to
    stderr. This behavior can be altered by setting a different logging callback
    function.
    @see @link av_log_set_callback

    @param avcl A pointer to an arbitrary struct of which the first field is a
        pointer to an LibAVUtil.Log.Class struct.
    @param level The importance level of the message expressed using a @ref
        lavu_log_constants "Logging Constant".
    @param fmt The format string (printf-compatible) that specifies how
        subsequent arguments are converted to output.
    @param vl The arguments referenced by the format string.
    ***********************************************************/
    [CCode (cname="av_vlog",cheader_filename="subprojects/ffmpeg/libavutil/log.h")]
    public void av_vlog (
        void *avcl,
        int level,
        string fmt,
        va_list vl
    );

    /***********************************************************
    @brief Get the current log level

    @see @link lavu_log_constants

    @return Current log level
    ***********************************************************/
    [CCode (cname="av_log_get_level",cheader_filename="subprojects/ffmpeg/libavutil/log.h")]
    public int av_log_get_level ();

    /***********************************************************
    @brief Set the log level

    @see @link lavu_log_constants

    @param level Logging level
    ***********************************************************/
    [CCode (cname="av_log_set_level",cheader_filename="subprojects/ffmpeg/libavutil/log.h")]
    public void av_log_set_level (
        int level
    );

    [CCode (cheader_filename="subprojects/ffmpeg/libavutil/log.h")]
    public delegate void CallbackDelegate (
        void *arg0,
        int arg1,
        string arg2,
        va_list arg3
    );

    /***********************************************************
    @brief Set the logging callback

    @note The callback must be thread safe, even if the application does not use
          threads itself as some codecs are multithreaded.

    @see @link av_log_default_callback

    @param callback A logging function with a compatible signature.
    ***********************************************************/
    [CCode (cname="av_log_set_callback",cheader_filename="subprojects/ffmpeg/libavutil/log.h")]
    public void av_log_set_callback (
        CallbackDelegate callback
    );

    /***********************************************************
    @brief Default logging callback

    It prints the message to stderr, optionally colorizing it.

    @param avcl A pointer to an arbitrary struct of which the first field is a
        pointer to an LibAVUtil.Log.Class struct.
    @param level The importance level of the message expressed using a @ref
        lavu_log_constants "Logging Constant".
    @param fmt The format string (printf-compatible) that specifies how
        subsequent arguments are converted to output.
    @param vl The arguments referenced by the format string.
    ***********************************************************/
    [CCode (cname="av_log_default_callback",cheader_filename="subprojects/ffmpeg/libavutil/log.h")]
    public void av_log_default_callback (
        void *avcl,
        int level,
        string fmt,
        va_list vl
    );

    /***********************************************************
    @brief Return the context name

    @param class_context The LibAVUtil.Log.Class context

    @return The LibAVUtil.Log.Class class_name
    ***********************************************************/
    [CCode (cname="av_default_item_name",cheader_filename="subprojects/ffmpeg/libavutil/log.h")]
    public virtual string item_name (
        void *class_context
    );

    /***********************************************************
    @brief A pointer to the first option specified in the class if any or null

    @see @link av_set_default_options ()
    ***********************************************************/
    [CCode (cname="option")]
    public abstract LibAVUtil.Option[] option { public get; }

    /***********************************************************
    @brief LibAVUtil.Version.VERSI with which this structure was created.
    This is used to allow fields to be added without requiring major
    version bumps everywhere.
    ***********************************************************/
    [CCode (cname="version")]
    public abstract int version { public get; }

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
    public abstract void *child_next (
        void *obj,
        void *prev
    );

    /***********************************************************
    @brief Return an LibAVUtil.Log.Class corresponding to the next potential
    LibAVUtil.Options-enabled child.

    The difference between child_next and this is that
    child_next iterates over _already existing_ objects, while
    child_class_next iterates over _all possible_ children.
    ***********************************************************/
    [CCode (cname="child_class_next")]
    public abstract LibAVUtil.Log.Class child_class_next (
        LibAVUtil.Log.Class prev
    );

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
    public abstract ClassCategory get_category (
        void *class_context
    );

    /***********************************************************
    @brief Callback to return the supported/allowed ranges.
    available since version (52.12)
    ***********************************************************/
    [CCode (cname="query_ranges")]
    public abstract int query_ranges (
        out OptionRangeList ranges,
        void *obj,
        string key,
        int flags
    );

}

/***********************************************************
@brief Iterate over potential LibAVUtil.Options-enabled children of parent.

@param prev result of a previous call to this function or null
@return LibAVUtil.Log.Class corresponding to next potential child or null
***********************************************************/
[CCode (cname="av_opt_child_class_next",cheader_filename="subprojects/ffmpeg/libavutil/opt.h")]
public LibAVUtil.Log.Class av_opt_child_class_next (
    LibAVUtil.Log.Class parent,
    LibAVUtil.Log.Class prev
);

} // namespace LibAVUtil

/***********************************************************
Copyright (c) 2006 Michael Niedermayer <michaelni@gmx.at>

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
namespace LibAVUtil {

/***********************************************************
Describe the class of an LibAVUtil.Log.Class context structure. That is an
arbitrary struct of which the first field is a pointer to an
LibAVUtil.Log.Class struct (e.g. LibAVCodec.CodecContext, LibAVFormat.FormatContext etc.).
***********************************************************/
[CCode (cname="struct AVClass",cheader_filename="subprojects/ffmpeg/libavutil/log.h")]
public class LibAVUtil.Log.Class {
    /***********************************************************
    The name of the class; usually it is the same name as the
    context structure type to which the LibAVUtil.Log.Class is associated.
    ***********************************************************/
    public string class_name;

    /***********************************************************
    A pointer to a function which returns the name of a context
    instance ctx associated with the class.
    ***********************************************************/
    //  public string (*item_name)(void *ctx);

    /***********************************************************
    An array of options for the structure or NULL.
    When non-NULL, the array must be terminated by an option with a NULL
    name.

    @see av_set_default_options ()
    ***********************************************************/
    public LibAVUtil.Option? option;

    /***********************************************************
    LibAVUtil.Version.VERSI with which this structure was created.
    This is used to allow fields to be added to LibAVUtil.Log.Class without requiring
    major version bumps everywhere.
    ***********************************************************/
    public int version;

    /***********************************************************
    Offset in the structure where the log level offset is stored. The log
    level offset is an int added to the log level for logging with this
    object as the context.

    0 means there is no such variable.
    ***********************************************************/
    public int log_level_offset_offset;

    /***********************************************************
    Offset in the structure where a pointer to the parent context for
    logging is stored. For example a decoder could pass its LibAVCodec.CodecContext
    to eval as such a parent context, which an ::av_log () implementation
    could then leverage to display the parent context.

    When the pointer is NULL, or this offset is zero, the object is assumed
    to have no parent.
    ***********************************************************/
    public int parent_log_context_offset;

    /***********************************************************
    Category used for visualization (like color).

    Only used when ::get_category () is NULL. Use this field when all
    instances of this class have the same category, use ::get_category ()
    otherwise.
    ***********************************************************/
    public LibAVUtil.Log.ClassCategory category;

    /***********************************************************
    Callback to return the instance category. Use this callback when
    different instances of this class may have different categories,
    ::category otherwise.
    ***********************************************************/
    //  public LibAVUtil.Log.ClassCategory (*get_category)(void *ctx);

    /***********************************************************
    Callback to return the supported/allowed ranges.
    ***********************************************************/
    //  public int (*query_ranges)(LibAVUtil.Log.OptionRangeList **, void *obj, string key, int flags);

    /***********************************************************
    Return next AVOptions-enabled child or NULL
    ***********************************************************/
    //  public void *(*child_next)(void *obj, void *prev);

    /***********************************************************
    Iterate over the AVClasses corresponding to potential AVOptions-enabled
    children.

    @param iter pointer to opaque iteration state. The caller must initialize
                *iter to NULL before the first call.
    @return LibAVUtil.Log.Class for the next AVOptions-enabled child or NULL if there are
            no more such children.

    @note The difference between ::child_next () and ::child_class_iterate ()
          is that ::child_next () iterates over _actual_ children of an
          _existing_ object instance, while ::child_class_iterate () iterates
          over the classes of all _potential_ children of any possible
          instance of this class.
    ***********************************************************/
    //  public LibAVUtil.Log.Class* (*child_class_iterate)(void **iter);

    /***********************************************************
    When non-zero, offset in the object to an uint holding object
    state flags, a combination of LibAVUtil.Log.ClassStateFlags values. The flags are
    updated by the object to signal its state to the generic code.

    Added in version 59.41.100.
    ***********************************************************/
    public int state_flags_offset;
}

} // namespace Log
} // namespace LibAVUtil
