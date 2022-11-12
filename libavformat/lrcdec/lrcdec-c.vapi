/***********************************************************
LRC lyrics file format decoder
@copyright 2014 StarBrilliant <m13253@hotmail.com>
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

[CCode (cname="struct LRCContext", cheader_filename="")]
public struct LRCDemuxerPrivateData { }

[CCode (cname="ff_lrc_demuxer", cheader_filename="")]
public class LRCDemuxer : AVInputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "lrc";
        }
    }
    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "LRC lyrics";
        }
    }
    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (LRCDemuxerPrivateData);
        }
    }
    [CCode (cname="lrc_probe", cheader_filename="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="lrc_read_header", cheader_filename="")]
    public override int read_header (
        AVFormatContext format_context
    );
    [CCode (cname="lrc_read_packet", cheader_filename="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    [CCode (cname="lrc_read_close", cheader_filename="")]
    public override int read_close (
        AVFormatContext format_context
    );
    [CCode (cname="lrc_read_seek", cheader_filename="")]
    public override int read_seek2 (
        AVFormatContext format_context,
        int stream_index,
        int64 min_ts,
        int64 ts,
        int64 max_ts,
        int flags
    );
}

} // namespace LibAVFormat
