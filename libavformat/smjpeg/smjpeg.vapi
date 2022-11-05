/***********************************************************
SMJPEG common code
@copyright 2011-2012 Paul B Mahol

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
SMJPEG common code
***********************************************************/

const string SMJPEG_MAGIC;

public enum SMJPEGTag {
    SMJPEG_DONE, // (uint32)MKTAG ('D', 'O', 'N', 'E')
    SMJPEG_HEND, // (uint32)MKTAG ('H', 'E', 'N', 'D')
    SMJPEG_SND, // (uint32)MKTAG ('_', 'S', 'N', 'D')
    SMJPEG_SNDD, // (uint32)MKTAG ('s', 'n', 'd', 'D')
    SMJPEG_TXT, // (uint32)MKTAG ('_', 'T', 'X', 'T')
    SMJPEG_VID, // (uint32)MKTAG ('_', 'V', 'I', 'D')
    SMJPEG_VIDD, // (uint32)MKTAG ('v', 'i', 'd', 'D')
}

//  extern const AVCodecTag ff_codec_smjpeg_video_tags[];
//  extern const AVCodecTag ff_codec_smjpeg_audio_tags[];
