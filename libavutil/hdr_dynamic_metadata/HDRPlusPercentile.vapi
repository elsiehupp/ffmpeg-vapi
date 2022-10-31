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
@brief Represents the percentile at a specific percentage in
a distribution.
***********************************************************/
[CCode (cname="struct AVHDRPlusPercentile", cheader_filename="libavcodec/hdr_dynamic_metadata.h")]
public struct HDRPlusPercentile {
    /***********************************************************
    @brief The percentage value corresponding to a specific percentile linearized
    RGB value in the processing window in the scene. The value shall be in
    the range of 0 to100, inclusive.
    ***********************************************************/
    [CCode (cname="percentage")]
    public uint8 percentage;

    /***********************************************************
    @brief The linearized maxRGB value at a specific percentile in the processing
    window in the scene. The value shall be in the range of 0 to 1, inclusive
    and in multiples of 0.00001.
    ***********************************************************/
    [CCode (cname="percentile")]
    public Rational percentile;
}

} // namespace LibAVUtil
