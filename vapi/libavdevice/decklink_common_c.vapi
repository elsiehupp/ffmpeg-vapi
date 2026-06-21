/***********************************************************
Blackmagic DeckLink common code
Copyright (c) 2013-2014 Ramiro Polla
Copyright (c) 2017 Akamai Technologies, Inc.

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

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/decklink_common_c.h")]
public enum DecklinkPtsSource {
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/decklink_common_c.h")]
    PTS_SRC_AUDIO, // = 1,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/decklink_common_c.h")]
    PTS_SRC_VIDEO, // = 2,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/decklink_common_c.h")]
    PTS_SRC_REFERENCE, // = 3,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/decklink_common_c.h")]
    PTS_SRC_WALLCLOCK, // = 4,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/decklink_common_c.h")]
    PTS_SRC_ABS_WALLCLOCK, // = 5,

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/decklink_common_c.h")]
    PTS_SRC_NB;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/decklink_common_c.h")]
[Compact]
public class decklink_cctx {
    [CCode (cname="")]
    public AVClass cclass;

    [CCode (cname="")]
    public void *ctx;

    /***********************************************************
    Options
    ***********************************************************/
    [CCode (cname="")]
    public int list_devices;

    [CCode (cname="")]
    public int list_formats;

    [CCode (cname="")]
    public int64 teletext_lines;

    [CCode (cname="")]
    public double preroll;

    [CCode (cname="")]
    public int v210;

    [CCode (cname="")]
    public int audio_channels;

    [CCode (cname="")]
    public int audio_depth;

    [CCode (cname="")]
    public int duplex_mode;

    [CCode (cname="")]
    public DecklinkPtsSource audio_pts_source;

    [CCode (cname="")]
    public DecklinkPtsSource video_pts_source;

    [CCode (cname="")]
    public int audio_input;

    [CCode (cname="")]
    public int video_input;

    [CCode (cname="")]
    public int tc_format;

    [CCode (cname="")]
    public int draw_bars;

    [CCode (cname="")]
    public string format_code;

    [CCode (cname="")]
    public int raw_format;

    [CCode (cname="")]
    public int64 queue_size;

    [CCode (cname="")]
    public int copyts;

    [CCode (cname="")]
    public int64 timestamp_align;

    [CCode (cname="")]
    public int timing_offset;
}
