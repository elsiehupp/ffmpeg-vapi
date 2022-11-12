/***********************************************************
Electronic Arts .cdata file Demuxer
@copyright 2007 Peter Ross
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
@file Electronic Arts cdata Format Demuxer
by Peter Ross (pross@xvid.org)

Technical details here:
http://wiki.multimedia.cx/index.php?title=EA_Command_And_Conquer_3_Audio_Codec
***********************************************************/

[CCode (cname="struct CdataDemuxContext", cheader_filename="")]
public struct EACTDATADemuxerPrivateData { }

[CCode (cname="ff_ea_cdata_demuxer", cheader_filename="")]
public class EACTDATADemuxer : AVInputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "ea_cdata";
        }
    }
    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "Electronic Arts cdata";
        }
    }
    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (EACTDATADemuxerPrivateData);
        }
    }
    [CCode (cname="cdata_probe", cheader_filename="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="cdata_read_header", cheader_filename="")]
    public override int read_header (
        AVFormatContext format_context
    );
    [CCode (cname="cdata_read_packet", cheader_filename="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "cdata";
        }
    }
}

} // namespace LibAVFormat
