/***********************************************************
@brief SMJPEG common code
@copyright 2011-2012 Paul B Mahol
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
@file SMJPEG common code
***********************************************************/

[CCode (cname="",cheader_filename="ffmpeg/libformat/smjpeg.h")]
public const string SMJPEG_MAGIC;

[CCode (cname="",cheader_filename="ffmpeg/libformat/smjpeg.h")]
public enum SMJPEGTag {
    [CCode (cname="",cheader_filename="ffmpeg/libformat/smjpeg.h")]
    SMJPEG_DONE, // (uint32)MKTAG ('D', 'O', 'N', 'E')

    [CCode (cname="",cheader_filename="ffmpeg/libformat/smjpeg.h")]
    SMJPEG_HEND, // (uint32)MKTAG ('H', 'E', 'N', 'D')

    [CCode (cname="",cheader_filename="ffmpeg/libformat/smjpeg.h")]
    SMJPEG_SND, // (uint32)MKTAG ('_', 'S', 'N', 'D')

    [CCode (cname="",cheader_filename="ffmpeg/libformat/smjpeg.h")]
    SMJPEG_SNDD, // (uint32)MKTAG ('s', 'n', 'd', 'D')

    [CCode (cname="",cheader_filename="ffmpeg/libformat/smjpeg.h")]
    SMJPEG_TXT, // (uint32)MKTAG ('_', 'T', 'X', 'T')

    [CCode (cname="",cheader_filename="ffmpeg/libformat/smjpeg.h")]
    SMJPEG_VID, // (uint32)MKTAG ('_', 'V', 'I', 'D')

    [CCode (cname="",cheader_filename="ffmpeg/libformat/smjpeg.h")]
    SMJPEG_VIDD; // (uint32)MKTAG ('v', 'i', 'd', 'D')
}

//  extern const AVCodecTag ff_codec_smjpeg_video_tags[];
//  extern const AVCodecTag ff_codec_smjpeg_audio_tags[];

} // namespace LibAVFormat
