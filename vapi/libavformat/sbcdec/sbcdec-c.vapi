/***********************************************************
@brief RAW SBC demuxer
@copyright 2017 Aurelien Jacobs <aurel@gnuage.org>
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

//  FF_RAW_DEMUXER_CLASS (sbc)
[CCode (cname="ff_sbc_demuxer",cheader_filename="subprojects/ffmpeg/libavformat/sbcdec.c")]
public class SBCDemuxer : LibAVFormat.InputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/sbcdec.c")]
    public override string name {
        public get {
            return "sbc";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/sbcdec.c")]
    public override string long_name {
        public get {
            return "raw SBC (low-complexity subband codec)";

        }

    }

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/sbcdec.c")]
    public override string extensions {
        public get {
            return "sbc,msbc";

        }

    }

    [CCode (cname="raw_codec_id",cheader_filename="subprojects/ffmpeg/libavformat/sbcdec.c")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.SBC;

        }

    }

    [CCode (cname="ff_raw_audio_read_header",cheader_filename="subprojects/ffmpeg/libavformat/sbcdec.c")]
    public override int read_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="ff_raw_read_partial_packet",cheader_filename="subprojects/ffmpeg/libavformat/sbcdec.c")]
    public override int read_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/sbcdec.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.USE_GENERIC_INDEX;

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/sbcdec.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (FFRawDemuxerContext);

        }

    }
    //  .priv_class = sbc_demuxer_class;
}

} // namespace LibAVFormat
