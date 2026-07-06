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
/***********************************************************
@brief MD STUDIO audio demuxer

@copyright 2009 Benjamin Larsson
***********************************************************/
namespace LibAVFormat {

[CCode (cname="ff_aea_demuxer",cheader_filename="subprojects/ffmpeg/libavformat/aea.c")]
public class AEADemuxer : LibAVFormat.InputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/aea.c")]
    public override string name {
        public get {
            return "aea";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/aea.c")]
    public override string long_name {
        public get {
            return "MD STUDIO audio";

        }

    }

    [CCode (cname="aea_read_probe",cheader_filename="subprojects/ffmpeg/libavformat/aea.c")]
    public override int read_probe (
        LibAVFormat.ProbeData format_context
    );

    [CCode (cname="aea_read_header",cheader_filename="subprojects/ffmpeg/libavformat/aea.c")]
    public override int read_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="aea_read_packet",cheader_filename="subprojects/ffmpeg/libavformat/aea.c")]
    public override int read_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="ff_pcm_read_seek",cheader_filename="subprojects/ffmpeg/libavformat/aea.c")]
    public override int read_seek (
        LibAVFormat.FormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/aea.c")]
    public override LibAVFormat.FormatFlags1 flags {
        public get {
            return LibAVFormat.FormatFlags1.USE_GENERIC_INDEX;

        }

    }

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/aea.c")]
    public override string extensions {
        public get {
            return "aea";

        }

    }
}

} // namespace LibAVFormat
