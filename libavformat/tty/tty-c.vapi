/***********************************************************
Tele-typewriter demuxer
@copyright 2010 Peter Ross <pross@xvid.org>
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

/***********************************************************
@file Tele-typewriter demuxer
***********************************************************/

//  #define OFFSET(x) offsetof(TtyDemuxContext, x)
//  #define DEC AV_OPT_FLAG_DECODING_PARAM
//  static const LibAVUtil.Option options[] = {
//      { "chars_per_frame", "", offsetof(TtyDemuxContext, chars_per_frame), AV_OPT_TYPE_INT, {.i64 = 6000}, 1, INT_MAX, AV_OPT_FLAG_DECODING_PARAM},
//      { "video_size", "A string describing frame size, such as 640x480 or hd720.", OFFSET(width), AV_OPT_TYPE_IMAGE_SIZE, {.str = NULL}, 0, 0, DEC },
//      { "framerate", "", OFFSET(framerate), AV_OPT_TYPE_VIDEO_RATE, {.str = "25"}, 0, INT_MAX, DEC },
//      { NULL },
//  }

[CCode (cname="tty_demuxer_class", cheader="")]
public class TTYDemuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "TTY demuxer";
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
    //  .option = options,
    [CCode (cname="version", cheader="")]
    public override int version {
        public get {
            return LIBAVUTIL_VERSION_INT;
        }
    }
}

[CCode (cname="ff_tty_demuxer", cheader="")]
public class TTYDemuxer : AVInputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "tty";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "Tele-typewriter";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (TtyDemuxContext);
        }
    }
    [CCode (cname="read_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="read_header", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );
    [CCode (cname="read_packet", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return tty_extensions;
        }
    }
    //  .priv_class = tty_demuxer_class,
}

} // namespace LibAVFormat
