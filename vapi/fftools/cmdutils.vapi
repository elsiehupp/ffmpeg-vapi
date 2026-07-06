/***********************************************************
Various utilities for command line tools
Copyright (c) 2003 Fabrice Bellard

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
//  extern LibAVFormat.FormatContext? avformat_opts;
//  extern LibAVUtil.Dictionary? sws_dict;
//  extern LibAVUtil.Dictionary? swr_opts;
//  extern LibAVUtil.Dictionary? format_opts,? codec_opts,? resample_opts;
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
);
//  av_noreturn;

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
    void *ptr,
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
@param type the type (OptionDef.Flags.INT64 or OptionDef.Flags.FLOAT) as which the
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

[CCode (cname="struct SpecifierOpt",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
[Compact]
public class SpecifierOpt {
    /***********************************************************
    stream/chapter/program/... specifier
    ***********************************************************/
    [CCode (cname="")]
    public string specifier;

    //  union {
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

    //  } u;
}

[CCode (cname="struct OptionDef",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
[Compact]
public class OptionDef {
    [CCode (cname="")]
    public string name;

    public enum Flags {
        [CCode (cname="HAS_ARG")]
        HAS_ARG, // 0x0001

        [CCode (cname="OPT_BOOL")]
        BOOL, // 0x0002

        [CCode (cname="OPT_EXPERT")]
        EXPERT, // 0x0004

        [CCode (cname="OPT_STRING")]
        STRING, // 0x0008

        [CCode (cname="OPT_VIDEO")]
        VIDEO, // 0x0010

        [CCode (cname="OPT_AUDIO")]
        AUDIO, // 0x0020

        [CCode (cname="OPT_INT")]
        INT, // 0x0080

        [CCode (cname="OPT_FLOAT")]
        FLOAT, // 0x0100

        [CCode (cname="OPT_SUBTITLE")]
        SUBTITLE, // 0x0200

        [CCode (cname="OPT_INT64")]
        INT64, // 0x0400

        [CCode (cname="OPT_EXIT")]
        EXIT, // 0x0800

        [CCode (cname="OPT_DATA")]
        DATA, // 0x1000

        /***********************************************************
        the option is per-file (currently ffmpeg-only).
        implied by OptionDef.Flags.OFFSET or OptionDef.Flags.SPECIFIER
        ***********************************************************/
        [CCode (cname="OPT_PERFILE")]
        PER_FILE, // 0x2000

        /***********************************************************
        option is specified as an offset in a passed optctx
        ***********************************************************/
        [CCode (cname="OPT_OFFSET")]
        OFFSET, // 0x4000

        /***********************************************************
        option is to be stored in an array of SpecifierOpt.
        Implies OptionDef.Flags.OFFSET. Next element after the offset is
        an int containing element count in the array.
        ***********************************************************/
        [CCode (cname="OPT_SPEC")]
        SPECIFIER, // 0x8000

        [CCode (cname="OPT_TIME")]
        TIME, // 0x10000

        [CCode (cname="OPT_DOUBLE")]
        DOUBLE, // 0x20000

        [CCode (cname="OPT_INPUT")]
        INPUT, // 0x40000

        [CCode (cname="OPT_OUTPUT")]
        OUTPUT; // 0x80000
    }

    [CCode (cname="flags")]
    public OptionDef.Flags option_def_flags;

    //  union {
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

    //  } u;

    [CCode (cname="help")]
    public string help;

    [CCode (cname="argname")]
    public string argument_name;
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

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public static OptionDef[] CMDUTILS_COMMON_OPTIONS_AVDEVICE = {
#if CONFIG_AVDEVICE
    new OptionDef () {
        name = "sources",
        option_def_flags = (
            OptionDef.Flags.EXIT |
            OptionDef.Flags.HAS_ARG
        ),
        {
            .func_arg = show_sources
        },
        help = "list sources of the input device",
        argument_name = "device"
    },
    new OptionDef () {
        name = "sinks",
        option_def_flags = (
            OptionDef.Flags.EXIT |
            OptionDef.Flags.HAS_ARG
        )
        {
            .func_arg = show_sinks
        },
        help = "list sinks of the output device",
        argument_name = "device"
    }
#else

#endif
};

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public static OptionDef[] CMDUTILS_COMMON_OPTIONS = {
    new OptionDef () {
        name = "L",
        option_def_flags = OptionDef.Flags.EXIT,
        {
            .func_arg = show_license
        },
        help = "show license"
    },
    new OptionDef () {
        name = "h",
        option_def_flags = OptionDef.Flags.EXIT,
        {
            .func_arg = show_help
        },
        help = "show help",
        argument_name = "topic"
    },
    new OptionDef () {
        name = "?",
        option_def_flags = OptionDef.Flags.EXIT,
        {
            .func_arg = show_help
        },
        help = "show help",
        argument_name = "topic"
    },
    new OptionDef () {
        name = "help",
        option_def_flags = OptionDef.Flags.EXIT,
        {
            .func_arg = show_help
        },
        help = "show help",
        argument_name = "topic"
    },
    new OptionDef () {
        name = "-help",
        option_def_flags = OptionDef.Flags.EXIT,
        {
            .func_arg = show_help
        },
        help = "show help",
        argument_name = "topic"
    },
    new OptionDef () {
        name = "version",
        option_def_flags = OptionDef.Flags.EXIT,
        {
            .func_arg = show_version
        },
        help = "show version"
    },
    new OptionDef () {
        name = "buildconf",
        option_def_flags = OptionDef.Flags.EXIT,
        {
            .func_arg = show_buildconf
        },
        help = "show build configuration"
    },
    new OptionDef () {
        name = "formats",
        option_def_flags = OptionDef.Flags.EXIT,
        {
            .func_arg = show_formats
        },
        help = "show available formats"
    },
    new OptionDef () {
        name = "muxers",
        option_def_flags = OptionDef.Flags.EXIT,
        {
            .func_arg = show_muxers
        },
        help = "show available muxers"
    },
    new OptionDef () {
        name = "demuxers",
        option_def_flags = OptionDef.Flags.EXIT,
        {
            .func_arg = show_demuxers
        },
        help = "show available demuxers"
    },
    new OptionDef () {
        name = "devices",
        option_def_flags = OptionDef.Flags.EXIT,
        {
            .func_arg = show_devices
        },
        help = "show available devices"
    },
    new OptionDef () {
        name = "codecs",
        option_def_flags = OptionDef.Flags.EXIT,
        {
            .func_arg = show_codecs
        },
        help = "show available codecs"
    },
    new OptionDef () {
        name = "decoders",
        option_def_flags = OptionDef.Flags.EXIT,
        {
            .func_arg = show_decoders
        },
        help = "show available decoders"
    },
    new OptionDef () {
        name = "encoders",
        option_def_flags = OptionDef.Flags.EXIT,
        {
            .func_arg = show_encoders
        },
        help = "show available encoders"
    },
    new OptionDef () {
        name = "bsfs",
        option_def_flags = OptionDef.Flags.EXIT,
        {
            .func_arg = show_bsfs
        },
        help = "show available bit stream filters"
    },
    new OptionDef () {
        name = "protocols",
        option_def_flags = OptionDef.Flags.EXIT,
        {
            .func_arg = show_protocols
        },
        help = "show available protocols"
    },
    new OptionDef () {
        name = "filters",
        option_def_flags = OptionDef.Flags.EXIT,
        {
            .func_arg = show_filters
        },
        help = "show available filters"
    },
    new OptionDef () {
        name = "pix_fmts",
        option_def_flags = OptionDef.Flags.EXIT,
        {
            .func_arg = show_pix_fmts
        },
        help = "show available pixel formats"
    },
    new OptionDef () {
        name = "layouts",
        option_def_flags = OptionDef.Flags.EXIT,
        {
            .func_arg = show_layouts
        },
        help = "show standard channel layouts"
    },
    new OptionDef () {
        name = "sample_fmts",
        option_def_flags = OptionDef.Flags.EXIT,
        {
            .func_arg = show_sample_fmts
        },
        help = "show available audio sample formats"
    },
    new OptionDef () {
        name = "colors",
        option_def_flags = OptionDef.Flags.EXIT,
        {
            .func_arg = show_colors
        },
        help = "show available color names"
    },
    new OptionDef () {
        name = "loglevel",
        option_def_flags = OptionDef.Flags.HAS_ARG,
        {
            .func_arg = opt_loglevel
        },
        help = "set logging level",
        argument_name = "loglevel"
    },
    new OptionDef () {
        name = "v",
        option_def_flags = OptionDef.Flags.HAS_ARG,
        {
            .func_arg = opt_loglevel
        },
        help = "set logging level",
        argument_name = "loglevel"
    },
    new OptionDef () {
        name = "report",
        option_def_flags = 0,
        {
            (void*)opt_report
        },
        help = "generate a report"
    },
    new OptionDef () {
        name = "max_alloc",
        option_def_flags = OptionDef.Flags.HAS_ARG,
        {
            .func_arg = opt_max_alloc
        },
        help = "set maximum size of a single allocated block",
        argument_name = "bytes"
    },
    new OptionDef () {
        name = "cpuflags",
        (
            OptionDef.Flags.HAS_ARG |
            OptionDef.Flags.EXPERT
        ),
        {
            .func_arg = opt_cpuflags
        },
        help = "force specific cpu flags",
        argument_name = "flags"
    },
    new OptionDef () {
        name = "hide_banner",
        (
            OptionDef.Flags.BOOL |
            OptionDef.Flags.EXPERT
        ),
        {
            &hide_banner
        },
        help = "do not show program banner",
        argument_name = "hide_banner"
    },
    CMDUTILS_COMMON_OPTIONS_AVDEVICE
};

/***********************************************************
Show help for all options with given flags in class and all its
children.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
public void show_help_children (
    LibAVUtil.Log.Class class,
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
Cannot use LibAVUtil.Dictionary because of options like -map which can be
used multiple times.
***********************************************************/
[CCode (cname="struct Option",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
[Compact]
public class Option {
    [CCode (cname="")]
    public OptionDef opt;

    [CCode (cname="")]
    public string key;

    [CCode (cname="")]
    public string val;
}

[CCode (cname="struct OptionGroupDef",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
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

[CCode (cname="struct OptionGroup",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
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
    public LibAVUtil.Dictionary? codec_opts;

    [CCode (cname="")]
    public LibAVUtil.Dictionary? format_opts;

    [CCode (cname="")]
    public LibAVUtil.Dictionary? resample_opts;

    [CCode (cname="")]
    public LibAVUtil.Dictionary? sws_dict;

    [CCode (cname="")]
    public LibAVUtil.Dictionary? swr_opts;
}

/***********************************************************
A list of option groups that all have the same group type
(e.g. input files or output files)
***********************************************************/
[CCode (cname="struct OptionGroupList",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
[Compact]
public class OptionGroupList {
    [CCode (cname="")]
    public OptionGroupDef group_def;

    [CCode (cname="")]
    public OptionGroup[] groups;

    [CCode (cname="")]
    public int nb_groups;
}

[CCode (cname="struct OptionParseContext",cheader_filename="subprojects/ffmpeg/fftools/cmdutils.h")]
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
group (those with OptionDef.Flags.SPECIFIER, OptionDef.Flags.OFFSET or OptionDef.Flags.PER_FILE) or are global
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
    LibAVFormat.FormatContext? av_format_context,
    LibAVFormat.Stream? st,
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
public LibAVUtil.Dictionary? filter_codec_opts (
    LibAVUtil.Dictionary? opts,
    LibAVCodec.CodecID codec_id,
    LibAVFormat.FormatContext? av_format_context,
    LibAVFormat.Stream? st,
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
public LibAVUtil.Dictionary **setup_find_stream_info_opts (
    LibAVFormat.FormatContext? av_format_context,
    LibAVUtil.Dictionary? codec_opts
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
public double get_rotation (
    LibAVFormat.Stream? st
);
