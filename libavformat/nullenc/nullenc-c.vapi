/***********************************************************
@brief RAW null muxer
@copyright 2002 Fabrice Bellard
***********************************************************/
/***********************************************************
@brief This file is part of FFmpeg.

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

[CCode (cname="ff_null_muxer", cheader_filename="")]
public class NullMuxer : AVOutputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "null";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "raw null video";
        }
    }

    [CCode (cname="audio_codec", cheader_filename="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
        #if AV_HAVE_BIGENDIAN
            return LibAVCodec.CodecID.PCM_S16BE;
        #else
            return LibAVCodec.CodecID.PCM_S16LE;
        #endif
        }
    }

    [CCode (cname="video_codec", cheader_filename="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.WRAPPED_AVFRAME;
        }
    }

    [CCode (cname="null_write_packet", cheader_filename="")]
    public override int write_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="flags", cheader_filename="")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_VARIABLE_FPS | AVFMT_NOFILE | AVFMT_NOTIMESTAMPS;
        }
    }
}

} // namespace LibAVFormat
