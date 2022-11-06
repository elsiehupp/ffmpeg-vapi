/***********************************************************
Westwood Studios VQA Format Demuxer
@copyright 2003 The FFmpeg project

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

/**
@file
Westwood Studios VQA file demuxer
by Mike Melanson (melanson@pcisys.net)
for more information on the Westwood file formats, visit:
  http://www.pcisys.net/~melanson/codecs/
  http://www.geocities.com/SiliconValley/8682/aud3.txt
***********************************************************/

[CCode (cname="", cheader="")]
public class InputFormat : AVInputFormat ff_wsvqa_demuxer = {
    //  .name           = "wsvqa",
    //  .long_name      = "Westwood Studios VQA",
    //  .priv_data_size = sizeof(WsVqaDemuxContext),
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );     = wsvqa_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = wsvqa_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = wsvqa_read_packet,
}
