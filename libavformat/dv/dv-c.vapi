/***********************************************************
@brief General DV demuxer
@copyright 2003 Roman Shaposhnik

Many thanks to Dan Dennedy <dan@dennedy.org> for providing wealth
of DV technical info.

Raw DV format
@copyright 2002 Fabrice Bellard

50 Mbps (DVCPRO50) and 100 Mbps (DVCPRO HD) support
@copyright 2006 Daniel Maas <dmaas@maasdigital.com>
Funded by BBC Research & Development
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

[CCode (cname="struct RawDVContext", cheader_filename="")]
public struct DVDemuxerPrivateData { }

[CCode (cname="ff_dv_demuxer", cheader_filename="")]
public class DVDemuxer : AVInputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "dv";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "DV (Digital Video)";
        }
    }

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (DVDemuxerPrivateData);
        }
    }

    [CCode (cname="dv_probe", cheader_filename="")]
    public override int read_probe (
        AVProbeData format_context
    );

    [CCode (cname="dv_read_header", cheader_filename="")]
    public override int read_header (
        AVFormatContext format_context
    );

    [CCode (cname="dv_read_packet", cheader_filename="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="dv_read_close", cheader_filename="")]
    public override int read_close (
        AVFormatContext format_context
    );

    [CCode (cname="dv_read_seek", cheader_filename="")]
    public override int read_seek (
        AVFormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "dv,dif";
        }
    }
}

} // namespace LibAVFormat
