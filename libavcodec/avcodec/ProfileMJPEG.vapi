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

[CCode (cprefix="", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public enum ProfileMJPEG {
    FF_PROFILE_MJPEG_HUFFMAN_BASELINE_DCT,
    FF_PROFILE_MJPEG_HUFFMAN_EXTENDED_SEQUENTIAL_DCT,
    FF_PROFILE_MJPEG_HUFFMAN_PROGRESSIVE_DCT,
    FF_PROFILE_MJPEG_HUFFMAN_LOSSLESS,
    FF_PROFILE_MJPEG_JPEG_LS,
}

} // namespace LibAVCodec
