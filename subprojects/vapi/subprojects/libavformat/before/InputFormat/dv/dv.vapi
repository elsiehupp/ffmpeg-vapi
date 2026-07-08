/***********************************************************
@brief General DV muxer/demuxer
@copyright 2003 Roman Shaposhnik

Many thanks to Dan Dennedy <dan@dennedy.org> for providing wealth
of DV technical info.

Raw DV format
@copyright 2002 Fabrice Bellard
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

[CCode (cname="struct DVDemuxContext",cheader_filename="subprojects/ffmpeg/libavformat/dv.h")]
[Compact]
public class DVDemuxContext {

    [CCode (cname="avpriv_dv_init_demux",cheader_filename="subprojects/ffmpeg/libavformat/dv.h")]
    public DVDemuxContext avpriv_dv_init_demux (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="avpriv_dv_get_packet",cheader_filename="subprojects/ffmpeg/libavformat/dv.h")]
    public int avpriv_dv_get_packet (
        DVDemuxContext demux_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="avpriv_dv_produce_packet",cheader_filename="subprojects/ffmpeg/libavformat/dv.h")]
    public int avpriv_dv_produce_packet (
        DVDemuxContext demux_context,
        LibAVCodec.Packet packet,
        uint8[] buffer,
        int arg,
        int64 arg_
    );

    [CCode (cname="ff_dv_offset_reset",cheader_filename="subprojects/ffmpeg/libavformat/dv.h")]
    public void ff_dv_offset_reset (
        DVDemuxContext demux_context,
        int64 frame_offset
    );

}

[CCode (cname="struct DVMuxContext",cheader_filename="subprojects/ffmpeg/libavformat/dv.h")]
[Compact]
public class DVMuxContext { }

} // namespace LibAVFormat
