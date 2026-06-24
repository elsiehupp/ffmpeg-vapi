/***********************************************************
@brief RAW demuxers
@copyright 2001 Fabrice Bellard
@copyright 2005 Alex Beregszaszi
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

public abstract class RawOptionsClass : LibAVUtil.Class {

    [CCode (cname="option")]
    public override LibAVUtil.Option[] options {
        public get {
            return {
                new LibAVUtil.IntOption () {
                    name = "raw_packet_size",
                    short_help_text = "",
                    offset = offsetof (
                        FFRawDemuxerContext,
                        raw_packet_size
                    ),
                    default_value = RAW_PACKET_SIZE,
                    minimum_value = 1,
                    maximum_value = int.MAX,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
                },
                {
                    NULL
                }

            };

        }

    }

}

#if CONFIG_DATA_DEMUXER
//  FF_RAW_DEMUXER_CLASS (raw_data)

[CCode (cname="ff_data_demuxer",cheader_filename="subprojects/ffmpeg/libavformat/rawdec.c")]
public class DataDemuxer : AVInputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/rawdec.c")]
    public override string name {
        public get {
            return "data";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/rawdec.c")]
    public override string long_name {
        public get {
            return "raw data";

        }

    }

    [CCode (cname="ff_raw_data_read_header",cheader_filename="subprojects/ffmpeg/libavformat/rawdec.c")]
    public override int read_header (
        AVFormatContext format_context
    );

    [CCode (cname="ff_raw_read_partial_packet",cheader_filename="subprojects/ffmpeg/libavformat/rawdec.c")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="raw_codec_id",cheader_filename="subprojects/ffmpeg/libavformat/rawdec.c")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.NONE;

        }

    }

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/rawdec.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.NO_TIMESTAMPS;

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/rawdec.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (FFRawDemuxerContext);

        }

    }
    //  .priv_class = raw_data_demuxer_class;
}
#endif

} // namespace LibAVFormat
