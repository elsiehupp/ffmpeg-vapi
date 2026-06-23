/***********************************************************
Various utilities for command line tools
copyright (c) 2003 Fabrice Bellard

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

//  #ifdef _WIN32
//  #undef main /***********************************************************
//      We don't want SDL to override our main ()
//  ***********************************************************/
//  #endif

/***********************************************************
program name, defined by the program for show_version ().
***********************************************************/
//  extern const char program_name[];

/***********************************************************
program birth year, defined by the program for show_banner ()
***********************************************************/
//  extern const int program_birth_year;

//  extern AVCodecContext? avcodec_opts[LibAVUtil.MediaType.NB];
//  extern AVFormatContext? avformat_opts;
//  extern AVDictionary? sws_dict;
//  extern AVDictionary? swr_opts;
//  extern AVDictionary? format_opts,? codec_opts,? resample_opts;
//  extern int hide_banner;

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public delegate void CallbackDelegate (
    int ret
);

/***********************************************************
Register a program-specific cleanup routine.
***********************************************************/
[CCode (cname="register_exit")]
public void register_exit (
    CallbackDelegate cb
);

/***********************************************************
Wraps exit with a program-specific cleanup routine.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public void exit_program (
    int ret
) av_noreturn;

/***********************************************************
Initialize dynamic library loading
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public void init_dynload ();

/***********************************************************
Initialize the cmdutils option system, in particular
allocate the *_opts contexts.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public void init_opts ();

/***********************************************************
Uninitialize the cmdutils option system, in particular
free the *_opts contexts and their contents.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public void uninit_opts ();

/***********************************************************
Trivial log callback.
Only suitable for opt_help and similar since it lacks prefix handling.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public void log_callback_help (
    void* ptr,
    int level,
    char* fmt,
    va_list vl
);

/***********************************************************
Override the cpuflags.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public int opt_cpuflags (
    void *optctx,
    string opt,
    string arg
);

/***********************************************************
Fallback for options that are not explicitly handled, these will be
parsed through AVOptions.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public int opt_default (
    void *optctx,
    string opt,
    string arg
);

/***********************************************************
Set the libav* libraries log level.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public int opt_loglevel (
    void *optctx,
    string opt,
    string arg
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public int opt_report (
    string opt
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public int opt_max_alloc (
    void *optctx,
    string opt,
    string arg
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public int opt_codec_debug (
    void *optctx,
    string opt,
    string arg
);

/***********************************************************
Limit the execution time.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public int opt_timelimit (
    void *optctx,
    string opt,
    string arg
);

/***********************************************************
Parse a string and return its corresponding value as a double.
Exit from the application if the string cannot be correctly
parsed or the corresponding value is invalid.

@param context the context of the value to be set (e.g. the
corresponding command line option name)
@param numstr the string to be parsed
@param type the type (OPT_INT64 or OPT_FLOAT) as which the
string should be parsed
@param min the minimum valid accepted value
@param max the maximum valid accepted value
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public double parse_number_or_die (
    string context,
    string numstr,
    int type,
    double min,
    double max
);

/***********************************************************
Parse a string specifying a time and return its corresponding
value as a number of microseconds. Exit from the application if
the string cannot be correctly parsed.

@param context the context of the value to be set (e.g. the
corresponding command line option name)
@param timestr the string to be parsed
@param is_duration a flag which tells how to interpret timestr, if
not zero timestr is interpreted as a duration, otherwise as a
date

@see av_parse_time ()
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public int64 parse_time_or_die (
    string context,
    string timestr,
    int is_duration
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
[Compact]
public class SpecifierOpt {
    /***********************************************************
    stream/chapter/program/... specifier
    ***********************************************************/
    [CCode (cname="")]
    public string specifier;

    union {
        [CCode (cname="")]
        public uint8[] str;

        [CCode (cname="")]
        public int i;

        [CCode (cname="")]
        public int64 i64;

        [CCode (cname="")]
        public uint64 ui64;

        [CCode (cname="")]
        public float f;

        [CCode (cname="")]
        public double dbl;

    } u;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
