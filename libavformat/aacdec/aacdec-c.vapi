/***********************************************************
raw ADTS AAC demuxer
@copyright 2008 Michael Niedermayer <michaelni@gmx.at>
@copyright 2009 Robert Swain ( rob opendot cl )
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

[CCode (cname="ff_aac_demuxer", cheader="")]
public class AACDemuxer : AVInputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "aac";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "raw ADTS AAC (Advanced Audio Coding)";
        }
    }
    [CCode (cname="adts_aac_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="adts_aac_read_header", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );
    [CCode (cname="adts_aac_read_packet", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    [CCode (cname="flags", cheader="")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_GENERIC_INDEX;
        }
    }
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return "aac";
        }
    }
    [CCode (cname="mime_type", cheader="")]
    public override string mime_type {
        public get {
            return "audio/aac,audio/aacp,audio/x-aac";
        }
    }
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.AAC;
        }
    }
}

} // namespace LibAVFormat
