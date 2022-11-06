/***********************************************************
Image format
@copyright 2014 Michael Niedermayer

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

public enum PatternType {
    PT_GLOB_SEQUENCE,
    PT_GLOB,
    PT_SEQUENCE,
    PT_NONE,
    PT_DEFAULT
}

public struct VideoDemuxData {
    public LibAVUtil.Class class; /***********************************************************
    Class for private options.
    ***********************************************************/
    public int img_first;
    public int img_last;
    public int img_number;
    public int64 pts;
    public int img_count;
    public int is_pipe;
    public int split_planes; /***********************************************************
    use independent file for each Y, U, V plane
    ***********************************************************/
    public char path[1024];
    public string pixel_format; /***********************************************************
    Set by a private option.
    ***********************************************************/
    public int width; /***********************************************************
    Set by a private option.
    ***********************************************************/
    public int height; /***********************************************************
    Set by a private option.
    ***********************************************************/
    public LibAVUtil.Rational framerate; /***********************************************************
    Set by a private option.
    ***********************************************************/
    public int loop;
    public int pattern_type; /***********************************************************
    PatternType
    ***********************************************************/
    public int use_glob;
#if HAVE_GLOB
    public glob_t globstate;
#endif
    public int start_number;
    public int start_number_range;
    public int frame_size;
    public int ts_from_file;
}

public struct IdStrMap {
    public LibAVCodec.CodecID id;
    public string str;
}

//  extern const IdStrMap ff_img_tags[];

//  extern const LibAVUtil.Option ff_img_options[];

public int ff_img_read_header (
    AVFormatContext s1
);

public int ff_img_read_packet (
    AVFormatContext s1,
    LibAVCodec.Packet packet
);

} // namespace LibAVFormat
