/***********************************************************
@brief Creative Voice File demuxer.
@copyright 2006 Aurelien Jacobs <aurel@gnuage.org>
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

[CCode (cname="ff_voc_demuxer",cheader_filename="subprojects/ffmpeg/libavformat/vocdec.c")]
public class VOCDemuxer : LibAVFormat.InputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/vocdec.c")]
    public override string name {
        public get {
            return "voc";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/vocdec.c")]
    public override string long_name {
        public get {
            return "Creative Voice";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/vocdec.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VocDecContext);

        }

    }

    [CCode (cname="voc_probe",cheader_filename="subprojects/ffmpeg/libavformat/vocdec.c")]
    public override int read_probe (
        LibAVFormat.ProbeData format_context
    );

    [CCode (cname="voc_read_header",cheader_filename="subprojects/ffmpeg/libavformat/vocdec.c")]
    public override int read_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="voc_read_packet",cheader_filename="subprojects/ffmpeg/libavformat/vocdec.c")]
    public override int read_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="voc_read_seek",cheader_filename="subprojects/ffmpeg/libavformat/vocdec.c")]
    public override int read_seek (
        LibAVFormat.FormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="codec_tag")]
    public override AVCodecTag[] codec_tag_list {
        public get {
            return {
                ff_voc_codec_tags,
                0
            };

        }

    }

}

} // namespace LibAVFormat
