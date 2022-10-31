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

/***********************************************************
@brief Structure describing a single Region Of Interest.

When multiple regions are defined in a single side-data block, they
should be ordered from most to least important - some encoders are only
capable of supporting a limited number of distinct regions, so will have
to truncate the list.

When overlapping regions are defined, the first region containing a given
area of the frame applies.
***********************************************************/
[CCode (cname="struct AVRegionOfInterest", cheader_filename="ffmpeg/libavutil/frame.h")]
public struct RegionOfInterest {
    /***********************************************************
    @brief Must be set to the size of this data structure (that is,
    sizeof (RegionOfInterest)).
    ***********************************************************/
    [CCode (cname="self_size")]
    public uint32 self_size;

    /***********************************************************
    @brief Distance in pixels from the top edge of the frame to the top and
    bottom edges and from the left edge of the frame to the left and
    right edges of the rectangle defining this region of interest.

    The constraints on a region are encoder dependent, so the region
    actually affected may be slightly larger for alignment or other
    reasons.
    ***********************************************************/
    [CCode (cname="top")]
    public int top;
    [CCode (cname="bottom")]
    public int bottom;
    [CCode (cname="left")]
    public int left;
    [CCode (cname="right")]
    public int right;

    /***********************************************************
    @brief Quantisation offset.

    Must be in the range -1 to +1. A value of zero indicates no quality
    change. A negative value asks for better quality (less quantisation),
    while a positive value asks for worse quality (greater quantisation).

    The range is calibrated so that the extreme values indicate the
    largest possible offset - if the rest of the frame is encoded with the
    worst possible quality, an offset of -1 indicates that this region
    should be encoded with the best possible quality anyway. Intermediate
    values are then interpolated in some codec-dependent way.

    For example, in 10-bit H.264 the quantisation parameter varies between
    -12 and 51. A typical qoffset value of -1/10 therefore indicates that
    this region should be encoded with a QP around one-tenth of the full
    range better than the rest of the frame. So, if most of the frame
    were to be encoded with a QP of around 30, this region would get a QP
    of around 24 (an offset of approximately -1/10 * (51 - -12) = -6.3).
    An extreme value of -1 would indicate that this region should be
    encoded with the best possible quality regardless of the treatment of
    the rest of the frame - that is, should be encoded at a QP of -12.
    ***********************************************************/
    [CCode (cname="qoffset")]
    public Rational qoffset;
}

} // namespace LibAVUtil
