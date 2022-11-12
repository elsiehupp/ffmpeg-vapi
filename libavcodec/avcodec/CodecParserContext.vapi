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

[CCode (cname="struct AVCodecParserContext", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public struct CodecParserContext {
    [CCode (cname="priv_data")]
    public void *priv_data;

    [CCode (cname="parser")]
    public CodecParser parser;

    /***********************************************************
    @brief Offset of the current frame
    ***********************************************************/
    [CCode (cname="frame_offset")]
    public int64 frame_offset;

    /***********************************************************
    @brief Current offset (incremented by each av_parser_parse ())
    ***********************************************************/
    [CCode (cname="cur_offset")]
    public int64 cur_offset;

    /***********************************************************
    @brief Affset of the next frame
    ***********************************************************/
    [CCode (cname="next_frame_offset")]
    public int64 next_frame_offset;

    /***********************************************************
    @brief Video info
    ***********************************************************/

    /***********************************************************
    @brief XXX: Put it back in CodecContext.
    ***********************************************************/
    [CCode (cname="pict_type")]
    public int pict_type;

    /***********************************************************
    @brief This field is used for proper frame duration computation in lavf.
    It signals, how much longer the frame duration of the current frame
    is compared to normal frame duration.

    frame_duration = (1 + repeat_pict) * time_base

    It is used by codecs like H.264 to display telecined material.

    XXX: Put it back in CodecContext.
    ***********************************************************/
    [CCode (cname="repeat_pict")]
    public int repeat_pict;

    /***********************************************************
    @brief pts of the current frame
    ***********************************************************/
    [CCode (cname="pts")]
    public int64 pts;

    /***********************************************************
    @brief dts of the current frame
    ***********************************************************/
    [CCode (cname="dts")]
    public int64 dts;

    /***********************************************************
    @brief Private data
    ***********************************************************/
    [CCode (cname="last_pts")]
    public int64 last_pts;

    [CCode (cname="last_dts")]
    public int64 last_dts;

    [CCode (cname="fetch_timestamp")]
    public int fetch_timestamp;

    [CCode (cname="AV_PARSER_PTS_NB", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public const int AV_PARSER_PTS_NB;

    [CCode (cname="cur_frame_start_index")]
    public int cur_frame_start_index;

    [CCode (cname="cur_frame_offset")]
    public int64 cur_frame_offset[AV_PARSER_PTS_NB];

    [CCode (cname="cur_frame_pts")]
    public int64 cur_frame_pts[AV_PARSER_PTS_NB];

    [CCode (cname="cur_frame_dts")]
    public int64 cur_frame_dts[AV_PARSER_PTS_NB];

    [CCode (cname="flags")]
    public ParserFlags flags;

    /***********************************************************
    @brief Byte offset from starting packet start
    ***********************************************************/
    [CCode (cname="offset")]
    public int64 offset;

    [CCode (cname="cur_frame_end")]
    public int64 cur_frame_end[AV_PARSER_PTS_NB];

    /***********************************************************
    @brief Set by parser to 1 for key frames and 0 for non-key frames.
    It is initialized to -1, so if the parser doesn't set this flag,
    old-style fallback using AV_PICTURE_TYPE_I picture type as key frames
    will be used.
    ***********************************************************/
    [CCode (cname="key_frame")]
    public int key_frame;

    /***********************************************************
    @brief Timestamp generation support
***********************************************************/

    /***********************************************************
    @brief Synchronization point for start of timestamp generation.

    Set to >0 for sync point, 0 for no sync point and <0 for undefined
    (default).

    For example, this corresponds to presence of H.264 buffering period
    SEI message.
    ***********************************************************/
    [CCode (cname="dts_sync_point")]
    public int dts_sync_point;

    /***********************************************************
    @brief Offset of the current timestamp against last timestamp sync point in
    units of CodecContext.time_base.

    Set to INT_MIN when dts_sync_point unused. Otherwise, it must
    contain a valid timestamp offset.

    Note that the timestamp of sync point has usually a nonzero
    dts_ref_dts_delta, which refers to the previous sync point. Offset of
    the next frame after timestamp sync point will be usually 1.

    For example, this corresponds to H.264 cpb_removal_delay.
    ***********************************************************/
    [CCode (cname="dts_ref_dts_delta")]
    public int dts_ref_dts_delta;

    /***********************************************************
    @brief Presentation delay of current frame in units of CodecContext.time_base.

    Set to INT_MIN when dts_sync_point unused. Otherwise, it must
    contain valid non-negative timestamp delta (presentation time of a frame
    must not lie in the past).

    This delay represents the difference between decoding and presentation
    time of the frame.

    For example, this corresponds to H.264 dpb_output_delay.
    ***********************************************************/
    [CCode (cname="pts_dts_delta")]
    public int pts_dts_delta;

    /***********************************************************
    @brief Position of the packet in file.

    Analogous to cur_frame_pts/dts
    ***********************************************************/
    [CCode (cname="cur_frame_pos")]
    public int64 cur_frame_pos[AV_PARSER_PTS_NB];

    /***********************************************************
    @brief Byte position of currently parsed frame in stream.
    ***********************************************************/
    [CCode (cname="pos")]
    public int64 pos;

    /***********************************************************
    @brief Previous frame byte position.
    ***********************************************************/
    [CCode (cname="last_pos")]
    public int64 last_pos;

    /***********************************************************
    @brief Duration of the current frame.
    For audio, this is in units of 1 / CodecContext.sample_rate.
    For all other types, this is in units of CodecContext.time_base.
    ***********************************************************/
    [CCode (cname="duration")]
    public int duration;

    [CCode (cname="field_order")]
    public FieldOrder field_order;

    /***********************************************************
    @brief Indicate whether a picture is coded as a frame, top field or bottom field.

    For example, H.264 field_pic_flag equal to 0 corresponds to
    PictureStructure.FRAME. An H.264 picture with field_pic_flag
    equal to 1 and bottom_field_flag equal to 0 corresponds to
    PictureStructure.TOP_FIELD.
    ***********************************************************/
    [CCode (cname="picture_structure")]
    public PictureStructure picture_structure;

    /***********************************************************
    @brief Picture number incremented in presentation or output order.
    This field may be reinitialized at the first picture of a new sequence.

    For example, this corresponds to H.264 PicOrderCnt.
    ***********************************************************/
    [CCode (cname="output_picture_number")]
    public int output_picture_number;

    /***********************************************************
    @brief Width of the decoded video intended for presentation.
    ***********************************************************/
    [CCode (cname="width")]
    public int width;

    /***********************************************************
    @brief Height of the decoded video intended for presentation.
    ***********************************************************/
    [CCode (cname="height")]
    public int height;

    /***********************************************************
    @brief Width of the coded video.
    ***********************************************************/
    [CCode (cname="coded_width")]
    public int coded_width;

    /***********************************************************
    @brief Height of the coded video.
    ***********************************************************/
    [CCode (cname="coded_height")]
    public int coded_height;

    /***********************************************************
    @brief The format of the coded data, corresponds to enum LibAVUtil.PixelFormat for video
    and for enum LibAVUtil.SampleFormat for audio.

    Note that a decoder can have considerable freedom in how exactly it
    decodes the data, so the format reported here might be different from the
    one returned by a decoder.
    ***********************************************************/
    [CCode (cname="format")]
    public int format;

    [CCode (cname="av_parser_init", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public CodecParserContext av_parser_init (
        int codec_id
    );

    /***********************************************************
    @brief Parse a packet.

    @param s parser context.
    @param avctx codec context.
    @param poutbuf set to pointer to parsed buffer or null if not yet finished.
    @param poutbuf_size set to size of parsed buffer or zero if not yet finished.
    @param buffer input buffer.
    @param buf_size buffer size in bytes without the padding. I.e. the full buffer
        size is assumed to be buf_size + AV_INPUT_BUFFER_PADDING_SIZE.
        To signal EOF, this should be 0 (so that the last frame
        can be output).
    @param pts input presentation timestamp.
    @param dts input decoding timestamp.
    @param pos input byte position in stream.
    @return the number of bytes of the input bitstream used.

    Example:
    @code
    while (in_len) {
        len = av_parser_parse2 (myparser, CodecContext, &data, &size,
        in_data, in_len,
        pts, dts, pos);
        in_data += len;
        in_len -= len;

        if (size)
        decode_frame (data, size);
    }
    @endcode
    ***********************************************************/
    [CCode (cname="av_parser_parse2", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public int av_parser_parse2 (
        CodecParserContext s,
        CodecContext avctx,
        out uint8[] poutbuf, out int poutbuf_size,
        uint8[] buffer, int buf_size,
        int64 pts, int64 dts,
        int64 pos
    );

    [CCode (cname="av_parser_close", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public void av_parser_close (
        CodecParserContext s
    );

}

} // namespace LibAVCodec
