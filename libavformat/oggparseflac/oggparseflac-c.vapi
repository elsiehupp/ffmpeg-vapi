/***********************************************************
   @copyright 2005  Matthieu CASTET
***********************************************************/
/***********************************************************
This file is part of FFmpeg.

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

[CCode (cname="ff_flac_codec", cheader="")]
public class FlacCodec : OggCodec {
    public override int8[] magic {
        public get {
            return "\177FLAC";
        }
    }
    //  .magicsize = 5,
    [CCode (cname="flac_header", cheader="")]
    public override int header (
        AVFormatContext context,
        int arg
    );
    //  .nb_header = 2,
}

[CCode (cname="ff_old_flac_codec", cheader="")]
public class OldFlacCodec : OggCodec {
    public override int8[] magic {
        public get {
            return "fLaC";
        }
    }
    //  .magicsize = 4,
    [CCode (cname="old_flac_header", cheader="")]
    public override int header (
        AVFormatContext context,
        int arg
    );
    //  .nb_header = 0,
}
