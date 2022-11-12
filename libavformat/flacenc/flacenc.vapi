/***********************************************************
@brief Raw FLAC muxer
@copyright 2009 Justin Ruggles
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
public int ff_flac_write_header (
    AVIOContext pb,
    uint8[] extradata,
    int extradata_size,
    int last_block
);

[CCode (cname="", cheader_filename="")]
public int ff_flac_is_native_layout (
    uint64 channel_layout
);

} // namespace LibAVFormat
