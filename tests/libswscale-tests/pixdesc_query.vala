/***********************************************************
Copyright (c) 2017 Clément Bœsch <u pkh me>

This file is part of FFmpeg.

FFmpeg is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

FFmpeg is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with FFmpeg; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
***********************************************************/

//  #include <stdlib.h>

//  #include "libavutil/mem.h"
//  #include "libswscale/swscale_internal.h"

private struct QueryTab {
    string class;
    delegate int Cond (AVPixelFormat pix_fmt);
    Cond cond;
}

private QueryTab query_tab[] = {
    {"is16BPS", is16BPS},
    {"isNBPS", isNBPS},
    {"isBE", isBE},
    {"isYUV", isYUV},
    {"isPlanarYUV", isPlanarYUV},
    {"isSemiPlanarYUV", isSemiPlanarYUV},
    {"isRGB", isRGB},
    {"Gray", isGray},
    {"RGBinInt", isRGBinInt},
    {"BGRinInt", isBGRinInt},
    {"Bayer", isBayer},
    {"AnyRGB", isAnyRGB},
    {"ALPHA", isALPHA},
    {"Packed", isPacked},
    {"Planar", isPlanar},
    {"PackedRGB", isPackedRGB},
    {"PlanarRGB", isPlanarRGB},
    {"usePal", usePal},
};

private static int cmp_str (void *a, void *b
) {
    string s1 = *(
    string[] )a;
    string s2 = *(
    string[] )b;
    return strcmp (s1, s2);
}

private static int main () {
    int i, j;

    for (i = 0; i < FF_ARRAY_ELEMS (query_tab); i++) {
        string[] pix_fmts = null;
        int nb_pix_fmts = 0;
        AVPixFmtDescriptor? pix_desc = null;

        while ((pix_desc = av_pix_fmt_desc_next (pix_desc))) {
            AVPixelFormat pix_fmt = av_pix_fmt_desc_get_id (pix_desc);
            if (query_tab[i].cond (pix_fmt)) {
                string pix_name = pix_desc.name;
                if      (pix_fmt == LibAVUtil.PixelFormat.RGB32)   pix_name = "rgb32";
                else if (pix_fmt == LibAVUtil.PixelFormat.RGB32_1) pix_name = "rgb32_1";
                else if (pix_fmt == LibAVUtil.PixelFormat.BGR32)   pix_name = "bgr32";
                else if (pix_fmt == LibAVUtil.PixelFormat.BGR32_1) pix_name = "bgr32_1";

                av_dynarray_add (&pix_fmts, &nb_pix_fmts, (void *)pix_name);
            }

        }

        if (pix_fmts) {
            qsort (pix_fmts, nb_pix_fmts, sizeof (pix_fmts), cmp_str);

            printf ("%s:\n", query_tab[i].class);
            for (j = 0; j < nb_pix_fmts; j++)
                printf ("  %s\n", pix_fmts[j]);
            printf ("\n");

            av_free (pix_fmts);
        }

    }

    return 0;
}
