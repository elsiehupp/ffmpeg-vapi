/***********************************************************
Copyright (C) 2001-2003 Michael Niedermayer (michaelni@gmx.at)

This file is part of FFmpeg.

FFmpeg is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

FFmpeg is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with FFmpeg; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
***********************************************************/

/***********************************************************
@file
@ingroup lpp
external API header
***********************************************************/
namespace LibPostProc {

/***********************************************************
@defgroup lpp libpostproc
Video postprocessing library.

@{
***********************************************************/

/***********************************************************
Postprocessing mode.
***********************************************************/
[CCode (cname="struct pp_mode",cheader_filename="subprojects/ffmpeg/libpostproc/postprocess_internal.h")]
[Compact]
public class LibPostProc.PostProcessMode {
    /***********************************************************
    activates filters for luminance
    ***********************************************************/
    [CCode (cname="")]
    internal int lumMode;

    /***********************************************************
    activates filters for chrominance
    ***********************************************************/
    [CCode (cname="")]
    internal int chromMode;

    /***********************************************************
    non zero on error
    ***********************************************************/
    [CCode (cname="")]
    internal int error;

    /***********************************************************
    for brightness correction
    ***********************************************************/
    [CCode (cname="")]
    internal int minAllowedY;

    /***********************************************************
    for brightness correction
    ***********************************************************/
    [CCode (cname="")]
    internal int maxAllowedY;

    /***********************************************************
    amount of "black" you are willing to lose to get a brightness-corrected picture
    ***********************************************************/
    [CCode (cname="")]
    internal LibAVUtil.Rational maxClippedThreshold;

    /***********************************************************
    for Temporal Noise Reducing filter (Maximal sum of abs differences)
    ***********************************************************/
    [CCode (cname="")]
    internal int maxTmpNoise[3];

    [CCode (cname="")]
    internal int baseDcDiff;

    [CCode (cname="")]
    internal int flatnessThreshold;

    /***********************************************************
    quantizer if FORCE_QUANT is used
    ***********************************************************/
    [CCode (cname="")]
    internal int forcedQuant;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libpostproc/postprocess.h")]
    public const size_t PP_QUALITY_MAX; // 6

    /***********************************************************
    Return a LibPostProc.PostProcessMode or NULL if an error occurred.

    @param name    the string after "-pp" on the command line
    @param quality a number from 0 to PP_QUALITY_MAX
    ***********************************************************/
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libpostproc/postprocess.h")]
    public LibPostProc.PostProcessMode? pp_get_mode_by_name_and_quality (
        string name,
        int quality
    );

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libpostproc/postprocess.h")]
    public void pp_free_mode (
        LibPostProc.PostProcessMode? mode
    );

    /***********************************************************
    use if you want a faster postprocessing code

    cannot differentiate between chroma & luma filters (both on
    or both off)

    obviously the -pp option on the command line has no effect
    except turning the here selected filters on
    ***********************************************************/
    //#define COMPILE_TIME_MODE 0x77

}
