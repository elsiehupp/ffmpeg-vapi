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
/***********************************************************
@brief LibAVUtil.Options
@copyright 2005 Michael Niedermayer <michaelni@gmx.at>
***********************************************************/
namespace LibAVUtil {

/***********************************************************
@file LibAVUtil.Options
***********************************************************/

/***********************************************************
@defgroup avoptions LibAVUtil.Options
@ingroup LibAVUtil.Data
LibAVUtil.Options provide a generic system to declare options on arbitrary structs
("objects"). An option can have a help text, a type and a range of possible
values. Options may then be enumerated, read and written to.

@section avoptions_implement Implementing LibAVUtil.Options
This section describes how to add LibAVUtil.Options capabilities to a struct.

All LibAVUtil.Options-related information is stored in an Class. Therefore
the first member of the struct should be a pointer to an Class describing it.
The option field of the Class must be set to a null-terminated static array
of LibAVUtil.Options. Each Option must have a non-empty name, a type, a default
value and for number-type LibAVUtil.Options also a range of allowed values. It must
also declare an offset in bytes from the start of the struct, where the field
associated with this Option is located. Other fields in the Option struct
should also be set when applicable, but are not required.

The following example illustrates an LibAVUtil.Options-enabled struct:
@code
[CCode (cname="", cheader_filename="")]
public struct test_struct {
    Class class;
    int int_opt;
    char str_opt;
    uint8[] bin_opt;
    int bin_len;
}

[CCode (cname="", cheader_filename="")]
public const Option test_options[] = {
    { "test_int", "This is a test option of int type.", offsetof (test_struct, int_opt),
        OptionType.INT, { .i64 = -1 }, INT_MIN, int.MAX },
    { "test_str", "This is a test option of string type.", offsetof (test_struct, str_opt),
        OptionType.STRING },
    { "test_bin", "This is a test option of binary type.", offsetof (test_struct, bin_opt),
        OptionType.BINARY },
    { null },
}

[CCode (cname="", cheader_filename="")]
public const Class test_class = {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "test class";
        }
    }

    [CCode (cname="item_name", cheader_filename="")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }
    //  .option = test_options,
    [CCode (cname="version", cheader_filename="")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;
        }
    }
}
@endcode

Next, when allocating your struct, you must ensure that the Class pointer
is set to the correct value. Then, av_opt_set_defaults () can be called to
initialize defaults. After that the struct is ready to be used with the
LibAVUtil.Options API.

When cleaning up, you may use the av_opt_free () function to automatically
free all the allocated string and binary options.

Continuing with the above example:

@code
test_struct alloc_test_struct () {
    test_struct ret = av_mallocz (sizeof (*ret));
    ret.class = test_class;
    av_opt_set_defaults (ret);
    return ret;
}
void free_test_struct (out test_struct foo) {
    av_opt_free (*foo);
    av_freep (foo);
}
@endcode

@subsection avoptions_implement_nesting Nesting
    It may happen that an LibAVUtil.Options-enabled struct contains another
    LibAVUtil.Options-enabled struct as a member (e.g. LibAVCodec.CodecContext in
    LibAVCodec exports generic options, while its priv_data field exports
    codec-specific options). In such a case, it is possible to set up the
    parent struct to export a child's options. To do that, simply
    implement Class.child_next () and Class.child_class_next () in the
    parent struct's Class.
    Assuming that the test_struct from above now also contains a
    child_struct field:

    @code
    [CCode (cname="", cheader_filename="")]
    public struct child_struct {
        Class class;
        int flags_opt;
    } child_struct;

    [CCode (cname="", cheader_filename="")]
    public const Option child_opts[] = {
        { "test_flags", "This is a test option of flags type.",
        offsetof (child_struct, flags_opt), OptionType.FLAGS, { .i64 = 0 }, INT_MIN, int.MAX },
        { null },
    }

    [CCode (cname="", cheader_filename="")]
    public const Class child_class = {
        //  .class_name = "child class";
        //  .item_name = base.item_name,
        //  .option = child_opts,
        //  .version = LibAVUtil.Version.INT,
    }

    void *child_next (void *obj, void *prev) {
        test_struct t = obj;
        if (!prev && t.child_struct)
        return t.child_struct;
        return null
    }
    Class child_class_next (Class prev) {
        return prev ? null : &child_class;
    }
    @endcode
    Putting child_next () and child_class_next () as defined above into
    test_class will now make child_struct's options accessible through
    test_struct (again, proper setup as described above needs to be done on
    child_struct right after it is created).

    From the above example it might not be clear why both child_next ()
    and child_class_next () are needed. The distinction is that child_next ()
    iterates over actually existing objects, while child_class_next ()
    iterates over all possible child classes. E.g. if an LibAVCodec.CodecContext
    was initialized to use a codec which has private options, then its
    child_next () will return LibAVCodec.CodecContext.priv_data and finish
    iterating. OTOH child_class_next () on LibAVCodec.CodecContext.av_class will
    iterate over all available codecs with private options.

@subsection avoptions_implement_named_constants Named constants
    It is possible to create named constants for options. Simply set the unit
    field of the option the constants should apply to a string and
    create the constants themselves as options of type OptionType.CONST
    with their unit field set to the same string.
    Their default_val field should contain the value of the named
    constant.
    For example, to add some named constants for the test_flags option
    above, put the following into the child_opts array:
    @code
    { "test_flags", "This is a test option of flags type.",
     offsetof (child_struct, flags_opt), OptionType.FLAGS, { .i64 = 0 }, INT_MIN, int.MAX, "test_unit" },
    { "flag1", "This is a flag with value 16", 0, OptionType.CONST, { .i64 = 16 }, 0, 0, "test_unit" },
    @endcode

@section avoptions_use Using LibAVUtil.Options
This section deals with accessing options in an LibAVUtil.Options-enabled struct.
Such structs in FFmpeg are e.g. LibAVCodec.CodecContext in LibAVCodec or
AVFormatContext in libavformat.

@subsection avoptions_use_examine Examining LibAVUtil.Options
The basic functions for examining options are av_opt_next (), which iterates
over all options defined for one object, and av_opt_find (), which searches
for an option with the given name.

The situation is more complicated with nesting. An LibAVUtil.Options-enabled struct
may have LibAVUtil.Options-enabled children. Passing the OptionSearchFlags.SEARCH_CHILDREN flag
to av_opt_find () will make the function search children recursively.

For enumerating there are basically two cases. The first is when you want to
get all options that may potentially exist on the struct and its children
(e.g. when constructing documentation). In that case you should call
av_opt_child_class_next () recursively on the parent struct's Class. The
second case is when you have an already initialized struct with all its
children and you want to get all options that can be actually written or read
from it. In that case you should call av_opt_child_next () recursively (and
av_opt_next () on each result).

@subsection avoptions_use_get_set Reading and writing LibAVUtil.Options
When setting options, you often have a string read directly from the
user. In such a case, simply passing it to av_opt_set () is enough. For
non-string type options, av_opt_set () will parse the string according to the
option type.

Similarly av_opt_get () will read any option type and convert it to a string
which will be returned. Do not forget that the string is allocated, so you
have to free it with av_free ().

In some cases it may be more convenient to put all options into an
LibAVUtil.Dictionary and call av_opt_set_dict () on it. A specific case of this
are the format/codec open functions in lavf/lavc which take a dictionary
filled with option as a parameter. This makes it possible to set some options
that cannot be set otherwise, since e.g. the input file format is not known
before the file is actually opened.
***********************************************************/

/***********************************************************
@brief Option
***********************************************************/
[CCode (cname="struct AVOption", cheader_filename="ffmpeg/libavutil/opt.h")]
public struct Option {
    [CCode (cname="name")]
    public string name;

