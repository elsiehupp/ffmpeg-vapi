/***********************************************************
@brief Creative Voice File demuxer.
@copyright 2006 Aurelien Jacobs <aurel@gnuage.org>
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

[CCode (cname="struct voc_dec_context")]
public struct VocDecContext {
    [CCode (cname="", cheader_filename="")]
    public int64 remaining_size;

    [CCode (cname="", cheader_filename="")]
    public int64 pts;
}

[CCode (cname="enum voc_type")]
public enum VocType {
    VOC_TYPE_EOF,
    VOC_TYPE_VOICE_DATA,
    VOC_TYPE_VOICE_DATA_CONT,
    VOC_TYPE_SILENCE,
    VOC_TYPE_MARKER,
    VOC_TYPE_ASCII,
    VOC_TYPE_REPETITION_START,
    VOC_TYPE_REPETITION_END,
    VOC_TYPE_EXTENDED,
    VOC_TYPE_NEW_VOICE_DATA,
}

//  extern const uchar ff_voc_magic[21];
//  extern const AVCodecTag ff_voc_codec_tags[];

[CCode (cname="", cheader_filename="")]
public int ff_voc_get_packet (
    AVFormatContext format_context,
    LibAVCodec.Packet packet,
    AVStream st,
    int max_size
);

} // namespace LibAVFormat
