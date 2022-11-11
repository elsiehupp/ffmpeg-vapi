/***********************************************************
Bethsoft VID format Demuxer
@copyright 2007 Nicholas Tung
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

namespace LibAVFormat {

/***********************************************************
@file @brief Bethesda Softworks VID (.vid) file demuxer
@author Nicholas Tung [ntung (at. ntung com] (2007-03)
@see http://wiki.multimedia.cx/index.php?title=Bethsoft_VID
@see http://www.svatopluk.com/andux/docs/dfvid.html
***********************************************************/

[CCode (cname="ff_bethsoftvid_demuxer", cheader="")]
public class BethSoftVIDDemuxer : AVInputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "bethsoftvid";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "Bethesda Softworks VID";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (BVID_DemuxContext);
        }
    }
    [CCode (cname="vid_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="vid_read_header", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );
    [CCode (cname="vid_read_packet", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    [CCode (cname="vid_read_close", cheader="")]
    public override int read_close (
        AVFormatContext format_context
    );
}

} // namespace LibAVFormat
