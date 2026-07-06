/***********************************************************
Copyright (c) 2001 Fabrice Bellard

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

namespace LibAVFormat {

/***********************************************************
@file
@ingroup libavf
Main libavformat public API header
***********************************************************/

/***********************************************************
LibAVFormat.StreamGroupTileGrid holds information on how to combine several
independent images on a single canvas for presentation.

The output should be a @ref LibAVFormat.StreamGroupTileGrid.background "background"
colored @ref LibAVFormat.StreamGroupTileGrid.coded_width "coded_width" x
@ref LibAVFormat.StreamGroupTileGrid.coded_height "coded_height" canvas where a
@ref LibAVFormat.StreamGroupTileGrid.nb_tiles "nb_tiles" amount of tiles are placed in
the order they appear in the @ref LibAVFormat.StreamGroupTileGrid.offsets "offsets"
array, at the exact offset described for them. In particular, if two or more
tiles overlap, the image with higher index in the
@ref LibAVFormat.StreamGroupTileGrid.offsets "offsets" array takes priority.
Note that a single image may be used multiple times, i.e. multiple entries
in @ref LibAVFormat.StreamGroupTileGrid.offsets "offsets" may have the same value of
idx.

The following is an example of a simple grid with 3 rows and 4 columns:

+---+---+---+---+
| 0 | 1 | 2 | 3 |
+---+---+---+---+
| 4 | 5 | 6 | 7 |
+---+---+---+---+
| 8 | 9 |10 |11 |
+---+---+---+---+

Assuming all tiles have a dimension of 512x512, the
@ref LibAVFormat.StreamGroupTileGrid.offsets "offset" of the topleft pixel of
the first @ref LibAVFormat.StreamGroup.streams "stream" in the group is "0,0", the
@ref LibAVFormat.StreamGroupTileGrid.offsets "offset" of the topleft pixel of
the second @ref LibAVFormat.StreamGroup.streams "stream" in the group is "512,0", the
@ref LibAVFormat.StreamGroupTileGrid.offsets "offset" of the topleft pixel of
the fifth @ref LibAVFormat.StreamGroup.streams "stream" in the group is "0,512", the
@ref LibAVFormat.StreamGroupTileGrid.offsets "offset", of the topleft pixel of
the sixth @ref LibAVFormat.StreamGroup.streams "stream" in the group is "512,512",
etc.

The following is an example of a canvas with overlapping tiles:

+-----------+
|   %%%%%   |
|***%%3%%@@@|
|**0%%%%%2@@|
|***##1@@@@@|
|   #####   |
+-----------+

Assuming a canvas with size 1024x1024 and all tiles with a dimension of
512x512, a possible @ref LibAVFormat.StreamGroupTileGrid.offsets "offset" for the
topleft pixel of the first @ref LibAVFormat.StreamGroup.streams "stream" in the group
would be 0x256, the @ref LibAVFormat.StreamGroupTileGrid.offsets "offset" for the
topleft pixel of the second @ref LibAVFormat.StreamGroup.streams "stream" in the group
would be 256x512, the @ref LibAVFormat.StreamGroupTileGrid.offsets "offset" for the
topleft pixel of the third @ref LibAVFormat.StreamGroup.streams "stream" in the group
would be 512x256, and the @ref LibAVFormat.StreamGroupTileGrid.offsets "offset" for
the topleft pixel of the fourth @ref LibAVFormat.StreamGroup.streams "stream" in the
group would be 256x0.

sizeof (LibAVFormat.StreamGroupTileGrid) is not a part of the ABI and may only be
allocated by avformat_stream_group_create ().
***********************************************************/
[CCode (cname="struct AVStreamGroupTileGrid",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
[Compact]
public class LibAVFormat.StreamGroupTileGrid {
    [CCode (cname="av_class")]
    public LibAVUtil.Log.Class? av_class;

    /***********************************************************
    Amount of tiles in the grid.

    Must be > 0.
    ***********************************************************/
    [CCode (cname="nb_tiles")]
    public uint nb_tiles;

    /***********************************************************
    Width of the canvas.

    Must be > 0.
    ***********************************************************/
    [CCode (cname="coded_width")]
    public int coded_width;

    /***********************************************************
    Height of the canvas.

    Must be > 0.
    ***********************************************************/
    [CCode (cname="coded_height")]
    public int coded_height;

    /***********************************************************
    An @ref nb_tiles sized array of offsets in pixels from the topleft edge
    of the canvas, indicating where each stream should be placed.
    It must be allocated with the av_malloc () family of functions.

    - demuxing: set by libavformat, must not be modified by the caller.
    - muxing: set by the caller before avformat_write_header ().

    Freed by libavformat in avformat_free_context ().
    ***********************************************************/
    [Compact]
    public class Offsets {
        /***********************************************************
        Index of the stream in the group this tile references.

        Must be < @ref LibAVFormat.StreamGroup.nb_streams "nb_streams".
        ***********************************************************/
        [CCode (cname="idx")]
        public uint idx;

        /***********************************************************
        Offset in pixels from the left edge of the canvas where the tile
        should be placed.
        ***********************************************************/
        [CCode (cname="horizontal")]
        public int horizontal;

        /***********************************************************
        Offset in pixels from the top edge of the canvas where the tile
        should be placed.
        ***********************************************************/
        [CCode (cname="vertical")]
        public int vertical;
    }

    [CCode (cname="offsets")]
    public Offsets? offsets;

    /***********************************************************
    The pixel value per channel in RGBA format used if no pixel of any tile
    is located at a particular pixel location.

    @see av_image_fill_color ().
    @see av_parse_color ().
    ***********************************************************/
    [CCode (cname="background")]
    public uint8 background[4];

    /***********************************************************
    Offset in pixels from the left edge of the canvas where the actual image
    meant for presentation starts.

    This field must be >= 0 and < @ref coded_width.
    ***********************************************************/
    [CCode (cname="horizontal_offset")]
    public int horizontal_offset;

    /***********************************************************
    Offset in pixels from the top edge of the canvas where the actual image
    meant for presentation starts.

    This field must be >= 0 and < @ref coded_height.
    ***********************************************************/
    [CCode (cname="vertical_offset")]
    public int vertical_offset;

    /***********************************************************
    Width of the final image for presentation.

    Must be > 0 and <= (@ref coded_width - @ref horizontal_offset).
    When it's not equal to (@ref coded_width - @ref horizontal_offset), the
    result of (@ref coded_width - width - @ref horizontal_offset) is the
    amount amount of pixels to be cropped from the right edge of the
    final image before presentation.
    ***********************************************************/
    [CCode (cname="width")]
    public int width;

    /***********************************************************
    Height of the final image for presentation.

    Must be > 0 and <= (@ref coded_height - @ref vertical_offset).
    When it's not equal to (@ref coded_height - @ref vertical_offset), the
    result of (@ref coded_height - height - @ref vertical_offset) is the
    amount amount of pixels to be cropped from the bottom edge of the
    final image before presentation.
    ***********************************************************/
    [CCode (cname="height")]
    public int height;

    /***********************************************************
    Additional data associated with the grid.

    Should be allocated with av_packet_side_data_new () or
    av_packet_side_data_add (), and will be freed by avformat_free_context ().
    ***********************************************************/
    [CCode (cname="coded_side_data")]
    public AVPacketSideData? coded_side_data;

    /***********************************************************
    Amount of entries in @ref coded_side_data.
    ***********************************************************/
    [CCode (cname="nb_coded_side_data")]
    public int nb_coded_side_data;
}

} // namespace LibAVFormat
