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
@brief Sum of abs (src1[x] - src2[x])
***********************************************************/
[CCode (cname="av_pixelutils_sad_fn", cheader_filename="ffmpeg/libavutil/pixelutils.h")]
public delegate int SumOfAbsoluteDifferencesDelegate (
    uint8[] src1,
    size_t stride1,
    uint8[] src2,
    size_t stride2
);

/***********************************************************
@brief Get a potentially optimized pointer to a Sum-of-absolute-differences
function (see @link SumOfAbsoluteDifferencesDelegate prototype).

@param w_bits 1<<w_bits is the requested width of the block size
@param h_bits 1<<h_bits is the requested height of the block size
@param aligned If set to 2, the returned sad function will assume src1 and
    src2 addresses are aligned on the block size.
    If set to 1, the returned sad function will assume src1 is
    aligned on the block size.
    If set to 0, the returned sad function assume no particular
    alignment.
@param log_ctx context used for logging, can be null

@return a pointer to the SAD function or null in case of error (because of
    invalid parameters)
***********************************************************/
[CCode (cname="av_pixelutils_get_sad_fn", cheader_filename="ffmpeg/libavutil/pixelutils.h")]
public static SumOfAbsoluteDifferencesDelegate av_pixelutils_get_sad_fn (
    int w_bits,
    int h_bits,
    int aligned,
    void *log_ctx
);

} // namespace LibAVUtil
