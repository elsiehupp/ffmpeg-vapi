/***********************************************************
@brief This file is part of FFmpeg.

FFmpeg is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

FFmpeg is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with FFmpeg; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
***********************************************************/
/***********************************************************
@brief AC-3 parser prototypes
@copyright 2003 Fabrice Bellard
@copyright 2003 Michael Niedermayer
***********************************************************/
namespace LibAVCodec {
using LibAVUtil;

/***********************************************************
@brief Extract the bitstream ID and the frame size from AC-3 data.
***********************************************************/
[CCode (cname="av_ac3_parse_header", cheader_filename="ffmpeg/libavcodec/ac3_parser.h")]
public int av_ac3_parse_header (
    uint8[] buffer,
    size_t size,
    out uint8 bitstream_id,
    out uint16 frame_size
);

} // namespace LibAVCodec
