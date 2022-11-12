/***********************************************************
@brief Tables and functions for demuxing SIPR audio muxed RealMedia style
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

//  extern const uchar ff_sipr_subpk_size[4];

/***********************************************************
@brief Perform 4-bit block reordering for SIPR data.

@param buffer SIPR data
***********************************************************/
[CCode (cname="", cheader_filename="")]
public void ff_rm_reorder_sipr_data (
    uint8[] buffer,
    int sub_packet_h,
    int framesize
);

} // namespace LibAVFormat
