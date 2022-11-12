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

namespace LibAVFormat {

//  #define OFFSET(x) offsetof(AVIContext, x)
//  #define ENC AV_OPT_FLAG_ENCODING_PARAM
//  static const LibAVUtil.Option options[] = {
//      { "reserve_index_space", "reserve space (in bytes) at the beginning of the file for each stream index", OFFSET(reserve_index_space), AV_OPT_TYPE_INT, { .i64 = 0 }, 0, INT_MAX, ENC },
//      { "write_channel_mask", "write channel mask into wave format header", OFFSET(write_channel_mask), AV_OPT_TYPE_BOOL, { .i64 = 1 }, 0, 1, ENC },
//      { NULL },
//  }

[CCode (cname="avi_muxer_class", cheader_filename="")]
public class AVIMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "AVI muxer";
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
}

[CCode (cname="struct AVIContext", cheader_filename="")]
public struct AVIMuxerPrivateData { }

[CCode (cname="ff_avi_muxer", cheader_filename="")]
public class AVIMuxer : AVOutputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "avi";
        }
    }
    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "AVI (Audio Video Interleaved)";
        }
    }
    [CCode (cname="mime_type", cheader_filename="")]
    public override string mime_type {
        public get {
            return "video/x-msvideo";
        }
    }
    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "avi";
        }
    }
    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (AVIMuxerPrivateData);
        }
    }
    [CCode (cname="audio_codec", cheader_filename="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
        #if CONFIG_LIBMP3LAME
            return LibAVCodec.CodecID.MP3;
        #else
            return LibAVCodec.CodecID.AC3;
        #endif
        }
    }
    [CCode (cname="video_codec", cheader_filename="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.MPEG4;
        }
    }
    [CCode (cname="avi_init", cheader_filename="")]
    public override int init (
        AVFormatContext format_context
    );
    [CCode (cname="avi_write_header", cheader_filename="")]
    public override int write_header (
        AVFormatContext format_context
    );
    [CCode (cname="avi_write_packet", cheader_filename="")]
    public override int write_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    [CCode (cname="avi_write_trailer", cheader_filename="")]
    public override int write_trailer (
        AVFormatContext format_context
    );
    //  .codec_tag = (AVCodecTag[]) {
    //      ff_codec_bmp_tags, ff_codec_wav_tags, 0
    //  },
    //  .priv_class = avi_muxer_class,
}

} // namespace LibAVFormat