[Compact]
public class OptionDef {
    [CCode (cname="")]
    public string name;

    [CCode (cname="")]
    public int flags;

    public enum FooBar {
        [CCode (cname="")]
        HAS_ARG, // 0x0001

        [CCode (cname="")]
        OPT_BOOL, // 0x0002

        [CCode (cname="")]
        OPT_EXPERT, // 0x0004

        [CCode (cname="")]
        OPT_STRING, // 0x0008

        [CCode (cname="")]
        OPT_VIDEO, // 0x0010

        [CCode (cname="")]
        OPT_AUDIO, // 0x0020

        [CCode (cname="")]
        OPT_INT, // 0x0080

        [CCode (cname="")]
        OPT_FLOAT, // 0x0100

        [CCode (cname="")]
        OPT_SUBTITLE, // 0x0200

        [CCode (cname="")]
        OPT_INT64, // 0x0400

        [CCode (cname="")]
        OPT_EXIT, // 0x0800

        [CCode (cname="")]
        OPT_DATA, // 0x1000

        /***********************************************************
        the option is per-file (currently ffmpeg-only).
        implied by OPT_OFFSET or OPT_SPEC
        ***********************************************************/
        [CCode (cname="")]
        OPT_PERFILE, // 0x2000

        /***********************************************************
        option is specified as an offset in a passed optctx
        ***********************************************************/
        [CCode (cname="")]
        OPT_OFFSET, // 0x4000

        /***********************************************************
        option is to be stored in an array of SpecifierOpt.
        Implies OPT_OFFSET. Next element after the offset is
        an int containing element count in the array.
        ***********************************************************/
        [CCode (cname="")]
        OPT_SPEC, // 0x8000

        [CCode (cname="")]
        OPT_TIME, // 0x10000

        [CCode (cname="")]
        OPT_DOUBLE, // 0x20000

        [CCode (cname="")]
        OPT_INPUT, // 0x40000

        [CCode (cname="")]
        OPT_OUTPUT; // 0x80000
    }

    union {
        [CCode (cname="")]
        public void *dst_ptr;

        public delegate int FuncArgDelegate (
            void *data,
            string string_1,
            string string_2
        );

        [CCode (cname="func_arg")]
        public FuncArgDelegate func_arg;

        [CCode (cname="")]
        public size_t off;

    } u;

    [CCode (cname="")]
    public string help;

    [CCode (cname="")]
    public string argname;
}

