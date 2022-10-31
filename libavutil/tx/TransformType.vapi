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

[CCode (cprefix="AV_TX_", cheader_filename="libavcodec/tx.h")]
public enum TransformType {
    /***********************************************************
    @brief Standard complex to complex FFT with sample data type ComplexFloat.
    Scaling currently unsupported
    ***********************************************************/
    FLOAT_FFT,
    /***********************************************************
    @brief Standard MDCT with sample data type of float and a scale type of
    float. Length is the frame size, not the window size (which is 2x frame)
    ***********************************************************/
    FLOAT_MDCT,
}

} // namespace LibAVUtil
