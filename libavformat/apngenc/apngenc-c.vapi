/***********************************************************
APNG muxer
@copyright 2015 Donny Yang

first version by Donny Yang <work@kota.moe>
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

//  #define OFFSET(x) offsetof(APNGMuxContext, x)
//  #define ENC AV_OPT_FLAG_ENCODING_PARAM
//  static const AVOption options[] = {
//      { "plays", "Number of times to play the output: 0 - infinite loop, 1 - no loop", OFFSET(plays),
//        AV_OPT_TYPE_INT, { .i64 = 1 }, 0, UINT_MAX, ENC },
//      { "final_delay", "Force delay after the last frame", OFFSET(last_delay),
//        AV_OPT_TYPE_RATIONAL, { .dbl = 0 }, 0, USHRT_MAX, ENC },
//      { NULL },
//  }

[CCode (cname="apng_muxer_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "APNG muxer";
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
    public override AVOption[] option { public get; }
}

[CCode (cname="ff_apng_muxer", cheader="")]
public class APNGOutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "apng";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "Animated Portable Network Graphics";
        }
    }
    [CCode (cname="mime_type", cheader="")]
    public override string mime_type {
        public get {
            return "image/png";
        }
    }
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return "apng";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (APNGMuxContext);
        }
    }
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.NONE;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.APNG;
        }
    }
    [CCode (cname="apng_write_header", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );
    [CCode (cname="apng_write_packet", cheader="")]
    public abstract int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );
    [CCode (cname="apng_write_trailer", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    );
    [CCode (cname="apng_deinit", cheader="")]
    public override void deinit (
        AVFormatContext format_context
    );
    //  .priv_class = apng_muxer_class,
    //  .flags = AVFMT_VARIABLE_FPS,
}
