/***********************************************************
@brief SCC subtitle demuxer
@copyright 2017 Paul B Mahol
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

[CCode (cname="struct SCCContext",cheader_filename="subprojects/ffmpeg/libavformat/sccdec.c")]
[Compact]
public class SCCDemuxerPrivateData { }

[CCode (cname="ff_scc_demuxer",cheader_filename="subprojects/ffmpeg/libavformat/sccdec.c")]
public class SCCDemuxer : LibAVFormat.InputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/sccdec.c")]
    public override string name {
        public get {
            return "scc";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/sccdec.c")]
    public override string long_name {
        public get {
            return "Scenarist Closed Captions";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/sccdec.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (SCCDemuxerPrivateData);

        }

    }

    [CCode (cname="scc_probe",cheader_filename="subprojects/ffmpeg/libavformat/sccdec.c")]
    public override int read_probe (
        LibAVFormat.ProbeData format_context
    );

    [CCode (cname="scc_read_header",cheader_filename="subprojects/ffmpeg/libavformat/sccdec.c")]
    public override int read_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="scc_read_packet",cheader_filename="subprojects/ffmpeg/libavformat/sccdec.c")]
    public override int read_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="scc_read_seek",cheader_filename="subprojects/ffmpeg/libavformat/sccdec.c")]
    public override int read_seek2 (
        LibAVFormat.FormatContext format_context,
        int stream_index,
        int64 min_ts,
        int64 ts,
        int64 max_ts,
        int flags
    );

    [CCode (cname="scc_read_close",cheader_filename="subprojects/ffmpeg/libavformat/sccdec.c")]
    public override int read_close (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/sccdec.c")]
    public override string extensions {
        public get {
            return "scc";

        }

    }
}

} // namespace LibAVFormat
