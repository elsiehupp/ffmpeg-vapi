/***********************************************************
"Real" compatible muxer.
@copyright 2000, 2001 Fabrice Bellard
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

[CCode (cname="struct RMMuxContext",cheader_filename="subprojects/ffmpeg/libavformat/rmenc.c")]
[Compact]
public class RealMediaMuxerPrivateData { }

[CCode (cname="ff_rm_muxer",cheader_filename="subprojects/ffmpeg/libavformat/rmenc.c")]
public class RealMediaMuxer : LibAVFormat.OutputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/rmenc.c")]
    public override string name {
        public get {
            return "rm";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/rmenc.c")]
    public override string long_name {
        public get {
            return "RealMedia";

        }

    }

    [CCode (cname="mime_type",cheader_filename="subprojects/ffmpeg/libavformat/rmenc.c")]
    public override string mime_type {
        public get {
            return "application/vnd.rn-realmedia";

        }

    }

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/rmenc.c")]
    public override string extensions {
        public get {
            return "rm,ra";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/rmenc.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (RealMediaMuxerPrivateData);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="subprojects/ffmpeg/libavformat/rmenc.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.AC3;

        }

    }

    [CCode (cname="video_codec",cheader_filename="subprojects/ffmpeg/libavformat/rmenc.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.RV10;

        }

    }

    [CCode (cname="rm_write_header",cheader_filename="subprojects/ffmpeg/libavformat/rmenc.c")]
    public override int write_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="rm_write_packet",cheader_filename="subprojects/ffmpeg/libavformat/rmenc.c")]
    public override int write_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="rm_write_trailer",cheader_filename="subprojects/ffmpeg/libavformat/rmenc.c")]
    public override int write_trailer (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="codec_tag")]
    public override LibAVFormat.CodecTag[] codec_tag_list {
        public get {
            return {
                ff_rm_codec_tags,
                0
            };

        }

    }

}

} // namespace LibAVFormat
