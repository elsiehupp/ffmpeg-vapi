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
@brief A reference to a data buffer.

The size of this struct is not a part of the public ABI and it is not meant
to be allocated directly.
***********************************************************/
[CCode (cname="struct AVBufferRef", cheader_filename="buffer.h")]
public struct BufferRef {
    [CCode (cname="buffer")]
    public LibAVUtil.Buffer buffer;

    /***********************************************************
    @description The data buffer. It is considered writable if and only if
        this is the only reference to the buffer, in which case
        av_buffer_is_writable () returns 1.
    ***********************************************************/
    [CCode (cname="data")]
    public uint8[] data;

    /***********************************************************
    @brief Size of data in bytes.
    ***********************************************************/
    [CCode (cname="size")]
    public size_t size;

    /***********************************************************
    @brief Allocate an LibAVUtil.Buffer of the given size using av_malloc ().

    @return an LibAVUtil.BufferRef of given size or null when out of memory
    ***********************************************************/
    [CCode (cname="av_buffer_alloc", cheader_filename="buffer.h")]
    public LibAVUtil.BufferRef av_buffer_alloc (
        size_t size
    );

    /***********************************************************
    @description Same as av_buffer_alloc (), except the returned buffer will be initialized
        to zero.
    ***********************************************************/
    [CCode (cname="av_buffer_allocz", cheader_filename="buffer.h")]
    public LibAVUtil.BufferRef av_buffer_allocz (
        size_t size
    );

}

} // namespace LibAVUtil
