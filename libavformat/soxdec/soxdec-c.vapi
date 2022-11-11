/***********************************************************
SoX native format demuxer
@copyright 2009 Daniel Verkamp <daniel@drv.nu>

Based on libSoX sox-fmt.c
@copyright 2008 robs@users.sourceforge.net
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

/***********************************************************
@file SoX native format demuxer
@author Daniel Verkamp
@see http://wiki.multimedia.cx/index.php?title=SoX_native_intermediate_format
***********************************************************/

[CCode (cname="ff_sox_demuxer", cheader="")]
public class SoXDemuxer : AVInputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "sox";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "SoX native";
        }
    }
    [CCode (cname="sox_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="sox_read_header", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );
    [CCode (cname="ff_pcm_read_packet", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    [CCode (cname="ff_pcm_read_seek", cheader="")]
    public override int read_seek (
        AVFormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );
}

} // namespace LibAVFormat
