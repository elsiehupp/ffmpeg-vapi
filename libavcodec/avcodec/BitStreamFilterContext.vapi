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

[CCode (cname="struct AVBSFInternal", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public struct BSFInternal { }

/***********************************************************
@brief The bitstream filter state.

This struct must be allocated with av_bsf_alloc () and freed with
av_bsf_free ().

The fields in the struct will only be changed (by the caller or by the
filter) as described in their documentation, and are to be considered
immutable otherwise.
***********************************************************/
[CCode (cname="struct AVBSFContext", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public struct BitStreamFilterContext {
    /***********************************************************
    @brief A class for logging and LibAVUtil.Options
    ***********************************************************/
    [CCode (cname="av_class")]
    public LibAVUtil.Class av_class;

    /***********************************************************
    @brief The bitstream filter this context is an instance of.
    ***********************************************************/
    [CCode (cname="filter")]
    public BitStreamFilter filter;

    /***********************************************************
    @brief Opaque LibAVCodec internal data. Must not be touched by the caller in any
        way.
    ***********************************************************/
    [CCode (cname="internal")]
    public BSFInternal internal;

    /***********************************************************
    @brief Opaque filter-specific private data. If filter->priv_class is non-null,
        this is an LibAVUtil.Options-enabled struct.
    ***********************************************************/
    [CCode (cname="priv_data")]
    public void *priv_data;

    /***********************************************************
    @brief Parameters of the input stream. This field is allocated in
    av_bsf_alloc (), it needs to be filled by the caller before
    av_bsf_init ().
    ***********************************************************/
    [CCode (cname="par_in")]
    public CodecParameters par_in;

    /***********************************************************
    @brief Parameters of the output stream. This field is allocated in
    av_bsf_alloc (), it is set by the filter in av_bsf_init ().
    ***********************************************************/
    [CCode (cname="par_out")]
    public CodecParameters par_out;

    /***********************************************************
    @brief The timebase used for the timestamps of the input packets. Set by the
    caller before av_bsf_init ().
    ***********************************************************/
    [CCode (cname="time_base_in")]
    public LibAVUtil.Rational time_base_in;

    /***********************************************************
    @brief The timebase used for the timestamps of the output packets. Set by the
    filter in av_bsf_init ().
    ***********************************************************/
    [CCode (cname="time_base_out")]
    public LibAVUtil.Rational time_base_out;

    /***********************************************************
    @return a bitstream filter with the specified name or null if no such
        bitstream filter exists.
    ***********************************************************/
    [CCode (cname="av_bsf_get_by_name", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public BitStreamFilter av_bsf_get_by_name (
        string name
    );

    /***********************************************************
    @brief Iterate over all registered bitstream filters.

    @param opaque a pointer where LibAVCodec will store the iteration state. Must
        point to null to start the iteration.

    @return the next registered bitstream filter or null when the iteration is
        finished
    ***********************************************************/
    [CCode (cname="av_bsf_iterate", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public BitStreamFilter av_bsf_iterate (out void *opaque);

    /***********************************************************
    @brief Allocate a context for a given bitstream filter. The caller must fill in the
    context parameters as described in the documentation and then call
    av_bsf_init () before sending any data to the filter.

    @param filter the filter for which to allocate an instance.
    @param bsf_context a pointer into which the pointer to the newly-allocated context
        will be written. It must be freed with av_bsf_free () after the
        filtering is done.

    @return 0 on success, a negative LibAVUtil.ErrorCode code on failure
    ***********************************************************/
    [CCode (cname="av_bsf_alloc", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public int av_bsf_alloc (
        BitStreamFilter filter,
        BitStreamFilterContext bsf_context
    );

    /***********************************************************
    @brief Prepare the filter for use, after all the parameters and options have been
    set.
    ***********************************************************/
    [CCode (cname="av_bsf_init", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public int av_bsf_init (
        BitStreamFilterContext bsf_context
    );

    /***********************************************************
    @brief Submit a packet for filtering.

    After sending each packet, the filter must be completely drained by calling
    av_bsf_receive_packet () repeatedly until it returns LibAVUtil.ErrorCode (EAGAIN) or
    AVERROR_EOF.

    @param pkt the packet to filter. The bitstream filter will take ownership of
    the packet and reset the contents of pkt. pkt is not touched if an error occurs.
    This parameter may be null, which signals the end of the stream (i.e. no more
    packets will be sent). That will cause the filter to output any packets it
    may have buffered internally.

    @return 0 on success, a negative LibAVUtil.ErrorCode on error.
    ***********************************************************/
    [CCode (cname="av_bsf_send_packet", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public int av_bsf_send_packet (
        BitStreamFilterContext bsf_context,
        Packet pkt
    );

    /***********************************************************
    @brief Retrieve a filtered packet.

    @param[out] pkt this struct will be filled with the contents of the filtered
        packet. It is owned by the caller and must be freed using
        av_packet_unref () when it is no longer needed.
        This parameter should be "clean" (i.e. freshly allocated
        with av_packet_alloc () or unreffed with av_packet_unref ())
        when this function is called. If this function returns
        successfully, the contents of pkt will be completely
        overwritten by the returned data. On failure, pkt is not
        touched.

    @return 0 on success. LibAVUtil.ErrorCode (EAGAIN) if more packets need to be sent to the
    filter (using av_bsf_send_packet ()) to get more output. AVERROR_EOF if there
    will be no further output from the filter. Another negative LibAVUtil.ErrorCode value if
    an error occurs.

    @note one input packet may result in several output packets, so after sending
    a packet with av_bsf_send_packet (), this function needs to be called
    repeatedly until it stops returning 0. It is also possible for a filter to
    output fewer packets than were sent to it, so this function may return
    LibAVUtil.ErrorCode (EAGAIN) immediately after a successful av_bsf_send_packet () call.
    ***********************************************************/
    [CCode (cname="av_bsf_receive_packet", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public int av_bsf_receive_packet (
        BitStreamFilterContext bsf_context,
        Packet pkt
    );

    /***********************************************************
    @brief Reset the internal bitstream filter state / flush internal buffers.
    ***********************************************************/
    [CCode (cname="av_bsf_flush", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public void av_bsf_flush (
        BitStreamFilterContext bsf_context
    );

    /***********************************************************
    @brief Free a bitstream filter context and everything associated with it; write null
    into the supplied pointer.
    ***********************************************************/
    [CCode (cname="av_bsf_free", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public void av_bsf_free (
        BitStreamFilterContext bsf_context
    );

    /***********************************************************
    @brief Get the LibAVUtil.Class for BitStreamFilterContext. It can be used in combination with
    OptionSearchFlags.FAKE_OBJECT_PARAMETER for examining options.

    @see @link av_opt_find ().
    ***********************************************************/
    [CCode (cname="av_bsf_get_class", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public LibAVUtil.Class av_bsf_get_class ();

    /***********************************************************
    @brief Parse string describing list of bitstream filters and create single
    @link BitStreamFilterContext describing the whole chain of bitstream filters.
    Resulting @link BitStreamFilterContext can be treated as any other @link BitStreamFilterContext freshly
    allocated by av_bsf_alloc ().

    @param str String describing chain of bitstream filters in format
        `bsf1[=opt1=val1:opt2=val2][,bsf2]`
    @param[out] bsf Pointer to be set to newly created @link BitStreamFilterContext structure
        representing the chain of bitstream filters

    @return >=0 on success, negative LibAVUtil.ErrorCode in case of failure
    ***********************************************************/
    [CCode (cname="av_bsf_list_parse_str", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public int av_bsf_list_parse_str (
        string str,
        BitStreamFilterContext bsf
    );

    /***********************************************************
    @brief Get null/pass-through bitstream filter.

    @param[out] bsf Pointer to be set to new instance of pass-through bitstream filter

    @return
    ***********************************************************/
    [CCode (cname="av_bsf_get_null_filter", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public int av_bsf_get_null_filter (
        BitStreamFilterContext bsf
    );

}

} // namespace LibAVCodec
