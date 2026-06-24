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

[CCode (cname="struct voc_dec_context",cheader_filename="subprojects/ffmpeg/libformat/voc.h")]
[Compact]
public class VocDecContext {
    [CCode (cname="remaining_size")]
    public int64 remaining_size;

    [CCode (cname="pts")]
    public int64 pts;
}

[CCode (cname="enum voc_type",cprefix="VOC_TYPE_",cheader_filename="subprojects/ffmpeg/libformat/voc.h")]
public enum VocType {
    [CCode (cname="VOC_TYPE_EOF")]
    END_OF_FILE,
    VOICE_DATA,

    [CCode (cname="VOC_TYPE_VOICE_DATA_CONT")]
    VOICE_DATA_CONT,
    SILENCE,
    MARKER,
    ASCII,
    REPETITION_START,
    REPETITION_END,
    EXTENDED,
    NEW_VOICE_DATA;
}

//  extern const uchar ff_voc_magic[21];
//  extern const AVCodecTag ff_voc_codec_tags[];

[CCode (cname="ff_voc_get_packet",cheader_filename="subprojects/ffmpeg/libformat/voc.h")]
public int ff_voc_get_packet (
    AVFormatContext format_context,
    LibAVCodec.Packet packet,
    AVStream st,
    int max_size
);

} // namespace LibAVFormat
