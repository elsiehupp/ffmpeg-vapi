/***********************************************************
Brute Force & Ignorance (BFI) demuxer
@copyright 2008 Sisir Koppaka
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
@file @brief Brute Force & Ignorance (.bfi) file demuxer
@author Sisir Koppaka ( sisir.koppaka at gmail dot com )
@see http://wiki.multimedia.cx/index.php?title=BFI
***********************************************************/

[CCode (cname="struct BFIContext", cheader_filename="")]
public struct BFIDemuxerPrivateData { }

[CCode (cname="ff_bfi_demuxer", cheader_filename="")]
public class BFIDemuxer : AVInputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "bfi";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "Brute Force & Ignorance";
        }
    }

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (BFIDemuxerPrivateData);
        }
    }

    [CCode (cname="bfi_probe", cheader_filename="")]
    public override int read_probe (
        AVProbeData format_context
    );

    [CCode (cname="bfi_read_header", cheader_filename="")]
    public override int read_header (
        AVFormatContext format_context
    );

    [CCode (cname="bfi_read_packet", cheader_filename="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
}

} // namespace LibAVFormat
