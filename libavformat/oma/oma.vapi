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

[CCode (cname="", cheader_filename="")]
public const size_t EA3_HEADER_SIZE;

[CCode (cname="", cheader_filename="")]
public const string ID3v2_EA3_MAGIC;

[CCode (cname="", cheader_filename="")]
public const size_t OMA_ENC_HEADER_SIZE;

[CCode (cname="", cheader_filename="")]
public enum OMACodecID {
    OMA_CODECID_ATRAC3,
    OMA_CODECID_ATRAC3P,
    OMA_CODECID_MP3,
    OMA_CODECID_LPCM,
    OMA_CODECID_WMA,
    OMA_CODECID_ATRAC3PAL,
    OMA_CODECID_ATRAC3AL,
}

//  extern const uint16 ff_oma_srate_tab[8];

//  extern const AVCodecTag ff_oma_codec_tags[];

//  extern const uint64 ff_oma_chid_to_native_layout[7];
//  extern const int ff_oma_chid_to_num_channels[7];

} // namespace LibAVFormat
