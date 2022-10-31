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

namespace LibAVUtil {

/***********************************************************
@file
@ingroup lavu_frame
reference-counted frame API
***********************************************************/

[Flags]
[CCode (cprefix="FF_DECODE_ERROR_", cheader_filename="libavcodec/frame.h")]
public enum DecodeErrorFlags {
    INVALID_BITSTREAM,
    MISSING_REFERENCE,
    CONCEALMENT_ACTIVE,
    DECODE_SLICES,
}

} // namespace LibAVUtil
