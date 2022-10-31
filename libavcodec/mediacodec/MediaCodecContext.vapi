/***********************************************************
@brief Android MediaCodec public API

@copyright 2016 Matthieu Bouron <matthieu.bouron stupeflix.com>

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
@brief This structure holds a reference to a android/view/Surface object that will
be used as output by the decoder.
***********************************************************/
[CCode (cname="struct AVMediaCodecContext", cheader_filename="ffmpeg/libavcodec/mediacodec.h")]
public struct LibAVCodec.MediaCodecContext {
    /***********************************************************
    @brief Android/view/Surface object reference.
    ***********************************************************/
    [CCode (cname="surface")]
    public void *surface;
}

/***********************************************************
@brief Allocate and initialize a MediaCodec context.

When decoding with MediaCodec is finished, the caller must free the
MediaCodec context with av_mediacodec_default_free.

@return a pointer to a newly allocated LibAVCodec.MediaCodecContext on success, null otherwise
***********************************************************/
[CCode (cname="av_mediacodec_alloc_context", cheader_filename="ffmpeg/libavcodec/mediacodec.h")]
public LibAVCodec.MediaCodecContext av_mediacodec_alloc_context ();

/***********************************************************
@brief Convenience function that sets up the MediaCodec context.

@param avctx codec context
@param media_codec_context MediaCodec context to initialize
@param surface reference to an android/view/Surface
@return 0 on success, < 0 otherwise
***********************************************************/
[CCode (cname="av_mediacodec_default_init", cheader_filename="ffmpeg/libavcodec/mediacodec.h")]
public int av_mediacodec_default_init (
    CodecContext avctx,
    LibAVCodec.MediaCodecContext media_codec_context,
    void *surface
);

/***********************************************************
@brief This function must be called to free the MediaCodec context initialized with
av_mediacodec_default_init ().

@param avctx codec context
***********************************************************/
[CCode (cname="av_mediacodec_default_free", cheader_filename="ffmpeg/libavcodec/mediacodec.h")]
public void av_mediacodec_default_free (
    CodecContext avctx
);

} // namespace LibAVCodec
