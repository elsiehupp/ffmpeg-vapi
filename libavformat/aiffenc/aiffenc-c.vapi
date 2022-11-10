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

//  #define OFFSET(x) offsetof(AIFFOutputContext, x)
//  #define ENC AV_OPT_FLAG_ENCODING_PARAM
//  static const AVOption options[] = {
//      { "write_id3v2", "Enable ID3 tags writing."
//        OFFSET(write_id3v2), AV_OPT_TYPE_BOOL, {.i64 = 0}, 0, 1, ENC },
//      { "id3v2_version", "Select ID3v2 version to write. Currently 3 and 4 are supported."
//        OFFSET(id3v2_version), AV_OPT_TYPE_INT, {.i64 = 4}, 3, 4, ENC },
//      { NULL },
//  }

[CCode (cname="aiff_muxer_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "AIFF muxer";
        }
    }
    //  .item_name = av_default_item_name,
    //  .option = options,
    //  .version = LIBAVUTIL_VERSION_INT,
}

[CCode (cname="ff_aiff_muxer", cheader="")]
public class AiffOutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "aiff";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "Audio IFF";
        }
    }
    [CCode (cname="mime_type", cheader="")]
    public override string mime_type {
        public get {
            return "audio/aiff";
        }
    }
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return "aif,aiff,afc,aifc";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (AIFFOutputContext);
        }
    }
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.PCM_S16BE;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.PNG;
        }
    }
    [CCode (cname="aiff_write_header", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );
    [CCode (cname="aiff_write_packet", cheader="")]
    public abstract int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );
    [CCode (cname="aiff_write_trailer", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    );
    //  .codec_tag = (const AVCodecTag* const []){ ff_codec_aiff_tags, 0 },
    //  .priv_class = aiff_muxer_class,
}
