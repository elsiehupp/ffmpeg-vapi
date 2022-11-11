/***********************************************************
FLI/FLC Animation File Demuxer
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

/***********************************************************
@file FLI/FLC file demuxer
by Mike Melanson (melanson@pcisys.net)
for more information on the .fli/.flc file format and all of its many
variations, visit:
  http://www.compuphase.com/flic.htm

This demuxer handles standard 0xAF11- and 0xAF12-type FLIs. It also handles
special FLIs from the PC games "Magic Carpet" and "X-COM: Terror from the Deep".
***********************************************************/

[CCode (cname="ff_flic_demuxer", cheader="")]
public class InputDemuxer : AVInputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "flic";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "FLI/FLC/FLX animation";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (FlicDemuxContext);
        }
    }
    [CCode (cname="flic_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="flic_read_header", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );
    [CCode (cname="flic_read_packet", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
}
