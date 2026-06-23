/***********************************************************
@brief AST common code
@copyright 2012 James Almer
***********************************************************/
/***********************************************************
@brief This file is part of FFmpeg.

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

const AVCodecTag ff_codec_ast_tags[] = {
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.ADPCM_AFC,
        tag = 0
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.PCM_S16BE_PLANAR,
        tag = 1
    },
    new AVCodecTag () {
        codec_id = LibAVCodec.CodecID.NONE,
        tag = 0
    }

};

} // namespace LibAVFormat
