/***********************************************************
Magic Lantern Video (MLV) demuxer
@copyright 2014 Peter Ross
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
@file Magic Lantern Video (MLV) demuxer
***********************************************************/

[CCode (cname="ff_mlv_demuxer", cheader="")]
public class MLVDemuxer : AVInputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "mlv";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "Magic Lantern Video (MLV)";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MlvContext);
        }
    }
    [CCode (cname="probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="read_header", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );
    [CCode (cname="read_packet", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    [CCode (cname="read_close", cheader="")]
    public override int read_close (
        AVFormatContext format_context
    );
    [CCode (cname="read_seek", cheader="")]
    public override int read_seek (
        AVFormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );
}

} // namespace LibAVFormat
