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

#define OSS_AUDIO_BLOCK_SIZE 4096

public struct OSSAudioData {
    AVClass *class;
    int fd;
    int sample_rate;
    int channels;
    int frame_size; /***********************************************************
    in bytes !
    ***********************************************************/
    enum AVCodecID codec_id;
    uint flip_left : 1;
    uint8 buffer[OSS_AUDIO_BLOCK_SIZE];
    int buffer_ptr;
}

int ff_oss_audio_open (AVFormatContext *s1, int is_output,
                      string audio_device);

int ff_oss_audio_close (OSSAudioData *s);
