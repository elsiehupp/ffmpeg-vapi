/***********************************************************
FLV common header

@copyright 2006 The FFmpeg Project

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

namespace LibAVFormat {

/***********************************************************
@file
FLV common header
***********************************************************/

/***********************************************************
offsets for packed values
***********************************************************/
public const size_t FLV_AUDIO_SAMPLESSIZE_OFFSET;
public const size_t FLV_AUDIO_SAMPLERATE_OFFSET;
public const size_t FLV_AUDIO_CODECID_OFFSET;

public const size_t FLV_VIDEO_FRAMETYPE_OFFSET;

/***********************************************************
bitmasks to isolate specific values
***********************************************************/
[Flags]
public enum FLVAudioMask {
    FLV_AUDIO_CHANNEL_MASK,
    FLV_AUDIO_SAMPLESIZE_MASK,
    FLV_AUDIO_SAMPLERATE_MASK,
    FLV_AUDIO_CODECID_MASK,

    FLV_VIDEO_CODECID_MASK,
    FLV_VIDEO_FRAMETYPE_MASK,
}

public const uint32 AMF_END_OF_OBJECT;

public const string KEYFRAMES_TAG;
public const string KEYFRAMES_TIMESTAMP_TAG;
public const string KEYFRAMES_BYTEOFFSET_TAG;

[Flags]
public enum FLVHeaderFlags {
    FLV_HEADER_FLAG_HASVIDEO,
    FLV_HEADER_FLAG_HASAUDIO,
}

public enum FlvTagType {
    FLV_TAG_TYPE_AUDIO,
    FLV_TAG_TYPE_VIDEO,
    FLV_TAG_TYPE_META,
}

public enum FLVStreamType {
    FLV_STREAM_TYPE_VIDEO,
    FLV_STREAM_TYPE_AUDIO,
    FLV_STREAM_TYPE_SUBTITLE,
    FLV_STREAM_TYPE_DATA,
    FLV_STREAM_TYPE_NB,
}

public enum FLVAudioMode {
    FLV_MONO = 0,
    FLV_STEREO = 1,
}

public enum FLVSampleSize {
    FLV_SAMPLESSIZE_8BIT = 0,
    FLV_SAMPLESSIZE_16BIT = 1 << FLV_AUDIO_SAMPLESSIZE_OFFSET,
}

public enum FLVSampleRate {
    FLV_SAMPLERATE_SPECIAL = 0, /***********************************************************
    signifies 5512Hz and 8000Hz in the case of NELLYMOSER
    ***********************************************************/
    FLV_SAMPLERATE_11025HZ = 1 << FLV_AUDIO_SAMPLERATE_OFFSET,
    FLV_SAMPLERATE_22050HZ = 2 << FLV_AUDIO_SAMPLERATE_OFFSET,
    FLV_SAMPLERATE_44100HZ = 3 << FLV_AUDIO_SAMPLERATE_OFFSET,
}

public enum FLVVCodecIDWithOffset {
    FLV_CODECID_PCM = 0,
    FLV_CODECID_ADPCM = 1 << FLV_AUDIO_CODECID_OFFSET,
    FLV_CODECID_MP3 = 2 << FLV_AUDIO_CODECID_OFFSET,
    FLV_CODECID_PCM_LE = 3 << FLV_AUDIO_CODECID_OFFSET,
    FLV_CODECID_NELLYMOSER_16KHZ_MONO = 4 << FLV_AUDIO_CODECID_OFFSET,
    FLV_CODECID_NELLYMOSER_8KHZ_MONO = 5 << FLV_AUDIO_CODECID_OFFSET,
    FLV_CODECID_NELLYMOSER = 6 << FLV_AUDIO_CODECID_OFFSET,
    FLV_CODECID_PCM_ALAW = 7 << FLV_AUDIO_CODECID_OFFSET,
    FLV_CODECID_PCM_MULAW = 8 << FLV_AUDIO_CODECID_OFFSET,
    FLV_CODECID_AAC = 10<< FLV_AUDIO_CODECID_OFFSET,
    FLV_CODECID_SPEEX = 11<< FLV_AUDIO_CODECID_OFFSET,
}

public enum FLVVCodecID {
    FLV_CODECID_H263 = 2,
    FLV_CODECID_SCREEN = 3,
    FLV_CODECID_VP6 = 4,
    FLV_CODECID_VP6A = 5,
    FLV_CODECID_SCREEN2 = 6,
    FLV_CODECID_H264 = 7,
    FLV_CODECID_REALH263= 8,
    FLV_CODECID_MPEG4 = 9,
}

[Flags]
public enum FLVVideoFrameType {
    /***********************************************************
    Key frame (for AVC, a seekable frame)
    ***********************************************************/
    FLV_FRAME_KEY,
    /***********************************************************
    Inter frame (for AVC, a non-seekable frame)
    ***********************************************************/
    FLV_FRAME_INTER,
    /***********************************************************
    Disposable inter frame (H.263 only)
    ***********************************************************/
    FLV_FRAME_DISP_INTER,
    /***********************************************************
    Generated key frame (reserved for server use only)
    ***********************************************************/
    FLV_FRAME_GENERATED_KEY,
    /***********************************************************
    Video info/command frame
    ***********************************************************/
    FLV_FRAME_VIDEO_INFO_CMD;
}

public enum AMFDataType {
    AMF_DATA_TYPE_NUMBER,
    AMF_DATA_TYPE_BOOL,
    AMF_DATA_TYPE_STRING,
    AMF_DATA_TYPE_OBJECT,
    AMF_DATA_TYPE_NULL,
    AMF_DATA_TYPE_UNDEFINED,
    AMF_DATA_TYPE_REFERENCE,
    AMF_DATA_TYPE_MIXEDARRAY,
    AMF_DATA_TYPE_OBJECT_END,
    AMF_DATA_TYPE_ARRAY,
    AMF_DATA_TYPE_DATE,
    AMF_DATA_TYPE_LONG_STRING,
    AMF_DATA_TYPE_UNSUPPORTED,
}

} // namespace LibAVFormat
