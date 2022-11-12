/***********************************************************
@brief Image format
@copyright 2014 Michael Niedermayer
***********************************************************/
/***********************************************************
@brief This file is part of FFmpeg.

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

[CCode (cname="", cheader_filename="")]
public enum PatternType {
    PT_GLOB_SEQUENCE,
    PT_GLOB,
    PT_SEQUENCE,
    PT_NONE,
    PT_DEFAULT
}

[CCode (cname="struct VideoDemuxData", cheader_filename="")]
public struct VideoDemuxData {
    /***********************************************************
    @brief Class for private options.
    ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public LibAVUtil.Class class;

    [CCode (cname="", cheader_filename="")]
    public int img_first;

    [CCode (cname="", cheader_filename="")]
    public int img_last;

    [CCode (cname="", cheader_filename="")]
    public int img_number;

    [CCode (cname="", cheader_filename="")]
    public int64 pts;

    [CCode (cname="", cheader_filename="")]
    public int img_count;

    [CCode (cname="", cheader_filename="")]
    public int is_pipe;

    /***********************************************************
    use independent file for each Y, U, V plane
    ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int split_planes;

    [CCode (cname="", cheader_filename="")]
    public char path[1024];

    /***********************************************************
    @brief Set by a private option.
    ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public string pixel_format;

    /***********************************************************
    @brief Set by a private option.
    ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int width;

    /***********************************************************
    @brief Set by a private option.
    ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int height;

    /***********************************************************
    @brief Set by a private option.
    ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public LibAVUtil.Rational framerate;

    [CCode (cname="", cheader_filename="")]
    public int loop;

    /***********************************************************
    @brief PatternType
    ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int pattern_type;

    [CCode (cname="", cheader_filename="")]
    public int use_glob;
#if HAVE_GLOB
    [CCode (cname="", cheader_filename="")]
    public glob_t globstate;
#endif
    [CCode (cname="", cheader_filename="")]
    public int start_number;

    [CCode (cname="", cheader_filename="")]
    public int start_number_range;

    [CCode (cname="", cheader_filename="")]
    public int frame_size;

    [CCode (cname="", cheader_filename="")]
    public int ts_from_file;
}

[CCode (cname="struct IdStrMap", cheader_filename="")]
public struct IdStrMap {
    [CCode (cname="", cheader_filename="")]
    public LibAVCodec.CodecID id;

    [CCode (cname="", cheader_filename="")]
    public string str;
}

//  extern const IdStrMap ff_img_tags[];

//  extern const LibAVUtil.Option ff_img_options[];

[CCode (cname="", cheader_filename="")]
public int ff_img_read_header (
    AVFormatContext s1
);

[CCode (cname="", cheader_filename="")]
public int ff_img_read_packet (
    AVFormatContext s1,
    LibAVCodec.Packet packet
);

} // namespace LibAVFormat
