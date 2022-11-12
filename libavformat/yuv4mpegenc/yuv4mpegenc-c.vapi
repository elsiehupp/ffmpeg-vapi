/***********************************************************
YUV4MPEG muxer
@copyright 2001, 2002, 2003 Fabrice Bellard
***********************************************************/
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

namespace LibAVFormat {

[CCode (cname="ff_yuv4mpegpipe_muxer", cheader_filename="")]
public class YUV4MpegPipeMuxer : AVOutputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "yuv4mpegpipe";
        }
    }
    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "YUV4MPEG pipe";
        }
    }
    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "y4m";
        }
    }
    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (int);
        }
    }
    [CCode (cname="audio_codec", cheader_filename="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.NONE;
        }
    }
    [CCode (cname="video_codec", cheader_filename="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.WRAPPED_AVFRAME;
        }
    }
    [CCode (cname="yuv4_write_header", cheader_filename="")]
    public override int write_header (
        AVFormatContext format_context
    );
    [CCode (cname="yuv4_write_packet", cheader_filename="")]
    public override int write_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
}

} // namespace LibAVFormat
