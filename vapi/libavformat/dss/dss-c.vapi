/***********************************************************
@brief Digital Speech Standard (DSS) demuxer
@copyright 2014 Oleksij Rempel <linux@rempel-privat.de>
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

[CCode (cname="struct DSSDemuxContext",cheader_filename="subprojects/ffmpeg/libavformat/dss.c")]
[Compact]
public class DSSDemuxerPrivateData { }

[CCode (cname="ff_dss_demuxer",cheader_filename="subprojects/ffmpeg/libavformat/dss.c")]
public class DSSDemuxer : LibAVFormat.InputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/dss.c")]
    public override string name {
        public get {
            return "dss";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/dss.c")]
    public override string long_name {
        public get {
            return "Digital Speech Standard (DSS)";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/dss.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (DSSDemuxerPrivateData);

        }

    }

    [CCode (cname="dss_probe",cheader_filename="subprojects/ffmpeg/libavformat/dss.c")]
    public override int read_probe (
        LibAVFormat.ProbeData format_context
    );

    [CCode (cname="dss_read_header",cheader_filename="subprojects/ffmpeg/libavformat/dss.c")]
    public override int read_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="dss_read_packet",cheader_filename="subprojects/ffmpeg/libavformat/dss.c")]
    public override int read_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="dss_read_close",cheader_filename="subprojects/ffmpeg/libavformat/dss.c")]
    public override int read_close (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="dss_read_seek",cheader_filename="subprojects/ffmpeg/libavformat/dss.c")]
    public override int read_seek (
        LibAVFormat.FormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/dss.c")]
    public override string extensions {
        public get {
            return "dss";

        }

    }
}

} // namespace LibAVFormat
