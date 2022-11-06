/***********************************************************
amr file format
@copyright 2001 FFmpeg project

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
Write and read amr data according to RFC3267, http://www.ietf.org/rfc/rfc3267.txt?number=3267

Only mono files are supported.

*/

[CCode (cname="", cheader="")]
public class InputFormat : AVInputFormat ff_amrwb_demuxer = {
    //  .name           = "amrwb",
    //  .long_name      = "raw AMR-WB",
    //  .priv_data_size = sizeof(AMRContext),
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );     = amrwb_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = amrwb_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = amr_read_packet,
    //  .flags          = AVFMT_GENERIC_INDEX,
}
#endif

#if CONFIG_AMR_MUXER
public class OutputFormat : AVOutputFormat ff_amr_muxer = {
    //  .name              = "amr",
    //  .long_name         = "3GPP AMR",
    //  .mime_type         = "audio/amr",
    //  .extensions        = "amr",
    //  .audio_codec       = AV_CODEC_ID_AMR_NB,
    //  .video_codec       = AV_CODEC_ID_NONE,
    [CCode (cname="amr_write_header", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );
    [CCode (cname="amr_write_packet", cheader="")]
    public abstract int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );
    //  .flags             = AVFMT_NOTIMESTAMPS,
}
#endif
