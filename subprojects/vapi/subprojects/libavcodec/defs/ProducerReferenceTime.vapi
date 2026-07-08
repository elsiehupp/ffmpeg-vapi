/***********************************************************
@brief This file is part of FFmpeg.

FFmpeg is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

FFmpeg is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with FFmpeg; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
***********************************************************/
namespace LibAVCodec {

/***********************************************************
@file @ingroup libavc
Misc types and constants that do not belong anywhere else.
***********************************************************/

/***********************************************************
This structure supplies correlation between a packet
timestamp and a wall clock production time. The definition
follows the Producer Reference Time ('prft') as defined
in ISO/IEC 14496-12.
***********************************************************/
[CCode (cname="struct AVProducerReferenceTime",cheader_filename="subprojects/ffmpeg/libavcodec/defs.h")]
[Compact]
public class ProducerReferenceTime {
    /***********************************************************
    A UTC timestamp, in microseconds, since Unix epoch (e.g,
    av_gettime ()).
    ***********************************************************/
    [CCode (cname="")]
    public int64 wallclock;

    [CCode (cname="")]
    public int flags;
}

} // namespace LibAVCodec
