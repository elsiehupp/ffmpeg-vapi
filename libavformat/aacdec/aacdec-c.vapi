/***********************************************************
raw ADTS AAC demuxer
@copyright 2008 Michael Niedermayer <michaelni@gmx.at>
@copyright 2009 Robert Swain ( rob opendot cl )

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

[CCode (cname="ff_aac_demuxer", cheader="")]
public class InputFormat : AVInputFormat ff_aac_demuxer = {
    //  .name         = "aac",
    //  .long_name    = "raw ADTS AAC (Advanced Audio Coding)",
    [CCode (cname="adts_aac_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="adts_aac_read_header", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );
    [CCode (cname="adts_aac_read_packet", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    //  .flags        = AVFMT_GENERIC_INDEX,
    //  .extensions   = "aac",
    //  .mime_type    = "audio/aac,audio/aacp,audio/x-aac",
    //  .raw_codec_id = AV_CODEC_ID_AAC,
}
