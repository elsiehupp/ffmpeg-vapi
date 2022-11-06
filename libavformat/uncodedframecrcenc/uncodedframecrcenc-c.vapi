/*
* Copyright (c) 2013 Nicolas George
*
* This file is part of FFmpeg.
*
* FFmpeg is free software; you can redistribute it and/or
* modify it under the terms of the GNU Lesser General Public License
* as published by the Free Software Foundation; either
* version 2.1 of the License, or (at your option) any later version.
*
* FFmpeg is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU Lesser General Public License for more details.
*
* You should have received a copy of the GNU Lesser General Public License
* along with FFmpeg; if not, write to the Free Software Foundation, Inc.,
* 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
*/

AVOutputFormat ff_uncodedframecrc_muxer = {
    //  .name              = "uncodedframecrc",
    //  .long_name         = "uncoded framecrc testing",
    //  .audio_codec       = AV_CODEC_ID_PCM_S16LE,
    //  .video_codec       = AV_CODEC_ID_RAWVIDEO,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );      = write_header,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buf,
        int buf_size
    );      = write_packet,
    [CCode (cname="", cheader="")]
    public override int write_uncoded_frame (
        AVFormatContext format_context,
        int stream_index,
        LibAVUtil.Frame frame,
        uint flags
    ); = write_frame,
    //  .flags             = AVFMT_VARIABLE_FPS | AVFMT_TS_NONSTRICT |
                         AVFMT_TS_NEGATIVE,
};