    /***********************************************************
    @brief Short English help text
    @todo What about other languages?
        ***********************************************************/
    [CCode (cname="help")]
    public string short_help_text;

    /***********************************************************
    @brief The offset relative to the context structure where the option
    value is stored. It should be 0 for named constants.
        ***********************************************************/
    [CCode (cname="offset")]
    public int offset;

    [CCode (cname="type")]
    public OptionType type;

    /***********************************************************
    @brief The default value for scalar options
        ***********************************************************/
    //  union {
    //      int64 i64;
    //      double dbl;
    //      string str;
    //      /***********************************************************
    TODO those are unused now
    //  ***********************************************************/
//      Rational q;
    //  } default_val;

    /***********************************************************
    @brief Minimum valid value for the option
        ***********************************************************/
    [CCode (cname="min")]
    public double min;

    /***********************************************************
    @brief Maximum valid value for the option
        ***********************************************************/
    [CCode (cname="max")]
    public double max;

    [CCode (cname="flags")]
    public OptionFlags flags;

    /***********************************************************
    @brief The logical unit to which the option belongs. Non-constant
    options and corresponding named constants share the same
    unit. May be null.
        ***********************************************************/
    [CCode (cname="unit")]
    public string unit;

    /***********************************************************
    @brief Look for an option in an object. Consider only options which
    have all the specified flags set.

    @param[in] obj A pointer to a struct whose first element is a
        pointer to an Class.
        Alternatively a double pointer to an Class, if
        OptionSearchFlags.FAKE_OBJECT_PARAMETER search flag is set.
    @param[in] name The name of the option to look for.
    @param[in] unit When searching for named constants, name of the unit
        it belongs to.
    @param opt_flags Find only options with all the specified flags set (AV_OPT_FLAG).
    @param search_flags A combination of OptionSearchFlags.

    @return A pointer to the option found, or null if no option
        was found.

    @note Options found with OptionSearchFlags.SEARCH_CHILDREN flag may not be settable
    directly with av_opt_set (). Use special calls which take an options
    LibAVUtil.Dictionary (e.g. avformat_open_input ()) to set options found with this
    flag.
        ***********************************************************/
    [CCode (cname="av_opt_find", cheader_filename="ffmpeg/libavutil/opt.h")]
    public Option av_opt_find (
        void *obj,
        string name,
        string unit,
        int opt_flags,
        int search_flags
    );

