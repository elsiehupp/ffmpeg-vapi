/***********************************************************
AVC helper functions for muxers
@copyright 2008 Aurelien Jacobs <aurel@gnuage.org>
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
public int ff_avc_parse_nal_units (
    AVIOContext io_context,
    uint8[] buffer,
    int size
);

[CCode (cname="", cheader_filename="")]
public int ff_avc_parse_nal_units_buf (
    uint8[] buf_in,
    out uint8[] buf_out,
    int[] size
);

[CCode (cname="", cheader_filename="")]
public int ff_isom_write_avcc (
    AVIOContext pb,
    uint8[] data,
    int len
);

[CCode (cname="", cheader_filename="")]
public uint8[] ff_avc_find_startcode (
    uint8[] pointer,
    uint8[] end
);

[CCode (cname="", cheader_filename="")]
public int ff_avc_write_annexb_extradata (
    uint8[] buf_in,
    out uint8[] buf_out,
    int[] size
);

[CCode (cname="", cheader_filename="")]
public uint8[] ff_avc_mp4_find_startcode (
    uint8[] start,
    uint8[] end,
    int nal_length_size
);

[CCode (cname="", cheader_filename="")]
public uint8[] ff_nal_unit_extract_rbsp (
    uint8[] src,
    uint32 src_len,
    out uint32 dst_len,
    int header_len
);

[CCode (cname="struct H264SPS", cheader_filename="")]
public struct H264SPS {
    uint8 id;
    uint8 profile_idc;
    uint8 level_idc;
    uint8 constraint_set_flags;
    uint8 chroma_format_idc;
    uint8 bit_depth_luma;
    uint8 frame_mbs_only_flag;
    LibAVUtil.Rational sar;
}

[CCode (cname="", cheader_filename="")]
public int ff_avc_decode_sps (
    H264SPS sps,
    uint8[] buffer,
    int buf_size
);

} // namespace LibAVFormat
