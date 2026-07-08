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
@brief Memory
***********************************************************/
namespace Memory {

    /***********************************************************
    @brief Same behaviour av_fast_malloc but the buffer has additional
    AV_INPUT_BUFFER_PADDING_SIZE at the end which will always be 0.

    In addition the whole buffer will initially and after resizes
    be 0-initialized so that no uninitialized data will ever appear.
    ***********************************************************/
    [CCode (cname="av_fast_padded_malloc",cheader_filename="subprojects/ffmpeg/libavcodec/avcodec.h")]
    public void av_fast_padded_malloc (
        void *ptr,
        out uint size,
        size_t min_size
    );

    /***********************************************************
    @brief Same behaviour av_fast_padded_malloc except that buffer will always
    be 0-initialized after call.
    ***********************************************************/
    [CCode (cname="av_fast_padded_mallocz",cheader_filename="subprojects/ffmpeg/libavcodec/avcodec.h")]
    public void av_fast_padded_mallocz (
        void *ptr,
        out uint size,
        size_t min_size
    );

} // namespace Memory
} // namespace LibAVCodec
