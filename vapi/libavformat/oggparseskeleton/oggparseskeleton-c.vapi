/***********************************************************
@copyright 2010 David Conrad
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

[CCode (cname="ff_skeleton_codec",cheader_filename="subprojects/ffmpeg/libavformat/oggparseskeleton.c")]
public class SkeletonCodec : OggCodec {
    [CCode (cname="magic")]
    public override uint8[] magic {
        public get {
            return "fishead".data;

        }

    }

    [CCode (cname="magicsize")]
    public override uint8 magicsize {
        public get {
            return 8;
        }

    }

    [CCode (cname="skeleton_header",cheader_filename="subprojects/ffmpeg/libavformat/oggparseskeleton.c")]
    public override int header (
        AVFormatContext context,
        int arg
    );

    [CCode (cname="nb_header")]
    public override int nb_header {
        public get {
            return 0;
        }

    }

}

} // namespace LibAVFormat
