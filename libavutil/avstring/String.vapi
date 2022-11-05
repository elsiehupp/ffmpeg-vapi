/***********************************************************
@copyright 2007 Mans Rullgard

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
namespace String {

/***********************************************************
@addtogroup LibAVUtil.String
***********************************************************/

/***********************************************************
@brief Return non-zero if pfx is a prefix of str. If it is, *ptr is set to
the address of the first character in str after the prefix.

@param str input string
@param pfx prefix to test
@param ptr updated if the prefix is matched inside str
@return non-zero if the prefix matches, zero otherwise
***********************************************************/
[CCode (cname="av_strstart", cheader_filename="ffmpeg/libavutil/avstring.h")]
public int av_strstart (
    string str,
    string pfx,
    out string ptr
);

/***********************************************************
@brief Return non-zero if pfx is a prefix of str independent of case. If
it is, *ptr is set to the address of the first character in str
after the prefix.

@param str input string
@param pfx prefix to test
@param ptr updated if the prefix is matched inside str
@return non-zero if the prefix matches, zero otherwise
***********************************************************/
[CCode (cname="av_stristart", cheader_filename="ffmpeg/libavutil/avstring.h")]
public int av_stristart (
    string str,
    string pfx,
    out string ptr
);

/***********************************************************
@brief Locate the first case-independent occurrence in the string haystack
of the string needle. A zero-length string needle is considered to
match at the start of haystack.

This function is a case-insensitive version of the standard strstr ().

@param haystack string to search in
@param needle string to search for
@return pointer to the located match within haystack
    or a null pointer if no match
***********************************************************/
[CCode (cname="av_stristr", cheader_filename="ffmpeg/libavutil/avstring.h")]
public string av_stristr (
    string haystack,
    string needle
);

/***********************************************************
@brief Locate the first occurrence of the string needle in the string haystack
where not more than hay_length characters are searched. A zero-length
string needle is considered to match at the start of haystack.

This function is a length-limited version of the standard strstr ().

@param haystack string to search in
@param needle string to search for
@param hay_length length of string to search in
@return pointer to the located match within haystack
    or a null pointer if no match
***********************************************************/
[CCode (cname="av_strnstr", cheader_filename="ffmpeg/libavutil/avstring.h")]
public string av_strnstr (
    string haystack,
    string needle,
    size_t hay_length
);

/***********************************************************
@brief Copy the string input_buffer to output_buffer, but no more than size - 1 bytes, and
null-terminate output_buffer.

This function is the same as BSD strlcpy ().

@param output_buffer destination buffer
@param input_buffer source string
@param size size of output_buffer buffer
@return the length of input_buffer

@warning since the return value is the length of input_buffer, input_buffer absolutely
_must_ be a properly 0-terminated string, otherwise this will read beyond
the end of the buffer and possibly crash.
***********************************************************/
[CCode (cname="av_strlcpy", cheader_filename="ffmpeg/libavutil/avstring.h")]
public size_t av_strlcpy (
    out string output_buffer,
    string input_buffer,
    size_t size
);

/***********************************************************
@brief Append the string input_buffer to the string output_buffer, but to a total length of
no more than size - 1 bytes, and null-terminate output_buffer.

This function is similar to BSD strlcat (), but differs when
size <= strlen (output_buffer).

@param output_buffer destination buffer
@param input_buffer source string
@param size size of output_buffer buffer
@return the total length of input_buffer and output_buffer

@warning since the return value use the length of input_buffer and output_buffer, these
absolutely _must_ be a properly 0-terminated strings, otherwise this
will read beyond the end of the buffer and possibly crash.
***********************************************************/
[CCode (cname="av_strlcat", cheader_filename="ffmpeg/libavutil/avstring.h")]
public size_t av_strlcat (
    out string output_buffer,
    string input_buffer,
    size_t size
);

/***********************************************************
@brief Append output to a string, according to a format. Never write out of
the output_buffer buffer, and always put a terminating 0 within
the buffer.
@param output_buffer destination buffer (string to which the output is
    appended)
@param size total size of the output_buffer buffer
@param fmt printf-compatible format string, specifying how the
    following parameters are used
@return the length of the string that would have been generated
    if enough space had been available
***********************************************************/
[CCode (cname="av_strlcatf", cheader_filename="ffmpeg/libavutil/avstring.h")]
public size_t av_strlcatf (
    out string output_buffer,
    size_t size,
    string fmt,
    ...
); // av_printf_format (3, 4);

/***********************************************************
@brief Get the count of continuous non zero chars starting from the beginning.

@param len maximum number of characters to check in the string, that
    is the maximum value which is returned by the function
***********************************************************/
[CCode (cname="av_strnlen", cheader_filename="ffmpeg/libavutil/avstring.h")]
public static size_t av_strnlen (
    string s,
    size_t len
);

