/***********************************************************
Interplay MVE File Demuxer
@copyright 2003 The FFmpeg project
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

/***********************************************************
@file Interplay MVE file demuxer
by Mike Melanson (melanson@pcisys.net)
For more information regarding the Interplay MVE file format, visit:
  http://www.pcisys.net/~melanson/codecs/
The aforementioned site also contains a command line utility for parsing
IP MVE files so that you can get a good idea of the typical structure of
such files. This demuxer is not the best example to use if you are trying
to write your own as it uses a rather roundabout approach for splitting
up and sending out the chunks.
***********************************************************/

[CCode (cname="ff_ipmovie_demuxer", cheader="")]
public class InputDemuxer : AVInputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "ipmovie";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "Interplay MVE";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (IPMVEContext);
        }
    }
    [CCode (cname="ipmovie_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="ipmovie_read_header", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );
    [CCode (cname="ipmovie_read_packet", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
}
