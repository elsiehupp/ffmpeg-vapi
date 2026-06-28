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
namespace LibAVFilter {

[CCode (cname="enum PrecisionType",cprefix="PRECISION_",cheader_filename="subprojects/ffmpeg/libavfilter/af_volume.h")]
public enum PrecisionType {
    FIXED, // = 0,
    FLOAT,
    DOUBLE;
}

[CCode (cname="enum EvalMode",cprefix="EVAL_MODE_",cheader_filename="subprojects/ffmpeg/libavfilter/af_volume.h")]
public enum EvalMode {
    [CCode (cname="")]
    ONCE,

    [CCode (cname="")]
    FRAME,

    [CCode (cname="")]
    NB;
}

[CCode (cname="enum VolumeVarName",cheader_filename="subprojects/ffmpeg/libavfilter/af_volume.h")]
public enum VolumeVarName {
    [CCode (cname="VAR_N")]
    N,

    [CCode (cname="VAR_NB_CHANNELS")]
    CHANNEL_COUNT,

    [CCode (cname="VAR_NB_CONSUMED_SAMPLES")]
    CONSUMED_SAMPLE_COUNT,

    [CCode (cname="VAR_NB_SAMPLES")]
    SAMPLE_COUNT,

    [CCode (cname="VAR_POS")]
    POS,

    [CCode (cname="VAR_PTS")]
    PTS,

    [CCode (cname="VAR_SAMPLE_RATE")]
    SAMPLE_RATE,

    [CCode (cname="VAR_STARTPTS")]
    START_PTS,

    [CCode (cname="VAR_STARTT")]
    START_T,

    [CCode (cname="VAR_T")]
    T,

    [CCode (cname="VAR_TB")]
    TB,

    [CCode (cname="VAR_VOLUME")]
    VOLUME,

    [CCode (cname="VAR_VARS_NB")]
    NB;
}

[CCode (cname="enum ReplayGainType",cprefix="REPLAYGAIN_",cheader_filename="subprojects/ffmpeg/libavfilter/af_volume.h")]
public enum ReplayGainType {
    DROP,
    IGNORE,
    TRACK,
    ALBUM;
}

[CCode (cname="struct VolumeContext",cheader_filename="subprojects/ffmpeg/libavfilter/af_volume.h")]
[Compact]
public class VolumeContext {
    [CCode (cname="class")]
    public LibAVUtil.Log.Class av_class;

    public AVFloatDSPContext? fdsp;

    [CCode (cname="")]
    public int precision;

    [CCode (cname="")]
    public int eval_mode;

    [CCode (cname="")]
    public string volume_expr;

    [CCode (cname="")]
    public AVExpr? volume_pexpr;

    [CCode (cname="")]
    public double var_values[VolumeVarName.NB];

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

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/af_volume.h")]
public void ff_volume_init_x86 (
    VolumeContext? vol
);

} // namespace LibAVFilter
