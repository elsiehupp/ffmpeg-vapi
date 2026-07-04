/***********************************************************
Copyright (C) 2003-2011 Michael Niedermayer <michaelni@gmx.at>

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

//  #include <stdio.h>
//  #include <stdlib.h>
//  #include <string.h>
//  #include <inttypes.h>
//  #include <stdarg.h>

//  #undef HAVE_AV_CONFIG_H
//  #include "libavutil/cpu.h"
//  #include "libavutil/imgutils.h"
//  #include "libavutil/mem.h"
//  #include "libavutil/avutil.h"
//  #include "libavutil/crc.h"
//  #include "libavutil/pixdesc.h"
//  #include "libavutil/lfg.h"

//  #include "libswscale/swscale.h"

/***********************************************************
HACK Duplicated from swscale_internal.h.
Should be removed when a cleaner pixel format system exists.
***********************************************************/
private static bool isGray (
    LibAVUtil.PixelFormat pixel_format
) {
    return (
        pixel_format == LibAVUtil.PixelFormat.GRAY8 ||
        pixel_format == LibAVUtil.PixelFormat.YA8 ||
        pixel_format == LibAVUtil.PixelFormat.GRAY16BE ||
        pixel_format == LibAVUtil.PixelFormat.GRAY16LE ||
        pixel_format == LibAVUtil.PixelFormat.YA16BE ||
        pixel_format == LibAVUtil.PixelFormat.YA16LE
    );

}

private static bool hasChroma (
    LibAVUtil.PixelFormat pixel_format
) {
    return !(
        isGray (
            pixel_format
        ) ||
        pixel_format == LibAVUtil.PixelFormat.MONOBLACK ||
        pixel_format == LibAVUtil.PixelFormat.MONOWHITE
    );

}

private static bool isALPHA (
    LibAVUtil.PixelFormat pixel_format
) {
    return (
        pixel_format == LibAVUtil.PixelFormat.BGR32 ||
        pixel_format == LibAVUtil.PixelFormat.BGR32_1 ||
        pixel_format == LibAVUtil.PixelFormat.RGB32 ||
        pixel_format == LibAVUtil.PixelFormat.RGB32_1 ||
        pixel_format == LibAVUtil.PixelFormat.YUVA420P
    );

}

private static uint64 getSSD (
    uint8[] src1,
    uint8[] src2,
    int stride1,
    int stride2,
    int w,
    int h
) {
    int x;
    int y;
    uint64 ssd = 0;

    for (y = 0; y < h; y++) {
        for (x = 0; x < w; x++) {
            int d = src1[x + y * stride1] - src2[x + y * stride2];
            ssd += d * d;
        }

    }

    return ssd;
}

private struct Results {
    uint64 ssdY;
    uint64 ssdU;
    uint64 ssdV;
    uint64 ssdA;
    uint32 crc;
}

private static AVPixelFormat cur_srcFormat;
private static int cur_srcW;
private static int cur_srcH;
private static uint8[] src[4];
private static int srcStride[4];

