/***********************************************************
Copyright (C) 2011-2013 Michael Niedermayer (michaelni@gmx.at)

This file is part of libswresample

libswresample is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

libswresample is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with libswresample; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
***********************************************************/
namespace LibSoftwareResample {

[CCode (cname="struct AudioData",cheader_filename="subprojects/ffmpeg/libswresample/swresample_internal.h")]
[Compact]
internal class LibSoftwareResample.AudioData {
    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/swresample_internal.h")]
    internal const size_t SWR_CH_MAX; // 64

    /***********************************************************
    samples buffer per channel
    ***********************************************************/
    [CCode (cname="")]
    internal uint8[] ch[SWR_CH_MAX];

    /***********************************************************
    samples buffer
    ***********************************************************/
    [CCode (cname="")]
    internal uint8[] data;

    /***********************************************************
    number of channels
    ***********************************************************/
    [CCode (cname="")]
    internal int ch_count;

    /***********************************************************
    bytes per sample
    ***********************************************************/
    [CCode (cname="")]
    internal int bps;

    /***********************************************************
    number of samples
    ***********************************************************/
    [CCode (cname="")]
    internal int count;

    /***********************************************************
    1 if planar audio, 0 otherwise
    ***********************************************************/
    [CCode (cname="")]
    internal int planar;

    /***********************************************************
    sample format
    ***********************************************************/
    [CCode (cname="")]
    internal AVSampleFormat fmt;

    [CCode (cname="",cheader_filename="subprojects/ffmpeg/libswresample/swresample_internal.h")]
    //  av_warn_unused_result
    internal int swri_realloc_audio (
        LibSoftwareResample.AudioData? a,
        int count
    );

}

} // namespace LibSoftwareResample
