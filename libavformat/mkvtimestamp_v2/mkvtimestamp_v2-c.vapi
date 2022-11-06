/***********************************************************
 extract pts as timecode v2, as defined by mkvtoolnix
 @copyright 2009 David Conrad

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
public class OutputFormat : AVOutputFormat ff_mkvtimestamp_v2_muxer = {
    //  .name         = "mkvtimestamp_v2",
    //  .long_name    = "extract pts as timecode v2 format, as defined by mkvtoolnix",
    //  .audio_codec  = AV_CODEC_ID_NONE,
    //  .video_codec  = AV_CODEC_ID_RAWVIDEO,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); = write_header,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    ); = write_packet,
}