// test by ref_data . src . dst . out & compare out against ref_data
// ref_data & out are YV12
public static int doTest (
    uint8[] ref_data[4],
    int refStride[4],
    int w,
    int h,
    AVPixelFormat srcFormat,
    AVPixelFormat dstFormat,
    int srcW,
    int srcH,
    int dstW,
    int dstH,
    int flags,
    Results? r
) {
    AVPixFmtDescriptor? desc_yuva420p = av_pix_fmt_desc_get (LibAVUtil.PixelFormat.YUVA420P);
    AVPixFmtDescriptor? desc_src = av_pix_fmt_desc_get (srcFormat);
    AVPixFmtDescriptor? desc_dst = av_pix_fmt_desc_get (dstFormat);
    uint8[] dst[4] = { 0 };
    uint8[] out_data[4] = { 0 };
    int dstStride[4] = {0};
    int i;
    uint64 ssdY, ssdU = 0, ssdV = 0, ssdA = 0;
    SwsContext? dstContext = null;
    SwsContext? outContext = null;
    uint32 crc = 0;
    int res = 0;

    if (cur_srcFormat != srcFormat || cur_srcW != srcW || cur_srcH != srcH) {
        SwsContext? srcContext = null;
        int p;

        for (p = 0; p < 4; p++)
            av_freep (&src[p]);

        res = av_image_fill_linesizes (srcStride, srcFormat, srcW);
        if (res < 0) {
            fprintf (stderr, "av_image_fill_linesizes failed\n");
            //  goto end;
        }

        for (p = 0; p < 4; p++) {
            srcStride[p] = FFALIGN (srcStride[p], 16);
            if (srcStride[p])
                src[p] = av_mallocz (srcStride[p] * srcH + 16);
            if (srcStride[p] && !src[p]) {
                perror ("Malloc");
                res = -1;
                //  goto end;
            }

        }

        srcContext = sws_getContext (w, h, LibAVUtil.PixelFormat.YUVA420P, srcW, srcH,
                                    srcFormat, LibSoftwareScale.SoftwareScaleFlags.BILINEAR, null, null, null);
        if (!srcContext) {
            fprintf (stderr, "Failed to get %s --. %s\n",
                    desc_yuva420p.name,
                    desc_src.name);
            res = -1;
            //  goto end;
        }

        sws_scale (srcContext, ref_data, refStride, 0, h,
                  (uint8[][]) src, srcStride);
        sws_freeContext (srcContext);

        cur_srcFormat = srcFormat;
        cur_srcW = srcW;
        cur_srcH = srcH;
    }

    res = av_image_fill_linesizes (dstStride, dstFormat, dstW);
    if (res < 0) {
        fprintf (stderr, "av_image_fill_linesizes failed\n");
        //  goto end;
    }

    for (i = 0; i < 4; i++) {
        /***********************************************************
        Image buffers passed into libswscale can be allocated any way you
        prefer, as long as they're aligned enough for the architecture, and
        they're freed appropriately (such as using av_free for buffers
        allocated with av_malloc).
        ***********************************************************/
        /***********************************************************
        An extra 16 bytes is being allocated because some scalers may write
        out of bounds.
        ***********************************************************/
        dstStride[i] = FFALIGN (dstStride[i], 16);
        if (dstStride[i])
            dst[i] = av_mallocz (dstStride[i] * dstH + 16);
        if (dstStride[i] && !dst[i]) {
            perror ("Malloc");
            res = -1;

            //  goto end;
        }

    }

    dstContext = sws_getContext (srcW, srcH, srcFormat, dstW, dstH, dstFormat,
                                flags, null, null, null);
    if (!dstContext) {
        fprintf (stderr, "Failed to get %s --. %s\n",
                desc_src.name, desc_dst.name);
        res = -1;
        //  goto end;
    }

    printf (" %s %dx%d . %s %3dx%3d flags=%2d",
           desc_src.name, srcW, srcH,
           desc_dst.name, dstW, dstH,
           flags);
    fflush (stdout);

    sws_scale (dstContext, (uint8[][])src, srcStride, 0, srcH, dst, dstStride);

    for (i = 0; i < 4 && dstStride[i]; i++)
        crc = av_crc (av_crc_get_table (AV_CRC_32_IEEE), crc, dst[i],
                     dstStride[i] * dstH);

    if (r && crc == r.crc) {
        ssdY = r.ssdY;
        ssdU = r.ssdU;
        ssdV = r.ssdV;
        ssdA = r.ssdA;
    } else {
        for (i = 0; i < 4; i++) {
            refStride[i] = FFALIGN (refStride[i], 16);
            if (refStride[i])
                out_data[i] = av_mallocz (refStride[i] * h);
            if (refStride[i] && !out_data[i]) {
                perror ("Malloc");
                res = -1;
                //  goto end;
            }

        }

        outContext = sws_getContext (dstW, dstH, dstFormat, w, h,
                                    LibAVUtil.PixelFormat.YUVA420P, LibSoftwareScale.SoftwareScaleFlags.BILINEAR,
                                    null, null, null);
        if (!outContext) {
            fprintf (stderr, "Failed to get %s --. %s\n",
                    desc_dst.name,
                    desc_yuva420p.name);
            res = -1;
            //  goto end;
        }

        sws_scale (outContext, (uint8[][]) dst, dstStride, 0, dstH,
                  out_data, refStride);

        ssdY = getSSD (ref_data[0], out_data[0], refStride[0], refStride[0], w, h);
        if (hasChroma (srcFormat) && hasChroma (dstFormat)) {
            //FIXME check that output is really gray
            ssdU = getSSD (ref_data[1], out_data[1], refStride[1], refStride[1],
                          (w + 1) >> 1, (h + 1) >> 1);
            ssdV = getSSD (ref_data[2], out_data[2], refStride[2], refStride[2],
                          (w + 1) >> 1, (h + 1) >> 1);
        }

        if (isALPHA (srcFormat) && isALPHA (dstFormat))
            ssdA = getSSD (ref_data[3], out_data[3], refStride[3], refStride[3], w, h);

        ssdY /= w * h;
        ssdU /= w * h / 4;
        ssdV /= w * h / 4;
        ssdA /= w * h;

        sws_freeContext (outContext);

        for (i = 0; i < 4; i++)
            if (refStride[i])
                av_free (out_data[i]);
    }

    printf (" CRC=%08x SSD=%5PRId64 ,%5PRId64 ,%5PRId64 ,%5PRId64 \n",
           crc, ssdY, ssdU, ssdV, ssdA);

//  end:
    sws_freeContext (dstContext);

    for (i = 0; i < 4; i++)
        if (dstStride[i])
            av_free (dst[i]);

    return res;
}

