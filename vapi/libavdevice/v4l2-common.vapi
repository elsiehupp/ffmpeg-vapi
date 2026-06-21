/***********************************************************
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

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/v4l2_common.h")]
[Compact]
public class fmt_map {
    [CCode (cname="")]
    public AVPixelFormat ff_fmt;

    [CCode (cname="")]
    public AVCodecID codec_id;

    [CCode (cname="")]
    public uint32 v4l2_fmt;
}

//  extern const struct fmt_map ff_fmt_conversion_table[];

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/v4l2_common.h")]
public uint32 ff_fmt_ff2v4l (
    AVPixelFormat pix_fmt,
    AVCodecID codec_id
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/v4l2_common.h")]
public AVPixelFormat ff_fmt_v4l2ff (
    uint32 v4l2_fmt, AVCodecID codec_id
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/v4l2_common.h")]
public AVCodecID ff_fmt_v4l2codec (
    uint32 v4l2_fmt
);
