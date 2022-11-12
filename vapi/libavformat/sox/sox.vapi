/***********************************************************
@brief SoX native format common data
@copyright 2009 Daniel Verkamp <daniel@drv.nu>
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
@brief Size of fixed header without magic
***********************************************************/
[CCode (cname="", cheader_filename="")]
public const size_t SOX_FIXED_HDR;

[CCode (cname="", cheader_filename="")]
public const uint32 SOX_TAG; // MKTAG ('.', 'S', 'o', 'X')

} // namespace LibAVFormat