private const LibSoftwareScale.SoftwareScaleFlags flags[] = {
    LibSoftwareScale.SoftwareScaleFlags.FAST_BILINEAR, LibSoftwareScale.SoftwareScaleFlags.BILINEAR, LibSoftwareScale.SoftwareScaleFlags.BICUBIC,
    LibSoftwareScale.SoftwareScaleFlags.X, LibSoftwareScale.SoftwareScaleFlags.POINT, LibSoftwareScale.SoftwareScaleFlags.AREA, 0
};

private static void selfTest (
    uint8[] ref_data[4], int refStride[4],
    int w, int h,
    AVPixelFormat srcFormat_in,
    AVPixelFormat dstFormat_in
) {
    int srcW = w;
    int srcH = h;
    int dstW[] = { srcW - srcW / 3, srcW, srcW + srcW / 3, 0 };
    int dstH[] = { srcH - srcH / 3, srcH, srcH + srcH / 3, 0 };
    AVPixelFormat srcFormat, dstFormat;
    AVPixFmtDescriptor? desc_src;
    AVPixFmtDescriptor? desc_dst;

    for (srcFormat = srcFormat_in != LibAVUtil.PixelFormat.NONE ? srcFormat_in : 0;
         srcFormat < LibAVUtil.PixelFormat.NB; srcFormat++) {
        if (!sws_isSupportedInput (srcFormat) ||
            !sws_isSupportedOutput (srcFormat))
            continue;

        desc_src = av_pix_fmt_desc_get (srcFormat);

        for (dstFormat = dstFormat_in != LibAVUtil.PixelFormat.NONE ? dstFormat_in : 0;
             dstFormat < LibAVUtil.PixelFormat.NB; dstFormat++) {
            int i, j, k;
            int res = 0;

            if (!sws_isSupportedInput (dstFormat) ||
                !sws_isSupportedOutput (dstFormat))
                continue;

            desc_dst = av_pix_fmt_desc_get (dstFormat);

            printf ("%s . %s\n", desc_src.name, desc_dst.name);
            fflush (stdout);

            for (k = 0; flags[k] && !res; k++)
                for (i = 0; dstW[i] && !res; i++)
                    for (j = 0; dstH[j] && !res; j++)
                        res = doTest (ref_data, refStride, w, h,
                                     srcFormat, dstFormat,
                                     srcW, srcH, dstW[i], dstH[j], flags[k],
                                     null);
            if (dstFormat_in != LibAVUtil.PixelFormat.NONE)
                break;
        }

        if (srcFormat_in != LibAVUtil.PixelFormat.NONE)
            break;
    }

}

