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
@copyright 2011 Justin Ruggles
***********************************************************/
namespace LibAVFormat {

/***********************************************************
@file CRI ADX demuxer
***********************************************************/

[CCode (cname="struct ADXDemuxerContext",cheader_filename="subprojects/ffmpeg/libavformat/adxdec.c")]
[Compact]
public class ADXDemuxerPrivateData { }

[CCode (cname="ff_adx_demuxer",cheader_filename="subprojects/ffmpeg/libavformat/adxdec.c")]
public class ADXDemuxer : LibAVFormat.InputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/adxdec.c")]
    public override string name {
        public get {
            return "adx";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/adxdec.c")]
    public override string long_name {
        public get {
            return "CRI ADX";

        }

    }

    [CCode (cname="adx_probe",cheader_filename="subprojects/ffmpeg/libavformat/adxdec.c")]
    public override int read_probe (
        LibAVFormat.ProbeData format_context
    );

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/adxdec.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (ADXDemuxerPrivateData);

        }

    }

    [CCode (cname="adx_read_header",cheader_filename="subprojects/ffmpeg/libavformat/adxdec.c")]
    public override int read_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="adx_read_packet",cheader_filename="subprojects/ffmpeg/libavformat/adxdec.c")]
    public override int read_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="extensions",cheader_filename="subprojects/ffmpeg/libavformat/adxdec.c")]
    public override string extensions {
        public get {
            return "adx";

        }

    }

    [CCode (cname="raw_codec_id",cheader_filename="subprojects/ffmpeg/libavformat/adxdec.c")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.ADPCM_ADX;

        }

    }

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/adxdec.c")]
    public override LibAVFormat.FormatFlags1 flags {
        public get {
            return LibAVFormat.FormatFlags1.USE_GENERIC_INDEX;

        }

    }
}

} // namespace LibAVFormat
