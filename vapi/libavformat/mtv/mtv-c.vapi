/***********************************************************
@brief Mtv demuxer
@copyright 2006 Reynaldo H. Verdejo Pinochet
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
@file MTV demuxer.
***********************************************************/

[CCode (cname="struct MTVDemuxContext",cheader_filename="subprojects/ffmpeg/libavformat/mtv.c")]
[Compact]
public class MTVDemuxerPrivateData { }

[CCode (cname="ff_mtv_demuxer",cheader_filename="subprojects/ffmpeg/libavformat/mtv.c")]
public class MTVDemuxer : LibAVFormat.InputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/mtv.c")]
    public override string name {
        public get {
            return "mtv";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/mtv.c")]
    public override string long_name {
        public get {
            return "MTV";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/mtv.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MTVDemuxerPrivateData);

        }

    }

    [CCode (cname="mtv_probe",cheader_filename="subprojects/ffmpeg/libavformat/mtv.c")]
    public override int read_probe (
        LibAVFormat.ProbeData format_context
    );

    [CCode (cname="mtv_read_header",cheader_filename="subprojects/ffmpeg/libavformat/mtv.c")]
    public override int read_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="mtv_read_packet",cheader_filename="subprojects/ffmpeg/libavformat/mtv.c")]
    public override int read_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

}

} // namespace LibAVFormat
