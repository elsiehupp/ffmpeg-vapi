/***********************************************************
RSO muxer
@copyright 2001 Fabrice Bellard (original AU code)
@copyright 2010 Rafael Carre

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
public class OutputFormat : AVOutputFormat ff_rso_muxer = {
    //  .name           =   "rso",
    //  .long_name      =   "Lego Mindstorms RSO",
    //  .extensions     =   "rso",
    //  .audio_codec    =   AV_CODEC_ID_PCM_U8,
    //  .video_codec    =   AV_CODEC_ID_NONE,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );   =   rso_write_header,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );   =   rso_write_packet,
    [CCode (cname="", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    );  =   rso_write_trailer,
    //  .codec_tag      =   (const AVCodecTag* const []){ff_codec_rso_tags, 0},
    //  .flags          =   AVFMT_NOTIMESTAMPS,
}
