/***********************************************************
@brief FLV common header

@copyright 2006 The FFmpeg Project
***********************************************************/
/***********************************************************
@brief This file is part of FFmpeg.

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

namespace LibAVFormat {

/***********************************************************
@file FLV common header
***********************************************************/

/***********************************************************
@brief Offsets for packed values
***********************************************************/
[CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
public const size_t FLV_AUDIO_SAMPLESSIZE_OFFSET;

[CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
public const size_t FLV_AUDIO_SAMPLERATE_OFFSET;

[CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
public const size_t FLV_AUDIO_CODECID_OFFSET;

[CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
public const size_t FLV_VIDEO_FRAMETYPE_OFFSET;

/***********************************************************
@brief Bitmasks to isolate specific values
***********************************************************/
[CCode (cname="",cheader_filename="")]
[Flags]
public enum FLVAudioMask {
    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    FLV_AUDIO_CHANNEL_MASK,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    FLV_AUDIO_SAMPLESIZE_MASK,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    FLV_AUDIO_SAMPLERATE_MASK,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    FLV_AUDIO_CODECID_MASK,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    FLV_VIDEO_CODECID_MASK,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    FLV_VIDEO_FRAMETYPE_MASK;
}

[CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
public const uint32 AMF_END_OF_OBJECT;

[CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
public const string KEYFRAMES_TAG;

[CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
public const string KEYFRAMES_TIMESTAMP_TAG;

[CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
public const string KEYFRAMES_BYTEOFFSET_TAG;

[CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
[Flags]
public enum FLVHeaderFlags {
    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    FLV_HEADER_FLAG_HASVIDEO,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    FLV_HEADER_FLAG_HASAUDIO;
}

[CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
public enum FlvTagType {
    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    FLV_TAG_TYPE_AUDIO,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    FLV_TAG_TYPE_VIDEO,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    FLV_TAG_TYPE_META;
}

[CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
public enum FLVStreamType {
    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    FLV_STREAM_TYPE_VIDEO,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    FLV_STREAM_TYPE_AUDIO,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    FLV_STREAM_TYPE_SUBTITLE,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    FLV_STREAM_TYPE_DATA,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    FLV_STREAM_TYPE_NB;
}

[CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
public enum FLVAudioMode {
    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    FLV_MONO = 0,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    FLV_STEREO = 1;
}

[CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
public enum FLVSampleSize {
    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    FLV_SAMPLESSIZE_8BIT = 0,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    FLV_SAMPLESSIZE_16BIT = 1 << FLV_AUDIO_SAMPLESSIZE_OFFSET;
}

[CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
public enum FLVSampleRate {
    /***********************************************************
    @brief Signifies 5512Hz and 8000Hz in the case of NELLYMOSER
    ***********************************************************/
    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    FLV_SAMPLERATE_SPECIAL = 0,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    FLV_SAMPLERATE_11025HZ = 1 << FLV_AUDIO_SAMPLERATE_OFFSET,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    FLV_SAMPLERATE_22050HZ = 2 << FLV_AUDIO_SAMPLERATE_OFFSET,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    FLV_SAMPLERATE_44100HZ = 3 << FLV_AUDIO_SAMPLERATE_OFFSET;
}

[CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
public enum FLVVCodecIDWithOffset {
    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    FLV_CODECID_PCM = 0,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    FLV_CODECID_ADPCM = 1 << FLV_AUDIO_CODECID_OFFSET,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    FLV_CODECID_MP3 = 2 << FLV_AUDIO_CODECID_OFFSET,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    FLV_CODECID_PCM_LE = 3 << FLV_AUDIO_CODECID_OFFSET,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    FLV_CODECID_NELLYMOSER_16KHZ_MONO = 4 << FLV_AUDIO_CODECID_OFFSET,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    FLV_CODECID_NELLYMOSER_8KHZ_MONO = 5 << FLV_AUDIO_CODECID_OFFSET,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    FLV_CODECID_NELLYMOSER = 6 << FLV_AUDIO_CODECID_OFFSET,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    FLV_CODECID_PCM_ALAW = 7 << FLV_AUDIO_CODECID_OFFSET,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    FLV_CODECID_PCM_MULAW = 8 << FLV_AUDIO_CODECID_OFFSET,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    FLV_CODECID_AAC = 10<< FLV_AUDIO_CODECID_OFFSET,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    FLV_CODECID_SPEEX = 11<< FLV_AUDIO_CODECID_OFFSET;
}

[CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
public enum FLVVCodecID {
    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    FLV_CODECID_H263 = 2,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    FLV_CODECID_SCREEN = 3,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    FLV_CODECID_VP6 = 4,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    FLV_CODECID_VP6A = 5,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    FLV_CODECID_SCREEN2 = 6,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    FLV_CODECID_H264 = 7,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    FLV_CODECID_REALH263= 8,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    FLV_CODECID_MPEG4 = 9;
}

[CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
[Flags]
public enum FLVVideoFrameType {
    /***********************************************************
    @brief Key frame (for AVC, a seekable frame)
    ***********************************************************/
    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    FLV_FRAME_KEY,

    /***********************************************************
    @brief Inter frame (for AVC, a non-seekable frame)
    ***********************************************************/
    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    FLV_FRAME_INTER,

    /***********************************************************
    @brief Disposable inter frame (H.263 only)
    ***********************************************************/
    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    FLV_FRAME_DISP_INTER,

    /***********************************************************
    @brief Generated key frame (reserved for server use only)
    ***********************************************************/
    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    FLV_FRAME_GENERATED_KEY,

    /***********************************************************
    @brief Video info/command frame
    ***********************************************************/
    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    FLV_FRAME_VIDEO_INFO_CMD;
}

[CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
public enum AMFDataType {
    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    AMF_DATA_TYPE_NUMBER,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    AMF_DATA_TYPE_BOOL,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    AMF_DATA_TYPE_STRING,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    AMF_DATA_TYPE_OBJECT,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    AMF_DATA_TYPE_NULL,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    AMF_DATA_TYPE_UNDEFINED,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    AMF_DATA_TYPE_REFERENCE,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    AMF_DATA_TYPE_MIXEDARRAY,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    AMF_DATA_TYPE_OBJECT_END,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    AMF_DATA_TYPE_ARRAY,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    AMF_DATA_TYPE_DATE,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    AMF_DATA_TYPE_LONG_STRING,

    [CCode (cname="",cheader_filename="ffmpeg/libformat/flv.h")]
    AMF_DATA_TYPE_UNSUPPORTED;
}

} // namespace LibAVFormat
