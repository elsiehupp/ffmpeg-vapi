/***********************************************************
nut muxer
@copyright 2004-2007 Michael Niedermayer
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

//  #define OFFSET(x) offsetof(NUTContext, x)
//  #define E AV_OPT_FLAG_ENCODING_PARAM
//  static const LibAVUtil.Option options[] = {
//      { "syncpoints",  "NUT syncpoint behaviour",                         OFFSET(flags), AV_OPT_TYPE_FLAGS, {.i64 = 0},             INT_MIN, INT_MAX, E, "syncpoints" },
//      { "default",     "",                                                0,             AV_OPT_TYPE_CONST, {.i64 = 0},             INT_MIN, INT_MAX, E, "syncpoints" },
//      { "none",        "Disable syncpoints, low overhead and unseekable", 0,             AV_OPT_TYPE_CONST, {.i64 = NUT_PIPE},      INT_MIN, INT_MAX, E, "syncpoints" },
//      { "timestamped", "Extend syncpoints with a wallclock timestamp",    0,             AV_OPT_TYPE_CONST, {.i64 = NUT_BROADCAST}, INT_MIN, INT_MAX, E, "syncpoints" },
//      { "write_index", "Write index",                               OFFSET(write_index), AV_OPT_TYPE_BOOL,  {.i64 = 1},                   0,       1, E, },
//      { NULL },
//  }

[CCode (cname="class", cheader="")]
public class NUTMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "nutenc";
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
    public override LibAVUtil.Option[] option { public get; }
    [CCode (cname="version", cheader="")]
    public override int version {
        public get {
            return LIBAVUTIL_VERSION_INT;
        }
    }
}

[CCode (cname="ff_nut_muxer", cheader="")]
public class NUTMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "nut";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "NUT";
        }
    }
    [CCode (cname="mime_type", cheader="")]
    public override string mime_type {
        public get {
            return "video/x-nut";
        }
    }
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return "nut";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (NUTContext);
        }
    }
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return CONFIG_LIBVORBIS ? LibAVCodec.CodecID.VORBIS : CONFIG_LIBMP3LAME ? LibAVCodec.CodecID.MP3 : LibAVCodec.CodecID.MP2;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.MPEG4;
        }
    }
    [CCode (cname="nut_write_header", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );
    [CCode (cname="nut_write_packet", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );
    [CCode (cname="nut_write_trailer", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    );
    [CCode (cname="nut_write_deinit", cheader="")]
    public override void deinit (
        AVFormatContext format_context
    );
    [CCode (cname="flags", cheader="")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_GLOBALHEADER | AVFMT_VARIABLE_FPS;
        }
    }
    //  .codec_tag = ff_nut_codec_tags,
    //  .priv_class = class,
}

} // namespace LibAVFormat
