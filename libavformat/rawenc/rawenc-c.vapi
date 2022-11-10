/***********************************************************
RAW muxers
@copyright 2001 Fabrice Bellard
@copyright 2005 Alex Beregszaszi
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

#if CONFIG_AC3_MUXER
[CCode (cname="ff_ac3_muxer", cheader="")]
public class OutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "ac3"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "raw AC-3"
    [CCode (cname="mime_type", cheader="")]
    public override string mime_type {
        public get {
            return ;
        }
    } // = "audio/x-ac3"
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return ;
        }
    } // = "ac3"
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.AC3;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.NONE;
        }
    }
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = ff_raw_write_packet,
    //  .flags = AVFMT_NOTIMESTAMPS,
}
#endif

#if CONFIG_ADX_MUXER

[CCode (cname="ff_adx_muxer", cheader="")]
public class ADXOutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "adx"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "CRI ADX"
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return ;
        }
    } // = "adx"
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.ADPCM_ADX;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.NONE;
        }
    }
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = ff_raw_write_packet,
    [CCode (cname="", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    ); // = adx_write_trailer,
    //  .flags = AVFMT_NOTIMESTAMPS,
}
#endif

#if CONFIG_APTX_MUXER
[CCode (cname="ff_aptx_muxer", cheader="")]
public class OutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "aptx"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "raw aptX (Audio Processing Technology for Bluetooth)"
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return ;
        }
    } // = "aptx"
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.APTX;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.NONE;
        }
    }
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = ff_raw_write_packet,
    //  .flags = AVFMT_NOTIMESTAMPS,
}
#endif

#if CONFIG_APTX_HD_MUXER
[CCode (cname="ff_aptx_hd_muxer", cheader="")]
public class OutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "aptx_hd"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "raw aptX HD (Audio Processing Technology for Bluetooth)"
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return ;
        }
    } // = "aptxhd"
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.APTX_HD;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.NONE;
        }
    }
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = ff_raw_write_packet,
    //  .flags = AVFMT_NOTIMESTAMPS,
}
#endif

#if CONFIG_AVS2_MUXER
[CCode (cname="ff_avs2_muxer", cheader="")]
public class OutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "avs2"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "raw AVS2-P2/IEEE1857.4 video"
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return ;
        }
    } // = "avs,avs2"
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.NONE;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.AVS2;
        }
    }
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = ff_raw_write_packet,
    //  .flags = AVFMT_NOTIMESTAMPS,
}
#endif

#if CONFIG_CAVSVIDEO_MUXER
[CCode (cname="ff_cavsvideo_muxer", cheader="")]
public class OutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "cavsvideo"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "raw Chinese AVS (Audio Video Standard) video"
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return ;
        }
    } // = "cavs"
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.NONE;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.CAVS;
        }
    }
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = ff_raw_write_packet,
    //  .flags = AVFMT_NOTIMESTAMPS,
}
#endif

#if CONFIG_CODEC2RAW_MUXER
[CCode (cname="ff_codec2raw_muxer", cheader="")]
public class OutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "codec2raw"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "raw codec2 muxer"
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.CODEC2;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.NONE;
        }
    }
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = ff_raw_write_packet,
    //  .flags = AVFMT_NOTIMESTAMPS,
}
#endif


#if CONFIG_DATA_MUXER
[CCode (cname="ff_data_muxer", cheader="")]
public class OutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "data"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "raw data"
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = ff_raw_write_packet,
    //  .flags = AVFMT_NOTIMESTAMPS,
}
#endif

#if CONFIG_DIRAC_MUXER
[CCode (cname="ff_dirac_muxer", cheader="")]
public class OutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "dirac"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "raw Dirac"
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return ;
        }
    } // = "drc,vc2"
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.NONE;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.DIRAC;
        }
    }
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = ff_raw_write_packet,
    //  .flags = AVFMT_NOTIMESTAMPS,
}
#endif

#if CONFIG_DNXHD_MUXER
[CCode (cname="ff_dnxhd_muxer", cheader="")]
public class OutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "dnxhd"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "raw DNxHD (SMPTE VC-3)"
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return ;
        }
    } // = "dnxhd,dnxhr"
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.NONE;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.DNXHD;
        }
    }
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = ff_raw_write_packet,
    //  .flags = AVFMT_NOTIMESTAMPS,
}
#endif

#if CONFIG_DTS_MUXER
[CCode (cname="ff_dts_muxer", cheader="")]
public class OutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "dts"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "raw DTS"
    [CCode (cname="mime_type", cheader="")]
    public override string mime_type {
        public get {
            return ;
        }
    } // = "audio/x-dca"
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return ;
        }
    } // = "dts"
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.DTS;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.NONE;
        }
    }
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = ff_raw_write_packet,
    //  .flags = AVFMT_NOTIMESTAMPS,
}
#endif

#if CONFIG_EAC3_MUXER
[CCode (cname="ff_eac3_muxer", cheader="")]
public class OutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "eac3"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "raw E-AC-3"
    [CCode (cname="mime_type", cheader="")]
    public override string mime_type {
        public get {
            return ;
        }
    } // = "audio/x-eac3"
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return ;
        }
    } // = "eac3"
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.EAC3;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.NONE;
        }
    }
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = ff_raw_write_packet,
    //  .flags = AVFMT_NOTIMESTAMPS,
}
#endif

#if CONFIG_G722_MUXER
[CCode (cname="ff_g722_muxer", cheader="")]
public class OutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "g722"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "raw G.722"
    [CCode (cname="mime_type", cheader="")]
    public override string mime_type {
        public get {
            return ;
        }
    } // = "audio/G722"
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return ;
        }
    } // = "g722"
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.ADPCM_G722;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.NONE;
        }
    }
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = ff_raw_write_packet,
    //  .flags = AVFMT_NOTIMESTAMPS,
}
#endif

#if CONFIG_G723_1_MUXER
[CCode (cname="ff_g723_1_muxer", cheader="")]
public class OutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "g723_1"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "raw G.723.1"
    [CCode (cname="mime_type", cheader="")]
    public override string mime_type {
        public get {
            return ;
        }
    } // = "audio/g723"
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return ;
        }
    } // = "tco,rco"
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.G723_1;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.NONE;
        }
    }
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = ff_raw_write_packet,
    //  .flags = AVFMT_NOTIMESTAMPS,
}
#endif

#if CONFIG_G726_MUXER
[CCode (cname="ff_g726_muxer", cheader="")]
public class OutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "g726"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "raw big-endian G.726 (\"left-justified\")"
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.ADPCM_G726;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.NONE;
        }
    }
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = ff_raw_write_packet,
    //  .flags = AVFMT_NOTIMESTAMPS,
}
#endif

#if CONFIG_G726LE_MUXER
[CCode (cname="ff_g726le_muxer", cheader="")]
public class OutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "g726le"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "raw little-endian G.726 (\"right-justified\")"
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.ADPCM_G726LE;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.NONE;
        }
    }
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = ff_raw_write_packet,
    //  .flags = AVFMT_NOTIMESTAMPS,
}
#endif

#if CONFIG_GSM_MUXER
[CCode (cname="ff_gsm_muxer", cheader="")]
public class OutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "gsm"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "raw GSM"
    [CCode (cname="mime_type", cheader="")]
    public override string mime_type {
        public get {
            return ;
        }
    } // = "audio/x-gsm"
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return ;
        }
    } // = "gsm"
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.GSM;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.NONE;
        }
    }
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = ff_raw_write_packet,
    //  .flags = AVFMT_NOTIMESTAMPS,
}
#endif

#if CONFIG_H261_MUXER
[CCode (cname="ff_h261_muxer", cheader="")]
public class OutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "h261"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "raw H.261"
    [CCode (cname="mime_type", cheader="")]
    public override string mime_type {
        public get {
            return ;
        }
    } // = "video/x-h261"
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return ;
        }
    } // = "h261"
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.NONE;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.H261;
        }
    }
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = ff_raw_write_packet,
    //  .flags = AVFMT_NOTIMESTAMPS,
}
#endif

#if CONFIG_H263_MUXER
[CCode (cname="ff_h263_muxer", cheader="")]
public class OutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "h263"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "raw H.263"
    [CCode (cname="mime_type", cheader="")]
    public override string mime_type {
        public get {
            return ;
        }
    } // = "video/x-h263"
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return ;
        }
    } // = "h263"
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.NONE;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.H263;
        }
    }
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = ff_raw_write_packet,
    //  .flags = AVFMT_NOTIMESTAMPS,
}
#endif

#if CONFIG_H264_MUXER

[CCode (cname="ff_h264_muxer", cheader="")]
public class H264OutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "h264"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "raw H.264 video"
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return ;
        }
    } // = "h264,264"
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.NONE;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.H264;
        }
    }
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = ff_raw_write_packet,
    [CCode (cname="", cheader="")]
    public override int check_bitstream (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    ); // = h264_check_bitstream,
    //  .flags = AVFMT_NOTIMESTAMPS,
}
#endif

#if CONFIG_HEVC_MUXER
static int hevc_check_bitstream(AVFormatContext *s, const AVPacket *pkt)
{
    AVStream *st = s->streams[0];
    if (pkt->size >= 5 && AV_RB32(pkt->data) != 0x0000001 &&
                          AV_RB24(pkt->data) != 0x000001)
        return ff_stream_add_bitstream_filter(st, "hevc_mp4toannexb", NULL);
    return 1;
}

[CCode (cname="ff_hevc_muxer", cheader="")]
public class HEVCOutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "hevc"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "raw HEVC video"
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return ;
        }
    } // = "hevc,h265,265"
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.NONE;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.HEVC;
        }
    }
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = ff_raw_write_packet,
    [CCode (cname="", cheader="")]
    public override int check_bitstream (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    ); // = hevc_check_bitstream,
    //  .flags = AVFMT_NOTIMESTAMPS,
}
#endif

#if CONFIG_M4V_MUXER
[CCode (cname="ff_m4v_muxer", cheader="")]
public class OutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "m4v"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "raw MPEG-4 video"
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return ;
        }
    } // = "m4v"
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.NONE;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.MPEG4;
        }
    }
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = ff_raw_write_packet,
    //  .flags = AVFMT_NOTIMESTAMPS,
}
#endif

#if CONFIG_MJPEG_MUXER
[CCode (cname="ff_mjpeg_muxer", cheader="")]
public class OutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "mjpeg"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "raw MJPEG video"
    [CCode (cname="mime_type", cheader="")]
    public override string mime_type {
        public get {
            return ;
        }
    } // = "video/x-mjpeg"
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return ;
        }
    } // = "mjpg,mjpeg"
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.NONE;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.MJPEG;
        }
    }
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = ff_raw_write_packet,
    //  .flags = AVFMT_NOTIMESTAMPS,
}
#endif

#if CONFIG_SINGLEJPEG_MUXER
[CCode (cname="ff_singlejpeg_muxer", cheader="")]
public class OutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "singlejpeg"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "JPEG single image"
    [CCode (cname="mime_type", cheader="")]
    public override string mime_type {
        public get {
            return ;
        }
    } // = "image/jpeg"
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.NONE;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.MJPEG;
        }
    }
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = ff_raw_write_packet,
    //  .flags = AVFMT_NOTIMESTAMPS,
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = force_one_stream,
}
#endif

#if CONFIG_MLP_MUXER
[CCode (cname="ff_mlp_muxer", cheader="")]
public class OutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "mlp"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "raw MLP"
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return ;
        }
    } // = "mlp"
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.MLP;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.NONE;
        }
    }
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = ff_raw_write_packet,
    //  .flags = AVFMT_NOTIMESTAMPS,
}
#endif

#if CONFIG_MP2_MUXER
[CCode (cname="ff_mp2_muxer", cheader="")]
public class OutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "mp2"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "MP2 (MPEG audio layer 2)"
    [CCode (cname="mime_type", cheader="")]
    public override string mime_type {
        public get {
            return ;
        }
    } // = "audio/mpeg"
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return ;
        }
    } // = "mp2,m2a,mpa"
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.MP2;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.NONE;
        }
    }
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = ff_raw_write_packet,
    //  .flags = AVFMT_NOTIMESTAMPS,
}
#endif

#if CONFIG_MPEG1VIDEO_MUXER
[CCode (cname="ff_mpeg1video_muxer", cheader="")]
public class OutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "mpeg1video"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "raw MPEG-1 video"
    [CCode (cname="mime_type", cheader="")]
    public override string mime_type {
        public get {
            return ;
        }
    } // = "video/mpeg"
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return ;
        }
    } // = "mpg,mpeg,m1v"
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.NONE;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.MPEG1VIDEO;
        }
    }
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = ff_raw_write_packet,
    //  .flags = AVFMT_NOTIMESTAMPS,
}
#endif

#if CONFIG_MPEG2VIDEO_MUXER
[CCode (cname="ff_mpeg2video_muxer", cheader="")]
public class OutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "mpeg2video"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "raw MPEG-2 video"
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return ;
        }
    } // = "m2v"
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.NONE;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.MPEG2VIDEO;
        }
    }
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = ff_raw_write_packet,
    //  .flags = AVFMT_NOTIMESTAMPS,
}
#endif

#if CONFIG_RAWVIDEO_MUXER
[CCode (cname="ff_rawvideo_muxer", cheader="")]
public class OutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "rawvideo"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "raw video"
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return ;
        }
    } // = "yuv,rgb"
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.NONE;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.RAWVIDEO;
        }
    }
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = ff_raw_write_packet,
    //  .flags = AVFMT_NOTIMESTAMPS,
}
#endif

#if CONFIG_SBC_MUXER
[CCode (cname="ff_sbc_muxer", cheader="")]
public class OutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "sbc"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "raw SBC"
    [CCode (cname="mime_type", cheader="")]
    public override string mime_type {
        public get {
            return ;
        }
    } // = "audio/x-sbc"
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return ;
        }
    } // = "sbc,msbc"
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.SBC;
        }
    }
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = ff_raw_write_packet,
    //  .flags = AVFMT_NOTIMESTAMPS,
}
#endif

#if CONFIG_TRUEHD_MUXER
[CCode (cname="ff_truehd_muxer", cheader="")]
public class OutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "truehd"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "raw TrueHD"
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return ;
        }
    } // = "thd"
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.TRUEHD;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.NONE;
        }
    }
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = ff_raw_write_packet,
    //  .flags = AVFMT_NOTIMESTAMPS,
}
#endif

#if CONFIG_VC1_MUXER
[CCode (cname="ff_vc1_muxer", cheader="")]
public class OutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "vc1"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "raw VC-1 video"
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return ;
        }
    } // = "vc1"
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.NONE;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.VC1
        }
    }
    [CCode (cname="", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    ); // = force_one_stream,
    [CCode (cname="", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    ); // = ff_raw_write_packet,
    //  .flags = AVFMT_NOTIMESTAMPS,
}
#endif
