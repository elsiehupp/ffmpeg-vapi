/***********************************************************
Xiph CELT parser for Ogg
@copyright 2011 Nicolas George
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

[CCode (cname="ff_celt_codec", cheader="")]
public class CELTCodec : OggCodec {
    public override int8[] magic {
        public get {
            return "CELT    ";
        }
    }
    //  .magicsize = 8,
    [CCode (cname="", cheader="")]
    public override int header (
        AVFormatContext context,
        int arg
    ); // = celt_header,
    //  .nb_header = 2,
}
