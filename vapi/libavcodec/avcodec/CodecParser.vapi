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

public delegate int ParserInitDelegate (
    CodecParserContext s
);

public delegate int ParserParseDelegate (
    CodecParserContext s,
    CodecContext avctx,
    out uint8[] poutbuf,
    out int poutbuf_size,
    uint8[] buffer,
    int buf_size
);

public delegate void ParserCloseDelegate (
    CodecParserContext s
);

public delegate int ParserSplitDelegate (
    CodecContext avctx,
    uint8[] buffer,
    int buf_size
);

[CCode (cname="struct AVCodecParser",cheader_filename="subprojects/ffmpeg/libavcodec/avcodec.h")]
public abstract class CodecParser {
    /***********************************************************
    @brief Several codec IDs are permitted
    ***********************************************************/
    [CCode (cname="codec_ids")]
    public int codec_ids[5];

    [CCode (cname="priv_data_size")]
    public abstract size_t priv_data_size { public get; }

    [CCode (cname="parser_init")]
    public ParserInitDelegate parser_init;

    /***********************************************************
    @brief This callback never returns an error. A negative value means
    that the frame start was in a previous packet.
    ***********************************************************/
    [CCode (cname="parser_parse")]
    public ParserParseDelegate parser_parse;

    [CCode (cname="parser_close")]
    public ParserCloseDelegate parser_close;

    [CCode (cname="split")]
    public ParserSplitDelegate split;

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













/***********************************************************
@defgroup lavc_parsing Frame parsing
@{
***********************************************************/

public struct AVCodecParser {
#if FF_API_PARSER_CODECID
    int codec_ids[7]; /* several codec IDs are permitted */
#else
    enum LibAVCodec.CodecID codec_ids[7]; /* several codec IDs are permitted */
#endif
#if FF_API_PARSER_PRIVATE
    /*****************************************************************
    All fields below this line are not part of the public API. They
    may not be used outside of libavcodec and can be changed and
    removed at will.
    New public fields should be added right above.
     *****************************************************************
    ***********************************************************/
    attribute_deprecated
    int priv_data_size;
    attribute_deprecated
    int (*parser_init)(AVCodecParserContext *s);
    /* This callback never returns an error, a negative value means that
    the frame start was in a previous packet. */
    attribute_deprecated
    int (*parser_parse)(AVCodecParserContext *s,
                        AVCodecContext *avctx,
                        const out uint8[] poutbuf, int *poutbuf_size,
                        const uint8[] buf, int buf_size);
    attribute_deprecated
    void (*parser_close)(AVCodecParserContext *s);
    attribute_deprecated
    int (*split)(AVCodecContext *avctx, const uint8[] buf, int buf_size);
#endif
} AVCodecParser;

/***********************************************************
@}
***********************************************************/


/***********************************************************
@defgroup lavc_parsing Frame parsing
@{
***********************************************************/

/***********************************************************
Iterate over all registered codec parsers.

@param opaque a pointer where libavcodec will store the iteration state. Must
              point to NULL to start the iteration.

@return the next registered codec parser or NULL when the iteration is
        finished
***********************************************************/
AVCodecParser? av_parser_iterate (void **opaque);

/***********************************************************
@}
***********************************************************/
