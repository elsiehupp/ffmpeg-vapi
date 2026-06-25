/***********************************************************
Bethsoft VID format Demuxer
@copyright 2007 Nicholas Tung
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
@file @brief Bethesda Softworks VID (.vid) file demuxer
@author Nicholas Tung [ntung (at. ntung com] (2007-03)
@see http://wiki.multimedia.cx/index.php?title=Bethsoft_VID
@see http://www.svatopluk.com/andux/docs/dfvid.html
***********************************************************/

[CCode (cname="struct BVID_DemuxContext",cheader_filename="subprojects/ffmpeg/libavformat/bethsoftvid.c")]
[Compact]
public class BethSoftVIDDemuxerPrivateData { }

[CCode (cname="ff_bethsoftvid_demuxer",cheader_filename="subprojects/ffmpeg/libavformat/bethsoftvid.c")]
public class BethSoftVIDDemuxer : LibAVFormat.InputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/bethsoftvid.c")]
    public override string name {
        public get {
            return "bethsoftvid";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/bethsoftvid.c")]
    public override string long_name {
        public get {
            return "Bethesda Softworks VID";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/bethsoftvid.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (BethSoftVIDDemuxerPrivateData);

        }

    }

    [CCode (cname="vid_probe",cheader_filename="subprojects/ffmpeg/libavformat/bethsoftvid.c")]
    public override int read_probe (
        LibAVFormat.ProbeData format_context
    );

    [CCode (cname="vid_read_header",cheader_filename="subprojects/ffmpeg/libavformat/bethsoftvid.c")]
    public override int read_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="vid_read_packet",cheader_filename="subprojects/ffmpeg/libavformat/bethsoftvid.c")]
    public override int read_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="vid_read_close",cheader_filename="subprojects/ffmpeg/libavformat/bethsoftvid.c")]
    public override int read_close (
        LibAVFormat.FormatContext format_context
    );

}

} // namespace LibAVFormat
