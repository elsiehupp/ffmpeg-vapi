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

/***********************************************************
@brief Structure for chain/list of bitstream filters.
Empty list can be allocated by av_bsf_list_alloc ().
***********************************************************/
[CCode (cname="struct AVBSFList", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public struct BitStreamFilterList {

    /***********************************************************
    @brief Allocate empty list of bitstream filters.
    The list must be later freed by av_bsf_list_free ()
    or finalized by av_bsf_list_finalize ().

    @return Pointer to @link BitStreamFilterList on success, null in case of failure
        ***********************************************************/
    [CCode (cname="av_bsf_list_alloc", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public BitStreamFilterList av_bsf_list_alloc ();

    /***********************************************************
    @brief Free list of bitstream filters.

    @param lst Pointer to pointer returned by av_bsf_list_alloc ()
        ***********************************************************/
    [CCode (cname="av_bsf_list_free", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public void av_bsf_list_free (
        BitStreamFilterList lst
    );

    /***********************************************************
    @brief Append bitstream filter to the list of bitstream filters.

    @param lst List to append to
    @param bsf Filter context to be appended

    @return >=0 on success, negative LibAVUtil.ErrorCode in case of failure
        ***********************************************************/
    [CCode (cname="av_bsf_list_append", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public int av_bsf_list_append (
        BitStreamFilterList lst,
        BitStreamFilterContext bsf
    );

    /***********************************************************
    @brief Construct new bitstream filter context given it's name and options
    and append it to the list of bitstream filters.

    @param lst List to append to
    @param bsf_name Name of the bitstream filter
    @param options Options for the bitstream filter, can be set to null

    @return >=0 on success, negative LibAVUtil.ErrorCode in case of failure
        ***********************************************************/
    [CCode (cname="av_bsf_list_append2", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public int av_bsf_list_append2 (
        BitStreamFilterList lst,
        string bsf_name,
        LibAVUtil.Dictionary[] options
    );

    /***********************************************************
    @brief Finalize list of bitstream filters.

    This function will transform @link BitStreamFilterList to single @link BitStreamFilterContext,
    so the whole chain of bitstream filters can be treated as single filter
    freshly allocated by av_bsf_alloc ().
    If the call is successful, @link BitStreamFilterList structure is freed and lst
    will be set to null. In case of failure, caller is responsible for
    freeing the structure by av_bsf_list_free ()

    @param lst Filter list structure to be transformed
    @param[out] bsf Pointer to be set to newly created @link BitStreamFilterContext structure
        representing the chain of bitstream filters

    @return >=0 on success, negative LibAVUtil.ErrorCode in case of failure
        ***********************************************************/
    [CCode (cname="av_bsf_list_finalize", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public int av_bsf_list_finalize (
        BitStreamFilterList lst,
        BitStreamFilterContext bsf
    );
}

} // namespace LibAVCodec
