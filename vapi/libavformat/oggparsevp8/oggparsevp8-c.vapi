/***********************************************************
@brief On2 VP8 parser for Ogg
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

[CCode (cname="ff_vp8_codec",cheader_filename="subprojects/ffmpeg/libavformat/oggparsevp8.c")]
public class VP8Codec : OggCodec {
    [CCode (cname="magic")]
    public override uint8[] magic {
        public get {
            return "OVP80".data;

        }

    }

    [CCode (cname="magicsize")]
    public override uint8 magicsize {
        public get {
            return 5;
        }

    }

    [CCode (cname="vp8_header",cheader_filename="subprojects/ffmpeg/libavformat/oggparsevp8.c")]
    public override int header (
        AVFormatContext context,
        int arg
    );

    [CCode (cname="vp8_packet",cheader_filename="subprojects/ffmpeg/libavformat/oggparsevp8.c")]
    public override int packet (
        AVFormatContext context,
        int arg
    );

    [CCode (cname="vp8_gptopts",cheader_filename="subprojects/ffmpeg/libavformat/oggparsevp8.c")]
    public override uint64 gptopts (
        AVFormatContext context,
        int arg1,
        uint64 arg2,
        out int64 dts
    );

    [CCode (cname="nb_header")]
    public override int nb_header {
        public get {
            return 1;
        }

    }

}

} // namespace LibAVFormat
