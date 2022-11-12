/***********************************************************
AIFF/AIFF-C muxer
@copyright 2006  Patrick Guimond
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

//  #define OFFSET(x) offsetof(AIFFOutputContext, x)
//  #define ENC AV_OPT_FLAG_ENCODING_PARAM
//  static const LibAVUtil.Option options[] = {
//      { "write_id3v2", "Enable ID3 tags writing.",
//        OFFSET(write_id3v2), AV_OPT_TYPE_BOOL, {.i64 = 0}, 0, 1, ENC },
//      { "id3v2_version", "Select ID3v2 version to write. Currently 3 and 4 are supported.",
//        OFFSET(id3v2_version), AV_OPT_TYPE_INT, {.i64 = 4}, 3, 4, ENC },
//      { NULL },
//  }

[CCode (cname="aiff_muxer_class", cheader_filename="")]
public class AIFFMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "AIFF muxer";
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
    //  .option = options,
    [CCode (cname="version", cheader_filename="")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;
        }
    }
}

[CCode (cname="struct AIFFOutputContext", cheader_filename="")]
public struct AIFFMuxerPrivateData { }

[CCode (cname="ff_aiff_muxer", cheader_filename="")]
public class AIFFMuxer : AVOutputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "aiff";
        }
    }
    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "Audio IFF";
        }
    }
    [CCode (cname="mime_type", cheader_filename="")]
    public override string mime_type {
        public get {
            return "audio/aiff";
        }
    }
    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "aif,aiff,afc,aifc";
        }
    }
    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (AIFFMuxerPrivateData);
        }
    }
    [CCode (cname="audio_codec", cheader_filename="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.PCM_S16BE;
        }
    }
    [CCode (cname="video_codec", cheader_filename="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.PNG;
        }
    }
    [CCode (cname="aiff_write_header", cheader_filename="")]
    public override int write_header (
        AVFormatContext format_context
    );
    [CCode (cname="aiff_write_packet", cheader_filename="")]
    public override int write_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    [CCode (cname="aiff_write_trailer", cheader_filename="")]
    public override int write_trailer (
        AVFormatContext format_context
    );
    //  .codec_tag = (AVCodecTag[]){ ff_codec_aiff_tags, 0 },
    //  .priv_class = aiff_muxer_class,
}

} // namespace LibAVFormat
