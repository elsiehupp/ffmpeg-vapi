/***********************************************************
@copyright 2008 David Conrad
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

const struct ogg_codec ff_dirac_codec = {
    //  .magic = "BBCD\0"
        }
    }
    //  .magicsize = 5,
    [CCode (cname="", cheader="")]
    public override int header (
        AVFormatContext context,
        int arg
    ); // = dirac_header,
    [CCode (cname="", cheader="")]
    public override uint64 gptopts (
        AVFormatContext context,
        int arg1,
        uint64 arg2,
        out int64 dts
    ); // = dirac_gptopts,
    //  .granule_is_start = 1,
    //  .nb_header = 1,
}

const struct ogg_codec ff_old_dirac_codec = {
    //  .magic = "KW-DIRAC"
        }
    }
    //  .magicsize = 8,
    [CCode (cname="", cheader="")]
    public override int header (
        AVFormatContext context,
        int arg
    ); // = old_dirac_header,
    [CCode (cname="", cheader="")]
    public override uint64 gptopts (
        AVFormatContext context,
        int arg1,
        uint64 arg2,
        out int64 dts
    ); // = old_dirac_gptopts,
    //  .granule_is_start = 1,
    //  .nb_header = 1,
}
