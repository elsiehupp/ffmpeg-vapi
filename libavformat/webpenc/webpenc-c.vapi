/***********************************************************
webp muxer
@copyright 2014 Michael Niedermayer
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

//  #define OFFSET(x) offsetof(WebpContext, x)
//  #define ENC AV_OPT_FLAG_ENCODING_PARAM
//  static const LibAVUtil.Option options[] = {
//      { "loop", "Number of times to loop the output: 0 - infinite loop", OFFSET(loop),
//        AV_OPT_TYPE_INT, { .i64 = 1 }, 0, 65535, ENC },
//      { NULL },
//  }

[CCode (cname="webp_muxer_class", cheader="")]
public class WebPMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "WebP muxer";
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
    [CCode (cname="version", cheader="")]
    public override int version {
        public get {
            return LIBAVUTIL_VERSION_INT;
        }
    }
    [CCode (cname="options", cheader="")]
    public override LibAVUtil.Option[] option { public get; }
}

[CCode (cname="ff_webp_muxer", cheader="")]
public class WebPMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "webp";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "WebP";
        }
    }
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return "webp";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (WebpContext);
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.WEBP;
        }
    }
    [CCode (cname="webp_write_header", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );
    [CCode (cname="webp_write_packet", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );
    [CCode (cname="webp_write_trailer", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    );
    //  .priv_class = webp_muxer_class,
    [CCode (cname="flags", cheader="")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_VARIABLE_FPS;
        }
    }
}

} // namespace LibAVFormat
