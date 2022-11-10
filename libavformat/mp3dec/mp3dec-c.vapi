/***********************************************************
MP3 demuxer
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

//  static const AVOption options[] = {
//      { "usetoc", "use table of contents", offsetof(MP3DecContext, usetoc), AV_OPT_TYPE_BOOL, {.i64 = 0}, 0, 1, AV_OPT_FLAG_DECODING_PARAM},
//      { NULL },
//  }

[CCode (cname="demuxer_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = "mp3"
    //  .item_name = av_default_item_name,
    [CCode (cname="options", cheader="")]
    public override AVOption[] option { public get; }
    //  .version = LIBAVUTIL_VERSION_INT,
    //  .category = AV_CLASS_CATEGORY_DEMUXER,
}

[CCode (cname="ff_mp3_demuxer", cheader="")]
public class InputDemuxer : AVInputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "mp3"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "MP2/3 (MPEG audio layer 2/3)"
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    ); // = mp3_read_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    ); // = mp3_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    ); // = mp3_read_packet,
    [CCode (cname="", cheader="")]
    public override int read_seek (
        AVFormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    ); // = mp3_seek,
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MP3DecContext);
        }
    }
    //  .flags = AVFMT_GENERIC_INDEX,
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return ;
        }
    } // = "mp2,mp3,m2a,mpa", /* XXX: use probe
***********************************************************/
    //  .priv_class = demuxer_class,
}