    /***********************************************************
    @brief Look for an option in an object. Consider only options which
    have all the specified flags set.

    @param[in] obj A pointer to a struct whose first element is a
        pointer to an Class.
        Alternatively a double pointer to an Class, if
        OptionSearchFlags.FAKE_OBJECT_PARAMETER search flag is set.
    @param[in] name The name of the option to look for.
    @param[in] unit When searching for named constants, name of the unit
        it belongs to.
    @param opt_flags Find only options with all the specified flags set (AV_OPT_FLAG).
    @param search_flags A combination of OptionSearchFlags.
    @param[out] target_obj if non-null, an object to which the option belongs will be
    written here. It may be different from obj if OptionSearchFlags.SEARCH_CHILDREN is present
    in search_flags. This parameter is ignored if search_flags contain
    OptionSearchFlags.FAKE_OBJECT_PARAMETER.

    @return A pointer to the option found, or null if no option
        was found.
        ***********************************************************/
    [CCode (cname="av_opt_find2", cheader_filename="ffmpeg/libavutil/opt.h")]
    public Option av_opt_find2 (
        void *obj,
        string name,
        string unit,
        int opt_flags,
        int search_flags,
        out void *target_obj
    );

    /***********************************************************
    @brief Iterate over all LibAVUtil.Options belonging to obj.

    @param obj an LibAVUtil.Options-enabled struct or a double pointer to an
        Class describing it.
    @param prev result of the previous call to av_opt_next () on this object
        or null
    @return next Option or null
        ***********************************************************/
    [CCode (cname="av_opt_next", cheader_filename="ffmpeg/libavutil/opt.h")]
    public Option av_opt_next (
        void *obj,
        Option prev
    );

    /***********************************************************
    @brief Iterate over LibAVUtil.Options-enabled children of obj.

    @param prev result of a previous call to this function or null
    @return next LibAVUtil.Options-enabled child or null
        ***********************************************************/
    [CCode (cname="av_opt_child_next", cheader_filename="ffmpeg/libavutil/opt.h")]
    public void *av_opt_child_next (
        void *obj,
        void *prev
    );

