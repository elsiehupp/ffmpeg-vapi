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

public struct SndioData {
    AVClass *class;
    struct sio_hdl *hdl;
    enum AVCodecID codec_id;
    int64 hwpos;
    int64 softpos;
    uint8 *buffer;
    int bps;
    int buffer_size;
    int buffer_offset;
    int channels;
    int sample_rate;
}

int ff_sndio_open (AVFormatContext *s1, int is_output, string audio_device);
int ff_sndio_close (SndioData *s);
