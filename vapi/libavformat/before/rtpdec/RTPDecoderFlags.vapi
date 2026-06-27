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

[Flags]
[CCode (cheader_filename="subprojects/ffmpeg/libformat/rtpdec.h")]
public enum RTPDecoderFlags {
    /***********************************************************
    @brief RTP packet contains a keyframe
    ***********************************************************/
    [CCode (cname="RTP_FLAG_KEY")]
    KEY,

    /***********************************************************
    @brief RTP marker bit was set for this packet
    ***********************************************************/
    [CCode (cname="RTP_FLAG_MARKER")]
    MARKER;
}

} // namespace LibAVFormat
