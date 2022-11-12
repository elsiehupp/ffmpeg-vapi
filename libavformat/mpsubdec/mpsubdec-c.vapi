/***********************************************************
@copyright 2012 Clément Bœsch
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
@file MPlayer subtitles format demuxer
***********************************************************/

[CCode (cname="struct MPSubContext", cheader_filename="")]
public struct MPSubDemuxerPrivateData { }

[CCode (cname="ff_mpsub_demuxer", cheader_filename="")]
public class MPSubDemuxer : AVInputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "mpsub";
        }
    }
    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "MPlayer subtitles";
        }
    }
    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MPSubDemuxerPrivateData);
        }
    }
    [CCode (cname="mpsub_probe", cheader_filename="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="mpsub_read_header", cheader_filename="")]
    public override int read_header (
        AVFormatContext format_context
    );
    [CCode (cname="mpsub_read_packet", cheader_filename="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    [CCode (cname="mpsub_read_seek", cheader_filename="")]
    public override int read_seek2 (
        AVFormatContext format_context,
        int stream_index,
        int64 min_ts,
        int64 ts,
        int64 max_ts,
        int flags
    );
    [CCode (cname="mpsub_read_close", cheader_filename="")]
    public override int read_close (
        AVFormatContext format_context
    );
    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "sub";
        }
    }
}

} // namespace LibAVFormat
