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
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/flv.h")]
public const size_t FLV_AUDIO_SAMPLESSIZE_OFFSET;

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/flv.h")]
public const size_t FLV_AUDIO_SAMPLERATE_OFFSET;

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/flv.h")]
public const size_t FLV_AUDIO_CODECID_OFFSET;

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/flv.h")]
public const size_t FLV_VIDEO_FRAMETYPE_OFFSET;

/***********************************************************
@brief Bitmasks to isolate specific values
***********************************************************/
[Flags]
[CCode (cheader_filename="subprojects/ffmpeg/libavformat/flv.h")]
public enum FLVMask {
    [CCode (cname="FLV_AUDIO_CHANNEL_MASK")]
    AUDIO_CHANNEL,

    [CCode (cname="FLV_AUDIO_SAMPLESIZE_MASK")]
    AUDIO_SAMPLE_SIZE,

    [CCode (cname="FLV_AUDIO_SAMPLERATE_MASK")]
    AUDIO_SAMPLE_RATE,

    [CCode (cname="FLV_AUDIO_CODECID_MASK")]
    AUDIO_CODEC_ID,

    [CCode (cname="FLV_VIDEO_CODECID_MASK")]
    VIDEO_CODEC_ID,

    [CCode (cname="FLV_VIDEO_FRAMETYPE_MASK")]
    VIDEO_FRAME_TYPE;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/flv.h")]
public const uint32 AMF_END_OF_OBJECT;

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/flv.h")]
public const string KEYFRAMES_TAG;

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/flv.h")]
public const string KEYFRAMES_TIMESTAMP_TAG;

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/flv.h")]
public const string KEYFRAMES_BYTEOFFSET_TAG;

[Flags]
[CCode (cheader_filename="subprojects/ffmpeg/libavformat/flv.h")]
public enum FLVHeaderFlags {
    [CCode (cname="FLV_HEADER_FLAG_HASVIDEO")]
    HAS_VIDEO,

    [CCode (cname="FLV_HEADER_FLAG_HASAUDIO")]
    HAS_AUDIO;
}

[CCode (cname="enum FlvTagType",cheader_filename="subprojects/ffmpeg/libavformat/flv.h")]
public enum FlvTagType {
    [CCode (cname="FLV_TAG_TYPE_AUDIO")]
    AUDIO,

    [CCode (cname="FLV_TAG_TYPE_VIDEO")]
    VIDEO,

    [CCode (cname="FLV_TAG_TYPE_META")]
    META;
}

[CCode (cheader_filename="subprojects/ffmpeg/libavformat/flv.h")]
public enum FLVStreamType {
    [CCode (cname="FLV_STREAM_TYPE_VIDEO")]
    VIDEO,

    [CCode (cname="FLV_STREAM_TYPE_AUDIO")]
    AUDIO,

    [CCode (cname="FLV_STREAM_TYPE_SUBTITLE")]
    SUBTITLE,

    [CCode (cname="FLV_STREAM_TYPE_DATA")]
    DATA,

    [CCode (cname="FLV_STREAM_TYPE_NB")]
    NB;
}

[CCode (cheader_filename="subprojects/ffmpeg/libavformat/flv.h")]
public enum FLVAudioMode {
    [CCode (cname="FLV_MONO")]
    MONO, // = 0,

    [CCode (cname="FLV_STEREO")]
    STEREO; // = 1;
}

[CCode (cheader_filename="subprojects/ffmpeg/libavformat/flv.h")]
public enum FLVSampleSize {
    [CCode (cname="FLV_SAMPLESSIZE_8BIT")]
    @8BIT, // = 0,

    [CCode (cname="FLV_SAMPLESSIZE_16BIT")]
    @16BIT; // = 1 << FLV_AUDIO_SAMPLESSIZE_OFFSET;
}

[CCode (cheader_filename="subprojects/ffmpeg/libavformat/flv.h")]
public enum FLVSampleRate {
    /***********************************************************
    @brief Signifies 5512Hz and 8000Hz in the case of NELLYMOSER
    ***********************************************************/
    [CCode (cname="FLV_SAMPLERATE_SPECIAL")]
    SPECIAL, // = 0,

    [CCode (cname="FLV_SAMPLERATE_11025HZ")]
    @11025HZ, // = 1 << FLV_AUDIO_SAMPLERATE_OFFSET,

    [CCode (cname="FLV_SAMPLERATE_22050HZ")]
    @22050HZ, // = 2 << FLV_AUDIO_SAMPLERATE_OFFSET,

    [CCode (cname="FLV_SAMPLERATE_44100HZ")]
    @44100HZ; // = 3 << FLV_AUDIO_SAMPLERATE_OFFSET;
}

[CCode (cheader_filename="subprojects/ffmpeg/libavformat/flv.h")]
public enum FLVVCodecIDWithOffset {
    [CCode (cname="FLV_CODECID_PCM")]
    PCM, // = 0,

    [CCode (cname="FLV_CODECID_ADPCM")]
    ADPCM, // = 1 << FLV_AUDIO_CODECID_OFFSET,

