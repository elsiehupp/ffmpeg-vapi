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
/***********************************************************
@brief AIFF/AIFF-C muxer/demuxer common header
@copyright 2006 Patrick Guimond
***********************************************************/
namespace LibAVFormat {

/***********************************************************
@file common header for AIFF muxer and demuxer
***********************************************************/

[CCode (cname="ff_codec_aiff_tags",cheader_filename="subprojects/ffmpeg/libavformat/aiff.h")]
public const LibAVFormat.CodecTag[] ff_codec_aiff_tags = {
    new LibAVFormat.CodecTag () {
        codec_id = LibAVCodec.CodecID.PCM_S16BE,
        tag = MKTAG (
            'N',
            'O',
            'N',
            'E'
        )
    },
    new LibAVFormat.CodecTag () {
        codec_id = LibAVCodec.CodecID.PCM_S8,
        tag = MKTAG (
            'N',
            'O',
            'N',
            'E'
        )
    },
    new LibAVFormat.CodecTag () {
        codec_id = LibAVCodec.CodecID.PCM_U8,
        tag = MKTAG (
            'r',
            'a',
            'w',
            ' '
        )
    },
    new LibAVFormat.CodecTag () {
        codec_id = LibAVCodec.CodecID.PCM_S24BE,
        tag = MKTAG (
            'N',
            'O',
            'N',
            'E'
        )
    },
    new LibAVFormat.CodecTag () {
        codec_id = LibAVCodec.CodecID.PCM_S32BE,
        tag = MKTAG (
            'N',
            'O',
            'N',
            'E'
        )
    },
    new LibAVFormat.CodecTag () {
        codec_id = LibAVCodec.CodecID.PCM_F32BE,
        tag = MKTAG (
            'f',
            'l',
            '3',
            '2'
        )
    },
    new LibAVFormat.CodecTag () {
        codec_id = LibAVCodec.CodecID.PCM_F64BE,
        tag = MKTAG (
            'f',
            'l',
            '6',
            '4'
        )
    },
    new LibAVFormat.CodecTag () {
        codec_id = LibAVCodec.CodecID.PCM_ALAW,
        tag = MKTAG (
            'a',
            'l',
            'a',
            'w'
        )
    },
    new LibAVFormat.CodecTag () {
        codec_id = LibAVCodec.CodecID.PCM_MULAW,
        tag = MKTAG (
            'u',
            'l',
            'a',
            'w'
        )
    },
    new LibAVFormat.CodecTag () {
        codec_id = LibAVCodec.CodecID.PCM_S24BE,
        tag = MKTAG (
            'i',
            'n',
            '2',
            '4'
        )
    },
    new LibAVFormat.CodecTag () {
        codec_id = LibAVCodec.CodecID.PCM_S32BE,
        tag = MKTAG (
            'i',
            'n',
            '3',
            '2'
        )
    },
    new LibAVFormat.CodecTag () {
        codec_id = LibAVCodec.CodecID.MACE3,
        tag = MKTAG (
            'M',
            'A',
            'C',
            '3'
        )
    },
    new LibAVFormat.CodecTag () {
        codec_id = LibAVCodec.CodecID.MACE6,
        tag = MKTAG (
            'M',
            'A',
            'C',
            '6'
        )
    },
    new LibAVFormat.CodecTag () {
        codec_id = LibAVCodec.CodecID.GSM,
        tag = MKTAG (
            'G',
            'S',
            'M',
            ' '
        )
    },
    new LibAVFormat.CodecTag () {
        codec_id = LibAVCodec.CodecID.ADPCM_G722,
        tag = MKTAG (
            'G',
            '7',
            '2',
            '2'
        )
    },
    new LibAVFormat.CodecTag () {
        codec_id = LibAVCodec.CodecID.ADPCM_G726LE,
        tag = MKTAG (
            'G',
            '7',
            '2',
            '6'
        )
    },
    new LibAVFormat.CodecTag () {
        codec_id = LibAVCodec.CodecID.PCM_S16BE,
        tag = MKTAG (
            't',
            'w',
            'o',
            's'
        )
    },
    new LibAVFormat.CodecTag () {
        codec_id = LibAVCodec.CodecID.PCM_S16LE,
        tag = MKTAG (
            's',
            'o',
            'w',
            't'
        )
    },
    new LibAVFormat.CodecTag () {
        codec_id = LibAVCodec.CodecID.ADPCM_IMA_QT,
        tag = MKTAG (
            'i',
            'm',
            'a',
            '4'
        )
    },
    new LibAVFormat.CodecTag () {
        codec_id = LibAVCodec.CodecID.QDMC,
        tag = MKTAG (
            'Q',
            'D',
            'M',
            'C'
        )
    },
    new LibAVFormat.CodecTag () {
        codec_id = LibAVCodec.CodecID.QDM2,
        tag = MKTAG (
            'Q',
            'D',
            'M',
            '2'
        )
    },
    new LibAVFormat.CodecTag () {
        codec_id = LibAVCodec.CodecID.QCELP,
        tag = MKTAG (
            'Q',
            'c',
            'l',
            'p'
        )
    },
    new LibAVFormat.CodecTag () {
        codec_id = LibAVCodec.CodecID.SDX2_DPCM,
        tag = MKTAG (
            'S',
            'D',
            'X',
            '2'
        )
    },
    new LibAVFormat.CodecTag () {
        codec_id = LibAVCodec.CodecID.ADPCM_IMA_WS,
        tag = MKTAG (
            'A',
            'D',
            'P',
            '4'
        )
    },
    new LibAVFormat.CodecTag () {
        codec_id = LibAVCodec.CodecID.NONE,
        tag = 0
    }

};

} // namespace LibAVFormat
