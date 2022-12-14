/***********************************************************
@brief Sierra VMD Format Demuxer
@copyright 2004 The FFmpeg project
***********************************************************/
/***********************************************************
@brief This file is part of FFmpeg.

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
@file Sierra VMD file demuxer
by Vladimir "VAG" Gneushev (vagsoft at mail.ru)
for more information on the Sierra VMD file format, visit:
    http://www.pcisys.net/~melanson/codecs/
***********************************************************/

[CCode (cname="struct VmdDemuxContext", cheader_filename="")]
public struct VMDDemuxerPrivateData { }

[CCode (cname="ff_vmd_demuxer", cheader_filename="")]
public class VMDDemuxer : AVInputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "vmd";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "Sierra VMD";
        }
    }

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VMDDemuxerPrivateData);
        }
    }

    [CCode (cname="vmd_probe", cheader_filename="")]
    public override int read_probe (
        AVProbeData format_context
    );

    [CCode (cname="vmd_read_header", cheader_filename="")]
    public override int read_header (
        AVFormatContext format_context
    );

    [CCode (cname="vmd_read_packet", cheader_filename="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="vmd_read_close", cheader_filename="")]
    public override int read_close (
        AVFormatContext format_context
    );
}

} // namespace LibAVFormat