private static int fileTest (
    uint8[] ref_data[4], int refStride[4],
    int w, int h, FILE? fp,
    AVPixelFormat srcFormat_in,
    AVPixelFormat dstFormat_in
) {
    char buf[256];

    while (fgets (buf, sizeof (buf), fp)) {
        Results r;
        AVPixelFormat srcFormat;
        char srcStr[21];
        int srcW = 0, srcH = 0;
        AVPixelFormat dstFormat;
        char dstStr[21];
        int dstW = 0, dstH = 0;
        int flags;
        int ret;

        ret = sscanf (buf,
                     " %20s %dx%d . %20s %dx%d flags=%d CRC=%x" +
                     " SSD=%SCNu64 , %SCNu64 , %SCNu64 , %SCNu64 \n",
                     srcStr, &srcW, &srcH, dstStr, &dstW, &dstH,
                     &flags, &r.crc, &r.ssdY, &r.ssdU, &r.ssdV, &r.ssdA);
        if (ret != 12) {
            srcStr[0] = dstStr[0] = 0;
            ret = sscanf (buf, "%20s . %20s\n", srcStr, dstStr);
        }

        srcFormat = av_get_pix_fmt (srcStr);
        dstFormat = av_get_pix_fmt (dstStr);

        if (srcFormat == LibAVUtil.PixelFormat.NONE || dstFormat == LibAVUtil.PixelFormat.NONE ||
            srcW > 8192U || srcH > 8192U || dstW > 8192U || dstH > 8192U) {
            fprintf (stderr, "malformed input file\n");
            return -1;
        }

        if ((srcFormat_in != LibAVUtil.PixelFormat.NONE && srcFormat_in != srcFormat) ||
            (dstFormat_in != LibAVUtil.PixelFormat.NONE && dstFormat_in != dstFormat))
            continue;
        if (ret != 12) {
            printf ("%s", buf);
            continue;
        }

        doTest (ref_data, refStride, w, h,
               srcFormat, dstFormat,
               srcW, srcH, dstW, dstH, flags,
               &r);
    }

    return 0;
}

private const int W = 96;
private const int H = 96;

private static int main (
    int argc,
    string[] argv
) {
    AVPixelFormat srcFormat = LibAVUtil.PixelFormat.NONE;
    AVPixelFormat dstFormat = LibAVUtil.PixelFormat.NONE;
    uint8[] rgb_data = av_malloc (W * H * 4);
    uint8[] rgb_src[4] = { rgb_data, null, null, null };
    int rgb_stride[4] = { 4 * W, 0, 0, 0 };
    uint8[] data = av_malloc (4 * W * H);
    uint8[] src[4] = { data, data + W * H, data + W * H * 2, data + W * H * 3 };
    int stride[4] = { W, W, W, W };
    int x, y;
    SwsContext? sws;
    AVLFG rand;
    int res = -1;
    int i;
    FILE? fp = null;

    if (!rgb_data || !data)
        return -1;

    for (i = 1; i < argc; i += 2) {
        if (argv[i][0] != '-' || i + 1 == argc)
            //  goto bad_option;
        if (!strcmp (argv[i], "-ref")) {
            fp = fopen (argv[i + 1], "r");
            if (!fp) {
                fprintf (stderr, "could not open '%s'\n", argv[i + 1]);
                //  goto error;
            }

        } else if (!strcmp (argv[i], "-cpuflags")) {
            uint flags = av_get_cpu_flags ();
            int ret = av_parse_cpu_caps (&flags, argv[i + 1]);
            if (ret < 0) {
                fprintf (stderr, "invalid cpu flags %s\n", argv[i + 1]);
                return ret;
            }

            av_force_cpu_flags (flags);
        } else if (!strcmp (argv[i], "-src")) {
            srcFormat = av_get_pix_fmt (argv[i + 1]);
            if (srcFormat == LibAVUtil.PixelFormat.NONE) {
                fprintf (stderr, "invalid pixel format %s\n", argv[i + 1]);
                return -1;
            }

        } else if (!strcmp (argv[i], "-dst")) {
            dstFormat = av_get_pix_fmt (argv[i + 1]);
            if (dstFormat == LibAVUtil.PixelFormat.NONE) {
                fprintf (stderr, "invalid pixel format %s\n", argv[i + 1]);
                return -1;
            }

        } else {
//  bad_option:
            fprintf (stderr, "bad option or argument missing (%s)\n", argv[i]);
            //  goto error;
        }

    }

    sws = sws_getContext (W / 12, H / 12, LibAVUtil.PixelFormat.RGB32, W, H,
                         LibAVUtil.PixelFormat.YUVA420P, LibSoftwareScale.SoftwareScaleFlags.BILINEAR, null, null, null);

    av_lfg_init (&rand, 1);

    for (y = 0; y < H; y++)
        for (x = 0; x < W * 4; x++)
            rgb_data[ x + y * 4 * W] = av_lfg_get (&rand);
    sws_scale (sws, rgb_src, rgb_stride, 0, H / 12, (uint8[][]) src, stride);
    sws_freeContext (sws);
    av_free (rgb_data);

    if (fp) {
        res = fileTest (src, stride, W, H, fp, srcFormat, dstFormat);
        fclose (fp);
    } else {
        selfTest (src, stride, W, H, srcFormat, dstFormat);
        res = 0;
    }
//  error:
    av_free (data);

    return res;
}
