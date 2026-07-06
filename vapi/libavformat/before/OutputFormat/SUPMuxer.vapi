/***********************************************************
@brief SUP muxer
@copyright 2014 Petri Hintukainen <phintuka@users.sourceforge.net>
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

[CCode (cname="ff_sup_muxer",cheader_filename="subprojects/ffmpeg/libavformat/supenc.c")]
public class SUPMuxer : LibAVFormat.OutputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/supenc.c")]
    public override string name {
        public get {
            return "sup";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/supenc.c")]
    public override string long_name {
        public get {
            return "raw HDMV Presentation Graphic Stream subtitles";

        }

    }

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/supenc.c")]
    public override string extensions {
        public get {
            return "sup";

        }

    }

    [CCode (cname="mime_type",cheader_filename="subprojects/ffmpeg/libavformat/supenc.c")]
    public override string mime_type {
        public get {
            return "application/x-pgs";

        }

    }

    [CCode (cname="subtitle_codec",cheader_filename="subprojects/ffmpeg/libavformat/supenc.c")]
    public override LibAVCodec.CodecID subtitle_codec {
        public get {
            return LibAVCodec.CodecID.HDMV_PGS_SUBTITLE;

        }

    }

    [CCode (cname="sup_write_header",cheader_filename="subprojects/ffmpeg/libavformat/supenc.c")]
    public override int write_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="sup_write_packet",cheader_filename="subprojects/ffmpeg/libavformat/supenc.c")]
    public override int write_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/supenc.c")]
    public override LibAVFormat.FormatFlags1 flags {
        public get {
            return LibAVFormat.FormatFlags1.ALLOWS_VARIABLE_FPS | LibAVFormat.FormatFlags1.ALLOW_NON_STRICT_TIMESTAMPS;

        }

    }
}

} // namespace LibAVFormat
