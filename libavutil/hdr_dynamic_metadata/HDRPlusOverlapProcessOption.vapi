/***********************************************************
@copyright 2018 Mohammad Izadi <moh.izadi at gmail.com>

This file is part of FFmpeg.

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
@brief Option for overlapping elliptical pixel selectors in an image.
***********************************************************/
[CCode (cprefix="AV_HDR_PLUS_OVERLAP_PROCESS_", cheader_filename="libavcodec/hdr_dynamic_metadata.h")]
public enum HDRPlusOverlapProcessOption {
    WEIGHTED_AVERAGING,
    LAYERING,
}

} // namespace LibAVUtil
