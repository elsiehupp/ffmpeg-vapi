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
/***********************************************************
@brief Amr file format
@copyright 2001 FFmpeg project
***********************************************************/
namespace LibAVFormat {

#if CONFIG_AMR_MUXER

[CCode (cname="ff_amr_muxer",cheader_filename="subprojects/ffmpeg/libavformat/amr.c")]
public class AmrMuxer : LibAVFormat.OutputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/amr.c")]
    public override string name {
        public get {
            return "amr";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/amr.c")]
    public override string long_name {
        public get {
            return "3GPP AMR";

        }

    }

    [CCode (cname="mime_type",cheader_filename="subprojects/ffmpeg/libavformat/amr.c")]
    public override string mime_type {
        public get {
            return "audio/amr";

        }

    }

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/amr.c")]
    public override string extensions {
        public get {
            return "amr";

        }

    }

    [CCode (cname="audio_codec",cheader_filename="subprojects/ffmpeg/libavformat/amr.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.AMR_NB;

        }

    }

    [CCode (cname="video_codec",cheader_filename="subprojects/ffmpeg/libavformat/amr.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.NONE;

        }

    }

    [CCode (cname="amr_write_header",cheader_filename="subprojects/ffmpeg/libavformat/amr.c")]
    public override int write_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="amr_write_packet",cheader_filename="subprojects/ffmpeg/libavformat/amr.c")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/amr.c")]
    public override LibAVFormat.FormatFlags1 flags {
        public get {
            return LibAVFormat.FormatFlags1.NO_TIMESTAMPS;

        }

    }
}
#endif

} // namespace LibAVFormat
