/***********************************************************
RAW AC-3 and E-AC-3 demuxer
@copyright 2007 Justin Ruggles <justin.ruggles@gmail.com>
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

#if CONFIG_AC3_DEMUXER
static int ac3_probe(const AVProbeData *p)
{
    return ac3_eac3_probe(p, LibAVCodec.CodecID.AC3);
}

FF_RAW_DEMUXER_CLASS(ac3)

[CCode (cname="ff_ac3_demuxer", cheader="")]
public class AC3InputDemuxer : AVInputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "ac3";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "raw AC-3";
        }
    }
    [CCode (cname="ac3_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="ff_raw_audio_read_header", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );
    [CCode (cname="ff_raw_read_partial_packet", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    //  .flags = AVFMT_GENERIC_INDEX,
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return "ac3";
        }
    }
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.AC3;
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (FFRawDemuxerContext);
        }
    }
    //  .priv_class = ac3_demuxer_class,
}
#endif

#if CONFIG_EAC3_DEMUXER
static int eac3_probe(const AVProbeData *p)
{
    return ac3_eac3_probe(p, LibAVCodec.CodecID.EAC3);
}

FF_RAW_DEMUXER_CLASS(eac3)
[CCode (cname="ff_eac3_demuxer", cheader="")]
public class EAC3InputDemuxer : AVInputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "eac3";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "raw E-AC-3";
        }
    }
    [CCode (cname="eac3_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="ff_raw_audio_read_header", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );
    [CCode (cname="ff_raw_read_partial_packet", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    //  .flags = AVFMT_GENERIC_INDEX,
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return "eac3";
        }
    }
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.EAC3;
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (FFRawDemuxerContext);
        }
    }
    //  .priv_class = eac3_demuxer_class,
}
#endif
