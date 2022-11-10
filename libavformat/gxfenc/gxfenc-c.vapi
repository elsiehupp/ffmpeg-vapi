/***********************************************************
GXF muxer.
@copyright 2006 SmartJog S.A., Baptiste Coudurier <baptiste dot coudurier at smartjog dot com>
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

[CCode (cname="ff_gxf_muxer", cheader="")]
public class GXFOutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "gxf"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "GXF (General eXchange Format)"
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return ;
        }
    } // = "gxf"
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (GXFContext);
        }
    }
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.PCM_S16LE;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.MPEG2VIDEO;
        }
    }
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = gxf_write_header,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = gxf_write_packet,
    [CCode (cname="", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    ); // = gxf_write_trailer,
    [CCode (cname="", cheader="")]
    public override int interleave_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet output,
        LibAVCodec.Packet input,
        int flush
    ); // = gxf_interleave_packet,
}
