/***********************************************************
@brief Videotoolbox hardware acceleration

@copyright 2012 Sebastien Zwickert

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
@file
@ingroup lavc_codec_hwaccel_videotoolbox
Public LibAVCodec Videotoolbox header.
***********************************************************/

/***********************************************************
@brief This struct holds all the information that needs to be passed
between the caller and LibAVCodec for initializing Videotoolbox decoding.
Its size is not a part of the public ABI, it must be allocated with
av_videotoolbox_alloc_context () and freed with av_free ().
***********************************************************/
[CCode (cname="struct AVVideotoolboxContext", cheader_filename="libavcodec/videotoolbox.h")]
public struct VideoToolboxContext {
    /***********************************************************
    @brief Videotoolbox decompression session object.
    Created and freed the caller.
    ***********************************************************/
    [CCode (cname="session")]
    public VTDecompressionSessionRef session;

    /***********************************************************
    @brief The output callback that must be passed to the session.
    Set by av_videottoolbox_default_init ()
    ***********************************************************/
    [CCode (cname="output_callback")]
    public VTDecompressionOutputCallback output_callback;

    /***********************************************************
    @brief CVPixelBuffer Format Type that Videotoolbox will use for decoded frames.
    set by the caller. If this is set to 0, then no specific format is
    requested from the decoder, and its native format is output.
    ***********************************************************/
    [CCode (cname="cv_pix_fmt_type")]
    public OSType cv_pix_fmt_type;

    /***********************************************************
    @brief CoreMedia Format Description that Videotoolbox will use to create the decompression session.
    Set by the caller.
    ***********************************************************/
    [CCode (cname="cm_fmt_desc")]
    public CMVideoFormatDescriptionRef cm_fmt_desc;

    /***********************************************************
    @brief CoreMedia codec type that Videotoolbox will use to create the decompression session.
    Set by the caller.
    ***********************************************************/
    [CCode (cname="cm_codec_type")]
    public int cm_codec_type;

    /***********************************************************
    @brief Allocate and initialize a Videotoolbox context.

    This function should be called from the get_format () callback when the caller
    selects the LibAVUtil.PixelFormat.VIDETOOLBOX format. The caller must then create
    the decoder object (using the output callback provided by LibAVCodec) that
    will be used for Videotoolbox-accelerated decoding.

    When decoding with Videotoolbox is finished, the caller must destroy the decoder
    object and free the Videotoolbox context using av_free ().

    @return the newly allocated context or null on failure
    ***********************************************************/
    [CCode (cname="av_videotoolbox_alloc_context", cheader_filename="libavcodec/videotoolbox.h")]
    public VideoToolboxContext av_videotoolbox_alloc_context ();

    /***********************************************************
    @brief This is a convenience function that creates and sets up the Videotoolbox context using
    an internal implementation.

    @param codec_context the corresponding codec context

    @return >= 0 on success, a negative LibAVUtil.ErrorCode code on failure
    ***********************************************************/
    [CCode (cname="av_videotoolbox_default_init", cheader_filename="libavcodec/videotoolbox.h")]
    public int av_videotoolbox_default_init (
        CodecContext codec_context
    );

    /***********************************************************
    @brief This is a convenience function that creates and sets up the Videotoolbox context using
    an internal implementation.

    @param codec_context the corresponding codec context
    @param vtctx the Videotoolbox context to use

    @return >= 0 on success, a negative LibAVUtil.ErrorCode code on failure
    ***********************************************************/
    [CCode (cname="av_videotoolbox_default_init2", cheader_filename="libavcodec/videotoolbox.h")]
    public int av_videotoolbox_default_init2 (
        CodecContext codec_context,
        VideoToolboxContext vtctx
    );

    /***********************************************************
    @brief This function must be called to free the Videotoolbox context initialized with
    av_videotoolbox_default_init ().

    @param codec_context the corresponding codec context
    ***********************************************************/
    [CCode (cname="av_videotoolbox_default_free", cheader_filename="libavcodec/videotoolbox.h")]
    public void av_videotoolbox_default_free (
        CodecContext codec_context
    );
}

} // namespace LibAVCodec