    /***********************************************************
    @defgroup opt_set_funcs Option setting functions
    Those functions set the field of obj with the given name to value.

    @param[in] obj A struct whose first element is a pointer to an Class.
    @param[in] name the name of the field to set
    @param[in] val The value to set. In case of av_opt_set () if the field is not
    of a string type, then the given string is parsed.
    SI postfixes and some named scalars are supported.
    If the field is of a numeric type, it has to be a numeric or named
    scalar. Behavior with more than one scalar and +- infix operators
    is undefined.
    If the field is of a flags type, it has to be a sequence of numeric
    scalars or named flags separated by '+' or '-'. Prefixing a flag
    with '+' causes it to be set without affecting the other flags;
    similarly, '-' unsets a flag.
    @param search_flags flags passed to av_opt_find2. I.e. if OptionSearchFlags.SEARCH_CHILDREN
    is passed here, then the option may be set on a child of obj.

    @return 0 if the value has been set, or an LibAVUtil.ErrorCode code in case of
    error:
    AVERROR_OPTION_NOT_FOUND if no matching option exists
    LibAVUtil.ErrorCode (ERANGE) if the value is out of range
    LibAVUtil.ErrorCode (EINVAL) if the value is not valid
        ***********************************************************/
    [CCode (cname="av_opt_set", cheader_filename="ffmpeg/libavutil/opt.h")]
    public int av_opt_set (
        void *obj,
        string name,
        string val,
        int search_flags
    );

    [CCode (cname="av_opt_set_int", cheader_filename="ffmpeg/libavutil/opt.h")]
    public int av_opt_set_int (
        void *obj,
        string name,
        int64 val,
        int search_flags
    );

    [CCode (cname="av_opt_set_double", cheader_filename="ffmpeg/libavutil/opt.h")]
    public int av_opt_set_double (
        void *obj,
        string name,
        double val,
        int search_flags
    );

    [CCode (cname="av_opt_set_q", cheader_filename="ffmpeg/libavutil/opt.h")]
    public int av_opt_set_q (
        void *obj,
        string name,
        Rational val,
        int search_flags
    );

    [CCode (cname="av_opt_set_bin", cheader_filename="ffmpeg/libavutil/opt.h")]
    public int av_opt_set_bin (
        void *obj,
        string name,
        uint8[] val,
        int size,
        int search_flags
    );

    [CCode (cname="av_opt_set_image_size", cheader_filename="ffmpeg/libavutil/opt.h")]
    public int av_opt_set_image_size (
        void *obj,
        string name,
        int w,
        int h,
        int search_flags
    );

    [CCode (cname="av_opt_set_pixel_fmt", cheader_filename="ffmpeg/libavutil/opt.h")]
    public int av_opt_set_pixel_fmt (
        void *obj, string name,
        PixelFormat fmt,
        int search_flags
    );

    [CCode (cname="av_opt_set_sample_fmt", cheader_filename="ffmpeg/libavutil/opt.h")]
    public int av_opt_set_sample_fmt (
        void *obj,
        string name,
        SampleFormat fmt,
        int search_flags
    );

    [CCode (cname="av_opt_set_video_rate", cheader_filename="ffmpeg/libavutil/opt.h")]
    public int av_opt_set_video_rate (
        void *obj,
        string name,
        Rational val,
        int search_flags
    );

    [CCode (cname="av_opt_set_channel_layout", cheader_filename="ffmpeg/libavutil/opt.h")]
    public int av_opt_set_channel_layout (
        void *obj,
        string name,
        int64 ch_layout,
        int search_flags
    );

    /***********************************************************
    @note Any old dictionary present is discarded and replaced with a copy of the new one. The
    caller still owns val is and responsible for freeing it.
        ***********************************************************/
    [CCode (cname="av_opt_set_dict_val", cheader_filename="ffmpeg/libavutil/opt.h")]
    public int av_opt_set_dict_val (
        void *obj,
        string name,
        LibAVUtil.Dictionary val,
        int search_flags
    );

    /***********************************************************
    @brief Set a binary option to an integer list.

    @param obj Class object to set options on
    @param name name of the binary option
    @param val pointer to an integer list (must have the correct type with
        regard to the contents of the list)
    @param term list terminator (usually 0 or -1)
    @param search_flags search flags
    @returns 0 or LibAVUtil.ErrorCode (EINVAL)
        ***********************************************************/
    [CCode (cname="av_opt_set_int_list", cheader_filename="ffmpeg/libavutil/opt.h")]
    public int av_opt_set_int_list (
        void *obj,
        string name,
        void *val,
        int term,
        int search_flags
    );

