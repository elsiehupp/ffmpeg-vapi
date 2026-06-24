/***********************************************************
Copyright (c) 2011 Jan Kokemüller

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

This file is based on libebur128 which is available at
https://github.com/jiixyj/libebur128/

***********************************************************/

/***********************************************************
\file ebur128.h
 @brief libebur128 - a library for loudness measurement according to
        the EBU R128 standard.
***********************************************************/

/***********************************************************
\enum channel
 Use these values when setting the channel map with ebur128_set_channel ().
 See definitions in ITU R-REC-BS 1770-4
***********************************************************/
[CCode (cname="enum channel",cheader_filename="subprojects/ffmpeg/libavfilter/ebur128.h")]
public enum Channel {
    /***********************************************************
    unused channel (for example LFE channel)
    ***********************************************************/
    UNUSED, // = 0,

    LEFT,

    /***********************************************************
    itu M+030
    ***********************************************************/
    [CCode (cname="FF_EBUR128_Mp030")]
    MP_030, // = 1,

    RIGHT,

    /***********************************************************
    itu M-030
    ***********************************************************/
    [CCode (cname="FF_EBUR128_Mm030")]
    MM_030, // = 2,

    CENTER,

    /***********************************************************
    itu M+000
    ***********************************************************/
    [CCode (cname="FF_EBUR128_Mp000")]
    MP_000, // = 3,

    LEFT_SURROUND,

    /***********************************************************
    itu M+110
    ***********************************************************/
    [CCode (cname="FF_EBUR128_Mp110")]
    MP_110, // = 4,

    RIGHT_SURROUND,

    /***********************************************************
    itu M-110
    ***********************************************************/
    [CCode (cname="FF_EBUR128_Mm110")]
    MM_110, // = 5,

    /***********************************************************
    a channel that is counted twice
    ***********************************************************/
    DUAL_MONO,

    /***********************************************************
    itu M+SC
    ***********************************************************/
    [CCode (cname="FF_EBUR128_MpSC")]
    MP_SC,

    /***********************************************************
    itu M-SC
    ***********************************************************/
    [CCode (cname="FF_EBUR128_MmSC")]
    MM_SC,

    /***********************************************************
    itu M+060
    ***********************************************************/
    [CCode (cname="FF_EBUR128_Mp060")]
    MP_060,

    /***********************************************************
    itu M-060
    ***********************************************************/
    [CCode (cname="FF_EBUR128_Mm060")]
    MM_060,

    /***********************************************************
    itu M+090
    ***********************************************************/
    [CCode (cname="FF_EBUR128_Mp090")]
    MP_090,

    /***********************************************************
    itu M-090
    ***********************************************************/
    [CCode (cname="FF_EBUR128_Mm090")]
    MM_090,

    /***********************************************************
    itu M+135
    ***********************************************************/
    [CCode (cname="FF_EBUR128_Mp135")]
    MP_135,

    /***********************************************************
    itu M-135
    ***********************************************************/
    [CCode (cname="FF_EBUR128_Mm135")]
    MM_135,

    /***********************************************************
    itu M+180
    ***********************************************************/
    [CCode (cname="FF_EBUR128_Mp180")]
    MP_180,

    /***********************************************************
    itu U+000
    ***********************************************************/
    [CCode (cname="FF_EBUR128_Up000")]
    UP_000,

    /***********************************************************
    itu U+030
    ***********************************************************/
    [CCode (cname="FF_EBUR128_Up030")]
    UP_030,

    /***********************************************************
    itu U-030
    ***********************************************************/
    [CCode (cname="FF_EBUR128_Um030")]
    UM_030,

    /***********************************************************
    itu U+045
    ***********************************************************/
    [CCode (cname="FF_EBUR128_Up045")]
    UP_045,

    /***********************************************************
    itu U-030
    ***********************************************************/
    [CCode (cname="FF_EBUR128_Um045")]
    UM_045,

    /***********************************************************
    itu U+090
    ***********************************************************/
    [CCode (cname="FF_EBUR128_Up090")]
    UP_090,

