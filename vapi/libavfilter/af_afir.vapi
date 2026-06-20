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

[CCode (cname="",cheader_filename="")]
[Compact]
public class AudioFIRSegment {
    [CCode (cname="")]
    public int nb_partitions;

    [CCode (cname="")]
    public int part_size;

    [CCode (cname="")]
    public int block_size;

    [CCode (cname="")]
    public int fft_length;

    [CCode (cname="")]
    public int coeff_size;

    [CCode (cname="")]
    public int input_size;

    [CCode (cname="")]
    public int input_offset;

    [CCode (cname="")]
    public int[] output_offset;

    [CCode (cname="")]
    public int[] part_index;

    [CCode (cname="")]
    public AVFrame sum;

    [CCode (cname="")]
    public AVFrame block;

    [CCode (cname="")]
    public AVFrame buffer;

    [CCode (cname="")]
    public AVFrame coeff;

    [CCode (cname="")]
    public AVFrame input;

    [CCode (cname="")]
    public AVFrame output;

    [CCode (cname="")]
    public RDFTContext **rdft;

    [CCode (cname="")]
    public RDFTContext **irdft;
}

[CCode (cname="",cheader_filename="")]
[Compact]
public class AudioFIRDSPContext {
    [CCode (cname="fcmul_add")]
    public void (*fcmul_add)(
        float[] sum, float[] t, float[] c,
        ptrdiff_t len
    );

}

[CCode (cname="",cheader_filename="")]
[Compact]
public class AudioFIRContext {
    [CCode (cname="")]
    public AVClass class;

    [CCode (cname="")]
    public float wet_gain;

    [CCode (cname="")]
    public float dry_gain;

    [CCode (cname="")]
    public float length;

    [CCode (cname="")]
    [CCode (cname="")]
    public int gtype;

    [CCode (cname="")]
    public float ir_gain;

    [CCode (cname="")]
    public int ir_format;

    [CCode (cname="")]
    public float max_ir_len;

    [CCode (cname="")]
    public int response;

    [CCode (cname="")]
    public int w;

    [CCode (cname="")]
    public int h;

    [CCode (cname="")]
    public AVRational frame_rate;

    [CCode (cname="")]
    public int ir_channel;

    [CCode (cname="")]
    public int minp;

    [CCode (cname="")]
    public int maxp;

    [CCode (cname="")]
    public float gain;

    [CCode (cname="")]
    public int eof_coeffs;

    [CCode (cname="")]
    public int have_coeffs;

    [CCode (cname="")]
    public int nb_taps;

    [CCode (cname="")]
    public int nb_channels;

    [CCode (cname="")]
    public int nb_coef_channels;

    [CCode (cname="")]
    public int one2many;

    [CCode (cname="")]
    public AudioFIRSegment seg[1024];

    [CCode (cname="")]
    public int nb_segments;

    [CCode (cname="")]
    public AVFrame in[2];

    [CCode (cname="")]
    public AVFrame video;

    [CCode (cname="")]
    public int min_part_size;

    [CCode (cname="")]
    public int64 pts;

    [CCode (cname="")]
    public AudioFIRDSPContext afirdsp;

    [CCode (cname="")]
    public AVFloatDSPContext *fdsp;
}

[CCode (cname="",cheader_filename="")]
public void ff_afir_init (
    AudioFIRDSPContext *s
);

[CCode (cname="",cheader_filename="")]
public void ff_afir_init_x86 (
    AudioFIRDSPContext *s
);
