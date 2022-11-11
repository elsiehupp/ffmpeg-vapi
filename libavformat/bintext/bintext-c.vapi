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
/***********************************************************
Binary text demuxer
eXtended BINary text (XBIN) demuxer
Artworx Data Format demuxer
iCEDraw File demuxer
@copyright 2010 Peter Ross <pross@xvid.org>
***********************************************************/
/***********************************************************
@file Binary text demuxer
eXtended BINary text (XBIN) demuxer
Artworx Data Format demuxer
iCEDraw File demuxer
***********************************************************/

//  #define OFFSET(x) offsetof(BinDemuxContext, x)
//  static const AVOption options[] = {
//      { "linespeed", "set simulated line speed (bytes per second)", OFFSET(chars_per_frame), AV_OPT_TYPE_INT, {.i64 = 6000}, 1, INT_MAX, AV_OPT_FLAG_DECODING_PARAM},
//      { "video_size", "set video size, such as 640x480 or hd720.", OFFSET(width), AV_OPT_TYPE_IMAGE_SIZE, {.str = NULL}, 0, 0, AV_OPT_FLAG_DECODING_PARAM },
//      { "framerate", "set framerate (frames per second)", OFFSET(framerate), AV_OPT_TYPE_VIDEO_RATE, {.str = "25"}, 0, INT_MAX, AV_OPT_FLAG_DECODING_PARAM },
//      { NULL },
//  }

#define CLASS(name)
(const AVClass[1]){{
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return name;
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
    //  .option = options,
    [CCode (cname="version", cheader="")]
    public override int version {
        public get {
            return LIBAVUTIL_VERSION_INT;
        }
    }
}}

#if CONFIG_BINTEXT_DEMUXER
[CCode (cname="ff_bintext_demuxer", cheader="")]
public class InputDemuxer : AVInputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "bin";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "Binary text";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (BinDemuxContext);
        }
    }
    [CCode (cname="bin_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="bintext_read_header", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );
    [CCode (cname="read_packet", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    //  .priv_class = CLASS("Binary text demuxer"
}
#endif

#if CONFIG_XBIN_DEMUXER
[CCode (cname="ff_xbin_demuxer", cheader="")]
public class InputDemuxer : AVInputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "xbin";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "eXtended BINary text (XBIN)";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (BinDemuxContext);
        }
    }
    [CCode (cname="xbin_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="xbin_read_header", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );
    [CCode (cname="read_packet", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    //  .priv_class = CLASS("eXtended BINary text (XBIN) demuxer"
}
#endif

#if CONFIG_ADF_DEMUXER
[CCode (cname="ff_adf_demuxer", cheader="")]
public class InputDemuxer : AVInputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "adf";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "Artworx Data Format";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (BinDemuxContext);
        }
    }
    [CCode (cname="adf_read_header", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );
    [CCode (cname="read_packet", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return "adf"
        }
    }
    //  .priv_class = CLASS("Artworx Data Format demuxer"
}
#endif

#if CONFIG_IDF_DEMUXER
[CCode (cname="ff_idf_demuxer", cheader="")]
public class InputDemuxer : AVInputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "idf";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "iCE Draw File";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (BinDemuxContext);
        }
    }
    [CCode (cname="idf_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="idf_read_header", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );
    [CCode (cname="read_packet", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return "idf"
        }
    }
    //  .priv_class = CLASS("iCE Draw File demuxer"
}
#endif