    /***********************************************************
    @defgroup opt_get_funcs Option getting functions
    Those functions get a value of the option with the given name from an object.

    @param[in] obj a struct whose first element is a pointer to an Class.
    @param[in] name name of the option to get.
    @param[in] search_flags flags passed to av_opt_find2. I.e. if OptionSearchFlags.SEARCH_CHILDREN
    is passed here, then the option may be found in a child of obj.
    @param[out] out_val value of the option will be written here
    @return >=0 on success, a negative error code otherwise
        ***********************************************************/
    /***********************************************************
    @note the returned string will be av_malloc ()ed and must be av_free ()ed by the caller

    @note if AV_OPT_ALLOW_NULL is set in search_flags in av_opt_get, and the option has
    OptionType.STRING or OptionType.BINARY and is set to null, *out_val will be set
    to null instead of an allocated empty string.
        ***********************************************************/
    [CCode (cname="av_opt_get", cheader_filename="ffmpeg/libavutil/opt.h")]
    public int av_opt_get (
        void *obj,
        string name,
        int search_flags,
        out uint8 out_val
    );

    [CCode (cname="av_opt_get_int", cheader_filename="ffmpeg/libavutil/opt.h")]
    public int av_opt_get_int (
        void *obj,
        string name,
        int search_flags,
        out int64 out_val
    );

    [CCode (cname="av_opt_get_double", cheader_filename="ffmpeg/libavutil/opt.h")]
    public int av_opt_get_double (
        void *obj,
        string name,
        int search_flags,
        out double out_val
    );

    [CCode (cname="av_opt_get_q", cheader_filename="ffmpeg/libavutil/opt.h")]
    public int av_opt_get_q (
        void *obj,
        string name,
        int search_flags,
        out Rational out_val
    );

    [CCode (cname="av_opt_get_image_size", cheader_filename="ffmpeg/libavutil/opt.h")]
    public int av_opt_get_image_size (
        void *obj,
        string name,
        int search_flags,
        out int w_out,
        out int h_out
    );

    [CCode (cname="av_opt_get_pixel_fmt", cheader_filename="ffmpeg/libavutil/opt.h")]
    public int av_opt_get_pixel_fmt (
        void *obj,
        string name,
        int search_flags,
        out PixelFormat out_fmt
    );

    [CCode (cname="av_opt_get_sample_fmt", cheader_filename="ffmpeg/libavutil/opt.h")]
    public int av_opt_get_sample_fmt (
        void *obj,
        string name,
        int search_flags,
        out SampleFormat out_fmt
    );

    [CCode (cname="av_opt_get_video_rate", cheader_filename="ffmpeg/libavutil/opt.h")]
    public int av_opt_get_video_rate (
        void *obj,
        string name,
        int search_flags,
        out Rational out_val
    );

    [CCode (cname="av_opt_get_channel_layout", cheader_filename="ffmpeg/libavutil/opt.h")]
    public int av_opt_get_channel_layout (
        void *obj,
        string name,
        int search_flags,
        out int64 ch_layout
    );

    /***********************************************************
    @param[out] out_val The returned dictionary is a copy of the actual value and must
    be freed with av_dict_free () by the caller
        ***********************************************************/
    [CCode (cname="av_opt_get_dict_val", cheader_filename="ffmpeg/libavutil/opt.h")]
    public int av_opt_get_dict_val (
        void *obj,
        string name,
        int search_flags,
        out LibAVUtil.Dictionary out_val
    );

    /***********************************************************
    @brief Gets a pointer to the requested field in a struct.
    This function allows accessing a struct even when its fields are moved or
    renamed since the application making the access has been compiled,

    @returns a pointer to the field, it can be cast to the correct type and read
        or written to.
        ***********************************************************/
    [CCode (cname="av_opt_ptr", cheader_filename="ffmpeg/libavutil/opt.h")]
    public void *av_opt_ptr (
        Class avclass,
        void *obj,
        string name
    );

