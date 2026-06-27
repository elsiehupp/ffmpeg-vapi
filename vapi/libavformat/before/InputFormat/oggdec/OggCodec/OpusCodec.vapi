/***********************************************************
@brief Opus parser for Ogg
@copyright 2012 Nicolas George
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

[CCode (cname="ff_opus_codec",cheader_filename="subprojects/ffmpeg/libavformat/oggparseopus.c")]
public class OpusCodec : OggCodec {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/oggparseopus.c")]
    public override uint8[] name {
        public get {
            return "Opus".data;

        }

    }

    [CCode (cname="magic")]
    public override uint8[] magic {
        public get {
            return "OpusHead".data;

        }

    }

    [CCode (cname="magicsize")]
    public override uint8 magicsize {
        public get {
            return 8;
        }

    }

    [CCode (cname="opus_header",cheader_filename="subprojects/ffmpeg/libavformat/oggparseopus.c")]
    public override int header (
        LibAVFormat.FormatContext context,
        int arg
    );

    [CCode (cname="opus_packet",cheader_filename="subprojects/ffmpeg/libavformat/oggparseopus.c")]
    public override int packet (
        LibAVFormat.FormatContext context,
        int arg
    );

    [CCode (cname="nb_header")]
    public override int nb_header {
        public get {
            return 1;
        }

    }

}

} // namespace LibAVFormat
