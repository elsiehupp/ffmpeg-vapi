/***********************************************************
SER demuxer
@copyright 2018 Paul B Mahol
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

//  #define OFFSET(x) offsetof(SERDemuxerContext, x)
//  #define DEC AV_OPT_FLAG_DECODING_PARAM
//  static const AVOption ser_options[] = {
//      { "framerate", "set frame rate", OFFSET(framerate), AV_OPT_TYPE_VIDEO_RATE, {.str = "25"}, 0, INT_MAX, DEC },
//      { NULL },
//  }

[CCode (cname="ser_demuxer_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = "ser demuxer"
    //  .item_name = av_default_item_name,
    //  .option = ser_options,
    //  .version = LIBAVUTIL_VERSION_INT,
}

[CCode (cname="ff_ser_demuxer", cheader="")]
public class InputDemuxer : AVInputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "ser"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "SER (Simple uncompressed video format for astronomical capturing)"
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (SERDemuxerContext);
        }
    }
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    ); // = ser_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    ); // = ser_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    ); // = ser_read_packet,
    //  .flags = AVFMT_GENERIC_INDEX,
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return ;
        }
    } // = "ser"
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.RAWVIDEO;
        }
    }
    //  .priv_class = ser_demuxer_class,
}