    /***********************************************************
    @brief Free an OptionRangeList struct and set it to null.
        ***********************************************************/
    [CCode (cname="av_opt_freep_ranges", cheader_filename="ffmpeg/libavutil/opt.h")]
    public void av_opt_freep_ranges (
        OptionRangeList ranges
    );

    /***********************************************************
    @brief Get a list of allowed ranges for the given option.

    The returned list may depend on other fields in obj like for example profile.

    @param flags is a bitmask of flags, undefined flags should not be set and should be ignored
        OptionSearchFlags.FAKE_OBJECT_PARAMETER indicates that the obj is a double pointer to a Class instead of a full instance
        AV_OPT_MULTI_COMPONENT_RANGE indicates that function may return more than one component, @see @link OptionRangeList

    The result must be freed with av_opt_freep_ranges.

    @return number of compontents returned on success, a negative errro code otherwise
        ***********************************************************/
    [CCode (cname="av_opt_query_ranges", cheader_filename="ffmpeg/libavutil/opt.h")]
    public int av_opt_query_ranges (
        out OptionRangeList ranges,
        void *obj,
        string key,
        int flags
    );

    /***********************************************************
    @brief Copy options from input_buffer object into dest object.

    Options that require memory allocation (e.g. string or binary) are malloc'ed in dest object.
    Original memory allocated for such options is freed unless both input_buffer and dest options points to the same memory.

    @param dest Object to copy from
    @param input_buffer Object to copy into
    @return 0 on success, negative on error
        ***********************************************************/
    [CCode (cname="av_opt_copy", cheader_filename="ffmpeg/libavutil/opt.h")]
    public int av_opt_copy (
        out void *dest,
        void *input_buffer
    );

    /***********************************************************
    @brief Get a default list of allowed ranges for the given option.

    This list is constructed without using the Class.query_ranges () callback
    and can be used as fallback from within the callback.

    @param flags is a bitmask of flags, undefined flags should not be set and should be ignored
        OptionSearchFlags.FAKE_OBJECT_PARAMETER indicates that the obj is a double pointer to a Class instead of a full instance
        AV_OPT_MULTI_COMPONENT_RANGE indicates that function may return more than one component, @see @link OptionRangeList

    The result must be freed with av_opt_free_ranges.

    @return number of compontents returned on success, a negative errro code otherwise
        ***********************************************************/
    [CCode (cname="av_opt_query_ranges_default", cheader_filename="ffmpeg/libavutil/opt.h")]
    public int av_opt_query_ranges_default (
        out OptionRangeList ranges,
        void *obj,
        string key,
        int flags
    );

    /***********************************************************
    @brief Check if given option is set to its default value.

    Options o must belong to the obj. This function must not be called to check child's options state.
    @see @link av_opt_is_set_to_default_by_name ().

    @param obj Class object to check option on
    @param o option to be checked
    @return     >0 when option is set to its default,
        0 when option is not set its default,
        <0 on error
        ***********************************************************/
    [CCode (cname="av_opt_is_set_to_default", cheader_filename="ffmpeg/libavutil/opt.h")]
    public int av_opt_is_set_to_default (
        void *obj,
        Option o
    );

    /***********************************************************
    @brief Check if given option is set to its default value.

    @param obj Class object to check option on
    @param name option name
    @param search_flags combination of OptionSearchFlags
    @return    >0 when option is set to its default,
        0 when option is not set its default,
        <0 on error
        ***********************************************************/
    [CCode (cname="av_opt_is_set_to_default_by_name", cheader_filename="ffmpeg/libavutil/opt.h")]
    public int av_opt_is_set_to_default_by_name (
        void *obj,
        string name,
        int search_flags
    );

    /***********************************************************
    @defgroup opt_eval_funcs Evaluating option strings
    This group of functions can be used to evaluate option strings
    and get numbers out of them. They do the same thing as av_opt_set (),
    except the result is written into the caller-supplied pointer.

    @param obj a struct whose first element is a pointer to Class.
    @param o an option for which the string is to be evaluated.
    @param val string to be evaluated.
    @param *_out value of the string will be written here.

    @return 0 on success, a negative number on failure.
        ***********************************************************/
    [CCode (cname="av_opt_eval_flags", cheader_filename="ffmpeg/libavutil/opt.h")]
    public int av_opt_eval_flags (
        void *obj,
        Option o,
        string val,
        out int flags_out
    );