/***********************************************************
Print help for all options matching specified flags.

@param options a list of options
@param msg title of this group. Only printed if at least one option matches.
@param req_flags print only options which have all those flags set.
@param rej_flags don't print options which have any of those flags set.
@param alt_flags print only options that have at least one of those flags set
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public void show_help_options (
    OptionDef[] options,
    string msg,
    int req_flags,
    int rej_flags,
    int alt_flags
);

#if CONFIG_AVDEVICE
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public define CMDUTILS_COMMON_OPTIONS_AVDEVICE
    {
        "sources",
        OPT_EXIT | HAS_ARG,
        {
            .func_arg = show_sources
        },
        "list sources of the input device",
        "device"
    },
    {
        "sinks",
        OPT_EXIT | HAS_ARG,
        {
            .func_arg = show_sinks
        },
        "list sinks of the output device",
        "device"
    },

#else
//  #define CMDUTILS_COMMON_OPTIONS_AVDEVICE
#endif

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public define CMDUTILS_COMMON_OPTIONS
    {
        "L",
        OPT_EXIT,
        {
            .func_arg = show_license
        },
        "show license"
    },
    {
        "h",
        OPT_EXIT,
        {
            .func_arg = show_help
        },
        "show help",
        "topic"
    },
    {
        "?",
        OPT_EXIT,
        {
            .func_arg = show_help
        },
        "show help",
        "topic"
    },
    {
        "help",
        OPT_EXIT,
        {
            .func_arg = show_help
        },
        "show help",
        "topic"
    },
    {
        "-help",
        OPT_EXIT,
        {
            .func_arg = show_help
        },
        "show help",
        "topic"
    },
    {
        "version",
        OPT_EXIT,
        {
            .func_arg = show_version
        },
        "show version"
    },
    {
        "buildconf",
        OPT_EXIT,
        {
            .func_arg = show_buildconf
        },
        "show build configuration"
    },
    {
        "formats",
        OPT_EXIT,
        {
            .func_arg = show_formats
        },
        "show available formats"
    },
    {
        "muxers",
        OPT_EXIT,
        {
            .func_arg = show_muxers
        },
        "show available muxers"
    },
    {
        "demuxers",
        OPT_EXIT,
        {
            .func_arg = show_demuxers
        },
        "show available demuxers"
    },
    {
        "devices",
        OPT_EXIT,
        {
            .func_arg = show_devices
        },
        "show available devices"
    },
    {
        "codecs",
        OPT_EXIT,
        {
            .func_arg = show_codecs
        },
        "show available codecs"
    },
    {
        "decoders",
        OPT_EXIT,
        {
            .func_arg = show_decoders
        },
        "show available decoders"
    },
    {
        "encoders",
        OPT_EXIT,
        {
            .func_arg = show_encoders
        },
        "show available encoders"
    },
    {
        "bsfs",
        OPT_EXIT,
        {
            .func_arg = show_bsfs
        },
        "show available bit stream filters"
    },
    {
        "protocols",
        OPT_EXIT,
        {
            .func_arg = show_protocols
        },
        "show available protocols"
    },
    {
        "filters",
        OPT_EXIT,
        {
            .func_arg = show_filters
        },
        "show available filters"
    },
    {
        "pix_fmts",
        OPT_EXIT,
        {
            .func_arg = show_pix_fmts
        },
        "show available pixel formats"
    },
    {
        "layouts",
        OPT_EXIT,
        {
            .func_arg = show_layouts
        },
        "show standard channel layouts"
    },
    {
        "sample_fmts",
        OPT_EXIT,
        {
            .func_arg = show_sample_fmts
        },
        "show available audio sample formats"
    },
    {
        "colors",
        OPT_EXIT,
        {
            .func_arg = show_colors
        },
        "show available color names"
    },
    {
        "loglevel",
        HAS_ARG,
        {
            .func_arg = opt_loglevel
        },
        "set logging level",
        "loglevel"
    },
    {
        "v",
        HAS_ARG,
        {
            .func_arg = opt_loglevel
        },
        "set logging level",
        "loglevel"
    },
    {
        "report",
        0,
        {
            (void*)opt_report
        },
        "generate a report"
    },
    {
        "max_alloc",
        HAS_ARG,
        {
            .func_arg = opt_max_alloc
        },
        "set maximum size of a single allocated block",
        "bytes"
    },
    {
        "cpuflags",
        HAS_ARG | OPT_EXPERT,
        {
            .func_arg = opt_cpuflags
        },
        "force specific cpu flags",
        "flags"
    },
    {
        "hide_banner",
        OPT_BOOL | OPT_EXPERT,
        {
            &hide_banner
        },
        "do not show program banner",
        "hide_banner"
    },
    CMDUTILS_COMMON_OPTIONS_AVDEVICE

/***********************************************************
Show help for all options with given flags in class and all its
children.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public void show_help_children (
    AVClass class,
    int flags
);

/***********************************************************
Per-fftool specific help handler. Implemented in each
fftool, called by show_help ().
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public void show_help_default (
    string opt,
    string arg
);

/***********************************************************
Generic -h handler common to all fftools.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public int show_help (
    void *optctx,
    string opt,
    string arg
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public delegate void ParseArgDelegate (
    void *optctx,
    string str
);

/***********************************************************
Parse the command line arguments.

@param optctx an opaque options context
@param argc   number of command line arguments
@param argv   values of command line arguments
@param options Array with the definitions required to interpret every
option of the form: -option_name [argument]
@param parse_arg_function Name of the function called to process every
argument without a leading option name flag. NULL if such arguments do
not have to be processed.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public void parse_options (
    void *optctx,
    int argc,
    string? argv,
    OptionDef? options,
    ParseArgDelegate parse_arg_function
);

/***********************************************************
Parse one given option.

@return on success 1 if arg was consumed, 0 otherwise; negative number on error
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public int parse_option (
    void *optctx,
    string opt,
    string arg,
    OptionDef? options
);

/***********************************************************
An option extracted from the commandline.
Cannot use AVDictionary because of options like -map which can be
used multiple times.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
[Compact]
public class Option {
    [CCode (cname="")]
    public OptionDef opt;

    [CCode (cname="")]
    public string key;

    [CCode (cname="")]
    public string val;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
[Compact]
public class OptionGroupDef {
    /***********************************************************
    group name
    ***********************************************************/
    [CCode (cname="")]
    public string name;

    /***********************************************************
    Option to be used as group separator. Can be NULL for groups
    which are terminated by a non-option argument (e.g. ffmpeg
    output files)
    ***********************************************************/
    [CCode (cname="")]
    public string sep;

    /***********************************************************
    Option flags that must be set on each option that is
    applied to this group
    ***********************************************************/
    [CCode (cname="")]
    public int flags;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
