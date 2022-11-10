/***********************************************************
Live HDS fragmenter
@copyright 2013 Martin Storsjo
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

//  #define OFFSET(x) offsetof(HDSContext, x)
//  #define E AV_OPT_FLAG_ENCODING_PARAM
//  static const AVOption options[] = {
//      { "window_size", "number of fragments kept in the manifest", OFFSET(window_size), AV_OPT_TYPE_INT, { .i64 = 0 }, 0, INT_MAX, E },
//      { "extra_window_size", "number of fragments kept outside of the manifest before removing from disk", OFFSET(extra_window_size), AV_OPT_TYPE_INT, { .i64 = 5 }, 0, INT_MAX, E },
//      { "min_frag_duration", "minimum fragment duration (in microseconds)", OFFSET(min_frag_duration), AV_OPT_TYPE_INT64, { .i64 = 10000000 }, 0, INT_MAX, E },
//      { "remove_at_exit", "remove all fragments when finished", OFFSET(remove_at_exit), AV_OPT_TYPE_BOOL, { .i64 = 0 }, 0, 1, E },
//      { NULL },
//  }

[CCode (cname="hds_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = "HDS muxer"
    //  .item_name = av_default_item_name,
    [CCode (cname="options", cheader="")]
    public override AVOption[] option { public get; }
    //  .version = LIBAVUTIL_VERSION_INT,
}

[CCode (cname="ff_hds_muxer", cheader="")]
public class HDSOutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "hds"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "HDS Muxer"
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (HDSContext);
        }
    }
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.AAC;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.H264;
        }
    }
    //  .flags = AVFMT_GLOBALHEADER | AVFMT_NOFILE,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = hds_write_header,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = hds_write_packet,
    [CCode (cname="", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    ); // = hds_write_trailer,
    //  .priv_class = hds_class,
}