    [CCode (cname="av_opt_eval_int", cheader_filename="ffmpeg/libavutil/opt.h")]
    public int av_opt_eval_int (
        void *obj,
        Option o,
        string val,
        out int int_out
    );

    [CCode (cname="av_opt_eval_int64", cheader_filename="ffmpeg/libavutil/opt.h")]
    public int av_opt_eval_int64 (
        void *obj,
        Option o,
        string val,
        out int64 int64_out
    );

    [CCode (cname="av_opt_eval_float", cheader_filename="ffmpeg/libavutil/opt.h")]
    public int av_opt_eval_float (
        void *obj,
        Option o,
        string val,
        out float float_out
    );

    [CCode (cname="av_opt_eval_double", cheader_filename="ffmpeg/libavutil/opt.h")]
    public int av_opt_eval_double (
        void *obj,
        Option o,
        string val,
        out double double_out
    );

    [CCode (cname="av_opt_eval_q", cheader_filename="ffmpeg/libavutil/opt.h")]
    public int av_opt_eval_q (
        void *obj,
        Option o,
        string val,
        out Rational q_out
    );

    /***********************************************************
    @brief Show the obj options.

    @param req_flags requested flags for the options to show. Show only the
        options for which it is opt.flags & req_flags.
    @param rej_flags rejected flags for the options to show. Show only the
        options for which it is !(opt.flags & req_flags).
    @param av_log_obj log context to use for showing the options
        ***********************************************************/
    [CCode (cname="av_opt_show2", cheader_filename="ffmpeg/libavutil/opt.h")]
    public int av_opt_show2 (
        void *obj,
        void *av_log_obj,
        int req_flags,
        int rej_flags
    );

    /***********************************************************
    @brief Set the values of all Option fields to their default values.

    @param void_context an Option-enabled struct (its first member must be a pointer to Class)
        ***********************************************************/
    [CCode (cname="av_opt_set_defaults", cheader_filename="ffmpeg/libavutil/opt.h")]
    public void av_opt_set_defaults (
        void *void_context
    );

    /***********************************************************
    @brief Set the values of all Option fields to their default values. Only these
    Option fields for which (opt.flags & mask) == flags will have their
    default applied to void_context.

    @param void_context an Option-enabled struct (its first member must be a pointer to Class)
    @param mask combination of OptionFlags
    @param flags combination of OptionFlags
        ***********************************************************/
    [CCode (cname="av_opt_set_defaults2", cheader_filename="ffmpeg/libavutil/opt.h")]
    public void av_opt_set_defaults2 (
        void *void_context,
        OptionFlags mask,
        OptionFlags flags
    );

    /***********************************************************
    @brief Parse the key/value pairs list in opts. For each key/value pair
    found, stores the value in the field in class_context that is named like the
    key. class_context must be an Class context, storing is done using
    LibAVUtil.Options.

    @param opts options string to parse, may be null
    @param key_val_sep a 0-terminated list of characters used to
    separate key from value
    @param pairs_sep a 0-terminated list of characters used to separate
    two pairs from each other
    @return the number of successfully set key/value pairs, or a negative
    value corresponding to an LibAVUtil.ErrorCode code in case of error:
    LibAVUtil.ErrorCode (EINVAL) if opts cannot be parsed,
    the error code issued by av_opt_set () if a key/value pair
    cannot be set
        ***********************************************************/
    [CCode (cname="av_set_options_string", cheader_filename="ffmpeg/libavutil/opt.h")]
    public int av_set_options_string (
        void *class_context,
        string opts,
        string key_val_sep,
        string pairs_sep
    );