[Compact]
public class OptionGroup {
    [CCode (cname="")]
    public OptionGroupDef group_def;

    [CCode (cname="")]
    public string arg;

    [CCode (cname="")]
    public Option? opts;

    [CCode (cname="")]
    public int nb_opts;

    [CCode (cname="")]
    public AVDictionary? codec_opts;

    [CCode (cname="")]
    public AVDictionary? format_opts;

    [CCode (cname="")]
    public AVDictionary? resample_opts;

    [CCode (cname="")]
    public AVDictionary? sws_dict;

    [CCode (cname="")]
    public AVDictionary? swr_opts;
}

/***********************************************************
A list of option groups that all have the same group type
(e.g. input files or output files)
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
[Compact]
public class OptionGroupList {
    [CCode (cname="")]
    public OptionGroupDef group_def;

    [CCode (cname="")]
    public OptionGroup[] groups;

    [CCode (cname="")]
    public int nb_groups;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
[Compact]
public class OptionParseContext {
    [CCode (cname="")]
    public OptionGroup global_opts;

    [CCode (cname="")]
    public OptionGroupList groups;

    [CCode (cname="")]
    public int nb_groups;

    /***********************************************************
    parsing state
    ***********************************************************/
    [CCode (cname="")]
    public OptionGroup cur_group;
}

