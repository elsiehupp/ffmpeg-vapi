/***********************************************************
Flash Compatible Streaming Format muxer
@copyright 2000 Fabrice Bellard
@copyright 2003 Tinic Uro
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

#if CONFIG_SWF_MUXER
[CCode (cname="ff_swf_muxer", cheader="")]
public class SWFMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "swf";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "SWF (ShockWave Flash)";
        }
    }
    [CCode (cname="mime_type", cheader="")]
    public override string mime_type {
        public get {
            return "application/x-shockwave-flash";
        }
    }
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return "swf";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (SWFContext);
        }
    }
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.MP3;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.FLV1;
        }
    }
    [CCode (cname="swf_write_header", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );
    [CCode (cname="swf_write_packet", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );
    [CCode (cname="swf_write_trailer", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    );
    [CCode (cname="flags", cheader="")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_TS_NONSTRICT;
        }
    }
}
#endif

#if CONFIG_AVM2_MUXER
[CCode (cname="ff_avm2_muxer", cheader="")]
public class AVM2Muxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "avm2";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "SWF (ShockWave Flash) (AVM2)";
        }
    }
    [CCode (cname="mime_type", cheader="")]
    public override string mime_type {
        public get {
            return "application/x-shockwave-flash";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (SWFContext);
        }
    }
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.MP3;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.FLV1;
        }
    }
    [CCode (cname="swf_write_header", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );
    [CCode (cname="swf_write_packet", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );
    [CCode (cname="swf_write_trailer", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    );
    [CCode (cname="flags", cheader="")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_TS_NONSTRICT;
        }
    }
}
#endif

} // namespace LibAVFormat
