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

[Compact]
public class AudioFIRSegment {
    public int nb_partitions;
    public int part_size;
    public int block_size;
    public int fft_length;
    public int coeff_size;
    public int input_size;
    public int input_offset;

    public int[] output_offset;
    public int[] part_index;

    public AVFrame sum;
    public AVFrame block;
    public AVFrame buffer;
    public AVFrame coeff;
    public AVFrame input;
    public AVFrame output;

    RDFTContext **rdft, **irdft;
}

[Compact]
public class AudioFIRDSPContext {

    [CCode (cname="fcmul_add")]
    public void (*fcmul_add)(
        float *sum, float *t, float *c,
        ptrdiff_t len
    );

}

[Compact]
public class AudioFIRContext {
    const AVClass *class;

    float wet_gain;
    float dry_gain;
    float length;
    public int gtype;
    float ir_gain;
    public int ir_format;
    float max_ir_len;
    public int response;
    public int w, h;
    public AVRational frame_rate;
    public int ir_channel;
    public int minp;
    public int maxp;

    float gain;

    public int eof_coeffs;
    public int have_coeffs;
    public int nb_taps;
    public int nb_channels;
    public int nb_coef_channels;
    public int one2many;

    AudioFIRSegment seg[1024];
    public int nb_segments;

    public AVFrame in[2];
    public AVFrame video;
    public int min_part_size;
    public int64 pts;

    AudioFIRDSPContext afirdsp;
    AVFloatDSPContext *fdsp;

}

public void ff_afir_init (AudioFIRDSPContext *s);
public void ff_afir_init_x86 (AudioFIRDSPContext *s);