    /***********************************************************
    itu U-090
    ***********************************************************/
    [CCode (cname="FF_EBUR128_Um090")]
    UM_090,

    /***********************************************************
    itu U+110
    ***********************************************************/
    [CCode (cname="FF_EBUR128_Up110")]
    UP_110,

    /***********************************************************
    itu U-110
    ***********************************************************/
    [CCode (cname="FF_EBUR128_Um110")]
    UM_110,

    /***********************************************************
    itu U+135
    ***********************************************************/
    [CCode (cname="FF_EBUR128_Up135")]
    UP_135,

    /***********************************************************
    itu U-135
    ***********************************************************/
    [CCode (cname="FF_EBUR128_Um135")]
    UM_135,

    /***********************************************************
    itu U+180
    ***********************************************************/
    [CCode (cname="FF_EBUR128_Up180")]
    UP_180,

    /***********************************************************
    itu T+000
    ***********************************************************/
    [CCode (cname="FF_EBUR128_Tp000")]
    TP_000,

    /***********************************************************
    itu B+000
    ***********************************************************/
    [CCode (cname="FF_EBUR128_Bp000")]
    BP_000,

    /***********************************************************
    itu B+045
    ***********************************************************/
    [CCode (cname="FF_EBUR128_Bp045")]
    BP_045,

    /***********************************************************
    itu B-045
    ***********************************************************/
    [CCode (cname="FF_EBUR128_Bm045")]
    BM_045;
}

/***********************************************************
\enum mode
 Use these values in ebur128_init (or'ed). Try to use the lowest possible
 modes that suit your needs, as performance will be better.
***********************************************************/
[CCode (cname="enum mode",cheader_filename="subprojects/ffmpeg/libavfilter/ebur128.h")]
public enum Mode {
    /***********************************************************
    can call ff_ebur128_loudness_momentary
    ***********************************************************/
    [CCode (cname="FF_EBUR128_MODE_M")]
    MOMENTARY, // = (1 << 0),

    /***********************************************************
    can call ff_ebur128_loudness_shortterm
    ***********************************************************/
    [CCode (cname="FF_EBUR128_MODE_S")]
    SHORT_TERM, // = (1 << 1) | Mode.MOMENTARY,

    /***********************************************************
    can call ff_ebur128_loudness_global_* and ff_ebur128_relative_threshold
    ***********************************************************/
    [CCode (cname="FF_EBUR128_MODE_I")]
    LOUDNESS_GLOBAL_OR_RELATIVE_THRESHOLD, // = (1 << 2) | Mode.MOMENTARY,

    /***********************************************************
    can call ff_ebur128_loudness_range
    ***********************************************************/
    [CCode (cname="FF_EBUR128_MODE_LRA")]
    LOUDNESS_RANGE, // = (1 << 3) | Mode.SHORT_TERM,

    /***********************************************************
    can call ff_ebur128_sample_peak
    ***********************************************************/
    [CCode (cname="FF_EBUR128_MODE_SAMPLE_PEAK")]
    SAMPLE_PEAK; // = (1 << 4) | Mode.MOMENTARY;
}

/***********************************************************
forward declaration of FFEBUR128StateInternal
***********************************************************/
[CCode (cname="struct FFEBUR128StateInternal",cheader_filename="subprojects/ffmpeg/libavfilter/ebur128.h")]
[Compact]
public class FFEBUR128StateInternal { }

/***********************************************************
@brief Contains information about the state of a loudness measurement.

You should not need to modify this struct directly.
***********************************************************/
[CCode (cname="struct FFEBUR128State",cheader_filename="subprojects/ffmpeg/libavfilter/ebur128.h")]
[Compact]
public class FFEBUR128State {
    /***********************************************************
    The current mode.
    ***********************************************************/
    [CCode (cname="")]
    public int mode;

    /***********************************************************
    The number of channels.
    ***********************************************************/
    [CCode (cname="")]
    public uint channels;

