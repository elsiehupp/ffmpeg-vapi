/***********************************************************
SMJPEG muxer
@copyright 2012 Paul B Mahol

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
This is a muxer for Loki SDL Motion JPEG files
***********************************************************/

[CCode (cname="", cheader="")]
public class OutputFormat : AVOutputFormat ff_smjpeg_muxer = {
    //  .name           = "smjpeg",
    //  .long_name      = "Loki SDL MJPEG",
    //  .priv_data_size = sizeof(SMJPEGMuxContext),
    //  .audio_codec    = AV_CODEC_ID_PCM_S16LE,
    //  .video_codec    = AV_CODEC_ID_MJPEG,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );   = smjpeg_write_header,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );   = smjpeg_write_packet,
    [CCode (cname="", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    );  = smjpeg_write_trailer,
    //  .flags          = AVFMT_GLOBALHEADER | AVFMT_TS_NONSTRICT,
    //  .codec_tag      = (const AVCodecTag *const []){ ff_codec_smjpeg_video_tags, ff_codec_smjpeg_audio_tags, 0 },
}
