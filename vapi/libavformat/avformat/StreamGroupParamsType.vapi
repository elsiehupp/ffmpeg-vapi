/***********************************************************
Copyright (c) 2001 Fabrice Bellard

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

namespace LibAVFormat {

/***********************************************************
@file
@ingroup libavf
Main libavformat public API header
***********************************************************/

[CCode (cname="enum AVStreamGroupParamsType",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
[Compact]
public enum LibAVFormat.StreamGroupParamsType {
    [CCode (cname="AV_STREAM_GROUP_PARAMS_NONE")]
    NONE,

    [CCode (cname="AV_STREAM_GROUP_PARAMS_IAMF_AUDIO_ELEMENT")]
    IAMF_AUDIO_ELEMENT,

    [CCode (cname="AV_STREAM_GROUP_PARAMS_IAMF_MIX_PRESENTATION")]
    IAMF_MIX_PRESENTATION,

    [CCode (cname="AV_STREAM_GROUP_PARAMS_TILE_GRID")]
    TILE_GRID,

    [CCode (cname="AV_STREAM_GROUP_PARAMS_LCEVC")]
    LCEVC;


    /***********************************************************
    @defgroup lavf_core Core functions
    @ingroup libavf

    Functions for querying libavformat capabilities, allocating core structures,
    etc.
    @{
    ***********************************************************/

    /***********************************************************
    @return a string identifying the stream group type, or NULL if unknown
    ***********************************************************/
    [CCode (cname="avformat_stream_group_name")]
    public static string avformat_stream_group_name (
        LibAVFormat.StreamGroupParamsType type
    );

    /***********************************************************
    @}
    ***********************************************************/

}

} // namespace LibAVFormat
