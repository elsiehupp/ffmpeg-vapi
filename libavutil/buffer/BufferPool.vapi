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
@file
@ingroup LibAVUtil.Buffer
refcounted data buffer API
***********************************************************/

/***********************************************************
@defgroup LibAVUtil.BufferPool LibAVUtil.BufferPool
@ingroup LibAVUtil.Data

LibAVUtil.BufferPool is an API for a lock-free thread-safe pool of LibAVUtil.Buffer (s).

Frequently allocating and freeing large buffers may be slow. LibAVUtil.BufferPool is
meant to solve this in cases when the caller needs a set of buffers of the
same size (the most obvious use case being buffers for raw video or audio
frames).

At the beginning, the user must call av_buffer_pool_init () to create the
buffer pool. Then whenever a buffer is needed, call av_buffer_pool_get () to
get a reference to a new buffer, similar to av_buffer_alloc (). This new
reference works in all aspects the same way as the one created by
av_buffer_alloc (). However, when the last reference to this buffer is
unreferenced, it is returned to the pool instead of being freed and will be
reused for subsequent av_buffer_pool_get () calls.

When the caller is done with the pool and no longer needs to allocate any new
buffers, av_buffer_pool_uninit () must be called to mark the pool as freeable.
Once all the buffers are released, it will automatically be freed.

Allocating and releasing buffers with this API is thread-safe as long as
either the default alloc callback is used, or the user-supplied one is
thread-safe.
***********************************************************/

/***********************************************************
@brief The buffer pool. This structure is opaque and not meant to be accessed
directly. It is allocated with av_buffer_pool_init () and freed with
av_buffer_pool_uninit ().
***********************************************************/
[CCode (cname="struct AVBufferPool", cheader_filename="buffer.h")]
public struct BufferPool { }

public delegate LibAVUtil.BufferRef AllocDelegate (
    size_t size
);

/***********************************************************
@brief Allocate and initialize a buffer pool.

@param size size of each buffer in this pool
@param alloc a function that will be used to allocate new buffers when the
pool is empty. May be null, then the default allocator will be used
(av_buffer_alloc ()).
@return newly created buffer pool on success, null on error.
***********************************************************/
[CCode (cname="av_buffer_pool_init", cheader_filename="buffer.h")]
public LibAVUtil.BufferPool av_buffer_pool_init (
    size_t size,
    AllocDelegate alloc
);

public delegate LibAVUtil.BufferRef AllocDelegate2 (
    void *opaque,
    size_t size
);

public delegate void FreeDelegate2 (
    void *opaque
);

/***********************************************************
@brief Allocate and initialize a buffer pool with a more complex allocator.

@param size size of each buffer in this pool
@param opaque arbitrary user data used by the allocator
@param alloc a function that will be used to allocate new buffers when the
    pool is empty. May be null, then the default allocator will be
    used (av_buffer_alloc ()).
@param pool_free a function that will be called immediately before the pool
    is freed. I.e. after av_buffer_pool_uninit () is called
    by the caller and all the frames are returned to the pool
    and freed. It is intended to uninitialize the user opaque
    data. May be null.
@return newly created buffer pool on success, null on error.
***********************************************************/
[CCode (cname="av_buffer_pool_init2", cheader_filename="buffer.h")]
public LibAVUtil.BufferPool av_buffer_pool_init2 (
    size_t size,
    void *opaque,
    AllocDelegate2 alloc,
    FreeDelegate2 pool_free
);

/***********************************************************
@brief Mark the pool as being available for freeing. It will actually be freed only
once all the allocated buffers associated with the pool are released. Thus it
is safe to call this function while some of the allocated buffers are still
in use.

@param pool pointer to the pool to be freed. It will be set to null.
***********************************************************/
[CCode (cname="av_buffer_pool_uninit", cheader_filename="buffer.h")]
public void av_buffer_pool_uninit (
    LibAVUtil.BufferPool pool
);

/***********************************************************
@brief Allocate a new LibAVUtil.Buffer, reusing an old buffer from the pool when available.
This function may be called simultaneously from multiple threads.

@return a reference to the new buffer on success, null on error.
***********************************************************/
[CCode (cname="av_buffer_pool_get", cheader_filename="buffer.h")]
public LibAVUtil.BufferRef av_buffer_pool_get (
    LibAVUtil.BufferPool pool
);

/***********************************************************
@brief Query the original opaque parameter of an allocated buffer in the pool.

@param ref a buffer reference to a buffer returned by av_buffer_pool_get.
@return the opaque parameter set by the buffer allocator function of the
    buffer pool.

@note the opaque parameter of ref is used by the buffer pool implementation,
therefore you have to use this function to access the original opaque
parameter of an allocated buffer.
***********************************************************/
[CCode (cname="av_buffer_pool_buffer_get_opaque", cheader_filename="buffer.h")]
public void *av_buffer_pool_buffer_get_opaque (
    LibAVUtil.BufferRef ref
);

} // namespace LibAVUtil
