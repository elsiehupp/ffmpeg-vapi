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

[CCode (cname="ff_codec_aiff_tags", cheader_filename="")]
public const AVCodecTag[] ff_codec_aiff_tags;
//  {
//      { LibAVCodec.CodecID.PCM_S16BE, MKTAG ('N','O','N','E') },
//      { LibAVCodec.CodecID.PCM_S8, MKTAG ('N','O','N','E') },
//      { LibAVCodec.CodecID.PCM_U8, MKTAG ('r','a','w',' ') },
//      { LibAVCodec.CodecID.PCM_S24BE, MKTAG ('N','O','N','E') },
//      { LibAVCodec.CodecID.PCM_S32BE, MKTAG ('N','O','N','E') },
//      { LibAVCodec.CodecID.PCM_F32BE, MKTAG ('f','l','3','2') },
//      { LibAVCodec.CodecID.PCM_F64BE, MKTAG ('f','l','6','4') },
//      { LibAVCodec.CodecID.PCM_ALAW, MKTAG ('a','l','a','w') },
//      { LibAVCodec.CodecID.PCM_MULAW, MKTAG ('u','l','a','w') },
//      { LibAVCodec.CodecID.PCM_S24BE, MKTAG ('i','n','2','4') },
//      { LibAVCodec.CodecID.PCM_S32BE, MKTAG ('i','n','3','2') },
//      { LibAVCodec.CodecID.MACE3, MKTAG ('M','A','C','3') },
//      { LibAVCodec.CodecID.MACE6, MKTAG ('M','A','C','6') },
//      { LibAVCodec.CodecID.GSM, MKTAG ('G','S','M',' ') },
//      { LibAVCodec.CodecID.ADPCM_G722, MKTAG ('G','7','2','2') },
//      { LibAVCodec.CodecID.ADPCM_G726LE, MKTAG ('G','7','2','6') },
//      { LibAVCodec.CodecID.PCM_S16BE, MKTAG ('t','w','o','s') },
//      { LibAVCodec.CodecID.PCM_S16LE, MKTAG ('s','o','w','t') },
//      { LibAVCodec.CodecID.ADPCM_IMA_QT, MKTAG ('i','m','a','4') },
//      { LibAVCodec.CodecID.QDMC, MKTAG ('Q','D','M','C') },
//      { LibAVCodec.CodecID.QDM2, MKTAG ('Q','D','M','2') },
//      { LibAVCodec.CodecID.QCELP, MKTAG ('Q','c','l','p') },
//      { LibAVCodec.CodecID.SDX2_DPCM, MKTAG ('S','D','X','2') },
//      { LibAVCodec.CodecID.ADPCM_IMA_WS, MKTAG ('A','D','P','4') },
//      { LibAVCodec.CodecID.NONE, 0 },
//  }

} // namespace LibAVFormat
