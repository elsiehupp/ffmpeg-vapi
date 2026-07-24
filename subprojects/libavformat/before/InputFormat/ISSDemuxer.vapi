/***********************************************************
@brief ISS (.iss) file demuxer
@copyright 2008 Jaikrishnan Menon <realityman@gmx.net>
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
@file Funcom ISS file demuxer
@author Jaikrishnan Menon
@see http://wiki.multimedia.cx/index.php?title=FunCom_ISS
***********************************************************/

[CCode (cname="struct IssDemuxContext",cheader_filename="subprojects/ffmpeg/libavformat/iss.c")]
[Compact]
public class ISSDemuxerPrivateData { }

[CCode (cname="ff_iss_demuxer",cheader_filename="subprojects/ffmpeg/libavformat/iss.c")]
public class ISSDemuxer : LibAVFormat.InputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/iss.c")]
    public override string name {
        public get {
            return "iss";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/iss.c")]
    public override string long_name {
        public get {
            return "Funcom ISS";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/iss.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (ISSDemuxerPrivateData);

        }

    }

    [CCode (cname="iss_probe",cheader_filename="subprojects/ffmpeg/libavformat/iss.c")]
    public override int read_probe (
        LibAVFormat.ProbeData format_context
    );

    [CCode (cname="iss_read_header",cheader_filename="subprojects/ffmpeg/libavformat/iss.c")]
    public override int read_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="iss_read_packet",cheader_filename="subprojects/ffmpeg/libavformat/iss.c")]
    public override int read_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

}

} // namespace LibAVFormat
