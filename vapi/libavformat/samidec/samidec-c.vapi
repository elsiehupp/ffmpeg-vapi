/***********************************************************
@copyright 2012 Clément Bœsch
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
@file SAMI subtitle demuxer
@see http://msdn.microsoft.com/en-us/library/ms971327.aspx
***********************************************************/

[CCode (cname="struct SAMIContext",cheader_filename="subprojects/ffmpeg/libavformat/samidec.c")]
[Compact]
public class SAMIDemuxerPrivateData { }

[CCode (cname="ff_sami_demuxer",cheader_filename="subprojects/ffmpeg/libavformat/samidec.c")]
public class SAMIDemuxer : LibAVFormat.InputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/samidec.c")]
    public override string name {
        public get {
            return "sami";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/samidec.c")]
    public override string long_name {
        public get {
            return "SAMI subtitle format";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/samidec.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (SAMIDemuxerPrivateData);

        }

    }

    [CCode (cname="sami_probe",cheader_filename="subprojects/ffmpeg/libavformat/samidec.c")]
    public override int read_probe (
        LibAVFormat.ProbeData format_context
    );

    [CCode (cname="sami_read_header",cheader_filename="subprojects/ffmpeg/libavformat/samidec.c")]
    public override int read_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="sami_read_packet",cheader_filename="subprojects/ffmpeg/libavformat/samidec.c")]
    public override int read_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="sami_read_seek",cheader_filename="subprojects/ffmpeg/libavformat/samidec.c")]
    public override int read_seek2 (
        LibAVFormat.FormatContext format_context,
        int stream_index,
        int64 min_ts,
        int64 ts,
        int64 max_ts,
        int flags
    );

    [CCode (cname="sami_read_close",cheader_filename="subprojects/ffmpeg/libavformat/samidec.c")]
    public override int read_close (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/samidec.c")]
    public override string extensions {
        public get {
            return "smi,sami";

        }

    }
}

} // namespace LibAVFormat
