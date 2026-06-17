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

public enum PrecisionType {
    PRECISION_FIXED = 0,
    PRECISION_FLOAT,
    PRECISION_DOUBLE,
}

public enum EvalMode {
    EVAL_MODE_ONCE,
    EVAL_MODE_FRAME,
    EVAL_MODE_NB
}

public enum VolumeVarName {
    VAR_N,
    VAR_NB_CHANNELS,
    VAR_NB_CONSUMED_SAMPLES,
    VAR_NB_SAMPLES,
    VAR_POS,
    VAR_PTS,
    VAR_SAMPLE_RATE,
    VAR_STARTPTS,
    VAR_STARTT,
    VAR_T,
    VAR_TB,
    VAR_VOLUME,
    VAR_VARS_NB
}

public enum ReplayGainType {
    REPLAYGAIN_DROP,
    REPLAYGAIN_IGNORE,
    REPLAYGAIN_TRACK,
    REPLAYGAIN_ALBUM,
}

[Compact]
public class VolumeContext {
    const AVClass *class;
    AVFloatDSPContext *fdsp;
    public int precision;
    public int eval_mode;
    string volume_expr;
    AVExpr *volume_pexpr;
    double var_values[VAR_VARS_NB];

    public int replaygain;
    double replaygain_preamp;
    public int    replaygain_noclip;
    double volume;
    public int    volume_i;
    public int    channels;
    public int    planes;
    public AVSampleFormat sample_fmt;

    void (*scale_samples)(uint8[] dst, uint8[] src, int nb_samples,
                          int volume);
    public int samples_align;
}

public void ff_volume_init_x86 (VolumeContext *vol);