    [CCode (cname="FLV_CODECID_MP3")]
    MP3, // = 2 << FLV_AUDIO_CODECID_OFFSET,

    [CCode (cname="FLV_CODECID_PCM_LE")]
    PCM_LE, // = 3 << FLV_AUDIO_CODECID_OFFSET,

    [CCode (cname="FLV_CODECID_NELLYMOSER_16KHZ_MONO")]
    NELLY_MOSER_16KHZ_MONO, // = 4 << FLV_AUDIO_CODECID_OFFSET,

    [CCode (cname="FLV_CODECID_NELLYMOSER_8KHZ_MONO")]
    NELLY_MOSER_8KHZ_MONO, // = 5 << FLV_AUDIO_CODECID_OFFSET,

    [CCode (cname="FLV_CODECID_NELLYMOSER")]
    NELLY_MOSER, // = 6 << FLV_AUDIO_CODECID_OFFSET,

    [CCode (cname="FLV_CODECID_PCM_ALAW")]
    PCM_ALAW, // = 7 << FLV_AUDIO_CODECID_OFFSET,

    [CCode (cname="FLV_CODECID_PCM_MULAW")]
    PCM_MULAW, // = 8 << FLV_AUDIO_CODECID_OFFSET,

    [CCode (cname="FLV_CODECID_AAC")]
    AAC, // = 10 << FLV_AUDIO_CODECID_OFFSET,

    [CCode (cname="FLV_CODECID_SPEEX")]
    SPEEX; // = 11 << FLV_AUDIO_CODECID_OFFSET;
}

[CCode (cheader_filename="subprojects/ffmpeg/libavformat/flv.h")]
public enum FLVVCodecID {
    [CCode (cname="FLV_CODECID_H263")]
    H263, // = 2,

    [CCode (cname="FLV_CODECID_SCREEN")]
    SCREEN, // = 3,

    [CCode (cname="FLV_CODECID_VP6")]
    VP6, // = 4,

    [CCode (cname="FLV_CODECID_VP6A")]
    VP6A, // = 5,

    [CCode (cname="FLV_CODECID_SCREEN2")]
    SCREEN2, // = 6,

    [CCode (cname="FLV_CODECID_H264")]
    H264, // = 7,

    [CCode (cname="FLV_CODECID_REALH263")]
    REAL_H263, // = 8,

    [CCode (cname="FLV_CODECID_MPEG4")]
    MPEG4; // = 9;
}

[Flags]
[CCode (cheader_filename="subprojects/ffmpeg/libavformat/flv.h")]
public enum FLVVideoFrameType {
    /***********************************************************
    @brief Key frame (for AVC, a seekable frame)
    ***********************************************************/
    [CCode (cname="FLV_FRAME_KEY")]
    KEY,

    /***********************************************************
    @brief Inter frame (for AVC, a non-seekable frame)
    ***********************************************************/
    [CCode (cname="FLV_FRAME_INTER")]
    INTER,

    /***********************************************************
    @brief Disposable inter frame (H.263 only)
    ***********************************************************/
    [CCode (cname="FLV_FRAME_DISP_INTER")]
    DISP_INTER,

    /***********************************************************
    @brief Generated key frame (reserved for server use only)
    ***********************************************************/
    [CCode (cname="FLV_FRAME_GENERATED_KEY")]
    GENERATED_KEY,

    /***********************************************************
    @brief Video info/command frame
    ***********************************************************/
    [CCode (cname="FLV_FRAME_VIDEO_INFO_CMD")]
    VIDEO_INFO_CMD;
}

[CCode (cname="enum AMFDataType",cheader_filename="subprojects/ffmpeg/libavformat/flv.h")]
public enum AMFDataType {
    [CCode (cname="AMF_DATA_TYPE_NUMBER")]
    NUMBER,

    [CCode (cname="AMF_DATA_TYPE_BOOL")]
    BOOL,

    [CCode (cname="AMF_DATA_TYPE_STRING")]
    STRING,

    [CCode (cname="AMF_DATA_TYPE_OBJECT")]
    OBJECT,

    [CCode (cname="AMF_DATA_TYPE_NULL")]
    NULL,

    [CCode (cname="AMF_DATA_TYPE_UNDEFINED")]
    UNDEFINED,

    [CCode (cname="AMF_DATA_TYPE_REFERENCE")]
    REFERENCE,

    [CCode (cname="AMF_DATA_TYPE_MIXEDARRAY")]
    MIXED_ARRAY,

    [CCode (cname="AMF_DATA_TYPE_OBJECT_END")]
    OBJECT_END,

    [CCode (cname="AMF_DATA_TYPE_ARRAY")]
    ARRAY,

    [CCode (cname="AMF_DATA_TYPE_DATE")]
    DATE,

    [CCode (cname="AMF_DATA_TYPE_LONG_STRING")]
    LONG_STRING,

    [CCode (cname="AMF_DATA_TYPE_UNSUPPORTED")]
    UNSUPPORTED;
}

} // namespace LibAVFormat
