/***********************************************************
Sony OpenMG (OMA) muxer

@copyright 2011 Michael Karcher

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
public class OutputFormat : AVOutputFormat ff_oma_muxer = {
    //  .name              = "oma",
    //  .long_name         = "Sony OpenMG audio",
    //  .mime_type         = "audio/x-oma",
    //  .extensions        = "oma",
    //  .audio_codec       = AV_CODEC_ID_ATRAC3,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );      = oma_write_header,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );      = ff_raw_write_packet,
    //  .codec_tag         = (const AVCodecTag* const []){ff_oma_codec_tags, 0},
    //  .flags             = AVFMT_NOTIMESTAMPS,
}
