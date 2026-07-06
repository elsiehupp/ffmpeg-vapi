/***********************************************************
@brief RTSP demuxer
@copyright 2002 Fabrice Bellard
***********************************************************/
/***********************************************************
@brief This file is part of FFmpeg.

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

[CCode (cname="rtsp_demuxer_class",cheader_filename="subprojects/ffmpeg/libavformat/rtspdec.c")]
public class RTSPDemuxerClass : LibAVUtil.Log.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/rtspdec.c")]
    public override string class_name {
        public get {
            return "RTSP demuxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/rtspdec.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="option")]
    public override LibAVUtil.Option[] options {
        public get {
            return {

            };

        }

    }
    //  .option = ff_rtsp_options,

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/rtspdec.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_rtsp_demuxer",cheader_filename="subprojects/ffmpeg/libavformat/rtspdec.c")]
public class RTSPDemuxer : LibAVFormat.InputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/rtspdec.c")]
    public override string name {
        public get {
            return "rtsp";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/rtspdec.c")]
    public override string long_name {
        public get {
            return "RTSP input";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/rtspdec.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (RTSPState);

        }

    }

    [CCode (cname="rtsp_probe",cheader_filename="subprojects/ffmpeg/libavformat/rtspdec.c")]
    public override int read_probe (
        LibAVFormat.ProbeData format_context
    );

    [CCode (cname="rtsp_read_header",cheader_filename="subprojects/ffmpeg/libavformat/rtspdec.c")]
    public override int read_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="rtsp_read_packet",cheader_filename="subprojects/ffmpeg/libavformat/rtspdec.c")]
    public override int read_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="rtsp_read_close",cheader_filename="subprojects/ffmpeg/libavformat/rtspdec.c")]
    public override int read_close (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="rtsp_read_seek",cheader_filename="subprojects/ffmpeg/libavformat/rtspdec.c")]
    public override int read_seek (
        LibAVFormat.FormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/rtspdec.c")]
    public override LibAVFormat.FormatFlags1 flags {
        public get {
            return LibAVFormat.FormatFlags1.NO_FILE;

        }

    }

    [CCode (cname="rtsp_read_play",cheader_filename="subprojects/ffmpeg/libavformat/rtspdec.c")]
    public override int read_play (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="rtsp_read_pause",cheader_filename="subprojects/ffmpeg/libavformat/rtspdec.c")]
    public override int read_pause (
        LibAVFormat.FormatContext format_context
    );
    //  .priv_class = rtsp_demuxer_class;
}

} // namespace LibAVFormat
