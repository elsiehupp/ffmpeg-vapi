/***********************************************************
Sony Playstation (PSX) STR File Demuxer
@copyright 2003 The FFmpeg project
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

/***********************************************************
@file PSX STR file demuxer
by Mike Melanson (melanson@pcisys.net)
This module handles streams that have been ripped from Sony Playstation
CD games. This demuxer can handle either raw STR files (which are just
concatenations of raw compact disc sectors) or STR files with 0x2C-byte
RIFF headers, followed by CD sectors.
***********************************************************/

[CCode (cname="ff_str_demuxer", cheader="")]
public class STRDemuxer : AVInputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "psxstr";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "Sony Playstation STR";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (StrDemuxContext);
        }
    }
    [CCode (cname="str_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="str_read_header", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );
    [CCode (cname="str_read_packet", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    [CCode (cname="str_read_close", cheader="")]
    public override int read_close (
        AVFormatContext format_context
    );
    [CCode (cname="flags", cheader="")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_NO_BYTE_SEEK;
        }
    }
}

} // namespace LibAVFormat
