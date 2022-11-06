/***********************************************************
Yamaha SMAF format
@copyright 2005 Vidar Madsen

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

#if CONFIG_MMF_DEMUXER
public class InputFormat : AVInputFormat ff_mmf_demuxer = {
    //  .name           = "mmf",
    //  .long_name      = "Yamaha SMAF",
    //  .priv_data_size = sizeof(MMFContext),
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );     = mmf_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = mmf_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = mmf_read_packet,
    //  .flags          = AVFMT_GENERIC_INDEX,
}
#endif

#if CONFIG_MMF_MUXER
public class OutputFormat : AVOutputFormat ff_mmf_muxer = {
    //  .name           = "mmf",
    //  .long_name      = "Yamaha SMAF",
    //  .mime_type      = "application/vnd.smaf",
    //  .extensions     = "mmf",
    //  .priv_data_size = sizeof(MMFContext),
    //  .audio_codec    = AV_CODEC_ID_ADPCM_YAMAHA,
    //  .video_codec    = AV_CODEC_ID_NONE,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );   = mmf_write_header,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );   = ff_raw_write_packet,
    [CCode (cname="", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    );  = mmf_write_trailer,
}
#endif
