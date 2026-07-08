/***********************************************************
filter layer
Copyright (c) 2007 Bobby Bingham

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

/***********************************************************
@file
@ingroup lavfi
Main libavfilter public API header
***********************************************************/
namespace LibAVFilter {

/***********************************************************
@defgroup lavfi libavfilter
Graph-based frame editing library.

@{
***********************************************************/

[Flags]
[CCode (cprefix="AVFILTER_FLAG_",cheader_filename="subprojects/ffmpeg/libavfilter/avfilter.h")]
public enum LibAVFilter.FilterFlags {
    /***********************************************************
    The number of the filter inputs is not determined just by LibAVFilter.Filter.inputs.
    The filter might add additional inputs during initialization depending on the
    options supplied to it.
    ***********************************************************/
    DYNAMIC_INPUTS, // (1 << 0)

    /***********************************************************
    The number of the filter outputs is not determined just by LibAVFilter.Filter.outputs.
    The filter might add additional outputs during initialization depending on
    the options supplied to it.
    ***********************************************************/
    DYNAMIC_OUTPUTS, // (1 << 1)

    /***********************************************************
    The filter supports multithreading by splitting frames into multiple parts
    and processing them concurrently.
    ***********************************************************/
    SLICE_THREADS, // (1 << 2)

    /***********************************************************
    Some filters support a generic "enable" expression option that can be used
    to enable or disable a filter in the timeline. Filters supporting this
    option have this flag set. When the enable expression is false, the default
    no-op filter_frame () function is called in place of the filter_frame ()
    callback defined on each input pad, thus the frame is passed unchanged to
    the next filters.
    ***********************************************************/
    SUPPORT_TIMELINE_GENERIC, // (1 << 16)

    /***********************************************************
    Same as LibAVFilter.FilterFlags.SUPPORT_TIMELINE_GENERIC, except that the filter will
    have its filter_frame () callback (s) called as usual even when the enable
    expression is false. The filter will disable filtering within the
    filter_frame () callback (s) itself, for example executing code depending on
    the LibAVFilter.FilterContext->is_disabled value.
    ***********************************************************/
    SUPPORT_TIMELINE_INTERNAL, // (1 << 17)

    /***********************************************************
    Handy mask to test whether the filter supports or no the timeline feature
    (internally or generically).
    ***********************************************************/
    SUPPORT_TIMELINE; // (LibAVFilter.FilterFlags.SUPPORT_TIMELINE_GENERIC | LibAVFilter.FilterFlags.SUPPORT_TIMELINE_INTERNAL)
}

/***********************************************************
@}
***********************************************************/

} // namespace LibAVFilter
