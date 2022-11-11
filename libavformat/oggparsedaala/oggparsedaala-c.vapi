/***********************************************************
Ogg Daala parser
@copyright 2015 Rostislav Pehlivanov <atomnuker gmail com>
@copyright 2015 Vittorio Giovara <vittorio.giovara gmail com>
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

namespace LibAVFormat {

[CCode (cname="ff_daala_codec", cheader="")]
public class DaalaCodec : OggCodec {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "Daala";
        }
    }
    public override int8[] magic {
        public get {
            return "200daala";
        }
    }
    //  .magicsize = 6,
    [CCode (cname="daala_header", cheader="")]
    public override int header (
        AVFormatContext context,
        int arg
    );
    [CCode (cname="daala_packet", cheader="")]
    public override int packet (
        AVFormatContext context,
        int arg
    );
    [CCode (cname="daala_gptopts", cheader="")]
    public override uint64 gptopts (
        AVFormatContext context,
        int arg1,
        uint64 arg2,
        out int64 dts
    );
    //  .granule_is_start = 1,
    //  .nb_header = 3,
}

} // namespace LibAVFormat
