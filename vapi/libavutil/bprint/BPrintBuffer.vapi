/***********************************************************
@copyright 2006 Michael Niedermayer <michaelni@gmx.at>
@copyright 2008 Peter Ross
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

/***********************************************************
@file audio channel layout utility functions
***********************************************************/

/***********************************************************
@addtogroup LibAVUtil.Audio
***********************************************************/

[CCode (cname="struct AVBPrint", cheader_filename="ffmpeg/libavutil/channel_layout.h")]
public struct BPrintBuffer {
    /***********************************************************
    @brief Append a description of a channel layout to a bprint buffer.
        ***********************************************************/
    [CCode (cname="av_bprint_channel_layout", cheader_filename="ffmpeg/libavutil/channel_layout.h")]
    public void av_bprint_channel_layout (
        BPrintBuffer bp,
        int nb_channels,
        uint64 channel_layout
    );
}

} // namespace LibAVUtil

/***********************************************************
@copyright 2012 Nicolas George
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

/***********************************************************
@brief Define a structure with extra padding to a fixed size
This helps ensuring binary compatibility with future versions.
***********************************************************/

//  #define FF_PAD_STRUCTURE (name, size, ...)
//  public struct ff_pad_helper_##name { __VA_ARGS__ }
//  public struct name {
//      __VA_ARGS__
//      char reserved_padding[size - sizeof (ff_pad_helper_##name)];
//  }

/***********************************************************
@brief Buffer to print data progressively

The string buffer grows as necessary and is always 0-terminated.
The content of the string is never accessed, and thus is
encoding-agnostic and can even hold binary data.

Small buffers are kept in the structure itself, and thus require no
memory allocation at all (unless the contents of the buffer is needed
after the structure goes out of scope). This is almost as lightweight as
declaring a local "char buffer[512]".

The length of the string can go beyond the allocated size: the buffer is
then truncated, but the functions still keep account of the actual total
length.

In other words, buffer.len can be greater than buffer.size and records the
total length of what would have been to the buffer if there had been
enough memory.

Append operations do not need to be tested for failure: if a memory
allocation fails, data stop being appended to the buffer, but the length
is still updated. This situation can be tested with
av_bprint_is_complete ().

The size_max field determines several possible behaviours:

size_max = -1 (= UINT_MAX) or any large value will let the buffer be
reallocated as necessary, with an amortized linear cost.

size_max = 0 prevents writing anything to the buffer: only the total
length is computed. The write operations can then possibly be repeated in
a buffer with exactly the necessary size
(using size_init = size_max = len + 1).

size_max = 1 is automatically replaced by the exact size available in the
structure itself, thus ensuring no dynamic memory allocation. The
internal buffer is large enough to hold a reasonable paragraph of text,
such as the current paragraph.
***********************************************************/

//  FF_PAD_STRUCTURE (BPrintBuffer, 1024,
//      /***********************************************************
//      string so far
//      ***********************************************************/
//      string str;
//      /***********************************************************
//      length so far
//      ***********************************************************/
//      uint len;
//      /***********************************************************
//      allocated memory
//      ***********************************************************/
//      uint size;
//      /***********************************************************
//      maximum allocated memory
//      ***********************************************************/
//      uint size_max;
//      char reserved_internal_buffer[1];
//  )

/***********************************************************
@brief Init a print buffer.

@param buffer buffer to init
@param size_init initial size (including the final 0)
@param size_max maximum size;
    0 means do not write anything, just count the length;
    1 is replaced by the maximum value for automatic storage;
    any large value means that the internal buffer will be
    reallocated as needed up to that limit; -1 is converted to
    UINT_MAX, the largest limit possible.
    May use @link BPrintSize macros.
***********************************************************/
[CCode (cname="av_bprint_init", cheader_filename="ffmpeg/libavutil/bprint.h")]
public void av_bprint_init (
    BPrintBuffer buffer,
    uint size_init,
    uint size_max
);

/***********************************************************
@brief Init a print buffer using a pre-existing buffer.

The buffer will not be reallocated.

@param print_buffer buffer structure to init
@param buffer byte buffer to use for the string data
@param size size of buffer
***********************************************************/
[CCode (cname="av_bprint_init_for_buffer", cheader_filename="ffmpeg/libavutil/bprint.h")]
public void av_bprint_init_for_buffer (
    BPrintBuffer print_buffer,
    string buffer,
    uint size
);

