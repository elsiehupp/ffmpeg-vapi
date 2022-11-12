/***********************************************************
@brief MPEG-1/2 muxer
@copyright 2000, 2001, 2002 Fabrice Bellard
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

//  #define OFFSET(x) offsetof(MpegMuxContext, x)
//  #define E AV_OPT_FLAG_ENCODING_PARAM
//  static const LibAVUtil.Option options[] = {
//      { "muxrate", NULL,                                          OFFSET(user_mux_rate), AV_OPT_TYPE_INT, { .i64 = 0 }, 0, ((1<<22) - 1) * (8 * 50), E },
//      { "preload", "Initial demux-decode delay in microseconds.", OFFSET(preload),  AV_OPT_TYPE_INT, { .i64 = 500000 }, 0, INT_MAX, E },
//      { NULL },
//  }


#if CONFIG_MPEG1SYSTEM_MUXER
[CCode (cname="mpeg_class", cheader_filename="")]
public class Mpeg2SystemsMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "mpeg muxer";
        }
    }

    [CCode (cname="item_name", cheader_filename="")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="version", cheader_filename="")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;
        }
    }

    [CCode (cname="options", cheader_filename="")]
    public override LibAVUtil.Option[] option { public get; }
}

[CCode (cname="ff_mpeg1system_muxer", cheader_filename="")]
public class Mpeg2SystemsMuxer : AVOutputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "mpeg";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "MPEG-1 Systems / MPEG program stream";
        }
    }

    [CCode (cname="mime_type", cheader_filename="")]
    public override string mime_type {
        public get {
            return "video/mpeg";
        }
    }

    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "mpg,mpeg";
        }
    }

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MpegMuxContext);
        }
    }

    [CCode (cname="audio_codec", cheader_filename="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.MP2;
        }
    }

    [CCode (cname="video_codec", cheader_filename="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.MPEG1VIDEO;
        }
    }

    [CCode (cname="mpeg_mux_init", cheader_filename="")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="mpeg_mux_write_packet", cheader_filename="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="mpeg_mux_end", cheader_filename="")]
    public override int write_trailer (
        AVFormatContext format_context
    );
    //  .priv_class = mpeg_class,
}
#endif

#if CONFIG_MPEG1VCD_MUXER
[CCode (cname="vcd_class", cheader_filename="")]
public class VCDMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "vcd muxer";
        }
    }

    [CCode (cname="item_name", cheader_filename="")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="version", cheader_filename="")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;
        }
    }

    [CCode (cname="options", cheader_filename="")]
    public override LibAVUtil.Option[] option { public get; }
}

[CCode (cname="ff_mpeg1vcd_muxer", cheader_filename="")]
public class VCDMuxer : AVOutputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "vcd";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "MPEG-1 Systems / MPEG program stream (VCD)";
        }
    }

    [CCode (cname="mime_type", cheader_filename="")]
    public override string mime_type {
        public get {
            return "video/mpeg";
        }
    }

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MpegMuxContext);
        }
    }

    [CCode (cname="audio_codec", cheader_filename="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.MP2;
        }
    }

    [CCode (cname="video_codec", cheader_filename="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.MPEG1VIDEO;
        }
    }

    [CCode (cname="mpeg_mux_init", cheader_filename="")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="mpeg_mux_write_packet", cheader_filename="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="mpeg_mux_end", cheader_filename="")]
    public override int write_trailer (
        AVFormatContext format_context
    );
    //  .priv_class = vcd_class,
}
#endif

#if CONFIG_MPEG2VOB_MUXER
[CCode (cname="vob_class", cheader_filename="")]
public class VOBMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "vob muxer";
        }
    }

    [CCode (cname="item_name", cheader_filename="")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="version", cheader_filename="")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;
        }
    }

    [CCode (cname="options", cheader_filename="")]
    public override LibAVUtil.Option[] option { public get; }
}

[CCode (cname="ff_mpeg2vob_muxer", cheader_filename="")]
public class VOBMuxer : AVOutputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "vob";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "MPEG-2 PS (VOB)";
        }
    }

    [CCode (cname="mime_type", cheader_filename="")]
    public override string mime_type {
        public get {
            return "video/mpeg";
        }
    }

    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "vob";
        }
    }

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MpegMuxContext);
        }
    }

    [CCode (cname="audio_codec", cheader_filename="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.MP2;
        }
    }

    [CCode (cname="video_codec", cheader_filename="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.MPEG2VIDEO;
        }
    }

    [CCode (cname="mpeg_mux_init", cheader_filename="")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="mpeg_mux_write_packet", cheader_filename="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="mpeg_mux_end", cheader_filename="")]
    public override int write_trailer (
        AVFormatContext format_context
    );
    //  .priv_class = vob_class,
}
#endif

/***********************************************************
@brief Same as mpeg2vob_mux except that the pack size is 2324
***********************************************************/
#if CONFIG_MPEG2SVCD_MUXER
[CCode (cname="svcd_class", cheader_filename="")]
public class SVCDMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "svcd muxer";
        }
    }

    [CCode (cname="item_name", cheader_filename="")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="version", cheader_filename="")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;
        }
    }

    [CCode (cname="options", cheader_filename="")]
    public override LibAVUtil.Option[] option { public get; }
}

[CCode (cname="ff_mpeg2svcd_muxer", cheader_filename="")]
public class SVCDMuxer : AVOutputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "svcd";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "MPEG-2 PS (SVCD)";
        }
    }

    [CCode (cname="mime_type", cheader_filename="")]
    public override string mime_type {
        public get {
            return "video/mpeg";
        }
    }

    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "vob";
        }
    }

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MpegMuxContext);
        }
    }

    [CCode (cname="audio_codec", cheader_filename="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.MP2;
        }
    }

    [CCode (cname="video_codec", cheader_filename="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.MPEG2VIDEO;
        }
    }

    [CCode (cname="mpeg_mux_init", cheader_filename="")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="mpeg_mux_write_packet", cheader_filename="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="mpeg_mux_end", cheader_filename="")]
    public override int write_trailer (
        AVFormatContext format_context
    );
    //  .priv_class = svcd_class,
}
#endif

/***********************************************************
@brief Same as mpeg2vob_mux except the 'is_dvd' flag is set to produce NAV pkts
***********************************************************/
#if CONFIG_MPEG2DVD_MUXER
[CCode (cname="dvd_class", cheader_filename="")]
public class DVDVOBMuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "dvd muxer";
        }
    }

    [CCode (cname="item_name", cheader_filename="")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="version", cheader_filename="")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;
        }
    }

    [CCode (cname="options", cheader_filename="")]
    public override LibAVUtil.Option[] option { public get; }
}

[CCode (cname="ff_mpeg2dvd_muxer", cheader_filename="")]
public class DVDVOBMuxer : AVOutputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "dvd";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "MPEG-2 PS (DVD VOB)";
        }
    }

    [CCode (cname="mime_type", cheader_filename="")]
    public override string mime_type {
        public get {
            return "video/mpeg";
        }
    }

    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "dvd";
        }
    }

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MpegMuxContext);
        }
    }

    [CCode (cname="audio_codec", cheader_filename="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.MP2;
        }
    }

    [CCode (cname="video_codec", cheader_filename="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.MPEG2VIDEO;
        }
    }

    [CCode (cname="mpeg_mux_init", cheader_filename="")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="mpeg_mux_write_packet", cheader_filename="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="mpeg_mux_end", cheader_filename="")]
    public override int write_trailer (
        AVFormatContext format_context
    );
    //  .priv_class = dvd_class,
}
#endif

} // namespace LibAVFormat
