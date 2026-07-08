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

[CCode (cname="struct AVCodecParser",cheader_filename="subprojects/ffmpeg/libavcodec/avcodec.h")]
public abstract class LibAVCodec.CodecParser {
    /***********************************************************
    @brief Several codec IDs are permitted
    ***********************************************************/
    [CCode (cname="codec_ids")]
    public LibAVCodec.CodecID codec_ids[7];

#if FF_API_PARSER_PRIVATE
    /*****************************************************************
    All fields below this line are not part of the public API. They
    may not be used outside of libavcodec and can be changed and
    removed at will.
    New public fields should be added right above.
    *****************************************************************/
    [CCode (cname="priv_data_size")]
    internal abstract size_t priv_data_size { public get; }

    internal delegate int ParserInitDelegate (
        CodecParserContext parser_context
    );

    [CCode (cname="parser_init")]
    internal ParserInitDelegate? parser_init;

    internal delegate int ParserParseDelegate (
        CodecParserContext parser_context,
        CodecContext avctx,
        out uint8[] poutbuf,
        out int poutbuf_size,
        uint8[] buffer,
        int buf_size
    );

    /***********************************************************
    @brief This callback never returns an error. A negative value means
    that the frame start was in a previous packet.
    ***********************************************************/
    [CCode (cname="parser_parse")]
    internal ParserParseDelegate? parser_parse;

    internal delegate void ParserCloseDelegate (
        CodecParserContext parser_context
    );

    [CCode (cname="parser_close")]
    internal ParserCloseDelegate? parser_close;

    internal delegate int ParserSplitDelegate (
        CodecContext avctx,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="split")]
    internal ParserSplitDelegate? split;
#endif

    [CCode (cname="next")]
    public CodecParser? next;

    /***********************************************************
    @brief Iterate over all registered codec parsers.

    @param opaque a pointer where LibAVCodec will store the
    iteration state. Must point to null to start the
    iteration.

    @return the next registered codec parser or null when the
    iteration is finished
    ***********************************************************/
    [CCode (cname="av_parser_iterate",cheader_filename="subprojects/ffmpeg/libavcodec/avcodec.h")]
    public CodecParser av_parser_iterate (
        out void *opaque
    );

}

} // namespace LibAVCodec
