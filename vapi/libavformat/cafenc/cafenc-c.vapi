/***********************************************************
@brief Core Audio Format muxer
@copyright 2011 Carl Eugen Hoyos
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

[CCode (cname="struct CAFContext",cheader_filename="subprojects/ffmpeg/libavformat/cafenc.c")]
[Compact]
public class CAFMuxerPrivateData { }

[CCode (cname="ff_caf_muxer",cheader_filename="subprojects/ffmpeg/libavformat/cafenc.c")]
public class CAFMuxer : LibAVFormat.OutputFormat  {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/cafenc.c")]
    public override string name {
        public get {
            return "caf";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/cafenc.c")]
    public override string long_name {
        public get {
            return "Apple CAF (Core Audio Format)";

        }

    }

    [CCode (cname="mime_type",cheader_filename="subprojects/ffmpeg/libavformat/cafenc.c")]
    public override string mime_type {
        public get {
            return "audio/x-caf";

        }

    }

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/cafenc.c")]
    public override string extensions {
        public get {
            return "caf";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/cafenc.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (CAFMuxerPrivateData);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="subprojects/ffmpeg/libavformat/cafenc.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.PCM_S16BE;

        }

    }

    [CCode (cname="video_codec",cheader_filename="subprojects/ffmpeg/libavformat/cafenc.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.NONE;

        }

    }

    [CCode (cname="caf_write_header",cheader_filename="subprojects/ffmpeg/libavformat/cafenc.c")]
    public override int write_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="caf_write_packet",cheader_filename="subprojects/ffmpeg/libavformat/cafenc.c")]
    public override int write_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="caf_write_trailer",cheader_filename="subprojects/ffmpeg/libavformat/cafenc.c")]
    public override int write_trailer (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="codec_tag")]
    public override AVCodecTag[] codec_tag_list {
        public get {
            return {
                ff_codec_caf_tags,
                0
            };

        }

    }

}

} // namespace LibAVFormat
