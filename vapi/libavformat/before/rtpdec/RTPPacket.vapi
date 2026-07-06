/***********************************************************
@brief RTP demuxer definitions
@copyright 2002 Fabrice Bellard
@copyright 2006 Ryan Martell <rdm4@martellventures.com>
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

[CCode (cname="struct RTPPacket",cheader_filename="subprojects/ffmpeg/libavformat/rtpdec.h")]
[Compact]
public class RTPPacket {
    [CCode (cname="")]
    public uint16 seq;

    [CCode (cname="")]
    public uint8[] buffer;

    [CCode (cname="")]
    public int len;

    [CCode (cname="")]
    public int64 recvtime;

    [CCode (cname="")]
    public RTPPacket? next;
}

} // namespace LibAVFormat
