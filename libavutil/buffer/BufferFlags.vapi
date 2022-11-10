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
@file @ingroup LibAVUtil.Buffer
refcounted data buffer API
***********************************************************/

[Flags]
[CCode (cname="enum AVBufferFlags", cheader_filename="buffer.h")]
public enum BufferFlags {
    /***********************************************************
    @brief Always treat the buffer as read-only, even when it has only one
    reference.
    ***********************************************************/
    AV_BUFFER_FLAG_READONLY;
}

public delegate void FreeDelegate (
    void *opaque,
    uint8[] data
);

/***********************************************************
@brief Create an LibAVUtil.Buffer from an existing array.

If this function is successful, data is owned by the LibAVUtil.Buffer. The caller may
only access data through the returned LibAVUtil.BufferRef and references derived from
it.
If this function fails, data is left untouched.
@param data data array
@param size size of data in bytes
@param free a callback for freeing this buffer's data
@param opaque parameter to be got for processing or passed to free
@param flags a combination of BufferFlags

@return an LibAVUtil.BufferRef referring to data on success, null on failure.
***********************************************************/
[CCode (cname="av_buffer_create", cheader_filename="buffer.h")]
public LibAVUtil.BufferRef av_buffer_create (
    uint8[] data, size_t size,
    FreeDelegate free,
    void *opaque,
    BufferFlags flags
);

/***********************************************************
@brief Default free callback, which calls av_free () on the buffer data.
This function is meant to be passed to av_buffer_create (), not called
directly.
***********************************************************/
[CCode (cname="av_buffer_default_free", cheader_filename="buffer.h")]
public void av_buffer_default_free (
    void *opaque,
    uint8[] data
);

/***********************************************************
@brief Create a new reference to an LibAVUtil.Buffer.

@return a new LibAVUtil.BufferRef referring to the same LibAVUtil.Buffer as buffer or null on
failure.
***********************************************************/
[CCode (cname="av_buffer_ref", cheader_filename="buffer.h")]
public LibAVUtil.BufferRef av_buffer_ref (
    LibAVUtil.BufferRef buffer
);

/***********************************************************
@brief Free a given reference and automatically free the buffer if there are no more
references to it.

@param buffer the reference to be freed. The pointer is set to null on return.
***********************************************************/
[CCode (cname="av_buffer_unref", cheader_filename="buffer.h")]
public void av_buffer_unref (
    LibAVUtil.BufferRef buffer
);

/***********************************************************
@return 1 if the caller may write to the data referred to by buffer (which is
true if and only if buffer is the only reference to the underlying LibAVUtil.Buffer).
Return 0 otherwise.
A positive answer is valid until av_buffer_ref () is called on buffer.
***********************************************************/
[CCode (cname="av_buffer_is_writable", cheader_filename="buffer.h")]
public int av_buffer_is_writable (
    LibAVUtil.BufferRef buffer
);

/***********************************************************
@return the opaque parameter set by av_buffer_create.
***********************************************************/
[CCode (cname="av_buffer_get_opaque", cheader_filename="buffer.h")]
public void *av_buffer_get_opaque (
    LibAVUtil.BufferRef buffer
);

[CCode (cname="av_buffer_get_ref_count", cheader_filename="buffer.h")]
public int av_buffer_get_ref_count (
    LibAVUtil.BufferRef buffer
);

/***********************************************************
@brief Create a writable reference from a given buffer reference, avoiding data copy
if possible.

@param buffer buffer reference to make writable. On success, buffer is either left
    untouched, or it is unreferenced and a new writable LibAVUtil.BufferRef is
    written in its place. On failure, buffer is left untouched.
@return 0 on success, a negative LibAVUtil.ErrorCode on failure.
***********************************************************/
[CCode (cname="av_buffer_make_writable", cheader_filename="buffer.h")]
public int av_buffer_make_writable (
    LibAVUtil.BufferRef buffer
);

/***********************************************************
@brief Reallocate a given buffer.

@param buffer a buffer reference to reallocate. On success, buffer will be
    unreferenced and a new reference with the required size will be
    written in its place. On failure buffer will be left untouched. *buffer
    may be null, then a new buffer is allocated.
@param size required new buffer size.
@return 0 on success, a negative LibAVUtil.ErrorCode on failure.

@note the buffer is actually reallocated with av_realloc () only if it was
initially allocated through av_buffer_realloc (null) and there is only one
reference to it (i.e. the one passed to this function). In all other cases
a new buffer is allocated and the data is copied.
***********************************************************/
[CCode (cname="av_buffer_realloc", cheader_filename="buffer.h")]
public int av_buffer_realloc (
    LibAVUtil.BufferRef buffer,
    size_t size
);

/***********************************************************
@brief Ensure output_buffer refers to the same data as input_buffer.

When output_buffer is already equivalent to input_buffer, do nothing. Otherwise unreference output_buffer
and replace it with a new reference to input_buffer.

@param output_buffer Pointer to either a valid buffer reference or null. On success,
    this will point to a buffer reference equivalent to input_buffer. On
    failure, output_buffer will be left untouched.
@param input_buffer A buffer reference to replace output_buffer with. May be null, then this
    function is equivalent to av_buffer_unref (output_buffer).
@return 0 on success
    LibAVUtil.ErrorCode (ENOMEM) on memory allocation failure.
***********************************************************/
[CCode (cname="av_buffer_replace", cheader_filename="buffer.h")]
public int av_buffer_replace (
    LibAVUtil.BufferRef output_buffer,
    LibAVUtil.BufferRef input_buffer
);

} // namespace LibAVUtil
