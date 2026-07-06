/***********************************************************
@brief RSD demuxer
@copyright 2013 James Almer
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

[CCode (cname="ff_rsd_demuxer",cheader_filename="subprojects/ffmpeg/libavformat/rsd.c")]
public class RSDDemuxer : LibAVFormat.InputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/rsd.c")]
    public override string name {
        public get {
            return "rsd";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/rsd.c")]
    public override string long_name {
        public get {
            return "GameCube RSD";

        }

    }

    [CCode (cname="rsd_probe",cheader_filename="subprojects/ffmpeg/libavformat/rsd.c")]
    public override int read_probe (
        LibAVFormat.ProbeData format_context
    );

    [CCode (cname="rsd_read_header",cheader_filename="subprojects/ffmpeg/libavformat/rsd.c")]
    public override int read_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="rsd_read_packet",cheader_filename="subprojects/ffmpeg/libavformat/rsd.c")]
    public override int read_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/rsd.c")]
    public override string extensions {
        public get {
            return "rsd";

        }

    }

    [CCode (cname="codec_tag")]
    public override LibAVFormat.CodecTag[] codec_tag_list {
        public get {
            return {
                rsd_tags,
                0
            };

        }

    }

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/rsd.c")]
    public override LibAVFormat.FormatFlags1 flags {
        public get {
            return LibAVFormat.FormatFlags1.USE_GENERIC_INDEX;

        }

    }
}

} // namespace LibAVFormat
