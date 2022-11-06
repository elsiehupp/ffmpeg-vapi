/***********************************************************
   @copyright 2005  Matthieu CASTET

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

const struct ogg_codec ff_flac_codec = {
    //  .magic = "\177FLAC",
    //  .magicsize = 5,
    [CCode (cname="", cheader="")]
    public override int header (
        AVFormatContext context,
        int arg
    ); = flac_header,
    //  .nb_header = 2,
}

const struct ogg_codec ff_old_flac_codec = {
    //  .magic = "fLaC",
    //  .magicsize = 4,
    [CCode (cname="", cheader="")]
    public override int header (
        AVFormatContext context,
        int arg
    ); = old_flac_header,
    //  .nb_header = 0,
}
