/***********************************************************
VAG demuxer
@copyright 2015 Paul B Mahol
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

[CCode (cname="ff_vag_demuxer", cheader="")]
public class VAGDemuxer : AVInputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "vag";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "Sony PS2 VAG";
        }
    }
    [CCode (cname="vag_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="vag_read_header", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );
    [CCode (cname="vag_read_packet", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return "vag";
        }
    }
}

} // namespace LibAVFormat
