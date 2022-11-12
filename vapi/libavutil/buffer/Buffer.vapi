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

/***********************************************************
@defgroup LibAVUtil.Buffer LibAVUtil.Buffer
@ingroup LibAVUtil.Data

LibAVUtil.Buffer is an API for reference-counted data buffers.

There are two core objects in this API -- LibAVUtil.Buffer and LibAVUtil.BufferRef. LibAVUtil.Buffer
represents the data buffer itself; it is opaque and not meant to be accessed
by the caller directly, but only through LibAVUtil.BufferRef. However, the caller may
e.g. compare two LibAVUtil.Buffer pointers to check whether two different references
are describing the same data buffer. LibAVUtil.BufferRef represents a single
reference to an LibAVUtil.Buffer and it is the object that may be manipulated by the
caller directly.

There are two functions provided for creating a new LibAVUtil.Buffer with a single
reference -- av_buffer_alloc () to just allocate a new buffer, and
av_buffer_create () to wrap an existing array in an LibAVUtil.Buffer. From an existing
reference, additional references may be created with av_buffer_ref ().
Use av_buffer_unref () to free a reference (this will automatically free the
data once all the references are freed).

The convention throughout this API and the rest of FFmpeg is such that the
buffer is considered writable if there exists only one reference to it (and
it has not been marked as read-only). The av_buffer_is_writable () function is
provided to check whether this is true and av_buffer_make_writable () will
automatically create a new writable buffer when necessary.
Of course nothing prevents the calling code from violating this convention,
however that is safe only when all the existing references are under its
control.

@note Referencing and unreferencing the buffers is thread-safe and thus
may be done from multiple threads simultaneously without any need for
additional locking.

@note Two different references to the same buffer can point to different
parts of the buffer (i.e. their LibAVUtil.BufferRef.data will not be equal).
***********************************************************/

/***********************************************************
@brief A reference counted buffer type. It is opaque and is meant to be used through
references (LibAVUtil.BufferRef).
***********************************************************/
[CCode (cname="struct AVBuffer", cheader_filename="buffer.h")]
public struct Buffer { }

} // namespace LibAVUtil
