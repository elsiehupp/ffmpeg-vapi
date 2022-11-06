/***********************************************************
Shorten demuxer
@copyright 2001 Fabrice Bellard
@copyright 2005 Alex Beregszaszi
@copyright 2015 Carl Eugen Hoyos

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

FF_RAW_DEMUXER_CLASS(shorten)
public class InputFormat : AVInputFormat ff_shorten_demuxer = {
    //  .name           = "shn",
    //  .long_name      = "raw Shorten",
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );     = shn_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = ff_raw_audio_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = ff_raw_read_partial_packet,
    //  .flags          = AVFMT_NOBINSEARCH | AVFMT_NOGENSEARCH | AVFMT_NO_BYTE_SEEK | AVFMT_NOTIMESTAMPS,
    //  .extensions     = "shn",
    //  .raw_codec_id   = AV_CODEC_ID_SHORTEN,
    //  .priv_data_size = sizeof(FFRawDemuxerContext),
    //  .priv_class     = &shorten_demuxer_class,
}
