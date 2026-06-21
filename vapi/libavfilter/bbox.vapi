/***********************************************************
Copyright (c) 2005 Robert Edele <yartrebo@earthlink.net>

This file is part of FFmpeg.

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

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/bbox.h")]
[Compact]
public class FFBoundingBox {
    [CCode (cname="")]
    public int x1;

    [CCode (cname="")]
    public int x2;

    [CCode (cname="")]
    public int y1;

    [CCode (cname="")]
    public int y2;
}

/***********************************************************
Calculate the smallest rectangle that will encompass the
region with values > min_val.

@param bbox bounding box structure which is updated with the found values.
            If no pixels could be found with value > min_val, the
            structure is not modified.
@return 1 in case at least one pixel with value > min_val was found,
        0 otherwise
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/bbox.h")]
public int ff_calculate_bounding_box (
    FFBoundingBox? bbox,
    uint8[] data,
    int linesize,
    int w,
    int h,
    int min_val
);
