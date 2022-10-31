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
@brief Function pointer to a function to perform the transform.

@note Using a different context than the one allocated during av_tx_init ()
is not allowed.

@param s the transform context
@param out the output array
@param in the input array
@param stride the input or output stride (depending on transform direction)
in bytes, currently implemented for all MDCT transforms
***********************************************************/
[CCode (cname="av_tx_fn", cheader_filename="ffmpeg/libavutil/tx.h")]
public delegate void TransformDelegate (
    TransformContext s,
    out void *output,
    void *input,
    size_t stride
);

[CCode (cname="struct AVTXContext", cheader_filename="ffmpeg/libavutil/tx.h")]
public struct TransformContext {
    /***********************************************************
    @brief Initialize a transform context with the given configuration
    Currently power of two lengths from 4 to 131072 are supported, along with
    any length decomposable to a power of two and either 3, 5 or 15.

    @param transform_context the context to allocate, will be null on error
    @param tx pointer to the transform function pointer to set
    @param type type the type of transform
    @param inv whether to do an inverse or a forward transform
    @param len the size of the transform in samples
    @param scale pointer to the value to scale the output if supported by type
    @param flags currently unused

    @return 0 on success, negative error code on failure
    ***********************************************************/
    [CCode (cname="av_tx_init", cheader_filename="ffmpeg/libavutil/tx.h")]
    public int av_tx_init (
        TransformContext transform_context,
        TransformDelegate tx,
        TransformType type,
        int inv,
        int len,
        void *scale,
        uint64 flags
    );

    /***********************************************************
    @brief Frees a context and sets transform_context to null, does nothing when transform_context == null
    ***********************************************************/
    [CCode (cname="av_tx_uninit", cheader_filename="ffmpeg/libavutil/tx.h")]
    public void av_tx_uninit (
        TransformContext transform_context
    );
}

} // namespace LibAVUtil
