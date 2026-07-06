/***********************************************************
@brief Sony OpenMG (OMA) common data
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

[CCode (cname="EA3_HEADER_SIZE",cheader_filename="subprojects/ffmpeg/libavformat/oma.h")]
public const size_t EA3_HEADER_SIZE;

[CCode (cname="ID3v2_EA3_MAGIC",cheader_filename="subprojects/ffmpeg/libavformat/oma.h")]
public const string ID3v2_EA3_MAGIC;

[CCode (cname="OMA_ENC_HEADER_SIZE",cheader_filename="subprojects/ffmpeg/libavformat/oma.h")]
public const size_t OMA_ENC_HEADER_SIZE;

[CCode (cheader_filename="subprojects/ffmpeg/libavformat/oma.h")]
public enum OMACodecID {
    [CCode (cname="OMA_CODECID_ATRAC3")]
    ATRAC3,

    [CCode (cname="OMA_CODECID_ATRAC3P")]
    ATRAC3_P,

    [CCode (cname="OMA_CODECID_MP3")]
    MP3,

    [CCode (cname="OMA_CODECID_LPCM")]
    LPCM,

    [CCode (cname="OMA_CODECID_WMA")]
    WMA,

    [CCode (cname="OMA_CODECID_ATRAC3PAL")]
    ATRAC3_PAL,

    [CCode (cname="OMA_CODECID_ATRAC3AL")]
    ATRAC3_AL;
}

//  extern const uint16 ff_oma_srate_tab[8];

//  extern const LibAVFormat.CodecTag ff_oma_codec_tags[];

//  extern const uint64 ff_oma_chid_to_native_layout[7];
//  extern const int ff_oma_chid_to_num_channels[7];

} // namespace LibAVFormat
