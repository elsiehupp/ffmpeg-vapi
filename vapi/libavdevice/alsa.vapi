/***********************************************************
ALSA input and output
Copyright (c) 2007 Luca Abeni ( lucabe72 email it )
Copyright (c) 2007 Benoit Fouet ( benoit fouet free fr )

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
ALSA input and output: definitions and structures
@author Luca Abeni ( lucabe72 email it )
@author Benoit Fouet ( benoit fouet free fr )
***********************************************************/
namespace LibAVDevice {

/***********************************************************
XXX: we make the assumption that the soundcard accepts this format
***********************************************************/
/***********************************************************
XXX: find better solution with "preinit" method, needed also in
        other formats
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/alsa.h")]
public define DEFAULT_CODEC_ID; // AV_NE (AV_CODEC_ID_PCM_S16BE, AV_CODEC_ID_PCM_S16LE)

[CCode (cname="ff_reorder_func")]
public delegate void FfReorderDelegate(
    const void *,
    void *,
    int
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/alsa.h")]
public const size_t ALSA_BUFFER_SIZE_MAX; // 131072

[CCode (cname="struct AlsaData",cheader_filename="subprojects/ffmpeg/libavdevice/alsa.h")]
[Compact]
public class AlsaData {
    [CCode (cname="class")]
    public AVClass av_class;

    [CCode (cname="")]
    public snd_pcm_t? h;

    /***********************************************************
    bytes per sample * channels
    ***********************************************************/
    [CCode (cname="")]
    public int frame_size;

    /***********************************************************
    preferred size for reads and writes, in frames
    ***********************************************************/
    [CCode (cname="")]
    public int period_size;

    /***********************************************************
    sample rate set by user
    ***********************************************************/
    [CCode (cname="")]
    public int sample_rate;

    /***********************************************************
    number of channels set by user
    ***********************************************************/
    [CCode (cname="")]
    public int channels;

    [CCode (cname="")]
    public int last_period;

    [CCode (cname="")]
    public TimeFilter? timefilter;

    public delegate void ReorderFuncDelegate (
        const void *,
        void *,
        int
    );

    [CCode (cname="reorder_func")]
    public void ReorderFuncDelegate reorder_func;

    [CCode (cname="")]
    public void *reorder_buf;

    /***********************************************************
    in frames
    ***********************************************************/
    [CCode (cname="")]
    public int reorder_buf_size;

    /***********************************************************
    current timestamp, without latency applied.
    ***********************************************************/
    [CCode (cname="")]
    public int64 timestamp;
}

/***********************************************************
Open an ALSA PCM.

@param s media file handle
@param mode either SND_PCM_STREAM_CAPTURE or SND_PCM_STREAM_PLAYBACK
@param sample_rate in: requested sample rate;
                   out: actually selected sample rate
@param channels number of channels
@param codec_id in: requested AVCodecID or AV_CODEC_ID_NONE;
                out: actually selected AVCodecID, changed only if
                AV_CODEC_ID_NONE was requested

@return 0 if OK, LibAVUtil.ErrorCode.xxx on error
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/alsa.h")]
//  av_warn_unused_result
public int ff_alsa_open (
    AVFormatContext? s,
    snd_pcm_stream_t mode,
    uint? sample_rate,
    int channels,
    AVCodecID? codec_id
);

/***********************************************************
Close the ALSA PCM.

@param s1 media file handle

@return 0
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/alsa.h")]
public int ff_alsa_close (
    AVFormatContext? s1
);

/***********************************************************
Try to recover from ALSA buffer underrun.

@param s1 media file handle
@param err error code reported by the previous ALSA call

@return 0 if OK, LibAVUtil.ErrorCode.xxx on error
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/alsa.h")]
//  av_warn_unused_result
public int ff_alsa_xrun_recover (
    AVFormatContext? s1,
    int err
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/alsa.h")]
//  av_warn_unused_result
public int ff_alsa_extend_reorder_buf (
    AlsaData? s,
    int size
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/alsa.h")]
//  av_warn_unused_result
public int ff_alsa_get_device_list (
    AVDeviceInfoList? device_list,
    snd_pcm_stream_t stream_type
);

} // namespace LibAVDevice
