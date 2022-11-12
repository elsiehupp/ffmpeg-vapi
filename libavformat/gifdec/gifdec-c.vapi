/***********************************************************
GIF demuxer
@copyright 2012 Vitaliy E Sugrobov
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
@file GIF demuxer.
***********************************************************/

//  static const LibAVUtil.Option options[] = {
//      { "min_delay"    , "minimum valid delay between frames (in hundredths of second)", offsetof(GIFDemuxContext, min_delay)    , AV_OPT_TYPE_INT, {.i64 = GIF_MIN_DELAY}    , 0, 100 * 60, AV_OPT_FLAG_DECODING_PARAM },
//      { "max_gif_delay", "maximum valid delay between frames (in hundredths of seconds)", offsetof(GIFDemuxContext, max_delay)   , AV_OPT_TYPE_INT, {.i64 = 65535}            , 0, 65535   , AV_OPT_FLAG_DECODING_PARAM },
//      { "default_delay", "default delay between frames (in hundredths of second)"      , offsetof(GIFDemuxContext, default_delay), AV_OPT_TYPE_INT, {.i64 = GIF_DEFAULT_DELAY}, 0, 100 * 60, AV_OPT_FLAG_DECODING_PARAM },
//      { "ignore_loop"  , "ignore loop setting (netscape extension)"                    , offsetof(GIFDemuxContext, ignore_loop)  , AV_OPT_TYPE_BOOL,{.i64 = 1}                , 0,        1, AV_OPT_FLAG_DECODING_PARAM },
//      { NULL },
//  }

[CCode (cname="demuxer_class", cheader_filename="")]
public class GIFDemuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "GIF demuxer";
        }
    }
    [CCode (cname="item_name", cheader_filename="")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }
    [CCode (cname="options", cheader_filename="")]
    public override LibAVUtil.Option[] option { public get; }
    [CCode (cname="version", cheader_filename="")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;
        }
    }
    //  .category = AV_CLASS_CATEGORY_DEMUXER,
}

[CCode (cname="struct GIFDemuxContext", cheader_filename="")]
public struct GIFDemuxerPrivateData { }

[CCode (cname="ff_gif_demuxer", cheader_filename="")]
public class GIFDemuxer : AVInputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "gif";
        }
    }
    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "CompuServe Graphics Interchange Format (GIF)";
        }
    }
    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (GIFDemuxerPrivateData);
        }
    }
    [CCode (cname="gif_probe", cheader_filename="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="gif_read_header", cheader_filename="")]
    public override int read_header (
        AVFormatContext format_context
    );
    [CCode (cname="gif_read_packet", cheader_filename="")]
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
    //  .priv_class = demuxer_class,
}

} // namespace LibAVFormat
