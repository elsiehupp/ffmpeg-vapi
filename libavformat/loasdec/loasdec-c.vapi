/***********************************************************
LOAS AudioSyncStream demuxer
@copyright 2008 Michael Niedermayer <michaelni@gmx.at>
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

FF_RAW_DEMUXER_CLASS(loas)
[CCode (cname="ff_loas_demuxer", cheader="")]
public class InputDemuxer : AVInputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "loas"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "LOAS AudioSyncStream"
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    ); // = loas_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    ); // = loas_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    ); // = ff_raw_read_partial_packet,
    //  .flags= AVFMT_GENERIC_INDEX,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.AAC_LATM;
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (FFRawDemuxerContext);
        }
    }
    //  .priv_class = loas_demuxer_class,
}
