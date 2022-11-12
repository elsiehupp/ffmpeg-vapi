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

namespace LibAVCodec {
using LibAVUtil;

public delegate void IDCTDelegate (
    int16[] block /***********************************************************
    align 16
***********************************************************/
);
public delegate void FDCTDelegate (
    int16[] block /***********************************************************
    align 16
***********************************************************/
);
public delegate void GetPixelsDelegate (
    int16[] block /***********************************************************
    align 16 */,
    uint8[] pixels /***********************************************************
    align 8 */,
    size_t line_size
);

/***********************************************************
@brief DCT context.
@note function pointers can be null if the specific features have been
    disabled at build time.
***********************************************************/
[CCode (cname="struct AVDCT", cheader_filename="ffmpeg/libavcodec/avdct.h")]
public struct DCT {
    [CCode (cname="av_class")]
    public LibAVUtil.Class av_class;

    [CCode (cname="idct")]
    public IDCTDelegate idct;

    /***********************************************************
    @brief IDCT input permutation.
    Several optimized IDCTs need a permutated input (relative to the
    normal order of the reference IDCT).
    This permutation must be performed before the idct_put/add.
    Note, normally this can be merged with the zigzag/alternate scan<br>
    An example to avoid confusion:
    - (->decode coeffs -> zigzag reorder -> dequant -> reference IDCT -> ...)
    - (x -> reference DCT -> reference IDCT -> x)
    - (x -> reference DCT -> simple_mmx_perm = idct_permutation
       -> simple_idct_mmx -> x)
    - (-> decode coeffs -> zigzag reorder -> simple_mmx_perm -> dequant
       -> simple_idct_mmx -> ...)
        ***********************************************************/
    [CCode (cname="idct_permutation")]
    public uint8 idct_permutation[64];

    [CCode (cname="fdct")]
    public FDCTDelegate fdct;

    /***********************************************************
    @brief DCT algorithm.
    must use LibAVUtil.Options to set this field.
        ***********************************************************/
    [CCode (cname="dct_algo")]
    public int dct_algo;

    /***********************************************************
    @brief IDCT algorithm.
    must use LibAVUtil.Options to set this field.
        ***********************************************************/
    [CCode (cname="idct_algo")]
    public int idct_algo;

    [CCode (cname="get_pixels")]
    public GetPixelsDelegate get_pixels;

    [CCode (cname="bits_per_sample")]
    public int bits_per_sample;

    /***********************************************************
    @brief Allocates a DCT context.
    This needs to be initialized with avcodec_dct_init () after optionally
    configuring it with LibAVUtil.Options.

    To free it use av_free ()
        ***********************************************************/
    [CCode (cname="avcodec_dct_alloc", cheader_filename="ffmpeg/libavcodec/avdct.h")]
    public DCT avcodec_dct_alloc ();

    [CCode (cname="avcodec_dct_init", cheader_filename="ffmpeg/libavcodec/avdct.h")]
    public int avcodec_dct_init (
        DCT avdct
    );

    [CCode (cname="avcodec_dct_get_class", cheader_filename="ffmpeg/libavcodec/avdct.h")]
    public LibAVUtil.Class avcodec_dct_get_class ();
}

} // namespace LibAVCodec
