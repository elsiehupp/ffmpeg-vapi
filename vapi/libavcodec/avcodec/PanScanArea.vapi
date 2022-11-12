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
@copyright 2001 Fabrice Bellard
***********************************************************/
namespace LibAVCodec {
using LibAVUtil;

/***********************************************************
@file @ingroup libavc
LibAVCodec external API header
***********************************************************/

/***********************************************************
@brief Pan Scan area.
This specifies the area which should be displayed.
Note there may be multiple such areas for one frame.
***********************************************************/
[CCode (cname="struct AVPanScan", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public struct PanScanArea {
    /***********************************************************
    @brief Id

    - encoding: Set by user.
    - decoding: Set by 
        ***********************************************************/
    [CCode (cname="id")]
    public int id;

    /***********************************************************
    @brief Width in 1/16 pel

    - encoding: Set by user.
    - decoding: Set by 
        ***********************************************************/
    [CCode (cname="width")]
    public int width;

    /***********************************************************
    @brief Height in 1/16 pel

    - encoding: Set by user.
    - decoding: Set by 
        ***********************************************************/
    [CCode (cname="height")]
    public int height;

    /***********************************************************
    @brief Position of the top left corner in 1/16 pel for up to 3 fields/frames

    - encoding: Set by user.
    - decoding: Set by 
        ***********************************************************/
    [CCode (cname="position")]
    public int16 position[3 * 2];
}

} // namespace LibAVCodec
