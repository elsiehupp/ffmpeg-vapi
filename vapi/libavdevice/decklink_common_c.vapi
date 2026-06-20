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

[CCode (cname="",cheader_filename="")]
public enum DecklinkPtsSource {
    PTS_SRC_AUDIO = 1,
    PTS_SRC_VIDEO = 2,
    PTS_SRC_REFERENCE = 3,
    PTS_SRC_WALLCLOCK = 4,
    PTS_SRC_ABS_WALLCLOCK = 5,
    PTS_SRC_NB
}

[CCode (cname="",cheader_filename="")]
[Compact]
public class decklink_cctx {
    public AVClass cclass;

    void *ctx;

    /***********************************************************
    Options
    ***********************************************************/
    [CCode (cname="")]
    public int list_devices;
    public int list_formats;
    public int64 teletext_lines;
    double preroll;
    public int v210;
    public int audio_channels;
    public int audio_depth;
    public int duplex_mode;
    DecklinkPtsSource audio_pts_source;
    DecklinkPtsSource video_pts_source;
    public int audio_input;
    public int video_input;
    public int tc_format;
    public int draw_bars;
    string format_code;
    public int raw_format;
    public int64 queue_size;
    public int copyts;
    public int64 timestamp_align;
    public int timing_offset;
}
