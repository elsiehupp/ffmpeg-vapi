/***********************************************************
@copyright 2010 Reimar Döffinger
***********************************************************/
/***********************************************************
This file is part of FFmpeg.

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

//  static const AVCodecTag codec_ivf_tags[] = {
//      { LibAVCodec.CodecID.VP8,  MKTAG('V', 'P', '8', '0') },
//      { LibAVCodec.CodecID.VP9,  MKTAG('V', 'P', '9', '0') },
//      { LibAVCodec.CodecID.AV1,  MKTAG('A', 'V', '0', '1') },
//      { LibAVCodec.CodecID.NONE, 0 }
//  }

[CCode (cname="ff_ivf_muxer", cheader="")]
public class IVFMuxer : AVOutputFormat {
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (IVFEncContext);
        }
    }
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "ivf";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "On2 IVF";
        }
    }
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return "ivf";
        }
    }
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.NONE;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.VP8;
        }
    }
    [CCode (cname="ivf_write_header", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );
    [CCode (cname="ivf_write_packet", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );
    [CCode (cname="ivf_write_trailer", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    );
    [CCode (cname="ivf_check_bitstream", cheader="")]
    public override int check_bitstream (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    //  .codec_tag = (AVCodecTag[]){ codec_ivf_tags, 0 },
}

} // namespace LibAVFormat
