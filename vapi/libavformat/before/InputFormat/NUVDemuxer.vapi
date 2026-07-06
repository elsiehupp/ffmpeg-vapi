/***********************************************************
@brief NuppelVideo demuxer.
@copyright 2006 Reimar Doeffinger
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

[CCode (cname="struct NUVContext",cheader_filename="subprojects/ffmpeg/libavformat/nuv.c")]
[Compact]
public class NUVDemuxerPrivateData { }

[CCode (cname="ff_nuv_demuxer",cheader_filename="subprojects/ffmpeg/libavformat/nuv.c")]
public class NUVDemuxer : LibAVFormat.InputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/nuv.c")]
    public override string name {
        public get {
            return "nuv";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/nuv.c")]
    public override string long_name {
        public get {
            return "NuppelVideo";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/nuv.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (NUVDemuxerPrivateData);

        }

    }

    [CCode (cname="nuv_probe",cheader_filename="subprojects/ffmpeg/libavformat/nuv.c")]
    public override int read_probe (
        LibAVFormat.ProbeData format_context
    );

    [CCode (cname="nuv_header",cheader_filename="subprojects/ffmpeg/libavformat/nuv.c")]
    public override int read_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="nuv_packet",cheader_filename="subprojects/ffmpeg/libavformat/nuv.c")]
    public override int read_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="nuv_read_dts",cheader_filename="subprojects/ffmpeg/libavformat/nuv.c")]
    public override int64 read_timestamp (
        LibAVFormat.FormatContext format_context,
        int stream_index,
        int64[] pos,
        int64 pos_limit
    );

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/nuv.c")]
    public override LibAVFormat.FormatFlags1 flags {
        public get {
            return LibAVFormat.FormatFlags1.USE_GENERIC_INDEX;

        }

    }
}

} // namespace LibAVFormat
