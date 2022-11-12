/***********************************************************
@brief Vividas VIV format Demuxer
@copyright 2012 Krzysztof Klinikowski
@copyright 2010 Andrzej Szombierski
based on vivparse @copyright 2007 Måns Rullgård
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
@file @brief Vividas VIV (.viv) file demuxer
@author Andrzej Szombierski [qq at kuku eu org] (2010-07)
@sa http://wiki.multimedia.cx/index.php?title=Vividas_VIV
***********************************************************/

[CCode (cname="struct VividasDemuxContext", cheader_filename="")]
public struct VividasDemuxerPrivateData { }

[CCode (cname="ff_vividas_demuxer", cheader_filename="")]
public class VividasDemuxer : AVInputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "vividas";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "Vividas VIV";
        }
    }

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VividasDemuxerPrivateData);
        }
    }

    [CCode (cname="viv_probe", cheader_filename="")]
    public override int read_probe (
        AVProbeData format_context
    );

    [CCode (cname="viv_read_header", cheader_filename="")]
    public override int read_header (
        AVFormatContext format_context
    );

    [CCode (cname="viv_read_packet", cheader_filename="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="viv_read_close", cheader_filename="")]
    public override int read_close (
        AVFormatContext format_context
    );

    [CCode (cname="viv_read_seek", cheader_filename="")]
    public override int read_seek (
        AVFormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );
}

} // namespace LibAVFormat
