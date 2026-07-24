/***********************************************************
@brief LOAS AudioSyncStream demuxer
@copyright 2008 Michael Niedermayer <michaelni@gmx.at>
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

//  FF_RAW_DEMUXER_CLASS (loas)
[CCode (cname="ff_loas_demuxer",cheader_filename="subprojects/ffmpeg/libavformat/loasdec.c")]
public class LOASDemuxer : LibAVFormat.InputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/loasdec.c")]
    public override string name {
        public get {
            return "loas";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/loasdec.c")]
    public override string long_name {
        public get {
            return "LOAS AudioSyncStream";

        }

    }

    [CCode (cname="loas_probe",cheader_filename="subprojects/ffmpeg/libavformat/loasdec.c")]
    public override int read_probe (
        LibAVFormat.ProbeData format_context
    );

    [CCode (cname="loas_read_header",cheader_filename="subprojects/ffmpeg/libavformat/loasdec.c")]
    public override int read_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="ff_raw_read_partial_packet",cheader_filename="subprojects/ffmpeg/libavformat/loasdec.c")]
    public override int read_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/loasdec.c")]
    public override LibAVFormat.FormatFlags1 flags {
        public get {
            return LibAVFormat.FormatFlags1.USE_GENERIC_INDEX;

        }

    }

    [CCode (cname="raw_codec_id",cheader_filename="subprojects/ffmpeg/libavformat/loasdec.c")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.AAC_LATM;

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/loasdec.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (FFRawDemuxerContext);

        }

    }
    //  .priv_class = loas_demuxer_class;
}

} // namespace LibAVFormat
