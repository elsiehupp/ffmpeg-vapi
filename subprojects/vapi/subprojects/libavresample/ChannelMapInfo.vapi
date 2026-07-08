/***********************************************************
Copyright (c) 2012 Justin Ruggles <justin.ruggles@gmail.com>

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
namespace LibAVResample {

[CCode (cname="struct ChannelMapInfo",cheader_filename="subprojects/ffmpeg/libavresample/internal.h")]
[Compact]
internal class LibAVResample.ChannelMapInfo {

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libavresample/avresample.h")]
    public const size_t AVRESAMPLE_MAX_CHANNELS; // 32

    /***********************************************************
    source index of each output channel, -1 if not remapped
    ***********************************************************/
    [CCode (cname="")]
    internal int channel_map[AVRESAMPLE_MAX_CHANNELS];

    /***********************************************************
    remap needed
    ***********************************************************/
    [CCode (cname="")]
    internal int do_remap;

    /***********************************************************
    dest index to copy from
    ***********************************************************/
    [CCode (cname="")]
    internal int channel_copy[AVRESAMPLE_MAX_CHANNELS];

    /***********************************************************
    copy needed
    ***********************************************************/
    [CCode (cname="")]
    internal int do_copy;

    /***********************************************************
    dest index to zero
    ***********************************************************/
    [CCode (cname="")]
    internal int channel_zero[AVRESAMPLE_MAX_CHANNELS];

    /***********************************************************
    zeroing needed
    ***********************************************************/
    [CCode (cname="")]
    internal int do_zero;

    /***********************************************************
    dest index of each input channel
    ***********************************************************/
    [CCode (cname="")]
    internal int input_map[AVRESAMPLE_MAX_CHANNELS];
}

} // namespace LibAVResample
