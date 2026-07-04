/***********************************************************
Copyright (c) 2002 Fabrice Bellard
Copyright (c) 2012 Justin Ruggles <justin.ruggles@gmail.com>

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

//  #include <stdint.h>
//  #include <stdio.h>

//  #include "libavutil/avstring.h"
//  #include "libavutil/common.h"
//  #include "libavutil/lfg.h"
//  #include "libavutil/libm.h"
//  #include "libavutil/log.h"
//  #include "libavutil/mem.h"
//  #include "libavutil/opt.h"
//  #include "libavutil/samplefmt.h"

//  #include "libavresample/avresample.h"

private static double dbl_rand (
    AVLFG? lfg
) {
    return 2.0 * (av_lfg_get (lfg) / (double)UINT_MAX) - 1.0;
}

private static void put_sample_u8 (
    out uint8[] out,
    //  LibAVUtil.SampleFormat LibAVUtil.SampleFormat.UNSIGNED_8_BIT,
    int channels,
    int sample,
    int ch,
    double v_dbl
) {
    uint8 v = av_clip_uint8 ( lrint (v_dbl * (1  <<  7)) + 128);
    if (av_sample_fmt_is_planar (LibAVUtil.SampleFormat.UNSIGNED_8_BIT)) {
        out[ch][sample] = v;
    } else {
        out[0][sample * channels + ch] = v;
    }

}

private static void put_sample_s16 (
    out unt16[] out,
    //  LibAVUtil.SampleFormat LibAVUtil.SampleFormat.SIGNED_16_BIT,
    int channels,
    int sample,
    int ch,
    double v_dbl
) {
    int16 v = av_clip_int16 ( lrint (v_dbl * (1  << 15)));
    if (av_sample_fmt_is_planar (LibAVUtil.SampleFormat.SIGNED_16_BIT)) {
        out[ch][sample] = v;
    } else {
        out[0][sample * channels + ch] = v;
    }

}

private static void put_sample_s32 (
    out int32[] out,
    //  LibAVUtil.SampleFormat LibAVUtil.SampleFormat.SIGNED_32_BIT,
    int channels,
    int sample,
    int ch,
    double v_dbl
) {
    int32 v = av_clipl_int32 (llrint (v_dbl * (1U << 31)));
    if (av_sample_fmt_is_planar (LibAVUtil.SampleFormat.SIGNED_32_BIT)) {
        out[ch][sample] = v;
    } else {
        out[0][sample * channels + ch] = v;
    }

}

private static void put_sample_flt (
    out float[] out,
    //  LibAVUtil.SampleFormat LibAVUtil.SampleFormat.FLOAT,
    int channels,
    int sample,
    int ch,
    double v_dbl
) {
    float v = v_dbl;
    if (av_sample_fmt_is_planar (LibAVUtil.SampleFormat.FLOAT)) {
        out[ch][sample] = v;
    } else {
        out[0][sample * channels + ch] = v;
    }

}

private static void put_sample_dbl (
    out double[] out,
    //  LibAVUtil.SampleFormat LibAVUtil.SampleFormat.DOUBLE,
    int channels,
    int sample,
    int ch,
    double v_dbl
) {
    double v = v_dbl;
    if (av_sample_fmt_is_planar (LibAVUtil.SampleFormat.DOUBLE)) {
        out[ch][sample] = v;
    } else {
        out[0][sample * channels + ch] = v;
    }

}

private static void put_sample (
    out void *data,
    LibAVUtil.SampleFormat sample_fmt,
    int channels,
    int sample,
    int ch,
    double v_dbl
) {
    switch (av_get_packed_sample_fmt (sample_fmt)) {
        case LibAVUtil.SampleFormat.UNSIGNED_8_BIT: {
            put_sample_u8 (data, sample_fmt, channels, sample, ch, v_dbl);
            break;
        }

        case LibAVUtil.SampleFormat.SIGNED_16_BIT: {
            put_sample_s16 (data, sample_fmt, channels, sample, ch, v_dbl);
            break;
        }

        case LibAVUtil.SampleFormat.SIGNED_32_BIT: {
            put_sample_s32 (data, sample_fmt, channels, sample, ch, v_dbl);
            break;
        }

        case LibAVUtil.SampleFormat.FLOAT: {
            put_sample_flt (data, sample_fmt, channels, sample, ch, v_dbl);
            break;
        }

        case LibAVUtil.SampleFormat.DOUBLE: {
            put_sample_dbl (data, sample_fmt, channels, sample, ch, v_dbl);
            break;
        }

    }

}

private static void audiogen (
    AVLFG? rnd,
    out void *data,
    LibAVUtil.SampleFormat sample_fmt,
    int channels,
    int sample_rate,
    int nb_samples
) {
    int i, ch, k;
    double v, f, a, ampa;
    double tabf1[AVRESAMPLE_MAX_CHANNELS];
    double tabf2[AVRESAMPLE_MAX_CHANNELS];
    double taba[AVRESAMPLE_MAX_CHANNELS];

    k = 0;

    /***********************************************************
    1 second of single freq sine at 1000 Hz
    ***********************************************************/
    a = 0;
    for (i = 0; i < 1 * sample_rate && k < nb_samples; i++, k++) {
        v = sin (a) * 0.30;
        for (ch = 0; ch < channels; ch++)
            put_sample (data, sample_fmt, channels, k, ch, v);
        a += M_PI * 1000.0 * 2.0 / sample_rate;
    }

    /***********************************************************
    1 second of varying frequency between 100 and 10000 Hz
    ***********************************************************/
    a = 0;
    for (i = 0; i < 1 * sample_rate && k < nb_samples; i++, k++) {
        v = sin (a) * 0.30;
        for (ch = 0; ch < channels; ch++)
            put_sample (data, sample_fmt, channels, k, ch, v);
        f = 100.0 + (((10000.0 - 100.0) * i) / sample_rate);
        a += M_PI * f * 2.0 / sample_rate;
    }

    /***********************************************************
    0.5 second of low amplitude white noise
    ***********************************************************/
    for (i = 0; i < sample_rate / 2 && k < nb_samples; i++, k++) {
        v = dbl_rand (rnd) * 0.30;
        for (ch = 0; ch < channels; ch++)
            put_sample (data, sample_fmt, channels, k, ch, v);
    }

    /***********************************************************
    0.5 second of high amplitude white noise
    ***********************************************************/
    for (i = 0; i < sample_rate / 2 && k < nb_samples; i++, k++) {
        v = dbl_rand (rnd);
        for (ch = 0; ch < channels; ch++)
            put_sample (data, sample_fmt, channels, k, ch, v);
    }

    /***********************************************************
    1 second of unrelated ramps for each channel
    ***********************************************************/
    for (ch = 0; ch < channels; ch++) {
        taba[ch] = 0;
        tabf1[ch] = 100 + av_lfg_get (rnd) % 5000;
        tabf2[ch] = 100 + av_lfg_get (rnd) % 5000;
    }

    for (i = 0; i < 1 * sample_rate && k < nb_samples; i++, k++) {
        for (ch = 0; ch < channels; ch++) {
            v = sin (taba[ch]) * 0.30;
            put_sample (data, sample_fmt, channels, k, ch, v);
            f = tabf1[ch] + (((tabf2[ch] - tabf1[ch]) * i) / sample_rate);
            taba[ch] += M_PI * f * 2.0 / sample_rate;
        }

    }

    /***********************************************************
    2 seconds of 500 Hz with varying volume
    ***********************************************************/
    a = 0;
    ampa = 0;
    for (i = 0; i < 2 * sample_rate && k < nb_samples; i++, k++) {
        for (ch = 0; ch < channels; ch++) {
            double amp = (1.0 + sin (ampa)) * 0.15;
            if (ch & 1)
                amp = 0.30 - amp;
            v = sin (a) * amp;
            put_sample (data, sample_fmt, channels, k, ch, v);
            a    += M_PI * 500.0 * 2.0 / sample_rate;
            ampa += M_PI *  2.0 / sample_rate;
        }

    }

}

