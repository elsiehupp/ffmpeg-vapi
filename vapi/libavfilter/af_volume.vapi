/***********************************************************
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

/***********************************************************
@file
audio volume filter
***********************************************************/

[CCode (cname="",cheader_filename="")]
public enum PrecisionType {
    [CCode (cname="")]
    PRECISION_FIXED = 0,

    [CCode (cname="")]
    PRECISION_FLOAT,

    [CCode (cname="")]
    PRECISION_DOUBLE;
}

[CCode (cname="",cheader_filename="")]
public enum EvalMode {
    [CCode (cname="")]
    EVAL_MODE_ONCE,

    [CCode (cname="")]
    EVAL_MODE_FRAME,

    [CCode (cname="")]
    EVAL_MODE_NB
}

[CCode (cname="",cheader_filename="")]
public enum VolumeVarName {
    [CCode (cname="")]
    VAR_N,

    [CCode (cname="")]
    VAR_NB_CHANNELS,

    [CCode (cname="")]
    VAR_NB_CONSUMED_SAMPLES,

    [CCode (cname="")]
    VAR_NB_SAMPLES,

    [CCode (cname="")]
    VAR_POS,

    [CCode (cname="")]
    VAR_PTS,

    [CCode (cname="")]
    VAR_SAMPLE_RATE,

    [CCode (cname="")]
    VAR_STARTPTS,

    [CCode (cname="")]
    VAR_STARTT,

    [CCode (cname="")]
    VAR_T,

    [CCode (cname="")]
    VAR_TB,

    [CCode (cname="")]
    VAR_VOLUME,

    [CCode (cname="")]
    VAR_VARS_NB;
}

[CCode (cname="",cheader_filename="")]
public enum ReplayGainType {
    [CCode (cname="")]
    REPLAYGAIN_DROP,

    [CCode (cname="")]
    REPLAYGAIN_IGNORE,

    [CCode (cname="")]
    REPLAYGAIN_TRACK,

    [CCode (cname="")]
    REPLAYGAIN_ALBUM;
}

[CCode (cname="",cheader_filename="")]
[Compact]
public class VolumeContext {
    [CCode (cname="")]
    public AVClass class;

    public AVFloatDSPContext *fdsp;

    [CCode (cname="")]
    public int precision;

    [CCode (cname="")]
    public int eval_mode;

    [CCode (cname="")]
    public string volume_expr;

    [CCode (cname="")]
    public AVExpr *volume_pexpr;

    [CCode (cname="")]
    public double var_values[VAR_VARS_NB];

    [CCode (cname="")]
    public int replaygain;

    [CCode (cname="")]
    public double replaygain_preamp;

    [CCode (cname="")]
    public int replaygain_noclip;

    [CCode (cname="")]
    public double volume;

    [CCode (cname="")]
    public int volume_i;

    [CCode (cname="")]
    public int channels;

    [CCode (cname="")]
    public int planes;

    [CCode (cname="")]
    public AVSampleFormat sample_fmt;

    public delegate void ScaleSamplesDelegate (
        uint8[] dst,
        uint8[] src,
        int nb_samples,
        int volume
    );

    [CCode (cname="scale_samples")]
    public ScaleSamplesDelegate scale_samples;

    [CCode (cname="")]
    public int samples_align;
}

[CCode (cname="",cheader_filename="")]
public void ff_volume_init_x86 (
    VolumeContext *vol
);
