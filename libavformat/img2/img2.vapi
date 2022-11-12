/***********************************************************
Image format
@copyright 2014 Michael Niedermayer
***********************************************************/
/***********************************************************
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
    Class for private options.
    ***********************************************************/
    public LibAVUtil.Class class;
    public int img_first;
    public int img_last;
    public int img_number;
    public int64 pts;
    public int img_count;
    public int is_pipe;
    /***********************************************************
    use independent file for each Y, U, V plane
    ***********************************************************/
    public int split_planes;
    public char path[1024];
    /***********************************************************
    Set by a private option.
    ***********************************************************/
    public string pixel_format;
    /***********************************************************
    Set by a private option.
    ***********************************************************/
    public int width;
    /***********************************************************
    Set by a private option.
    ***********************************************************/
    public int height;
    /***********************************************************
    Set by a private option.
    ***********************************************************/
    public LibAVUtil.Rational framerate;
    public int loop;
    /***********************************************************
    PatternType
    ***********************************************************/
    public int pattern_type;
    public int use_glob;
#if HAVE_GLOB
    public glob_t globstate;
#endif
    public int start_number;
    public int start_number_range;
    public int frame_size;
    public int ts_from_file;
}

[CCode (cname="struct IdStrMap", cheader_filename="")]
public struct IdStrMap {
    public LibAVCodec.CodecID id;
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