/***********************************************************
Parse an options group and write results into optctx.

@param optctx an app-specific options context. NULL for global options group
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public int parse_optgroup (
    void *optctx,
    OptionGroup? g
);

/***********************************************************
Split the commandline into an intermediate form convenient for further
processing.

The commandline is assumed to be composed of options which either belong to a
group (those with OPT_SPEC, OPT_OFFSET or OPT_PERFILE) or are global
(everything else).

A group (defined by an OptionGroupDef struct) is a sequence of options
terminated by either a group separator option (e.g. -i) or a parameter that
is not an option (doesn't start with -). A group without a separator option
must always be first in the supplied groups list.

All options within the same group are stored in one OptionGroup struct in an
OptionGroupList, all groups with the same group definition are stored in one
OptionGroupList in OptionParseContext.groups. The order of group lists is the
same as the order of group definitions.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public int split_commandline (
    OptionParseContext? octx,
    int argc,
    string argv[],
    OptionDef? options,
    OptionGroupDef? groups,
    int nb_groups
);

/***********************************************************
Free all allocated memory in an OptionParseContext.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public void uninit_parse_context (
    OptionParseContext? octx
);

/***********************************************************
Find the '-loglevel' option in the command line args and apply it.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public void parse_loglevel (
    int argc
    string? argv,
    OptionDef? options
);

/***********************************************************
Return index of option opt in argv or 0 if not found.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public int locate_option (
    int argc,
    string? argv,
    OptionDef? options,
    string optname
);

/***********************************************************
Check if the given stream matches a stream specifier.

@param av_format_context  Corresponding format context.
@param st Stream from av_format_context to be checked.
@param spec A stream specifier of the [v|a|s|d]:[\<stream index\>] form.

@return 1 if the stream matches, 0 if it doesn't, <0 on error
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public int check_stream_specifier (
    AVFormatContext? av_format_context,
    AVStream? st,
    string spec
);

/***********************************************************
Filter out options for given codec.

Create a new options dictionary containing only the options from
opts which apply to the codec with ID codec_id.

@param opts     dictionary to place options in
@param codec_id ID of the codec that should be filtered for
@param av_format_context Corresponding format context.
@param st A stream from av_format_context for which the options should be filtered.
@param codec The particular codec for which the options should be filtered.
             If null, the default one is looked up according to the codec id.
@return a pointer to the created dictionary
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public AVDictionary? filter_codec_opts (
    AVDictionary? opts,
    AVCodecID codec_id,
    AVFormatContext? av_format_context,
    AVStream? st,
    AVCodec? codec
);

/***********************************************************
Setup AVCodecContext options for avformat_find_stream_info ().

Create an array of dictionaries, one dictionary for each stream
contained in av_format_context.
Each dictionary will contain the options from codec_opts which can
be applied to the corresponding stream codec context.

@return pointer to the created array of dictionaries, NULL if it
cannot be created
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public AVDictionary **setup_find_stream_info_opts (
    AVFormatContext? av_format_context,
    AVDictionary? codec_opts
);

/***********************************************************
Print an error message to stderr, indicating filename and a human
readable description of the error code err.

If strerror_r () is not available the use of this function in a
multithreaded application may be unsafe.

@see av_strerror ()
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public void print_error (
    string filename,
    int err
);

/***********************************************************
Print the program banner to stderr. The banner contents depend on the
current version of the repository and of the libav* libraries used by
the program.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public void show_banner (
    int argc,
    string? argv,
    OptionDef? options
);

/***********************************************************
Print the version of the program to stdout. The version message
depends on the current versions of the repository and of the libav*
libraries.
This option processing function does not utilize the arguments.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public int show_version (
    void *optctx,
    string opt,
    string arg
);

/***********************************************************
Print the build configuration of the program to stdout. The contents
depend on the definition of FFMPEG_CONFIGURATION.
This option processing function does not utilize the arguments.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public int show_buildconf (
    void *optctx,
    string opt,
    string arg
);

/***********************************************************
Print the license of the program to stdout. The license depends on
the license of the libraries compiled into the program.
This option processing function does not utilize the arguments.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public int show_license (
    void *optctx,
    string opt,
    string arg
);

/***********************************************************
Print a listing containing all the formats supported by the
program (including devices).
This option processing function does not utilize the arguments.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public int show_formats (
    void *optctx,
    string opt,
    string arg
);

/***********************************************************
Print a listing containing all the muxers supported by the
program (including devices).
This option processing function does not utilize the arguments.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public int show_muxers (
    void *optctx,
    string opt,
    string arg
);

/***********************************************************
Print a listing containing all the demuxer supported by the
program (including devices).
This option processing function does not utilize the arguments.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public int show_demuxers (
    void *optctx,
    string opt,
    string arg
);

/***********************************************************
Print a listing containing all the devices supported by the
program.
This option processing function does not utilize the arguments.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public int show_devices (
    void *optctx,
    string opt,
    string arg
);

#if CONFIG_AVDEVICE
/***********************************************************
Print a listing containing autodetected sinks of the output device.
Device name with options may be passed as an argument to limit results.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public int show_sinks (
    void *optctx,
    string opt,
    string arg
);

/***********************************************************
Print a listing containing autodetected sources of the input device.
Device name with options may be passed as an argument to limit results.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public int show_sources (
    void *optctx,
    string opt,
    string arg
);
#endif

/***********************************************************
Print a listing containing all the codecs supported by the
program.
This option processing function does not utilize the arguments.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public int show_codecs (
    void *optctx,
    string opt,
    string arg
);

/***********************************************************
Print a listing containing all the decoders supported by the
program.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public int show_decoders (
    void *optctx,
    string opt,
    string arg
);

/***********************************************************
Print a listing containing all the encoders supported by the
program.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public int show_encoders (
    void *optctx,
    string opt,
    string arg
);

/***********************************************************
Print a listing containing all the filters supported by the
program.
This option processing function does not utilize the arguments.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public int show_filters (
    void *optctx,
    string opt,
    string arg
);

/***********************************************************
Print a listing containing all the bit stream filters supported by the
program.
This option processing function does not utilize the arguments.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public int show_bsfs (
    void *optctx,
    string opt,
    string arg
);

/***********************************************************
Print a listing containing all the protocols supported by the
program.
This option processing function does not utilize the arguments.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public int show_protocols (
    void *optctx,
    string opt,
    string arg
);

/***********************************************************
Print a listing containing all the pixel formats supported by the
program.
This option processing function does not utilize the arguments.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public int show_pix_fmts (
    void *optctx,
    string opt,
    string arg
);

/***********************************************************
Print a listing containing all the standard channel layouts supported by
the program.
This option processing function does not utilize the arguments.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public int show_layouts (
    void *optctx,
    string opt,
    string arg
);

/***********************************************************
Print a listing containing all the sample formats supported by the
program.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public int show_sample_fmts (
    void *optctx,
    string opt,
    string arg
);

/***********************************************************
Print a listing containing all the color names and values recognized
by the program.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public int show_colors (
    void *optctx,
    string opt,
    string arg
);

/***********************************************************
Return a positive value if a line read from standard input
starts with [yY], otherwise return 0.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public int read_yesno ();

/***********************************************************
Get a file corresponding to a preset file.

If is_path is non-zero, look for the file in the path preset_name.
Otherwise search for a file named arg.ffpreset in the directories
$FFMPEG_DATADIR (if set), $HOME/.ffmpeg, and in the datadir defined
at configuration time or in a "ffpresets" folder along the executable
on win32, in that order. If no such file is found and
codec_name is defined, then search for a file named
codec_name-preset_name.avpreset in the above-mentioned directories.

@param filename buffer where the name of the found filename is written
@param filename_size size in bytes of the filename buffer
@param preset_name name of the preset to search
@param is_path tell if preset_name is a filename path
@param codec_name name of the codec for which to look for the
preset, may be NULL
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public FILE? get_preset_file (
    string filename,
    size_t filename_size,
    string preset_name,
    int is_path,
    string codec_name
);

/***********************************************************
Realloc array to hold new_size elements of elem_size.
Calls exit () on failure.

@param array array to reallocate
@param elem_size size in bytes of each element
@param size new element count will be written here
@param new_size number of elements to place in reallocated array
@return reallocated array
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public void *grow_array (
    void *array,
    int elem_size,
    out int size,
    int new_size
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public define media_type_string LibAVUtil.MediaType.to_string

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public define GROW_ARRAY (
    void *array,
    void *nb_elems
);
//  {
//      array = grow_array (
//          array,
//          sizeof (*array),
//          &nb_elems,
//          nb_elems + 1
//      );
//  }

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public define GET_PIX_FMT_NAME (
    void *pix_fmt
);
//  {
//      string name = av_get_pix_fmt_name (pix_fmt);
//  }

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public define GET_CODEC_NAME (
    void *id
);
//  {
//      string name = avcodec_descriptor_get (id)->name;
//  }

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public define GET_SAMPLE_FMT_NAME (
    void *sample_fmt
);
//  {
//      string name = av_get_sample_fmt_name (sample_fmt);
//  }

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public define GET_SAMPLE_RATE_NAME (
    void *rate
);
//  {
//      char name[16];
//      snprintf (
//          name,
//          sizeof (name),
//          "%d",
//          rate
//      );
//  }

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public define GET_CH_LAYOUT_NAME (
    void *ch_layout
);
//  {
//      char name[16];
//      snprintf (
//          name,
//          sizeof (name),
//          "0x%"PRIx64,
//          ch_layout
//      );
//  }

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public define GET_CH_LAYOUT_DESC (
    void *ch_layout
);
//  {
//      char name[128];
//      av_get_channel_layout_string (
//          name,
//          sizeof (name),
//          0,
//          ch_layout
//      );
//  }

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public double get_rotation (
    AVStream? st
);
