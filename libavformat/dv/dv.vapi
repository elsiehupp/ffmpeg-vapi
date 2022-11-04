/***********************************************************
General DV muxer/demuxer
Copyright (c) 2003 Roman Shaposhnik

Many thanks to Dan Dennedy <dan@dennedy.org> for providing wealth
of DV technical info.

Raw DV format
Copyright (c) 2002 Fabrice Bellard

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

public struct DVDemuxContext { }
DVDemuxContext* avpriv_dv_init_demux (AVFormatContext format_context);
int avpriv_dv_get_packet (DVDemuxContext demux_context, AVPacket packet);
int avpriv_dv_produce_packet (DVDemuxContext demux_context, AVPacket packet, uint8[] buffer, int arg, int64 arg_);
void ff_dv_offset_reset (DVDemuxContext demux_context, int64 frame_offset);

public struct DVMuxContext { }
