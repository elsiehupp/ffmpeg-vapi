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
namespace LibAVDevice {

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/oss.h")]
public const size_t OSS_AUDIO_BLOCK_SIZE; // 4096

[CCode (cname="struct OSSAudioData",cheader_filename="subprojects/ffmpeg/libavdevice/oss.h")]
[Compact]
public class OSSAudioData {
    [CCode (cname="class")]
    public LibAVUtil.Log.Class av_class;

    [CCode (cname="")]
    public int fd;

    [CCode (cname="")]
    public int sample_rate;

    [CCode (cname="")]
    public int channels;

    /***********************************************************
    in bytes !
    ***********************************************************/
    [CCode (cname="")]
    public int frame_size;

    [CCode (cname="")]
    public LibAVCodec.CodecID codec_id;

    [CCode (cname="")]
    public uint flip_left; // : 1;

    [CCode (cname="")]
    public uint8 buffer[OSS_AUDIO_BLOCK_SIZE];

    [CCode (cname="")]
    public int buffer_ptr;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/oss.h")]
public int ff_oss_audio_open (
    LibAVFormat.FormatContext? s1,
    bool is_output,
    string audio_device
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/oss.h")]
public int ff_oss_audio_close (
    OSSAudioData? s
);

} // namespace LibAVDevice
