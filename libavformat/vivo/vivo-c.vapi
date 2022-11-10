/***********************************************************
Vivo stream demuxer
@copyright 2009 Daniel Verkamp <daniel at drv.nu>
***********************************************************/
/***********************************************************
This file is part of FFmpeg.

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
@file @brief Vivo stream demuxer
@author Daniel Verkamp <daniel at drv.nu>
@sa http://wiki.multimedia.cx/index.php?title=Vivo
***********************************************************/

[CCode (cname="ff_vivo_demuxer", cheader="")]
public class InputDemuxer : AVInputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "vivo"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "Vivo"
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VivoContext);
        }
    }
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    ); // = vivo_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    ); // = vivo_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    ); // = vivo_read_packet,
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return ;
        }
    } // = "viv"
}
