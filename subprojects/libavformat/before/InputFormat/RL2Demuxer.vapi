/***********************************************************
@brief RL2 Format Demuxer
@copyright 2008 Sascha Sommer (saschasommer@freenet.de)
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
@brief RL2 file demuxer
@file
@author Sascha Sommer (saschasommer@freenet.de)
@see http://wiki.multimedia.cx/index.php?title=RL2

extradata:
2 byte le initial drawing offset within 320x200 viewport
4 byte le number of used colors
256 * 3 bytes rgb palette
optional background_frame
***********************************************************/

[CCode (cname="struct Rl2DemuxContext",cheader_filename="subprojects/ffmpeg/libavformat/rl2.c")]
[Compact]
public class RL2DemuxerPrivateData { }

[CCode (cname="ff_rl2_demuxer",cheader_filename="subprojects/ffmpeg/libavformat/rl2.c")]
public class RL2Demuxer : LibAVFormat.InputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/rl2.c")]
    public override string name {
        public get {
            return "rl2";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/rl2.c")]
    public override string long_name {
        public get {
            return "RL2";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/rl2.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (RL2DemuxerPrivateData);

        }

    }

    [CCode (cname="rl2_probe",cheader_filename="subprojects/ffmpeg/libavformat/rl2.c")]
    public override int read_probe (
        LibAVFormat.ProbeData format_context
    );

    [CCode (cname="rl2_read_header",cheader_filename="subprojects/ffmpeg/libavformat/rl2.c")]
    public override int read_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="rl2_read_packet",cheader_filename="subprojects/ffmpeg/libavformat/rl2.c")]
    public override int read_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="rl2_read_seek",cheader_filename="subprojects/ffmpeg/libavformat/rl2.c")]
    public override int read_seek (
        LibAVFormat.FormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

}

} // namespace LibAVFormat
