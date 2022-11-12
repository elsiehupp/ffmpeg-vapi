/***********************************************************
@brief Pixel format descriptor
@copyright 2009 Michael Niedermayer <michaelni@gmx.at>
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

[CCode (cname="struct AVComponentDescriptor", cheader_filename="ffmpeg/libavutil/pixdesc.h")]
public struct ComponentDescriptor {
    /***********************************************************
    @brief Which of the 4 planes contains the component.
        ***********************************************************/
    [CCode (cname="plane")]
    public int plane;

    /***********************************************************
    @brief Number of elements between 2 horizontally consecutive pixels.
    Elements are bits for bitstream formats, bytes otherwise.
        ***********************************************************/
    [CCode (cname="step")]
    public int step;

    /***********************************************************
    @brief Number of elements before the component of the first pixel.
    Elements are bits for bitstream formats, bytes otherwise.
        ***********************************************************/
    [CCode (cname="offset")]
    public int offset;

    /***********************************************************
    @brief Number of least significant bits that must be shifted away
    to get the value.
        ***********************************************************/
    [CCode (cname="shift")]
    public int shift;

    /***********************************************************
    @brief Number of bits in the component.
        ***********************************************************/
    [CCode (cname="depth")]
    public int depth;
}

} // namespace LibAVUtil
