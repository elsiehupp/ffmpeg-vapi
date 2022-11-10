/***********************************************************
Animated GIF muxer
@copyright 2000 Fabrice Bellard

first version by Francois Revol <revol@free.fr>
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

//  #define OFFSET(x) offsetof(GIFContext, x)
//  #define ENC AV_OPT_FLAG_ENCODING_PARAM
//  static const AVOption options[] = {
//      { "loop", "Number of times to loop the output: -1 - no loop, 0 - infinite loop", OFFSET(loop),
//        AV_OPT_TYPE_INT, { .i64 = 0 }, -1, 65535, ENC },
//      { "final_delay", "Force delay (in centiseconds) after the last frame", OFFSET(last_delay),
//        AV_OPT_TYPE_INT, { .i64 = -1 }, -1, 65535, ENC },
//      { NULL },
//  }

[CCode (cname="gif_muxer_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = "GIF muxer"
    //  .item_name = av_default_item_name,
    //  .version = LIBAVUTIL_VERSION_INT,
    [CCode (cname="options", cheader="")]
    public override AVOption[] option { public get; }
}

[CCode (cname="ff_gif_muxer", cheader="")]
public class GIFOutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "gif"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "CompuServe Graphics Interchange Format (GIF)"
    [CCode (cname="mime_type", cheader="")]
    public override string mime_type {
        public get {
            return ;
        }
    } // = "image/gif"
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return ;
        }
    } // = "gif"
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (GIFContext);
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
            return LibAVCodec.CodecID.GIF;
        }
    }
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = gif_write_header,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = gif_write_packet,
    [CCode (cname="", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    ); // = gif_write_trailer,
    //  .priv_class = gif_muxer_class,
    //  .flags = AVFMT_VARIABLE_FPS,
}
