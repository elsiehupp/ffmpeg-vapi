/***********************************************************
WAV demuxer
@copyright 2001, 2002 Fabrice Bellard

Sony Wave64 demuxer
RF64 demuxer
@copyright 2009 Daniel Verkamp
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

//  #if CONFIG_WAV_DEMUXER
//  #define OFFSET(x) offsetof(WAVDemuxContext, x)
//  #define DEC AV_OPT_FLAG_DECODING_PARAM
//  static const AVOption demux_options[] = {
//      { "ignore_length", "Ignore length", OFFSET(ignore_length), AV_OPT_TYPE_BOOL, { .i64 = 0 }, 0, 1, DEC },
//      { NULL },
//  }

[CCode (cname="wav_demuxer_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = "WAV demuxer"
    //  .item_name = av_default_item_name,
    //  .option = demux_options,
    //  .version = LIBAVUTIL_VERSION_INT,
}
public class InputDemuxer : AVInputFormat ff_wav_demuxer = {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "wav"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "WAV / WAVE (Waveform Audio)"
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (WAVDemuxContext);
        }
    }
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    ); // = wav_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    ); // = wav_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    ); // = wav_read_packet,
    [CCode (cname="", cheader="")]
    public override int read_seek (
        AVFormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    ); // = wav_read_seek,
    //  .flags = AVFMT_GENERIC_INDEX,
    //  .codec_tag = (const AVCodecTag * const []) { ff_codec_wav_tags,  0 },
    //  .priv_class = wav_demuxer_class,
}
#endif /* CONFIG_WAV_DEMUXER */

#if CONFIG_W64_DEMUXER
[CCode (cname="ff_w64_demuxer", cheader="")]
public class InputDemuxer : AVInputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "w64"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "Sony Wave64"
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (WAVDemuxContext);
        }
    }
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    ); // = w64_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    ); // = w64_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    ); // = wav_read_packet,
    [CCode (cname="", cheader="")]
    public override int read_seek (
        AVFormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    ); // = wav_read_seek,
    //  .flags = AVFMT_GENERIC_INDEX,
    //  .codec_tag = (const AVCodecTag * const []) { ff_codec_wav_tags, 0 },
}
#endif /* CONFIG_W64_DEMUXER */
