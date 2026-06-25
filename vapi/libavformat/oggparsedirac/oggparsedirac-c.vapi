/***********************************************************
@copyright 2008 David Conrad
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

[CCode (cname="ff_dirac_codec",cheader_filename="subprojects/ffmpeg/libavformat/oggparsedirac.c")]
public class DiracCodec : OggCodec {
    [CCode (cname="magic")]
    public override uint8[] magic {
        public get {
            return "BBCD\0".data;

        }

    }

    [CCode (cname="magicsize")]
    public override uint8 magicsize {
        public get {
            return 5;
        }

    }

    [CCode (cname="dirac_header",cheader_filename="subprojects/ffmpeg/libavformat/oggparsedirac.c")]
    public override int header (
        LibAVFormat.FormatContext context,
        int arg
    );

    [CCode (cname="dirac_gptopts",cheader_filename="subprojects/ffmpeg/libavformat/oggparsedirac.c")]
    public override uint64 gptopts (
        LibAVFormat.FormatContext context,
        int arg1,
        uint64 arg2,
        out int64 dts
    );

    [CCode (cname="granule_is_start")]
    public override bool granule_is_start {
        public get {
            return true;
        }

    }

    [CCode (cname="nb_header")]
    public override int nb_header {
        public get {
            return 1;
        }

    }

}

[CCode (cname="ff_old_dirac_codec",cheader_filename="subprojects/ffmpeg/libavformat/oggparsedirac.c")]
public class OldDiracCodec : OggCodec {
    [CCode (cname="magic")]
    public override uint8[] magic {
        public get {
            return "KW-DIRAC".data;

        }

    }

    [CCode (cname="magicsize")]
    public override uint8 magicsize {
        public get {
            return 8;
        }

    }

    [CCode (cname="old_dirac_header",cheader_filename="subprojects/ffmpeg/libavformat/oggparsedirac.c")]
    public override int header (
        LibAVFormat.FormatContext context,
        int arg
    );

    [CCode (cname="old_dirac_gptopts",cheader_filename="subprojects/ffmpeg/libavformat/oggparsedirac.c")]
    public override uint64 gptopts (
        LibAVFormat.FormatContext context,
        int arg1,
        uint64 arg2,
        out int64 dts
    );

    [CCode (cname="granule_is_start")]
    public override bool granule_is_start {
        public get {
            return true;
        }

    }

    [CCode (cname="nb_header")]
    public override int nb_header {
        public get {
            return 1;
        }

    }

}

} // namespace LibAVFormat
