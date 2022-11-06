/***********************************************************
iLBC storage file format
@copyright 2012 Martin Storsjo

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

[CCode (cname="", cheader="")]
public class InputFormat : AVInputFormat ff_ilbc_demuxer = {
    //  .name         = "ilbc",
    //  .long_name    = "iLBC storage",
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );   = ilbc_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );  = ilbc_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );  = ilbc_read_packet,
    //  .flags        = AVFMT_GENERIC_INDEX,
}

[CCode (cname="", cheader="")]
public class OutputFormat : AVOutputFormat ff_ilbc_muxer = {
    //  .name         = "ilbc",
    //  .long_name    = "iLBC storage",
    //  .mime_type    = "audio/iLBC",
    //  .extensions   = "lbc",
    //  .audio_codec  = AV_CODEC_ID_ILBC,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); = ilbc_write_header,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    ); = ilbc_write_packet,
    //  .flags        = AVFMT_NOTIMESTAMPS,
}
