/***********************************************************
@brief TTA demuxer
@copyright 2006 Alex Beregszaszi
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

[CCode (cname="struct TTAContext",cheader_filename="subprojects/ffmpeg/libavformat/tta.c")]
[Compact]
public class TrueAudioDemuxerPrivateData { }

[CCode (cname="ff_tta_demuxer",cheader_filename="subprojects/ffmpeg/libavformat/tta.c")]
public class TrueAudioDemuxer : LibAVFormat.InputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/tta.c")]
    public override string name {
        public get {
            return "tta";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/tta.c")]
    public override string long_name {
        public get {
            return "TTA (True Audio)";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/tta.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (TrueAudioDemuxerPrivateData);

        }

    }

    [CCode (cname="tta_probe",cheader_filename="subprojects/ffmpeg/libavformat/tta.c")]
    public override int read_probe (
        LibAVFormat.ProbeData format_context
    );

    [CCode (cname="tta_read_header",cheader_filename="subprojects/ffmpeg/libavformat/tta.c")]
    public override int read_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="tta_read_packet",cheader_filename="subprojects/ffmpeg/libavformat/tta.c")]
    public override int read_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="tta_read_seek",cheader_filename="subprojects/ffmpeg/libavformat/tta.c")]
    public override int read_seek (
        LibAVFormat.FormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/tta.c")]
    public override string extensions {
        public get {
            return "tta";

        }

    }
}

} // namespace LibAVFormat
