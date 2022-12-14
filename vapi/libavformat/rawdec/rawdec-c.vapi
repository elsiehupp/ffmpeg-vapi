/***********************************************************
@brief RAW demuxers
@copyright 2001 Fabrice Bellard
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

//  #define OFFSET (x) offsetof (FFRawVideoDemuxerContext, x)
//  #define DEC AV_OPT_FLAG_DECODING_PARAM
//  const LibAVUtil.Option ff_rawvideo_options[] = {
//      { "framerate", "", OFFSET (framerate), AV_OPT_TYPE_VIDEO_RATE, {.str = "25"}, 0, INT_MAX, DEC},
//      { "raw_packet_size", "", OFFSET (raw_packet_size), AV_OPT_TYPE_INT, {.i64 = RAW_PACKET_SIZE }, 1, INT_MAX, DEC},
//      { NULL },
//  }
//  #undef OFFSET
//  #define OFFSET (x) offsetof (FFRawDemuxerContext, x)
//  const LibAVUtil.Option ff_raw_options[] = {
//      { "raw_packet_size", "", OFFSET (raw_packet_size), AV_OPT_TYPE_INT, {.i64 = RAW_PACKET_SIZE }, 1, INT_MAX, DEC},
//      { NULL },
//  }

#if CONFIG_DATA_DEMUXER
//  FF_RAW_DEMUXER_CLASS (raw_data)

[CCode (cname="ff_data_demuxer", cheader_filename="")]
public class DataDemuxer : AVInputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "data";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "raw data";
        }
    }

    [CCode (cname="ff_raw_data_read_header", cheader_filename="")]
    public override int read_header (
        AVFormatContext format_context
    );

    [CCode (cname="ff_raw_read_partial_packet", cheader_filename="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="raw_codec_id", cheader_filename="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.NONE;
        }
    }

    [CCode (cname="flags", cheader_filename="")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_NOTIMESTAMPS;
        }
    }

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (FFRawDemuxerContext);
        }
    }
    //  .priv_class = raw_data_demuxer_class,
}
#endif

} // namespace LibAVFormat
