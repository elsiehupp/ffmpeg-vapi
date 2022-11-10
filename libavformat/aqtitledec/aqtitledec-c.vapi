/***********************************************************
@copyright 2012 Clément Bœsch
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

/***********************************************************
@file AQTitle subtitles format demuxer

@see http://web.archive.org/web/20070210095721/http://www.volny.cz/aberka/czech/aqt.html
@see https://trac.annodex.net/wiki/AQTitle
***********************************************************/

//  #define OFFSET(x) offsetof(AQTitleContext, x)
//  #define SD AV_OPT_FLAG_SUBTITLE_PARAM|AV_OPT_FLAG_DECODING_PARAM
//  static const AVOption aqt_options[] = {
//      { "subfps", "set the movie frame rate", OFFSET(frame_rate), AV_OPT_TYPE_RATIONAL, {.dbl=25}, 0, INT_MAX, SD },
//      { NULL }
//  }

[CCode (cname="aqt_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = "aqtdec"
    //  .item_name = av_default_item_name,
    //  .option = aqt_options,
    //  .version = LIBAVUTIL_VERSION_INT,
}

[CCode (cname="ff_aqtitle_demuxer", cheader="")]
public class InputDemuxer : AVInputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "aqtitle"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "AQTitle subtitles"
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (AQTitleContext);
        }
    }
    [CCode (cname="aqt_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="aqt_read_header", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );
    [CCode (cname="aqt_read_packet", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    [CCode (cname="aqt_read_seek", cheader="")]
    public override int read_seek2 (
        AVFormatContext format_context,
        int stream_index,
        int64 min_ts,
        int64 ts,
        int64 max_ts,
        int flags
    );
    [CCode (cname="aqt_read_close", cheader="")]
    public override int read_close (
        AVFormatContext format_context
    );
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return ;
        }
    } // = "aqt"
    //  .priv_class = aqt_class,
}
