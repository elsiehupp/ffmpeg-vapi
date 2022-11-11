/***********************************************************
RTSP muxer
@copyright 2010 Martin Storsjo
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

[CCode (cname="rtsp_muxer_class", cheader="")]
public class RTSPMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "RTSP muxer";
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
    //  .option = ff_rtsp_options,
    [CCode (cname="version", cheader="")]
    public override int version {
        public get {
            return LIBAVUTIL_VERSION_INT;
        }
    }
}

[CCode (cname="ff_rtsp_muxer", cheader="")]
public class RTSPMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "rtsp";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "RTSP output";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (RTSPState);
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
            return LibAVCodec.CodecID.MPEG4;
        }
    }
    [CCode (cname="rtsp_write_header", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );
    [CCode (cname="rtsp_write_packet", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );
    [CCode (cname="rtsp_write_close", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    );
    [CCode (cname="flags", cheader="")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_NOFILE | AVFMT_GLOBALHEADER;
        }
    }
    //  .priv_class = rtsp_muxer_class,
}

} // namespace LibAVFormat
