/***********************************************************
@copyright 2001 Fabrice Bellard

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

namespace LibAVCodec {
using LibAVUtil;

/***********************************************************
@file
@ingroup libavc
LibAVCodec external API header
***********************************************************/

/***********************************************************
@defgroup lavc_parsing Frame parsing
***********************************************************/

#if FF_API_OLD_BSF
[CCode (cname="struct AVBitStreamFilterContext", cheader_filename="libavcodec/avcodec.h")]
public struct BitStreamFilterContextOld {
    [CCode (cname="priv_data")]
    public void *priv_data;
    [CCode (cname="filter")]
    public BitStreamFilter filter;
    [CCode (cname="parser")]
    public CodecParserContext[] parser;
    [CCode (cname="next")]
    public BitStreamFilterContextOld *next;

    /***********************************************************
    @brief Internal default arguments, used if null is passed to av_bitstream_filter_filter ().
    Not for access by library users.
    ***********************************************************/
    //  [CCode (cname="args")]
    //  public string args;
}
#endif

} // namespace LibAVCodec
