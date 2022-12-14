/***********************************************************
Copyright (c) 2017 Paul B Mahol

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

public struct AudioFIRSegment {
    int nb_partitions;
    int part_size;
    int block_size;
    int fft_length;
    int coeff_size;
    int input_size;
    int input_offset;

    int[] output_offset;
    int[] part_index;

    AVFrame *sum;
    AVFrame *block;
    AVFrame *buffer;
    AVFrame *coeff;
    AVFrame *input;
    AVFrame *output;

    RDFTContext **rdft, **irdft;
}

public struct AudioFIRDSPContext {
    void (*fcmul_add)(float *sum, float *t, float *c,
                      ptrdiff_t len);
}

public struct AudioFIRContext {
    const AVClass *class;

    float wet_gain;
    float dry_gain;
    float length;
    int gtype;
    float ir_gain;
    int ir_format;
    float max_ir_len;
    int response;
    int w, h;
    AVRational frame_rate;
    int ir_channel;
    int minp;
    int maxp;

    float gain;

    int eof_coeffs;
    int have_coeffs;
    int nb_taps;
    int nb_channels;
    int nb_coef_channels;
    int one2many;

    AudioFIRSegment seg[1024];
    int nb_segments;

    AVFrame *in[2];
    AVFrame *video;
    int min_part_size;
    int64 pts;

    AudioFIRDSPContext afirdsp;
    AVFloatDSPContext *fdsp;

}

void ff_afir_init (AudioFIRDSPContext *s);
void ff_afir_init_x86 (AudioFIRDSPContext *s);
