/***********************************************************
@brief SoX native format muxer
@copyright 2009 Daniel Verkamp <daniel@drv.nu>

Based on libSoX sox-fmt.c
@copyright 2008 robs@users.sourceforge.net
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

/***********************************************************
@file SoX native format muxer
@author Daniel Verkamp
@see http://wiki.multimedia.cx/index.php?title=SoX_native_intermediate_format
***********************************************************/

[CCode (cname="struct SoXContext",cheader_filename="subprojects/ffmpeg/libavformat/soxenc.c")]
[Compact]
public class SoXMuxerPrivateData { }

[CCode (cname="ff_sox_muxer",cheader_filename="subprojects/ffmpeg/libavformat/soxenc.c")]
public class SoXMuxer : LibAVFormat.OutputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/soxenc.c")]
    public override string name {
        public get {
            return "sox";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/soxenc.c")]
    public override string long_name {
        public get {
            return "SoX native";

        }

    }

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/soxenc.c")]
    public override string extensions {
        public get {
            return "sox";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/soxenc.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (SoXMuxerPrivateData);

        }

    }

    [CCode (cname="audio_codec",cheader_filename="subprojects/ffmpeg/libavformat/soxenc.c")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.PCM_S32LE;

        }

    }

    [CCode (cname="video_codec",cheader_filename="subprojects/ffmpeg/libavformat/soxenc.c")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.NONE;

        }

    }

    [CCode (cname="sox_write_header",cheader_filename="subprojects/ffmpeg/libavformat/soxenc.c")]
    public override int write_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="ff_raw_write_packet",cheader_filename="subprojects/ffmpeg/libavformat/soxenc.c")]
    public override int write_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="sox_write_trailer",cheader_filename="subprojects/ffmpeg/libavformat/soxenc.c")]
    public override int write_trailer (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/soxenc.c")]
    public override LibAVFormat.FormatFlags1 flags {
        public get {
            return LibAVFormat.FormatFlags1.NO_TIMESTAMPS;

        }

    }
}

} // namespace LibAVFormat
