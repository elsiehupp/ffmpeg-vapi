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
@brief RAW AC-3 and E-AC-3 demuxer
@copyright 2007 Justin Ruggles <justin.ruggles@gmail.com>
***********************************************************/
namespace LibAVFormat {

#if CONFIG_AC3_DEMUXER
static int ac3_probe(const AVProbeData *p)
{
    return ac3_eac3_probe(p, LibAVCodec.CodecID.AC3);
}

//  FF_RAW_DEMUXER_CLASS(ac3)

[CCode (cname="ff_ac3_demuxer", cheader_filename="")]
public class AC3Demuxer : AVInputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "ac3";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "raw AC-3";
        }
    }

    [CCode (cname="ac3_probe", cheader_filename="")]
    public override int read_probe (
        AVProbeData format_context
    );

    [CCode (cname="ff_raw_audio_read_header", cheader_filename="")]
    public override int read_header (
        AVFormatContext format_context
    );

    [CCode (cname="ff_raw_read_partial_packet", cheader_filename="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="flags", cheader_filename="")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_GENERIC_INDEX;
        }
    }

    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "ac3";
        }
    }

    [CCode (cname="raw_codec_id", cheader_filename="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.AC3;
        }
    }

    [CCode (cname="priv_data_size", cheader_filename="")]
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

//  FF_RAW_DEMUXER_CLASS(eac3)
[CCode (cname="ff_eac3_demuxer", cheader_filename="")]
public class EAC3Demuxer : AVInputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "eac3";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "raw E-AC-3";
        }
    }

    [CCode (cname="eac3_probe", cheader_filename="")]
    public override int read_probe (
        AVProbeData format_context
    );

    [CCode (cname="ff_raw_audio_read_header", cheader_filename="")]
    public override int read_header (
        AVFormatContext format_context
    );

    [CCode (cname="ff_raw_read_partial_packet", cheader_filename="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="flags", cheader_filename="")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_GENERIC_INDEX;
        }
    }

    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "eac3";
        }
    }

    [CCode (cname="raw_codec_id", cheader_filename="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.EAC3;
        }
    }

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (FFRawDemuxerContext);
        }
    }
    //  .priv_class = eac3_demuxer_class,
}
#endif

} // namespace LibAVFormat
