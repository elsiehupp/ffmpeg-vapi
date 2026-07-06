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

/***********************************************************
LibAVFormat.StreamGroupLCEVC is meant to define the relation between video streams
and a data stream containing LCEVC enhancement layer NALUs.

No more than one stream of
@ref LibAVCodec.CodecParameters.codec_id "codec_id" AV_CODEC_ID_LCEVC shall be present.
***********************************************************/
[CCode (cname="struct AVStreamGroupLCEVC",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
[Compact]
public class LibAVFormat.StreamGroupLCEVC {
    [CCode (cname="av_class")]
    public LibAVUtil.Log.Class? av_class;

    /***********************************************************
    @brief Index of the LCEVC data stream in LibAVFormat.StreamGroup.
    ***********************************************************/
    [CCode (cname="lcevc_index")]
    public uint lcevc_index;

    /***********************************************************
    @brief Width of the final stream for presentation.
    ***********************************************************/
    [CCode (cname="width")]
    public int width;

    /***********************************************************
    @brief Height of the final image for presentation.
    ***********************************************************/
    [CCode (cname="height")]
    public int height;
}

} // namespace LibAVFormat