/***********************************************************
@brief Append a formatted string to a print buffer.
***********************************************************/
[CCode (cname="av_bprintf", cheader_filename="ffmpeg/libavutil/bprint.h")]
public void av_bprintf (
    BPrintBuffer buffer,
    string fmt,
    ...
); // av_printf_format (2, 3);

/***********************************************************
@brief Append a formatted string to a print buffer.
***********************************************************/
[CCode (cname="av_vbprintf", cheader_filename="ffmpeg/libavutil/bprint.h")]
public void av_vbprintf (
    BPrintBuffer buffer,
    string fmt,
    va_list vl_arg
);

/***********************************************************
@brief Append char c n times to a print buffer.
***********************************************************/
[CCode (cname="av_bprint_chars", cheader_filename="ffmpeg/libavutil/bprint.h")]
public void av_bprint_chars (
    BPrintBuffer buffer,
    char c,
    uint n
);

/***********************************************************
@brief Append data to a print buffer.

param buffer bprint buffer to use
param data pointer to data
param size size of data
***********************************************************/
[CCode (cname="av_bprint_append_data", cheader_filename="ffmpeg/libavutil/bprint.h")]
public void av_bprint_append_data (
    BPrintBuffer buffer,
    string data,
    uint size
);

[CCode (cname="struct tm", cheader_filename="ffmpeg/libavutil/bprint.h")]
public struct AVTime { }

/***********************************************************
@brief Append a formatted date and time to a print buffer.

param buffer bprint buffer to use
param fmt date and time format string, see strftime ()
param tm broken-down time structure to translate

@note due to poor design of the standard strftime function, it may
produce poor results if the format string expands to a very long text and
the bprint buffer is near the limit stated by the size_max option.
***********************************************************/
[CCode (cname="av_bprint_strftime", cheader_filename="ffmpeg/libavutil/bprint.h")]
public void av_bprint_strftime (
    BPrintBuffer buffer,
    string fmt,
    AVTime tm
);

/***********************************************************
@brief Allocate bytes in the buffer for external use.

@param[in] buffer buffer structure
@param[in] size required size
@param[out] mem pointer to the memory area
@param[out] actual_size size of the memory area after allocation;
    can be larger or smaller than size
***********************************************************/
[CCode (cname="av_bprint_get_buffer", cheader_filename="ffmpeg/libavutil/bprint.h")]
public void av_bprint_get_buffer (
    BPrintBuffer buffer,
    uint size,
    out uchar[] mem,
    out uint actual_size
);

/***********************************************************
@brief Reset the string to "" but keep internal allocated data.
***********************************************************/
[CCode (cname="av_bprint_clear", cheader_filename="ffmpeg/libavutil/bprint.h")]
public void av_bprint_clear (
    BPrintBuffer buffer
);

/***********************************************************
@brief Test if the print buffer is complete (not truncated).

It may have been truncated due to a memory allocation failure
or the size_max limit (compare size and size_max if necessary).
***********************************************************/
[CCode (cname="av_bprint_is_complete", cheader_filename="ffmpeg/libavutil/bprint.h")]
public static int av_bprint_is_complete (
    BPrintBuffer buffer
);

/***********************************************************
@brief Finalize a print buffer.

The print buffer can no longer be used afterwards,
but the len and size fields are still valid.

@arg[out] ret_str if not null, used to return a permanent copy of the
    buffer contents, or null if memory allocation fails;
    if null, the buffer is discarded and freed
@return 0 for success or error code (probably LibAVUtil.ErrorCode (ENOMEM))
***********************************************************/
[CCode (cname="av_bprint_finalize", cheader_filename="ffmpeg/libavutil/bprint.h")]
public int av_bprint_finalize (
    BPrintBuffer buffer,
    out string ret_str
);

/***********************************************************
@brief Escape the content in input_buffer and append it to dstbuf.

@param dstbuf already inited destination bprint buffer
@param input_buffer string containing the text to escape
@param special_chars string containing the special characters which
    need to be escaped, can be null
@param mode escape mode to employ, see StringEscapeMode macros.
    Any unknown value for mode will be considered equivalent to
    StringEscapeMode.BACKSLASH, but this behaviour can change without
    notice.
@param flags flags which control how to escape, see StringEscapeFlags macros
***********************************************************/
[CCode (cname="av_bprint_escape", cheader_filename="ffmpeg/libavutil/bprint.h")]
public void av_bprint_escape (
    BPrintBuffer dstbuf,
    string input_buffer,
    string special_chars,
    StringEscapeMode mode,
    StringEscapeFlags flags
);

} // namespace LibAVUtil
