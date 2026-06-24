/***********************************************************
sndio play and grab interface
Copyright (c) 2010 Jacob Meuser

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

[CCode (cname="struct SndioData",cheader_filename="subprojects/ffmpeg/libavdevice/sndio.h")]
[Compact]
public class SndioData {
    [CCode (cname="class")]
    public AVClass av_class;

    [CCode (cname="")]
    public sio_hdl? hdl;

    [CCode (cname="")]
    public AVCodecID codec_id;

    [CCode (cname="")]
    public int64 hwpos;

    [CCode (cname="")]
    public int64 softpos;

    [CCode (cname="")]
    public uint8[] buffer;

    [CCode (cname="")]
    public int bps;

    [CCode (cname="")]
    public int buffer_size;

    [CCode (cname="")]
    public int buffer_offset;

    [CCode (cname="")]
    public int channels;

    [CCode (cname="")]
    public int sample_rate;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/sndio.h")]
public int ff_sndio_open (
    AVFormatContext? s1,
    int is_output,
    string audio_device
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/sndio.h")]
public int ff_sndio_close (
    SndioData? s
);
