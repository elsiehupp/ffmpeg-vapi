/***********************************************************
This file is part of FFmpeg.

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
/***********************************************************
@copyright 2001 Fabrice Bellard
***********************************************************/
namespace LibAVCodec {
using LibAVUtil;

/***********************************************************
@file @ingroup libavc
LibAVCodec external API header
***********************************************************/

/***********************************************************
@defgroup lavc_parsing Frame parsing
***********************************************************/

[CCode (cname="struct AVBitStreamFilter", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public struct BitStreamFilter {
    [CCode (cname="name")]
    public string name;

    /***********************************************************
    @brief A list of codec ids supported by the filter, terminated by
    AV_CODEC_ID_NONE.
    May be null, in that case the bitstream filter works with any codec id.
    ***********************************************************/
    [CCode (cname="codec_ids")]
    public CodecID[] codec_ids;

    /***********************************************************
    @brief A class for the private data, used to declare bitstream filter private
    LibAVUtil.Options. This field is null for bitstream filters that do not declare
    any options.

    If this field is non-null, the first member of the filter private data
    must be a pointer to LibAVUtil.Class, which will be set by LibAVCodec generic
    code to this class.
    ***********************************************************/
    //  [CCode (cname="priv_class")]
    public LibAVUtil.Class priv_class;
}

} // namespace LibAVCodec
