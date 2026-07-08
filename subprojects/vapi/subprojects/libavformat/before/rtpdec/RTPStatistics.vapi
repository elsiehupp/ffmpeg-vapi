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

/***********************************************************
@brief TYhese statistics are used for rtcp receiver reports...
***********************************************************/
[CCode (cname="struct RTPStatistics",cheader_filename="subprojects/ffmpeg/libavformat/rtpdec.h")]
[Compact]
public class RTPStatistics {
    /***********************************************************
    @brief Highest sequence number seen
    ***********************************************************/
    [CCode (cname="")]
    public uint16 max_seq;

    /***********************************************************
    @brief Shifted count of sequence number cycles
    ***********************************************************/
    [CCode (cname="")]
    public uint32 cycles;

    /***********************************************************
    @brief Base sequence number
    ***********************************************************/
    [CCode (cname="")]
    public uint32 base_seq;

    /***********************************************************
    @brief Last bad sequence number + 1
    ***********************************************************/
    [CCode (cname="")]
    public uint32 bad_seq;

    /***********************************************************
    @brief Sequence packets till source is valid
    ***********************************************************/
    [CCode (cname="")]
    public int probation;

    /***********************************************************
    @brief Packets received
    ***********************************************************/
    [CCode (cname="")]
    public uint32 received;

    /***********************************************************
    @brief Packets expected in last interval
    ***********************************************************/
    [CCode (cname="")]
    public uint32 expected_prior;

    /***********************************************************
    @brief Packets received in last interval
    ***********************************************************/
    [CCode (cname="")]
    public uint32 received_prior;

    /***********************************************************
    @brief Relative transit time for previous packet
    ***********************************************************/
    [CCode (cname="")]
    public uint32 transit;

    /***********************************************************
    @brief Estimated jitter
    ***********************************************************/
    [CCode (cname="")]
    public uint32 jitter;
}

} // namespace LibAVFormat