/***********************************************************
@brief Print arguments following specified format into a large enough auto
allocated buffer. It is similar to GNU asprintf ().
@param fmt printf-compatible format string, specifying how the
    following parameters are used.
@return the allocated string
@note You have to free the string yourself with av_free ().
***********************************************************/
[CCode (cname="av_asprintf", cheader_filename="ffmpeg/libavutil/avstring.h")]
public string av_asprintf (
    string fmt,
    ...
); // av_printf_format (1, 2);

/***********************************************************
@brief Convert a number to an av_malloced string.
***********************************************************/
[CCode (cname="av_d2str", cheader_filename="ffmpeg/libavutil/avstring.h")]
public string av_d2str (
    double d
);

/***********************************************************
@brief Unescape the given string until a non escaped terminating char,
and return the token corresponding to the unescaped string.

The normal \ and ' escaping is supported. Leading and trailing
whitespaces are removed, unless they are escaped with '\' or are
enclosed between ''.

@param buf the buffer to parse, buf will be updated to point to the
terminating char
@param term a 0-terminated list of terminating chars
@return the malloced unescaped string, which must be av_freed by
the user, null in case of allocation failure
***********************************************************/
[CCode (cname="av_get_token", cheader_filename="ffmpeg/libavutil/avstring.h")]
public string av_get_token (
    out string buf,
    string term
);

/***********************************************************
@brief Split the string into several tokens which can be accessed by
successive calls to av_strtok ().

A token is defined as a sequence of characters not belonging to the
set specified in delim.

On the first call to av_strtok (), s should point to the string to
parse, and the value of saveptr is ignored. In subsequent calls, s
should be null, and saveptr should be unchanged since the previous
call.

This function is similar to strtok_r () defined in POSIX.1.

@param s the string to parse, may be null
@param delim 0-terminated list of token delimiters, must be non-null
@param saveptr user-provided pointer which points to stored
    information necessary for av_strtok () to continue scanning the same
    string. saveptr is updated to point to the next character after the
    first delimiter found, or to null if the string was terminated
@return the found token, or null when no token is found
***********************************************************/
[CCode (cname="av_strtok", cheader_filename="ffmpeg/libavutil/avstring.h")]
public string av_strtok (
    string s,
    string delim,
    out string saveptr
);

/***********************************************************
@brief Locale-independent conversion of ASCII isdigit.
***********************************************************/
[CCode (cname="av_isdigit", cheader_filename="ffmpeg/libavutil/avstring.h")]
public static int av_isdigit (
    int c
);

/***********************************************************
@brief Locale-independent conversion of ASCII isgraph.
***********************************************************/
[CCode (cname="av_isgraph", cheader_filename="ffmpeg/libavutil/avstring.h")]
public static int av_isgraph (
    int c
);

/***********************************************************
@brief Locale-independent conversion of ASCII isspace.
***********************************************************/
[CCode (cname="av_isspace", cheader_filename="ffmpeg/libavutil/avstring.h")]
public static int av_isspace (
    int c
);

/***********************************************************
@brief Locale-independent conversion of ASCII characters to uppercase.
***********************************************************/
[CCode (cname="av_toupper", cheader_filename="ffmpeg/libavutil/avstring.h")]
public static int av_toupper (
    int c
);

/***********************************************************
@brief Locale-independent conversion of ASCII characters to lowercase.
***********************************************************/
[CCode (cname="av_tolower", cheader_filename="ffmpeg/libavutil/avstring.h")]
public static int av_tolower (
    int c
);

/***********************************************************
@brief Locale-independent conversion of ASCII isxdigit.
***********************************************************/
[CCode (cname="av_isxdigit", cheader_filename="ffmpeg/libavutil/avstring.h")]
public static int av_isxdigit (
    int c
);

/***********************************************************
@brief Locale-independent case-insensitive compare.
@note This means only ASCII-range characters are case-insensitive
***********************************************************/
[CCode (cname="av_strcasecmp", cheader_filename="ffmpeg/libavutil/avstring.h")]
public int av_strcasecmp (
    string a,
    string b
);

/***********************************************************
@brief Locale-independent case-insensitive compare.
@note This means only ASCII-range characters are case-insensitive
***********************************************************/
[CCode (cname="av_strncasecmp", cheader_filename="ffmpeg/libavutil/avstring.h")]
public int av_strncasecmp (
    string a,
    string b,
    size_t n
);

