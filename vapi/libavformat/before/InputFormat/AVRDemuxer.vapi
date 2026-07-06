/***********************************************************
@brief AVR demuxer
@copyright 2012 Paul B Mahol
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

[CCode (cname="ff_avr_demuxer",cheader_filename="subprojects/ffmpeg/libavformat/avr.c")]
public class AVRDemuxer : LibAVFormat.InputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/avr.c")]
    public override string name {
        public get {
            return "avr";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/avr.c")]
    public override string long_name {
        public get {
            return "AVR (Audio Visual Research)";

        }

    }

    [CCode (cname="avr_probe",cheader_filename="subprojects/ffmpeg/libavformat/avr.c")]
    public override int read_probe (
        LibAVFormat.ProbeData format_context
    );

    [CCode (cname="avr_read_header",cheader_filename="subprojects/ffmpeg/libavformat/avr.c")]
    public override int read_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="ff_pcm_read_packet",cheader_filename="subprojects/ffmpeg/libavformat/avr.c")]
    public override int read_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="ff_pcm_read_seek",cheader_filename="subprojects/ffmpeg/libavformat/avr.c")]
    public override int read_seek (
        LibAVFormat.FormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/avr.c")]
    public override string extensions {
        public get {
            return "avr";

        }

    }

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/avr.c")]
    public override LibAVFormat.FormatFlags1 flags {
        public get {
            return LibAVFormat.FormatFlags1.USE_GENERIC_INDEX;

        }

    }
}

} // namespace LibAVFormat
