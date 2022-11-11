/***********************************************************
AVI muxer
@copyright 2000 Fabrice Bellard
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

//  #define OFFSET(x) offsetof(AVIContext, x)
//  #define ENC AV_OPT_FLAG_ENCODING_PARAM
//  static const AVOption options[] = {
//      { "reserve_index_space", "reserve space (in bytes) at the beginning of the file for each stream index", OFFSET(reserve_index_space), AV_OPT_TYPE_INT, { .i64 = 0 }, 0, INT_MAX, ENC },
//      { "write_channel_mask", "write channel mask into wave format header", OFFSET(write_channel_mask), AV_OPT_TYPE_BOOL, { .i64 = 1 }, 0, 1, ENC },
//      { NULL },
//  }

[CCode (cname="avi_muxer_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "AVI muxer";
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
    [CCode (cname="options", cheader="")]
    public override AVOption[] option { public get; }
    [CCode (cname="version", cheader="")]
    public override int version {
        public get {
            return LIBAVUTIL_VERSION_INT;
        }
    }
}

[CCode (cname="ff_avi_muxer", cheader="")]
public class AVIOutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "avi";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "AVI (Audio Video Interleaved)";
        }
    }
    [CCode (cname="mime_type", cheader="")]
    public override string mime_type {
        public get {
            return "video/x-msvideo";
        }
    }
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return "avi";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (AVIContext);
        }
    }
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return CONFIG_LIBMP3LAME ? LibAVCodec.CodecID.MP3 : LibAVCodec.CodecID.AC3;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.MPEG4;
        }
    }
    [CCode (cname="avi_init", cheader="")]
    public override int init (
        AVFormatContext format_context
    );
    [CCode (cname="avi_write_header", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );
    [CCode (cname="avi_write_packet", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );
    [CCode (cname="avi_write_trailer", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    );
    //  .codec_tag = (AVCodecTag[]) {
    //      ff_codec_bmp_tags, ff_codec_wav_tags, 0
    //  },
    //  .priv_class = avi_muxer_class,
}
