/***********************************************************
Westwood Studios AUD Format Demuxer
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
@file Westwood Studios AUD file demuxer
by Mike Melanson (melanson@pcisys.net)
for more information on the Westwood file formats, visit:
  http://www.pcisys.net/~melanson/codecs/
  http://www.geocities.com/SiliconValley/8682/aud3.txt

Implementation note: There is no definite file signature for AUD files.
The demuxer uses a probabilistic strategy for content detection. This
entails performing sanity checks on certain header values in order to
qualify a file. Refer to wsaud_probe() for the precise parameters.
***********************************************************/

[CCode (cname="ff_wsaud_demuxer", cheader="")]
public class InputDemuxer : AVInputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "wsaud";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "Westwood Studios audio";
        }
    }
    [CCode (cname="wsaud_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="wsaud_read_header", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );
    [CCode (cname="wsaud_read_packet", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
}
