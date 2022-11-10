/***********************************************************
@copyright 2006 Michael Niedermayer <michaelni@gmx.at>
***********************************************************/
/***********************************************************
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
@brief Location of chroma samples.

Illustration showing the location of the first (top left) chroma sample of the
image, the left shows only luma, the right
shows the location of the chroma sample, the 2 could be imagined to overlay
each other but are drawn separately due to limitations of ASCII

1st 2nd 1st 2nd horizontal luma sample positions
v v v v
______ ______

* 1st luma line > |X X ...   |3 4 X ...    X are luma samples,
                  |            |1 2 1-6 are possible chroma positions
* 2nd luma line > |X X ...   |5 6 X ...    0 is undefined/unknown position
***********************************************************/
[CCode (cname="AVChromaLocation", cprefix="AVCHROMA_LOC_", cheader_filename="ffmpeg/libavutil/pixfmt.h")]
public enum ChromaLocation {
    UNSPECIFIED,
    /***********************************************************
    @brief MPEG-2/4 4:2:0, H.264 default for 4:2:0
    ***********************************************************/
    LEFT,
    /***********************************************************
    @brief MPEG-1 4:2:0, JPEG 4:2:0, H.263 4:2:0
    ***********************************************************/
    CENTER,
    /***********************************************************
    @brief ITU-R 601, SMPTE 274M 296M S314M (DV 4:1:1), mpeg2 4:2:2
    ***********************************************************/
    [CCode (cname="AVCHROMA_LOC_TOPLEFT")]
    TOP_LEFT,
    TOP,
    [CCode (cname="AVCHROMA_LOC_BOTTOMLEFT")]
    BOTTOM_LEFT,
    BOTTOM;
    /***********************************************************
    @brief Not part of ABI
    ***********************************************************/
    //  ChromaLocation.NB


    /***********************************************************
    @return the name for provided chroma location or null if unknown.
    ***********************************************************/
    [CCode (cname="av_chroma_location_name", cheader_filename="ffmpeg/libavutil/pixdesc.h")]
    public static string av_chroma_location_name (
        ChromaLocation location
    );

    /***********************************************************
    @return the ChromaLocation value for name or an ErrorCode if not found.
    ***********************************************************/
    [CCode (cname="av_chroma_location_from_name", cheader_filename="ffmpeg/libavutil/pixdesc.h")]
    public static ChromaLocation av_chroma_location_from_name (
        string name
    );

}

} // namespace LibAVUtil
