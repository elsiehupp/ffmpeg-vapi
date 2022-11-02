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
a very simple circular buffer FIFO implementation
***********************************************************/

public delegate void GenericReadDelegate (
    void *arg0,
    void *arg1,
    int arg2
);

[CCode (cname="struct AVFifoBuffer", cheader_filename="ffmpeg/libavutil/fifo.h")]
public struct FifoBuffer {
    [CCode (cname="buffer")]
    public uint8[] buffer;
    [CCode (cname="rptr")]
    public uint8[] r_pointer;
    [CCode (cname="wptr")]
    public uint8[] w_pointer;
    [CCode (cname="end")]
    public uint8[] end_pointer;
    [CCode (cname="rndx")]
    public uint32 r_index;
    [CCode (cname="wndx")]
    public uint32 w_index;

    /***********************************************************
    @brief Initialize an FifoBuffer.
    @param size of FIFO
    @return FifoBuffer or null in case of memory allocation failure
    ***********************************************************/
    [CCode (cname="av_fifo_alloc", cheader_filename="ffmpeg/libavutil/fifo.h")]
    public FifoBuffer av_fifo_alloc (
        uint size
    );

    /***********************************************************
    @brief Initialize an FifoBuffer.
    @param nmemb number of elements
    @param size size of the single element
    @return FifoBuffer or null in case of memory allocation failure
    ***********************************************************/
    [CCode (cname="av_fifo_alloc_array", cheader_filename="ffmpeg/libavutil/fifo.h")]
    public FifoBuffer av_fifo_alloc_array (
        size_t nmemb,
        size_t size
    );

    /***********************************************************
    @brief Free an FifoBuffer.
    @param f FifoBuffer to free
    ***********************************************************/
    [CCode (cname="av_fifo_free", cheader_filename="ffmpeg/libavutil/fifo.h")]
    public void av_fifo_free (
        FifoBuffer f
    );

    /***********************************************************
    @brief Free an FifoBuffer and reset pointer to null.
    @param f FifoBuffer to free
    ***********************************************************/
    [CCode (cname="av_fifo_freep", cheader_filename="ffmpeg/libavutil/fifo.h")]
    public void av_fifo_freep (
        FifoBuffer f
    );

    /***********************************************************
    @brief Reset the FifoBuffer to the state right after av_fifo_alloc, in particular it is emptied.
    @param f FifoBuffer to reset
    ***********************************************************/
    [CCode (cname="av_fifo_reset", cheader_filename="ffmpeg/libavutil/fifo.h")]
    public void av_fifo_reset (
        FifoBuffer f
    );

    /***********************************************************
    @brief Return the amount of data in bytes in the FifoBuffer, that is the
    amount of data you can read from it.
    @param f FifoBuffer to read from
    @return size
    ***********************************************************/
    [CCode (cname="av_fifo_size", cheader_filename="ffmpeg/libavutil/fifo.h")]
    public int av_fifo_size (
        FifoBuffer f
    );

    /***********************************************************
    @brief Return the amount of space in bytes in the FifoBuffer, that is the
    amount of data you can write into it.
    @param f FifoBuffer to write into
    @return size
    ***********************************************************/
    [CCode (cname="av_fifo_space", cheader_filename="ffmpeg/libavutil/fifo.h")]
    public int av_fifo_space (
        FifoBuffer f
    );

    /***********************************************************
    @brief Feed data at specific position from an FifoBuffer to a user-supplied callback.
    Similar as av_fifo_gereric_read but without discarding data.
    @param f FifoBuffer to read from
    @param offset offset from current read position
    @param buf_size number of bytes to read
    @param func generic read function
    @param dest data destination
    ***********************************************************/
    [CCode (cname="av_fifo_generic_peek_at", cheader_filename="ffmpeg/libavutil/fifo.h")]
    public int av_fifo_generic_peek_at (
        FifoBuffer f,
        out void *dest,
        int offset,
        int buf_size,
        GenericReadDelegate func
    );

