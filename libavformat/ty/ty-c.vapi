/***********************************************************
TiVo ty stream demuxer
@copyright 2005 VLC authors and VideoLAN
@copyright 2005 by Neal Symms (tivo@freakinzoo.com) - February 2005
based on code by Christopher Wingert for tivo-mplayer
tivo(at)wingert.org, February 2003
@copyright 2017 Paul B Mahol
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

[CCode (cname="ff_ty_demuxer", cheader="")]
public class TYDemuxer : AVInputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "ty";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "TiVo TY Stream";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (TYDemuxContext);
        }
    }
    [CCode (cname="ty_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="ty_read_header", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );
    [CCode (cname="ty_read_packet", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    [CCode (cname="ty_read_close", cheader="")]
    public override int read_close (
        AVFormatContext format_context
    );
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return "ty,ty+";
        }
    }
    [CCode (cname="flags", cheader="")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_TS_DISCONT;
        }
    }
}

} // namespace LibAVFormat
