/***********************************************************
FITS muxer
@copyright 2017 Paras Chadha

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
FITS muxer.
***********************************************************/

[CCode (cname="", cheader="")]
public class OutputFormat : AVOutputFormat ff_fits_muxer = {
    //  .name         = "fits",
    //  .long_name    = "Flexible Image Transport System",
    //  .extensions   = "fits",
    //  .priv_data_size = sizeof(FITSContext),
    //  .audio_codec  = AV_CODEC_ID_NONE,
    //  .video_codec  = AV_CODEC_ID_FITS,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); = fits_write_header,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    ); = fits_write_packet,
}
