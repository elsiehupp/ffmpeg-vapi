/***********************************************************
@brief RAW Ingenient MJPEG demuxer
@copyright 2005 Alex Beregszaszi
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

//  FF_RAWVIDEO_DEMUXER_CLASS (ingenient)

[CCode (cname="ff_ingenient_demuxer", cheader_filename="")]
public class IngenientDemuxer : AVInputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "ingenient";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "raw Ingenient MJPEG";
        }
    }

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (FFRawVideoDemuxerContext);
        }
    }

    [CCode (cname="ingenient_probe", cheader_filename="")]
    public override int read_probe (
        AVProbeData format_context
    );

    [CCode (cname="ff_raw_video_read_header", cheader_filename="")]
    public override int read_header (
        AVFormatContext format_context
    );

    [CCode (cname="ingenient_read_packet", cheader_filename="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="flags", cheader_filename="")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_GENERIC_INDEX;
        }
    }

    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "cgi"; // FIXME
        }
    }

    [CCode (cname="raw_codec_id", cheader_filename="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.MJPEG;
        }
    }
    //  .priv_class = ingenient_demuxer_class,
}

} // namespace LibAVFormat
