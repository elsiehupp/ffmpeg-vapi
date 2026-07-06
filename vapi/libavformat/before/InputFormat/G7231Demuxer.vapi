/***********************************************************
@brief G.723.1 demuxer
@copyright 2010 Mohamed Naufal Basheer
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
@file G.723.1 demuxer
***********************************************************/

[CCode (cname="ff_g723_1_demuxer",cheader_filename="subprojects/ffmpeg/libavformat/g723_1.c")]
public class G7231Demuxer : LibAVFormat.InputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/g723_1.c")]
    public override string name {
        public get {
            return "g723_1";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/g723_1.c")]
    public override string long_name {
        public get {
            return "G.723.1";

        }

    }

    [CCode (cname="g723_1_init",cheader_filename="subprojects/ffmpeg/libavformat/g723_1.c")]
    public override int read_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="g723_1_read_packet",cheader_filename="subprojects/ffmpeg/libavformat/g723_1.c")]
    public override int read_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/g723_1.c")]
    public override string extensions {
        public get {
            return "tco,rco,g723_1";

        }

    }

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/g723_1.c")]
    public override LibAVFormat.FormatFlags1 flags {
        public get {
            return LibAVFormat.FormatFlags1.USE_GENERIC_INDEX;

        }

    }
}

} // namespace LibAVFormat
