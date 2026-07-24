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

/***********************************************************
@brief Write and read amr data according to RFC3267, http://www.ietf.org/rfc/rfc3267.txt?number=3267

Only mono files are supported.
***********************************************************/
#if CONFIG_AMRWB_DEMUXER

[CCode (cname="ff_amrwb_demuxer",cheader_filename="subprojects/ffmpeg/libavformat/amr.c")]
public class AMRWBDemuxer : LibAVFormat.InputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/amr.c")]
    public override string name {
        public get {
            return "amrwb";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/amr.c")]
    public override string long_name {
        public get {
            return "raw AMR-WB";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/amr.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (AMRContext);

        }

    }

    [CCode (cname="amrwb_probe",cheader_filename="subprojects/ffmpeg/libavformat/amr.c")]
    public override int read_probe (
        LibAVFormat.ProbeData format_context
    );

    [CCode (cname="amrwb_read_header",cheader_filename="subprojects/ffmpeg/libavformat/amr.c")]
    public override int read_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="amr_read_packet",cheader_filename="subprojects/ffmpeg/libavformat/amr.c")]
    public override int read_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/amr.c")]
    public override LibAVFormat.FormatFlags1 flags {
        public get {
            return LibAVFormat.FormatFlags1.USE_GENERIC_INDEX;

        }

    }
}
#endif

} // namespace LibAVFormat
