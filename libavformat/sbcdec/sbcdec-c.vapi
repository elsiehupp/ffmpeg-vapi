/***********************************************************
RAW SBC demuxer
@copyright 2017  Aurelien Jacobs <aurel@gnuage.org>

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

FF_RAW_DEMUXER_CLASS(sbc)
public class InputFormat : AVInputFormat ff_sbc_demuxer = {
    //  .name           = "sbc",
    //  .long_name      = "raw SBC (low-complexity subband codec)",
    //  .extensions     = "sbc,msbc",
    //  .raw_codec_id   = AV_CODEC_ID_SBC,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = ff_raw_audio_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = ff_raw_read_partial_packet,
    //  .flags          = AVFMT_GENERIC_INDEX,
    //  .priv_data_size = sizeof(FFRawDemuxerContext),
    //  .priv_class     = &sbc_demuxer_class,
}
