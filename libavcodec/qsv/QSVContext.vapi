/***********************************************************
@brief Intel MediaSDK QSV public API

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

namespace LibAVCodec {
using LibAVUtil;

/***********************************************************
@brief This struct is used for communicating QSV parameters between LibAVCodec and
the caller. It is managed by the caller and must be assigned to
CodecContext.hwaccel_context.
- decoding: hwaccel_context must be set on return from the get_format ()
        callback
- encoding: hwaccel_context must be set before avcodec_open2 ()
***********************************************************/
[CCode (cname="struct AVQSVContext", cheader_filename="ffmpeg/libavcodec/qsv.h")]
public struct QSVContext {
    /***********************************************************
    @brief If non-null, the session to use for encoding or decoding.
    Otherwise, LibAVCodec will try to create an internal session.
    ***********************************************************/
    [CCode (cname="session")]
    public mfxSession session;

    /***********************************************************
    @brief The IO pattern to use.
    ***********************************************************/
    [CCode (cname="iopattern")]
    public int iopattern;

    /***********************************************************
    @brief Extra buffers to pass to encoder or decoder initialization.
    ***********************************************************/
    [CCode (cname="ext_buffers")]
    public mfxExtBuffer[] ext_buffers;
    [CCode (cname="nb_ext_buffers")]
    public int nb_ext_buffers;

    /***********************************************************
    @brief Encoding only. If this field is set to non-zero by the caller, LibAVCodec
    will create an mfxExtOpaqueSurfaceAlloc extended buffer and pass it to
    the encoder initialization. This only makes sense if iopattern is also
    set to MFX_IOPATTERN_IN_OPAQUE_MEMORY.

    The number of allocated opaque surfaces will be the sum of the number
    required by the encoder and the user-provided value nb_opaque_surfaces.
    The array of the opaque surfaces will be exported to the caller through
    the opaque_surfaces field.
    ***********************************************************/
    [CCode (cname="opaque_alloc")]
    public int opaque_alloc;

    /***********************************************************
    @brief Encoding only, and only if opaque_alloc is set to non-zero. Before
    calling avcodec_open2 (), the caller should set this field to the number
    of extra opaque surfaces to allocate beyond what is required by the
    encoder.

    On return from avcodec_open2 (), this field will be set by LibAVCodec to
    the total number of allocated opaque surfaces.
    ***********************************************************/
    [CCode (cname="nb_opaque_surfaces")]
    public int nb_opaque_surfaces;

    /***********************************************************
    @brief Encoding only, and only if opaque_alloc is set to non-zero. On return
    from avcodec_open2 (), this field will be used by LibAVCodec to export the
    array of the allocated opaque surfaces to the caller, so they can be
    passed to other parts of the pipeline.

    The buffer reference exported here is owned and managed by LibAVCodec,
    the callers should make their own reference with av_buffer_ref () and free
    it with av_buffer_unref () when it is no longer needed.

    The buffer data is an nb_opaque_surfaces-sized array of mfxFrameSurface1.
    ***********************************************************/
    [CCode (cname="opaque_surfaces")]
    public LibAVUtil.BufferRef opaque_surfaces;

    /***********************************************************
    @brief Encoding only, and only if opaque_alloc is set to non-zero. On return
    from avcodec_open2 (), this field will be set to the surface type used in
    the opaque allocation request.
    ***********************************************************/
    [CCode (cname="opaque_alloc_type")]
    public int opaque_alloc_type;

    /***********************************************************
    @brief Allocate a new context.

    It must be freed by the caller with av_free ().
    ***********************************************************/
    [CCode (cname="av_qsv_alloc_context", cheader_filename="ffmpeg/libavcodec/qsv.h")]
    public QSVContext av_qsv_alloc_context ();
}

} // namespace LibAVCodec
