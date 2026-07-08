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
namespace LibAVDevice {

[CCode (cname="struct fmt_map",cheader_filename="subprojects/ffmpeg/libavdevice/v4l2_common.h")]
[Compact]
public class fmt_map {
    [CCode (cname="ff_fmt")]
    public LibAVUtil.PixelFormat ff_fmt;

    [CCode (cname="codec_id")]
    public LibAVCodec.CodecID codec_id;

    [CCode (cname="v4l2_fmt")]
    public uint32 v4l2_fmt;
}

//  extern const struct fmt_map ff_fmt_conversion_table[];

[CCode (cname="ff_fmt_ff2v4l",cheader_filename="subprojects/ffmpeg/libavdevice/v4l2_common.h")]
public uint32 ff_fmt_ff2v4l (
    LibAVUtil.PixelFormat pix_fmt,
    LibAVCodec.CodecID codec_id
);

[CCode (cname="ff_fmt_v4l2ff",cheader_filename="subprojects/ffmpeg/libavdevice/v4l2_common.h")]
public LibAVUtil.PixelFormat ff_fmt_v4l2ff (
    uint32 v4l2_fmt, LibAVCodec.CodecID codec_id
);

[CCode (cname="ff_fmt_v4l2codec",cheader_filename="subprojects/ffmpeg/libavdevice/v4l2_common.h")]
public LibAVCodec.CodecID ff_fmt_v4l2codec (
    uint32 v4l2_fmt
);

} // namespace LibAVDevice