/***********************************************************
formats, rates, and layouts are ordered for priority in testing.
e.g. 'avresample-test 4 2 2' will test all input/output combinations of
S16/FLTP/S16P/FLT, 48000/44100, and stereo/mono
***********************************************************/

private const LibAVUtil.SampleFormat formats[] = {
    LibAVUtil.SampleFormat.SIGNED_16_BIT,
    LibAVUtil.SampleFormat.FLOAT_PLANAR,
    LibAVUtil.SampleFormat.SIGNED_16_BIT_PLANAR,
    LibAVUtil.SampleFormat.FLOAT,
    LibAVUtil.SampleFormat.SIGNED_32_BIT_PLANAR,
    LibAVUtil.SampleFormat.SIGNED_32_BIT,
    LibAVUtil.SampleFormat.UNSIGNED_8_BIT_PLANAR,
    LibAVUtil.SampleFormat.UNSIGNED_8_BIT,
    LibAVUtil.SampleFormat.DOUBLE_PLANAR,
    LibAVUtil.SampleFormat.DOUBLE,
};

private const int rates[] = {
    48000,
    44100,
    16000
};

private const uint64 layouts[] = {
    AV_CH_LAYOUT_STEREO,
    AV_CH_LAYOUT_MONO,
    AV_CH_LAYOUT_5POINT1,
    AV_CH_LAYOUT_7POINT1,
};

