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
/***********************************************************
@brief Android MediaCodec public API

@copyright 2016 Matthieu Bouron <matthieu.bouron stupeflix.com>
***********************************************************/
namespace LibAVCodec {
using LibAVUtil;

/***********************************************************
@brief Opaque structure representing a MediaCodec buffer to render.
***********************************************************/
//  [CCode (cname="struct MediaCodecBuffer", cheader_filename="ffmpeg/libavcodec/mediacodec.h")]
//  public struct MediaCodecBuffer { }

/***********************************************************
@brief Opaque structure representing a MediaCodec buffer to render.
***********************************************************/
[CCode (cname="struct AVMediaCodecBuffer", cheader_filename="ffmpeg/libavcodec/mediacodec.h")]
public struct MediaCodecBuffer {

    /***********************************************************
    @brief Release a MediaCodec buffer and render it to the surface that is associated
    with the decoder. This function should only be called once on a given
    buffer, once released the underlying buffer returns to the codec, thus
    subsequent calls to this function will have no effect.

    @param buffer the buffer to render
    @param render 1 to release and render the buffer to the surface or 0 to
    discard the buffer
    @return 0 on success, < 0 otherwise
    ***********************************************************/
    [CCode (cname="av_mediacodec_release_buffer", cheader_filename="ffmpeg/libavcodec/mediacodec.h")]
    public int av_mediacodec_release_buffer (
        MediaCodecBuffer buffer,
        int render
    );

    /***********************************************************
    @brief Release a MediaCodec buffer and render it at the given time to the surface
    that is associated with the decoder. The timestamp must be within one second
    of the current java/lang/System#nanoTime () (which is implemented using
    CLOCK_MONOTONIC on Android). See the Android MediaCodec documentation
    of android/media/MediaCodec#releaseOutputBuffer (int,long) for more details.

    @param buffer the buffer to render
    @param time timestamp in nanoseconds of when to render the buffer
    @return 0 on success, < 0 otherwise
    ***********************************************************/
    [CCode (cname="av_mediacodec_render_buffer_at_time", cheader_filename="ffmpeg/libavcodec/mediacodec.h")]
    public int av_mediacodec_render_buffer_at_time (
        MediaCodecBuffer buffer,
        int64 time
    );
}

} // namespace LibAVCodec
