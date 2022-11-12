/***********************************************************
MP3 muxer
@copyright 2003 Fabrice Bellard
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

//  static const LibAVUtil.Option options[] = {
//      { "id3v2_version", "Select ID3v2 version to write. Currently 3 and 4 are supported.",
//        offsetof(MP3Context, id3v2_version), AV_OPT_TYPE_INT, {.i64 = 4}, 0, 4, AV_OPT_FLAG_ENCODING_PARAM},
//      { "write_id3v1", "Enable ID3v1 writing. ID3v1 tags are written in UTF-8 which may not be supported by most software.",
//        offsetof(MP3Context, write_id3v1), AV_OPT_TYPE_BOOL, {.i64 = 0}, 0, 1, AV_OPT_FLAG_ENCODING_PARAM},
//      { "write_xing",  "Write the Xing header containing file duration.",
//        offsetof(MP3Context, write_xing),  AV_OPT_TYPE_BOOL, {.i64 = 1}, 0, 1, AV_OPT_FLAG_ENCODING_PARAM},
//      { NULL },
//  }

[CCode (cname="mp3_muxer_class", cheader_filename="")]
public class MP3MuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "MP3 muxer";
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

[CCode (cname="struct MP3Context", cheader_filename="")]
public struct MP3MuxerPrivateData { }

[CCode (cname="ff_mp3_muxer", cheader_filename="")]
public class MP3Muxer : AVOutputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "mp3";
        }
    }
    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "MP3 (MPEG audio layer 3)";
        }
    }
    [CCode (cname="mime_type", cheader_filename="")]
    public override string mime_type {
        public get {
            return "audio/mpeg";
        }
    }
    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "mp3";
        }
    }
    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MP3MuxerPrivateData);
        }
    }
    [CCode (cname="audio_codec", cheader_filename="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.MP3;
        }
    }
    [CCode (cname="video_codec", cheader_filename="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.PNG;
        }
    }
    [CCode (cname="mp3_write_header", cheader_filename="")]
    public override int write_header (
        AVFormatContext format_context
    );
    [CCode (cname="mp3_write_packet", cheader_filename="")]
    public override int write_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    [CCode (cname="mp3_write_trailer", cheader_filename="")]
    public override int write_trailer (
        AVFormatContext format_context
    );
    [CCode (cname="query_codec", cheader_filename="")]
    public override int query_codec (
        LibAVCodec.CodecID id,
        int std_compliance
    );
    [CCode (cname="flags", cheader_filename="")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_NOTIMESTAMPS;
        }
    }
    //  .priv_class = mp3_muxer_class,
}

} // namespace LibAVFormat
