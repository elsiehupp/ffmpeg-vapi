/***********************************************************
@brief Microsoft XMV demuxer
@copyright 2011 Sven Hesse <drmccoy@drmccoy.de>
@copyright 2011 Matthew Hoops <clone2727@gmail.com>
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

/***********************************************************
@file Microsoft XMV demuxer
***********************************************************/

[CCode (cname="struct XMVDemuxContext",cheader_filename="subprojects/ffmpeg/libavformat/xmv.c")]
[Compact]
public class XMVDemuxerPrivateData { }

[CCode (cname="ff_xmv_demuxer",cheader_filename="subprojects/ffmpeg/libavformat/xmv.c")]
public class XMVDemuxer : LibAVFormat.InputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/xmv.c")]
    public override string name {
        public get {
            return "xmv";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/xmv.c")]
    public override string long_name {
        public get {
            return "Microsoft XMV";

        }

    }

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/xmv.c")]
    public override string extensions {
        public get {
            return "xmv";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/xmv.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (XMVDemuxerPrivateData);

        }

    }

    [CCode (cname="xmv_probe",cheader_filename="subprojects/ffmpeg/libavformat/xmv.c")]
    public override int read_probe (
        LibAVFormat.ProbeData format_context
    );

    [CCode (cname="xmv_read_header",cheader_filename="subprojects/ffmpeg/libavformat/xmv.c")]
    public override int read_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="xmv_read_packet",cheader_filename="subprojects/ffmpeg/libavformat/xmv.c")]
    public override int read_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="xmv_read_close",cheader_filename="subprojects/ffmpeg/libavformat/xmv.c")]
    public override int read_close (
        LibAVFormat.FormatContext format_context
    );

}

} // namespace LibAVFormat
