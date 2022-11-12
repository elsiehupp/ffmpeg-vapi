/***********************************************************
@brief Tiertex Limited SEQ File Demuxer
@copyright 2006 Gregory Montoir (cyx@users.sourceforge.net)
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
@file Tiertex Limited SEQ file demuxer
***********************************************************/

[CCode (cname="struct SeqDemuxContext", cheader_filename="")]
public struct TiertexSEQDemuxerPrivateData { }

[CCode (cname="ff_tiertexseq_demuxer", cheader_filename="")]
public class TiertexSEQDemuxer : AVInputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "tiertexseq";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "Tiertex Limited SEQ";
        }
    }

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (TiertexSEQDemuxerPrivateData);
        }
    }

    [CCode (cname="seq_probe", cheader_filename="")]
    public override int read_probe (
        AVProbeData format_context
    );

    [CCode (cname="seq_read_header", cheader_filename="")]
    public override int read_header (
        AVFormatContext format_context
    );

    [CCode (cname="seq_read_packet", cheader_filename="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="seq_read_close", cheader_filename="")]
    public override int read_close (
        AVFormatContext format_context
    );
}

} // namespace LibAVFormat
