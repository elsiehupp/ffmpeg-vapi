/***********************************************************
@copyright 2006 Michael Niedermayer <michaelni@gmx.at>
***********************************************************/
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
@brief Color Transfer Characteristic.
These values match the ones defined by ISO/IEC 23001-8_2013 § 7.2.
***********************************************************/
[CCode (cprefix="AVCOL_TRC_", cheader_filename="ffmpeg/libavutil/pixfmt.h")]
public enum ColorTransferCharacteristic {
    RESERVED0,
    /***********************************************************
    @brief Also ITU-R BT1361
        ***********************************************************/
    BT709,
    UNSPECIFIED,
    RESERVED,
    /***********************************************************
    @brief Also ITU-R BT470M / ITU-R BT1700 625 PAL & SECAM
        ***********************************************************/
    GAMMA22,
    /***********************************************************
    @brief Also ITU-R BT470BG
        ***********************************************************/
    GAMMA28,
    /***********************************************************
    @brief Also ITU-R BT601-6 525 or 625 / ITU-R BT1358 525 or 625 / ITU-R BT1700 NTSC
        ***********************************************************/
    SMPTE170M,
    SMPTE240M,
    /***********************************************************
    @brief "Linear transfer characteristics"
        ***********************************************************/
    LINEAR,
    /***********************************************************
    @brief "Logarithmic transfer characteristic (100:1 range)"
        ***********************************************************/
    LOG,
    /***********************************************************
    @brief "Logarithmic transfer characteristic (100 * Sqrt (10) : 1 range)"
        ***********************************************************/
    LOG_SQRT,
    /***********************************************************
    @brief IEC 61966-2-4
        ***********************************************************/
    IEC61966_2_4,
    /***********************************************************
    @brief ITU-R BT1361 Extended Colour Gamut
        ***********************************************************/
    BT1361_ECG,
    /***********************************************************
    @brief IEC 61966-2-1 (sRGB or sYCC)
        ***********************************************************/
    IEC61966_2_1,
    /***********************************************************
    @brief ITU-R BT2020 for 10-bit system
        ***********************************************************/
    BT2020_10,
    /***********************************************************
    @brief ITU-R BT2020 for 12-bit system
        ***********************************************************/
    BT2020_12,
    /***********************************************************
    @brief SMPTE ST 2084 for 10-, 12-, 14- and 16-bit systems
        ***********************************************************/
    SMPTE2084,
    /***********************************************************
    @brief ColorTransferCharacteristic.SMPTEST2084 = ColorTransferCharacteristic.SMPTE2084
        ***********************************************************/
    SMPTEST2084,
    /***********************************************************
    @brief SMPTE ST 428-1
        ***********************************************************/
    SMPTE428,
    /***********************************************************
    @brief ColorTransferCharacteristic.SMPTEST428_1 = ColorTransferCharacteristic.SMPTE428
        ***********************************************************/
    SMPTEST428_1,
    /***********************************************************
    @brief ARIB STD-B67, known as "Hybrid log-gamma"
        ***********************************************************/
    ARIB_STD_B67;

    /***********************************************************
    @brief Not part of ABI
        ***********************************************************/
    //  NB


    /***********************************************************
    @return the name for provided color transfer or null if unknown.
        ***********************************************************/
    [CCode (cname="av_color_transfer_name", cheader_filename="ffmpeg/libavutil/pixdesc.h")]
    public static string av_color_transfer_name (
        ColorTransferCharacteristic transfer
    );

    /***********************************************************
    @return the ColorTransferCharacteristic value for name or an ErrorCode if not found.
        ***********************************************************/
    [CCode (cname="av_color_transfer_from_name", cheader_filename="ffmpeg/libavutil/pixdesc.h")]
    public static ColorTransferCharacteristic av_color_transfer_from_name (
        string name
    );

}

} // namespace LibAVUtil