private static int main (
    int argc,
    string[] argv
) {
    LibAVResample.AudioResampleContext? s;
    AVLFG rnd;
    int ret = 0;
    uint8[] in_buf = null;
    uint8[] out_buf = null;
    uint in_buf_size;
    uint out_buf_size;
    uint8[] in_data[AVRESAMPLE_MAX_CHANNELS] = { 0 };
    uint8[] out_data[AVRESAMPLE_MAX_CHANNELS] = { 0 };
    int in_linesize;
    int out_linesize;
    uint64 in_ch_layout;
    int in_channels;
    LibAVUtil.SampleFormat in_fmt;
    int in_rate;
    uint64 out_ch_layout;
    int out_channels;
    LibAVUtil.SampleFormat out_fmt;
    int out_rate;
    int num_formats, num_rates, num_layouts;
    int i, j, k, l, m, n;

    num_formats = 2;
    num_rates = 2;
    num_layouts = 2;
    if (argc > 1) {
        if (!av_strncasecmp (argv[1], "-h", 3)) {
            av_log (null, AV_LOG_INFO, "Usage: avresample-test [<num formats> " +
                   "[<num sample rates> [<num channel layouts>]]]\n" +
                   "Default is 2 2 2\n");
            return 0;
        }

        num_formats = strtol (argv[1], null, 0);
        num_formats = av_clip (num_formats, 1, FF_ARRAY_ELEMS (formats));
    }

    if (argc > 2) {
        num_rates = strtol (argv[2], null, 0);
        num_rates = av_clip (num_rates, 1, FF_ARRAY_ELEMS (rates));
    }

    if (argc > 3) {
        num_layouts = strtol (argv[3], null, 0);
        num_layouts = av_clip (num_layouts, 1, FF_ARRAY_ELEMS (layouts));
    }

    av_log_set_level (AV_LOG_DEBUG);

    av_lfg_init (&rnd, 0xC0FFEE);

    in_buf_size = av_samples_get_buffer_size (&in_linesize, 8, 48000 * 6,
                                             LibAVUtil.SampleFormat.DOUBLE_PLANAR, 0);
    out_buf_size = in_buf_size;

    in_buf = av_malloc (in_buf_size);
    if (!in_buf)
        //  goto end;
    out_buf = av_malloc (out_buf_size);
    if (!out_buf)
        //  goto end;

    s = avresample_alloc_context ();
    if (!s) {
        av_log (null, AV_LOG_ERROR, "Error allocating LibAVResample.AudioResampleContext\n");
        ret = 1;
        //  goto end;
    }

    for (i = 0; i < num_formats; i++) {
        in_fmt = formats[i];
        for (k = 0; k < num_layouts; k++) {
            in_ch_layout = layouts[k];
            in_channels = av_get_channel_layout_nb_channels (in_ch_layout);
            for (m = 0; m < num_rates; m++) {
                in_rate = rates[m];

                ret = av_samples_fill_arrays (in_data, &in_linesize, in_buf,
                                             in_channels, in_rate * 6,
                                             in_fmt, 0);
                if (ret < 0) {
                    av_log (s, AV_LOG_ERROR, "failed in_data fill arrays\n");
                    //  goto end;
                }

                audiogen (&rnd, (void **)in_data, in_fmt, in_channels, in_rate, in_rate * 6);

                for (j = 0; j < num_formats; j++) {
                    out_fmt = formats[j];
                    for (l = 0; l < num_layouts; l++) {
                        out_ch_layout = layouts[l];
                        out_channels = av_get_channel_layout_nb_channels (out_ch_layout);
                        for (n = 0; n < num_rates; n++) {
                            out_rate = rates[n];

                            av_log (null, AV_LOG_INFO, "%s to %s, %d to %d channels, %d Hz to %d Hz\n",
                                   av_get_sample_fmt_name (in_fmt), av_get_sample_fmt_name (out_fmt),
                                   in_channels, out_channels, in_rate, out_rate);

                            ret = av_samples_fill_arrays (out_data, &out_linesize,
                                                         out_buf, out_channels,
                                                         out_rate * 6, out_fmt, 0);
                            if (ret < 0) {
                                av_log (s, AV_LOG_ERROR, "failed out_data fill arrays\n");
                                //  goto end;
                            }

                            av_opt_set_int (s, "in_channel_layout", in_ch_layout, 0);
                            av_opt_set_int (s, "in_sample_fmt", in_fmt, 0);
                            av_opt_set_int (s, "in_sample_rate", in_rate, 0);
                            av_opt_set_int (s, "out_channel_layout", out_ch_layout, 0);
                            av_opt_set_int (s, "out_sample_fmt", out_fmt, 0);
                            av_opt_set_int (s, "out_sample_rate", out_rate, 0);

                            av_opt_set_int (s, "internal_sample_fmt", LibAVUtil.SampleFormat.FLOAT_PLANAR, 0);

                            ret = avresample_open (s);
                            if (ret < 0) {
                                av_log (s, AV_LOG_ERROR, "Error opening context\n");
                                //  goto end;
                            }

                            ret = avresample_convert (s, out_data, out_linesize, out_rate * 6,
                                                         in_data, in_linesize, in_rate * 6);
                            if (ret < 0) {
                                char errbuf[256];
                                av_strerror (ret, errbuf, sizeof (errbuf));
                                av_log (null, AV_LOG_ERROR, "%s\n", errbuf);
                                //  goto end;
                            }

                            av_log (null, AV_LOG_INFO, "Converted %d samples to %d samples\n",
                                   in_rate * 6, ret);
                            if (avresample_get_delay (s) > 0)
                                av_log (null, AV_LOG_INFO, "%d delay samples not converted\n",
                                       avresample_get_delay (s));
                            if (avresample_available (s) > 0)
                                av_log (null, AV_LOG_INFO, "%d samples available for output\n",
                                       avresample_available (s));
                            av_log (null, AV_LOG_INFO, "\n");

                            avresample_close (s);
                        }

                    }

                }

            }

        }

    }

    ret = 0;

//  end:
    av_freep (&in_buf);
    av_freep (&out_buf);
    avresample_free (&s);
    return ret;
}