    /***********************************************************
    @brief Parse the key-value pairs list in opts. For each key=value pair found,
    set the value of the corresponding option in class_context.

    @param class_context the Class object to set options on
    @param opts the options string, key-value pairs separated by a
        delimiter
    @param shorthand a null-terminated array of options names for shorthand
        notation: if the first field in opts has no key part,
        the key is taken from the first element of shorthand;
        then again for the second, etc., until either opts is
        finished, shorthand is finished or a named option is
        found; after that, all options must be named
    @param key_val_sep a 0-terminated list of characters used to separate
        key from value, for example '='
    @param pairs_sep a 0-terminated list of characters used to separate
        two pairs from each other, for example ':' or ','
    @return the number of successfully set key=value pairs, or a negative
        value corresponding to an LibAVUtil.ErrorCode code in case of error:
        LibAVUtil.ErrorCode (EINVAL) if opts cannot be parsed,
        the error code issued by av_set_string3 () if a key/value pair
        cannot be set

    Options names must use only the following characters: a-z A-Z 0-9 - . / _
    Separators must use characters distinct from option names and from each
    other.
        ***********************************************************/
    [CCode (cname="av_opt_set_from_string", cheader_filename="ffmpeg/libavutil/opt.h")]
    public int av_opt_set_from_string (
        void *class_context,
        string opts,
        string[] shorthand,
        string key_val_sep,
        string pairs_sep
    );

    /***********************************************************
    @brief Free all allocated objects in obj.
        ***********************************************************/
    [CCode (cname="av_opt_free", cheader_filename="ffmpeg/libavutil/opt.h")]
    public void av_opt_free (
        void *obj
    );

    /***********************************************************
    @brief Check whether a particular flag is set in a flags field.

    @param field_name the name of the flag field option
    @param flag_name the name of the flag to check
    @return non-zero if the flag is set, zero if the flag isn't set,
        isn't of the right type, or the flags field doesn't exist.
        ***********************************************************/
    [CCode (cname="av_opt_flag_is_set", cheader_filename="ffmpeg/libavutil/opt.h")]
    public int av_opt_flag_is_set (
        void *obj,
        string field_name,
        string flag_name
    );

    /***********************************************************
    @brief Set all the options from a given dictionary on an object.

    @param obj a struct whose first element is a pointer to Class
    @param options options to process. This dictionary will be freed and replaced
        by a new one containing all options not found in obj.
        Of course this new dictionary needs to be freed by caller
        with av_dict_free ().

    @return 0 on success, a negative LibAVUtil.ErrorCode if some option was found in obj,
        but could not be set.

    @see @link av_dict_copy ()
        ***********************************************************/
    [CCode (cname="av_opt_set_dict", cheader_filename="ffmpeg/libavutil/opt.h")]
    public int av_opt_set_dict (
        void *obj,
        LibAVUtil.Dictionary options
    );

    /***********************************************************
    @brief Set all the options from a given dictionary on an object.

    @param obj a struct whose first element is a pointer to Class
    @param options options to process. This dictionary will be freed and replaced
        by a new one containing all options not found in obj.
        Of course this new dictionary needs to be freed by caller
        with av_dict_free ().
    @param search_flags A combination of OptionSearchFlags.

    @return 0 on success, a negative LibAVUtil.ErrorCode if some option was found in obj,
        but could not be set.

    @see @link av_dict_copy ()
        ***********************************************************/
    [CCode (cname="av_opt_set_dict2", cheader_filename="ffmpeg/libavutil/opt.h")]
    public int av_opt_set_dict2 (
        void *obj,
        LibAVUtil.Dictionary options,
        int search_flags
    );

    /***********************************************************
    @brief Extract a key-value pair from the beginning of a string.

    @param ropts pointer to the options string, will be updated to
        point to the rest of the string (one of the pairs_sep
        or the final NUL)
    @param key_val_sep a 0-terminated list of characters used to separate
        key from value, for example '='
    @param pairs_sep a 0-terminated list of characters used to separate
        two pairs from each other, for example ':' or ','
    @param flags a combination of @link OptionFlags flags
    @param rkey parsed key; must be freed using av_free ()
    @param rval parsed value; must be freed using av_free ()

    @return  >=0 for success, or a negative value corresponding to an
        LibAVUtil.ErrorCode code in case of error; in particular:
        LibAVUtil.ErrorCode (EINVAL) if no key is present
        ***********************************************************/
    [CCode (cname="av_opt_get_key_value", cheader_filename="ffmpeg/libavutil/opt.h")]
    public int av_opt_get_key_value (
        out string ropts,
        string key_val_sep,
        string pairs_sep,
        uint flags,
        out string rkey,
        out string rval
    );


}
} // namespace LibAVUtil