    /***********************************************************
    @brief Feed data from an FifoBuffer to a user-supplied callback.
    Similar as av_fifo_gereric_read but without discarding data.
    @param f FifoBuffer to read from
    @param buf_size number of bytes to read
    @param func generic read function
    @param dest data destination
    ***********************************************************/
    [CCode (cname="av_fifo_generic_peek", cheader_filename="ffmpeg/libavutil/fifo.h")]
    public int av_fifo_generic_peek (
        FifoBuffer f,
        out void *dest,
        int buf_size,
        GenericReadDelegate func
    );

    /***********************************************************
    @brief Feed data from an FifoBuffer to a user-supplied callback.
    @param f FifoBuffer to read from
    @param buf_size number of bytes to read
    @param func generic read function
    @param dest data destination
    ***********************************************************/
    [CCode (cname="av_fifo_generic_read", cheader_filename="ffmpeg/libavutil/fifo.h")]
    public int av_fifo_generic_read (
        FifoBuffer f,
        out void *dest,
        int buf_size,
        GenericReadDelegate func
    );

    /***********************************************************
    @brief Feed data from a user-supplied callback to an FifoBuffer.
    @param f FifoBuffer to write to
    @param input_buffer data source; non-const since it may be used as a
        modifiable context by the function defined in func
    @param size number of bytes to write
    @param func generic write function; the first parameter is input_buffer,
        the second is dest_buf, the third is dest_buf_size.
        func must return the number of bytes written to dest_buf, or <= 0 to
        indicate no more data available to write.
        If func is null, input_buffer is interpreted as a simple byte array for source data.
    @return the number of bytes written to the FIFO
    ***********************************************************/
    [CCode (cname="av_fifo_generic_write", cheader_filename="ffmpeg/libavutil/fifo.h")]
    public int av_fifo_generic_write (
        FifoBuffer f,
        void *input_buffer,
        int size,
        GenericReadDelegate func
    );

    /***********************************************************
    @brief Resize an FifoBuffer.
    In case of reallocation failure, the old FIFO is kept unchanged.

    @param f FifoBuffer to resize
    @param size new FifoBuffer size in bytes
    @return <0 for failure, >=0 otherwise
    ***********************************************************/
    [CCode (cname="av_fifo_realloc2", cheader_filename="ffmpeg/libavutil/fifo.h")]
    public int av_fifo_realloc2 (
        FifoBuffer f,
        uint size
    );

    /***********************************************************
    @brief Enlarge an FifoBuffer.
    In case of reallocation failure, the old FIFO is kept unchanged.
    The new fifo size may be larger than the requested size.

    @param f FifoBuffer to resize
    @param additional_space the amount of space in bytes to allocate in addition to av_fifo_size ()
    @return <0 for failure, >=0 otherwise
    ***********************************************************/
    [CCode (cname="av_fifo_grow", cheader_filename="ffmpeg/libavutil/fifo.h")]
    public int av_fifo_grow (
        FifoBuffer f,
        uint additional_space
    );

    /***********************************************************
    @brief Read and discard the specified amount of data from an FifoBuffer.
    @param f FifoBuffer to read from
    @param size amount of data to read in bytes
    ***********************************************************/
    [CCode (cname="av_fifo_drain", cheader_filename="ffmpeg/libavutil/fifo.h")]
    public void av_fifo_drain (
        FifoBuffer f,
        int size
    );

    /***********************************************************
    @brief Return a pointer to the data stored in a FIFO buffer at a certain offset.
    The FIFO buffer is not modified.

    @param f FifoBuffer to peek at, f must be non-null
    @param offs an offset in bytes, its absolute value must be less
        than the used buffer size or the returned pointer will
        point outside to the buffer data.
        The used buffer size can be checked with av_fifo_size ().
    ***********************************************************/
    [CCode (cname="av_fifo_peek2", cheader_filename="ffmpeg/libavutil/fifo.h")]
    public static uint8[] av_fifo_peek2 (
        FifoBuffer f,
        int offs
    );
}

} // namespace LibAVUtil