    /***********************************************************
    The sample rate.
    ***********************************************************/
    [CCode (cname="")]
    public ulong samplerate;

    /***********************************************************
    Internal state.
    ***********************************************************/
    [CCode (cname="")]
    public FFEBUR128StateInternal? d;
}

/***********************************************************
@brief Initialize library state.

@param channels the number of channels.
@param samplerate the sample rate.
@param window set the maximum window size in ms, set to 0 for auto.
@param mode see the Mode enum for possible values.
@return an initialized library state.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/ebur128.h")]
public FFEBUR128State? ff_ebur128_init (
    uint channels,
    ulong samplerate,
    ulong window,
    Mode mode
);

/***********************************************************
@brief Destroy library state.

@param st pointer to a library state.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/ebur128.h")]
public void ff_ebur128_destroy (
    FFEBUR128State ** st
);

/***********************************************************
@brief Set channel type.

 The default is:
 - 0 -> Channel.LEFT
 - 1 -> Channel.RIGHT
 - 2 -> Channel.CENTER
 - 3 -> Channel.UNUSED
 - 4 -> Channel.LEFT_SURROUND
 - 5 -> Channel.RIGHT_SURROUND

@param st library state.
@param channel_number zero based channel index.
@param value channel type from the Channel enum.
@return
   - 0 on success.
   - AVERROR (EINVAL) if invalid channel index.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/ebur128.h")]
public int ff_ebur128_set_channel (
    FFEBUR128State * st,
    uint channel_number,
    Channel value
);

/***********************************************************
@brief Add frames to be processed.

@param st library state.
@param src array of source frames. Channels must be interleaved.
@param frames number of frames. Not number of samples!
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/ebur128.h")]
public void ff_ebur128_add_frames_short (
    FFEBUR128State * st,
    short[] src,
    size_t frames
);

/***********************************************************
@brief See \ref ebur128_add_frames_short
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/ebur128.h")]
public void ff_ebur128_add_frames_int (
    FFEBUR128State * st,
    int[] src,
    size_t frames
);

/***********************************************************
@brief See \ref ebur128_add_frames_short
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/ebur128.h")]
public void ff_ebur128_add_frames_float (
    FFEBUR128State * st,
    float[] src,
    size_t frames
);

/***********************************************************
@brief See \ref ebur128_add_frames_short
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/ebur128.h")]
public void ff_ebur128_add_frames_double (
    FFEBUR128State * st,
    double[] src,
    size_t frames
);

/***********************************************************
@brief Add frames to be processed.

@param st library state.
@param srcs array of source frame channel data pointers
@param frames number of frames. Not number of samples!
@param stride number of samples to skip to for the next sample of the same channel
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/ebur128.h")]
public void ff_ebur128_add_frames_planar_short (
    FFEBUR128State * st,
    short[][] srcs,
    size_t frames,
    int stride
);

/***********************************************************
@brief See \ref ebur128_add_frames_planar_short
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/ebur128.h")]
public void ff_ebur128_add_frames_planar_int (
    FFEBUR128State * st,
    int[]? srcs,
    size_t frames,
    int stride
);

/***********************************************************
@brief See \ref ebur128_add_frames_planar_short
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/ebur128.h")]
public void ff_ebur128_add_frames_planar_float (
    FFEBUR128State * st,
    float[]? srcs,
    size_t frames,
    int stride
);

/***********************************************************
@brief See \ref ebur128_add_frames_planar_short
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/ebur128.h")]
public void ff_ebur128_add_frames_planar_double (
    FFEBUR128State * st,
    double[]? srcs,
    size_t frames,
    int stride
);

/***********************************************************
@brief Get global integrated loudness in LUFS.

@param st library state.
@param out integrated loudness in LUFS. -HUGE_VAL if result is negative
            infinity.
@return
   - 0 on success.
   - AVERROR (EINVAL) if mode "Mode.LOUDNESS_GLOBAL_OR_RELATIVE_THRESHOLD" has not been set.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/ebur128.h")]
public int ff_ebur128_loudness_global (
    FFEBUR128State * st,
    double[] out
);

/***********************************************************
@brief Get global integrated loudness in LUFS across multiple instances.

@param sts array of library states.
@param size length of sts
@param out integrated loudness in LUFS. -HUGE_VAL if result is negative
            infinity.
@return
   - 0 on success.
   - AVERROR (EINVAL) if mode "Mode.LOUDNESS_GLOBAL_OR_RELATIVE_THRESHOLD" has not been set.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/ebur128.h")]
public int ff_ebur128_loudness_global_multiple (
    FFEBUR128State ** sts,
    size_t size,
    double[] out
);

/***********************************************************
@brief Get momentary loudness (last 400ms) in LUFS.

@param st library state.
@param out momentary loudness in LUFS. -HUGE_VAL if result is negative
            infinity.
@return
   - 0 on success.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/ebur128.h")]
public int ff_ebur128_loudness_momentary (
    FFEBUR128State * st,
    double[] out
);

/***********************************************************
@brief Get short-term loudness (last 3s) in LUFS.

@param st library state.
@param out short-term loudness in LUFS. -HUGE_VAL if result is negative
            infinity.
@return
   - 0 on success.
   - AVERROR (EINVAL) if mode "Mode.SHORT_TERM" has not been set.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/ebur128.h")]
public int ff_ebur128_loudness_shortterm (
    FFEBUR128State * st,
    double[] out
);

/***********************************************************
@brief Get loudness of the specified window in LUFS.

 window must not be larger than the current window set in st.

@param st library state.
@param window window in ms to calculate loudness.
@param out loudness in LUFS. -HUGE_VAL if result is negative infinity.
@return
   - 0 on success.
   - AVERROR (EINVAL) if window larger than current window in st.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/ebur128.h")]
public int ff_ebur128_loudness_window (
    FFEBUR128State * st,
    ulong window,
    double[] out
);

/***********************************************************
@brief Get loudness range (LRA) of programme in LU.

 Calculates loudness range according to EBU 3342.

@param st library state.
@param out loudness range (LRA) in LU. Will not be changed in case of
            error. AVERROR (EINVAL) will be returned in this case.
@return
   - 0 on success.
   - AVERROR (EINVAL) if mode "Mode.LOUDNESS_RANGE" has not been set.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/ebur128.h")]
public int ff_ebur128_loudness_range (
    FFEBUR128State * st,
    double[] out
);

/***********************************************************
@brief Get loudness range (LRA) in LU across multiple instances.

 Calculates loudness range according to EBU 3342.

@param sts array of library states.
@param size length of sts
@param out loudness range (LRA) in LU. Will not be changed in case of
            error. AVERROR (EINVAL) will be returned in this case.
@return
   - 0 on success.
   - AVERROR (EINVAL) if mode "Mode.LOUDNESS_RANGE" has not been set.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/ebur128.h")]
public int ff_ebur128_loudness_range_multiple (
    FFEBUR128State ** sts,
    size_t size,
    double[] out
);

/***********************************************************
@brief Get maximum sample peak of selected channel in float format.

@param st library state
@param channel_number channel to analyse
@param out maximum sample peak in float format (1.0 is 0 dBFS)
@return
   - 0 on success.
   - AVERROR (EINVAL) if mode "Mode.SAMPLE_PEAK" has not been set.
   - AVERROR (EINVAL) if invalid channel index.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/ebur128.h")]
public int ff_ebur128_sample_peak (
    FFEBUR128State * st,
    uint channel_number,
    double[] out
);

/***********************************************************
@brief Get relative threshold in LUFS.

@param st library state
@param out relative threshold in LUFS.
@return
   - 0 on success.
   - AVERROR (EINVAL) if mode "Mode.LOUDNESS_GLOBAL_OR_RELATIVE_THRESHOLD" has not been set.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/ebur128.h")]
public int ff_ebur128_relative_threshold (
    FFEBUR128State * st,
    double[] out
);
