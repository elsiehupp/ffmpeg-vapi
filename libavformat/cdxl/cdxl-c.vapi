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
CDXL demuxer
@copyright 2011-2012 Paul B Mahol
***********************************************************/
//  #define OFFSET(x) offsetof(CDXLDemuxContext, x)
//  static const LibAVUtil.Option cdxl_options[] = {
//      { "sample_rate", "", OFFSET(sample_rate), AV_OPT_TYPE_INT,    { .i64 = 11025 }, 1, INT_MAX, AV_OPT_FLAG_DECODING_PARAM },
//      { "framerate",   "", OFFSET(framerate),   AV_OPT_TYPE_STRING, { .str = NULL },  0, 0,       AV_OPT_FLAG_DECODING_PARAM },
//      { NULL },
//  }

[CCode (cname="cdxl_demuxer_class", cheader="")]
public class CDXLDemuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "CDXL demuxer";
        }
    }
    [CCode (cname="item_name", cheader="")]
    public override string item_name (
        void *class_context
    ) {
        return av_default_item_name (
            class_context
        );
    }
    //  .option = cdxl_options,
    [CCode (cname="version", cheader="")]
    public override int version {
        public get {
            return LIBAVUTIL_VERSION_INT;
        }
    }
}

[CCode (cname="ff_cdxl_demuxer", cheader="")]
public class CDXLDemuxer : AVInputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "cdxl";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "Commodore CDXL video";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (CDXLDemuxContext);
        }
    }
    [CCode (cname="cdxl_read_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="cdxl_read_header", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );
    [CCode (cname="cdxl_read_packet", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return "cdxl,xl";
        }
    }
    [CCode (cname="flags", cheader="")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_GENERIC_INDEX;
        }
    }
    //  .priv_class = cdxl_demuxer_class,
}

} // namespace LibAVFormat