/***********************************************************
@brief Locale-independent strings replace.
@note This means only ASCII-range characters are replace
***********************************************************/
[CCode (cname="av_strireplace", cheader_filename="ffmpeg/libavutil/avstring.h")]
public string av_strireplace (
    string str,
    string from,
    string to
);

/***********************************************************
@brief Thread safe basename.
@param path the path, on DOS both \ and / are considered separators.
@return pointer to the basename substring.
***********************************************************/
[CCode (cname="av_basename", cheader_filename="ffmpeg/libavutil/avstring.h")]
public string av_basename (
    string path
);

/***********************************************************
@brief Thread safe dirname.
@param path the path, on DOS both \ and / are considered separators.
@return the path with the separator replaced by the string terminator or ".".
@note the function may change the input string.
***********************************************************/
[CCode (cname="av_dirname", cheader_filename="ffmpeg/libavutil/avstring.h")]
public string av_dirname (
    string path
);

/***********************************************************
@brief Match instances of a name in a comma-separated list of names.
List entries are checked from the start to the end of the names list,
the first match ends further processing. If an entry prefixed with '-'
matches, then 0 is returned. The "ALL" list entry is considered to
match all names.

@param name Name to look for.
@param names List of names.
@return 1 on match, 0 otherwise.
***********************************************************/
[CCode (cname="av_match_name", cheader_filename="ffmpeg/libavutil/avstring.h")]
public int av_match_name (
    string name,
    string names
);

/***********************************************************
@brief Append path component to the existing path.
Path separator '/' is placed between when needed.
Resulting string have to be freed with av_free ().
@param path base path
@param component component to be appended
@return new path or null on error.
***********************************************************/
[CCode (cname="av_append_path_component", cheader_filename="ffmpeg/libavutil/avstring.h")]
public string av_append_path_component (
    string path,
    string component
);

/***********************************************************
@brief Escape string in input_buffer, and put the escaped string in an allocated
string in output_buffer, which must be freed with av_free ().

@param output_buffer pointer where an allocated string is put
@param input_buffer string to escape, must be non-null
@param special_chars string containing the special characters which
    need to be escaped, can be null
@param mode escape mode to employ, see StringEscapeMode macros.
    Any unknown value for mode will be considered equivalent to
    StringEscapeMode.BACKSLASH, but this behaviour can change without
    notice.
@param flags flags which control how to escape, see StringEscapeFlags macros
@return the length of the allocated string, or a negative error code in case of error
@see @link av_bprint_escape ()
***********************************************************/
//  av_warn_unused_result
[CCode (cname="av_escape", cheader_filename="ffmpeg/libavutil/avstring.h")]
public int av_escape (
    out string output_buffer,
    string input_buffer,
    string special_chars,
    StringEscapeMode mode,
    StringEscapeFlags flags
);

/***********************************************************
@brief Read and decode a single UTF-8 code point (character) from the
buffer in buf, and update buf to point to the next byte to
decode.

In case of an invalid byte sequence, the pointer will be updated to
the next byte after the invalid sequence and the function will
return an error code.

Depending on the specified flags, the function will also fail in
case the decoded code point does not belong to a valid range.

@note For speed-relevant code a carefully implemented use of
GET_UTF8 () may be preferred.

@param codep pointer used to return the parsed code in case of success.
    The value in codep is set even in case the range check fails.
@param bufp pointer to the address the first byte of the sequence
    to decode, updated by the function to point to the
    byte next after the decoded sequence
@param buf_end pointer to the end of the buffer, points to the next
    byte past the last in the buffer. This is used to
    avoid buffer overreads (in case of an unfinished
    UTF-8 sequence towards the end of the buffer).
@param flags a collection of Utf8Flags flags
@return >= 0 in case a sequence was successfully read, a negative
value in case of invalid sequence
***********************************************************/
//  av_warn_unused_result
[CCode (cname="av_utf8_decode", cheader_filename="ffmpeg/libavutil/avstring.h")]
public int av_utf8_decode (
    out int32 codep,
    out uint8[] bufp,
    uint8[] buf_end,
    Utf8Flags flags
);

/***********************************************************
@brief Check if a name is in a list.
@returns 0 if not found, or the 1 based index where it has been found in the
    list.
***********************************************************/
[CCode (cname="av_match_list", cheader_filename="ffmpeg/libavutil/avstring.h")]
public int av_match_list (
    string name,
    string list,
    char separator
);

/***********************************************************
@brief See libc sscanf manual for more information.
Locale-independent sscanf implementation.
***********************************************************/
[CCode (cname="av_sscanf", cheader_filename="ffmpeg/libavutil/avstring.h")]
public int av_sscanf (
    string str,
    string format,
    ...
);

} // namespace String
} // namespace LibAVUtil
