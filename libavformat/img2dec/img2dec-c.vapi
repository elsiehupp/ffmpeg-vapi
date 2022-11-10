/***********************************************************
Image format
@copyright 2000, 2001, 2002 Fabrice Bellard
@copyright 2004 Michael Niedermayer
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

#define IMAGEAUTO_DEMUXER(imgname, codecid)
[CCode (cname="imgname ## _class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(imgname) " demuxer"
    //  .item_name = av_default_item_name,
    //  .option = ff_img2pipe_options,
    //  .version = LIBAVUTIL_VERSION_INT,
}
[CCode (cname="ff_image_ ## imgname ## _pipe_demuxer", cheader="")]
public class InputDemuxer : AVInputFormat {\
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(imgname) "_pipe",
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "piped " AV_STRINGIFY(imgname) " sequence",
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    ); // = imgname ## _probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    ); // = ff_img_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    ); // = ff_img_read_packet,
    //  .priv_class =  imgname ## _class,
    //  .flags = AVFMT_GENERIC_INDEX,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return codecid;
        }
    }
}

IMAGEAUTO_DEMUXER(,     LibAVCodec.CodecID.BMP)
#define IMAGEAUTO_DEMUXER(imgname, codecid)
[CCode (cname="bmp_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(bmp) " demuxer"
    //  .item_name = av_default_item_name,
    //  .option = ff_img2pipe_options,
    //  .version = LIBAVUTIL_VERSION_INT,
}
[CCode (cname="ff_image_bmp_pipe_demuxer", cheader="")]
public class InputDemuxer : AVInputFormat {\
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(bmp) "_pipe",
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "piped " AV_STRINGIFY(bmp) " sequence",
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    ); // = bmp_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    ); // = ff_img_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    ); // = ff_img_read_packet,
    //  .priv_class =  bmp_class,
    //  .flags = AVFMT_GENERIC_INDEX,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return codecid;
        }
    }
}
IMAGEAUTO_DEMUXER(,     LibAVCodec.CodecID.DDS)
#define IMAGEAUTO_DEMUXER(dds, codecid)
[CCode (cname="dds_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(dds) " demuxer"
    //  .item_name = av_default_item_name,
    //  .option = ff_img2pipe_options,
    //  .version = LIBAVUTIL_VERSION_INT,
}
[CCode (cname="ff_image_dds_pipe_demuxer", cheader="")]
public class InputDemuxer : AVInputFormat {\
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(dds) "_pipe",
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "piped " AV_STRINGIFY(dds) " sequence",
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    ); // = dds_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    ); // = ff_img_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    ); // = ff_img_read_packet,
    //  .priv_class = dds_class,
    //  .flags = AVFMT_GENERIC_INDEX,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return codecid;
        }
    }
}
IMAGEAUTO_DEMUXER(,     LibAVCodec.CodecID.DPX)
#define IMAGEAUTO_DEMUXER(dpx, codecid)
[CCode (cname="dpx_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(dpx) " demuxer"
    //  .item_name = av_default_item_name,
    //  .option = ff_img2pipe_options,
    //  .version = LIBAVUTIL_VERSION_INT,
}
[CCode (cname="ff_image_dpx_pipe_demuxer", cheader="")]
public class InputDemuxer : AVInputFormat {\
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(dpx) "_pipe",
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "piped " AV_STRINGIFY(dpx) " sequence",
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    ); // = dpx_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    ); // = ff_img_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    ); // = ff_img_read_packet,
    //  .priv_class = dpx_class,
    //  .flags = AVFMT_GENERIC_INDEX,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return codecid;
        }
    }
}
IMAGEAUTO_DEMUXER(,     LibAVCodec.CodecID.EXR)
#define IMAGEAUTO_DEMUXER(exr, codecid)
[CCode (cname="exr_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(exr) " demuxer"
    //  .item_name = av_default_item_name,
    //  .option = ff_img2pipe_options,
    //  .version = LIBAVUTIL_VERSION_INT,
}
[CCode (cname="ff_image_exr_pipe_demuxer", cheader="")]
public class InputDemuxer : AVInputFormat {\
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(exr) "_pipe",
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "piped " AV_STRINGIFY(exr) " sequence",
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    ); // = exr_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    ); // = ff_img_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    ); // = ff_img_read_packet,
    //  .priv_class = exr_class,
    //  .flags = AVFMT_GENERIC_INDEX,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return codecid;
        }
    }
}
IMAGEAUTO_DEMUXER(,     LibAVCodec.CodecID.GIF)
#define IMAGEAUTO_DEMUXER(gif, codecid)
[CCode (cname="gif_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(gif) " demuxer"
    //  .item_name = av_default_item_name,
    //  .option = ff_img2pipe_options,
    //  .version = LIBAVUTIL_VERSION_INT,
}
[CCode (cname="ff_image_gif_pipe_demuxer", cheader="")]
public class InputDemuxer : AVInputFormat {\
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(gif) "_pipe",
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "piped " AV_STRINGIFY(gif) " sequence",
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    ); // = gif_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    ); // = ff_img_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    ); // = ff_img_read_packet,
    //  .priv_class = gif_class,
    //  .flags = AVFMT_GENERIC_INDEX,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return codecid;
        }
    }
}
IMAGEAUTO_DEMUXER(,     LibAVCodec.CodecID.JPEG2000)
#define IMAGEAUTO_DEMUXER(j2k, codecid)
[CCode (cname="j2k_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(j2k) " demuxer"
    //  .item_name = av_default_item_name,
    //  .option = ff_img2pipe_options,
    //  .version = LIBAVUTIL_VERSION_INT,
}
[CCode (cname="ff_image_j2k_pipe_demuxer", cheader="")]
public class InputDemuxer : AVInputFormat {\
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(j2k) "_pipe",
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "piped " AV_STRINGIFY(j2k) " sequence",
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    ); // = j2k_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    ); // = ff_img_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    ); // = ff_img_read_packet,
    //  .priv_class = j2k_class,
    //  .flags = AVFMT_GENERIC_INDEX,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return codecid;
        }
    }
}
IMAGEAUTO_DEMUXER(,    LibAVCodec.CodecID.MJPEG)
#define IMAGEAUTO_DEMUXER(jpeg, codecid)
[CCode (cname="jpeg_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(jpeg) " demuxer"
    //  .item_name = av_default_item_name,
    //  .option = ff_img2pipe_options,
    //  .version = LIBAVUTIL_VERSION_INT,
}
[CCode (cname="ff_image_jpeg_pipe_demuxer", cheader="")]
public class InputDemuxer : AVInputFormat {\
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(jpeg) "_pipe",
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "piped " AV_STRINGIFY(jpeg) " sequence",
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    ); // = jpeg_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    ); // = ff_img_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    ); // = ff_img_read_packet,
    //  .priv_class = jpeg_class,
    //  .flags = AVFMT_GENERIC_INDEX,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return codecid;
        }
    }
}
IMAGEAUTO_DEMUXER(,  LibAVCodec.CodecID.JPEGLS)
#define IMAGEAUTO_DEMUXER(jpegls, codecid)
[CCode (cname="jpegls_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(jpegls) " demuxer"
    //  .item_name = av_default_item_name,
    //  .option = ff_img2pipe_options,
    //  .version = LIBAVUTIL_VERSION_INT,
}
[CCode (cname="ff_image_jpegls_pipe_demuxer", cheader="")]
public class InputDemuxer : AVInputFormat {\
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(jpegls) "_pipe",
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "piped " AV_STRINGIFY(jpegls) " sequence",
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    ); // = jpegls_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    ); // = ff_img_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    ); // = ff_img_read_packet,
    //  .priv_class = jpegls_class,
    //  .flags = AVFMT_GENERIC_INDEX,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return codecid;
        }
    }
}
IMAGEAUTO_DEMUXER(,     LibAVCodec.CodecID.PAM)
#define IMAGEAUTO_DEMUXER(pam, codecid)
[CCode (cname="pam_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(pam) " demuxer"
    //  .item_name = av_default_item_name,
    //  .option = ff_img2pipe_options,
    //  .version = LIBAVUTIL_VERSION_INT,
}
[CCode (cname="ff_image_pam_pipe_demuxer", cheader="")]
public class InputDemuxer : AVInputFormat {\
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(pam) "_pipe",
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "piped " AV_STRINGIFY(pam) " sequence",
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    ); // = pam_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    ); // = ff_img_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    ); // = ff_img_read_packet,
    //  .priv_class = pam_class,
    //  .flags = AVFMT_GENERIC_INDEX,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return codecid;
        }
    }
}
IMAGEAUTO_DEMUXER(,     LibAVCodec.CodecID.PBM)
#define IMAGEAUTO_DEMUXER(pbm, codecid)
[CCode (cname="pbm_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(pbm) " demuxer"
    //  .item_name = av_default_item_name,
    //  .option = ff_img2pipe_options,
    //  .version = LIBAVUTIL_VERSION_INT,
}
[CCode (cname="ff_image_pbm_pipe_demuxer", cheader="")]
public class InputDemuxer : AVInputFormat {\
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(pbm) "_pipe",
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "piped " AV_STRINGIFY(pbm) " sequence",
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    ); // = pbm_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    ); // = ff_img_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    ); // = ff_img_read_packet,
    //  .priv_class = pbm_class,
    //  .flags = AVFMT_GENERIC_INDEX,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return codecid;
        }
    }
}
IMAGEAUTO_DEMUXER(,     LibAVCodec.CodecID.PCX)
#define IMAGEAUTO_DEMUXER(pcx, codecid)
[CCode (cname="pcx_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(pcx) " demuxer"
    //  .item_name = av_default_item_name,
    //  .option = ff_img2pipe_options,
    //  .version = LIBAVUTIL_VERSION_INT,
}
[CCode (cname="ff_image_pcx_pipe_demuxer", cheader="")]
public class InputDemuxer : AVInputFormat {\
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(pcx) "_pipe",
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "piped " AV_STRINGIFY(pcx) " sequence",
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    ); // = pcx_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    ); // = ff_img_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    ); // = ff_img_read_packet,
    //  .priv_class = pcx_class,
    //  .flags = AVFMT_GENERIC_INDEX,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return codecid;
        }
    }
}
IMAGEAUTO_DEMUXER(,     LibAVCodec.CodecID.PGM)
#define IMAGEAUTO_DEMUXER(pgm, codecid)
[CCode (cname="pgm_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(pgm) " demuxer"
    //  .item_name = av_default_item_name,
    //  .option = ff_img2pipe_options,
    //  .version = LIBAVUTIL_VERSION_INT,
}
[CCode (cname="ff_image_pgm_pipe_demuxer", cheader="")]
public class InputDemuxer : AVInputFormat {\
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(pgm) "_pipe",
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "piped " AV_STRINGIFY(pgm) " sequence",
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    ); // = pgm_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    ); // = ff_img_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    ); // = ff_img_read_packet,
    //  .priv_class = pgm_class,
    //  .flags = AVFMT_GENERIC_INDEX,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return codecid;
        }
    }
}
IMAGEAUTO_DEMUXER(,  LibAVCodec.CodecID.PGMYUV)
#define IMAGEAUTO_DEMUXER(pgmyuv, codecid)
[CCode (cname="pgmyuv_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(pgmyuv) " demuxer"
    //  .item_name = av_default_item_name,
    //  .option = ff_img2pipe_options,
    //  .version = LIBAVUTIL_VERSION_INT,
}
[CCode (cname="ff_image_pgmyuv_pipe_demuxer", cheader="")]
public class InputDemuxer : AVInputFormat {\
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(pgmyuv) "_pipe",
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "piped " AV_STRINGIFY(pgmyuv) " sequence",
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    ); // = pgmyuv_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    ); // = ff_img_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    ); // = ff_img_read_packet,
    //  .priv_class = pgmyuv_class,
    //  .flags = AVFMT_GENERIC_INDEX,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return codecid;
        }
    }
}
IMAGEAUTO_DEMUXER(,  LibAVCodec.CodecID.PICTOR)
#define IMAGEAUTO_DEMUXER(pictor, codecid)
[CCode (cname="pictor_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(pictor) " demuxer"
    //  .item_name = av_default_item_name,
    //  .option = ff_img2pipe_options,
    //  .version = LIBAVUTIL_VERSION_INT,
}
[CCode (cname="ff_image_pictor_pipe_demuxer", cheader="")]
public class InputDemuxer : AVInputFormat {\
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(pictor) "_pipe",
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "piped " AV_STRINGIFY(pictor) " sequence",
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    ); // = pictor_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    ); // = ff_img_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    ); // = ff_img_read_packet,
    //  .priv_class = pictor_class,
    //  .flags = AVFMT_GENERIC_INDEX,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return codecid;
        }
    }
}
IMAGEAUTO_DEMUXER(,     LibAVCodec.CodecID.PNG)
#define IMAGEAUTO_DEMUXER(png, codecid)
[CCode (cname="png_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(png) " demuxer"
    //  .item_name = av_default_item_name,
    //  .option = ff_img2pipe_options,
    //  .version = LIBAVUTIL_VERSION_INT,
}
[CCode (cname="ff_image_png_pipe_demuxer", cheader="")]
public class InputDemuxer : AVInputFormat {\
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(png) "_pipe",
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "piped " AV_STRINGIFY(png) " sequence",
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    ); // = png_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    ); // = ff_img_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    ); // = ff_img_read_packet,
    //  .priv_class = png_class,
    //  .flags = AVFMT_GENERIC_INDEX,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return codecid;
        }
    }
}
IMAGEAUTO_DEMUXER(,     LibAVCodec.CodecID.PPM)
#define IMAGEAUTO_DEMUXER(ppm, codecid)
[CCode (cname="ppm_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(ppm) " demuxer"
    //  .item_name = av_default_item_name,
    //  .option = ff_img2pipe_options,
    //  .version = LIBAVUTIL_VERSION_INT,
}
[CCode (cname="ff_image_ppm_pipe_demuxer", cheader="")]
public class InputDemuxer : AVInputFormat {\
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(ppm) "_pipe",
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "piped " AV_STRINGIFY(ppm) " sequence",
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    ); // = ppm_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    ); // = ff_img_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    ); // = ff_img_read_packet,
    //  .priv_class = ppm_class,
    //  .flags = AVFMT_GENERIC_INDEX,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return codecid;
        }
    }
}
IMAGEAUTO_DEMUXER(,     LibAVCodec.CodecID.PSD)
#define IMAGEAUTO_DEMUXER(psd, codecid)
[CCode (cname="psd_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(psd) " demuxer"
    //  .item_name = av_default_item_name,
    //  .option = ff_img2pipe_options,
    //  .version = LIBAVUTIL_VERSION_INT,
}
[CCode (cname="ff_image_psd_pipe_demuxer", cheader="")]
public class InputDemuxer : AVInputFormat {\
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(psd) "_pipe",
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "piped " AV_STRINGIFY(psd) " sequence",
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    ); // = psd_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    ); // = ff_img_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    ); // = ff_img_read_packet,
    //  .priv_class = psd_class,
    //  .flags = AVFMT_GENERIC_INDEX,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return codecid;
        }
    }
}
IMAGEAUTO_DEMUXER(,   LibAVCodec.CodecID.QDRAW)
#define IMAGEAUTO_DEMUXER(qdraw, codecid)
[CCode (cname="qdraw_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(qdraw) " demuxer"
    //  .item_name = av_default_item_name,
    //  .option = ff_img2pipe_options,
    //  .version = LIBAVUTIL_VERSION_INT,
}
[CCode (cname="ff_image_qdraw_pipe_demuxer", cheader="")]
public class InputDemuxer : AVInputFormat {\
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(qdraw) "_pipe",
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "piped " AV_STRINGIFY(qdraw) " sequence",
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    ); // = qdraw_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    ); // = ff_img_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    ); // = ff_img_read_packet,
    //  .priv_class = qdraw_class,
    //  .flags = AVFMT_GENERIC_INDEX,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return codecid;
        }
    }
}
IMAGEAUTO_DEMUXER(,     LibAVCodec.CodecID.SGI)
#define IMAGEAUTO_DEMUXER(sgi, codecid)
[CCode (cname="sgi_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(sgi) " demuxer"
    //  .item_name = av_default_item_name,
    //  .option = ff_img2pipe_options,
    //  .version = LIBAVUTIL_VERSION_INT,
}
[CCode (cname="ff_image_sgi_pipe_demuxer", cheader="")]
public class InputDemuxer : AVInputFormat {\
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(sgi) "_pipe",
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "piped " AV_STRINGIFY(sgi) " sequence",
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    ); // = sgi_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    ); // = ff_img_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    ); // = ff_img_read_packet,
    //  .priv_class = sgi_class,
    //  .flags = AVFMT_GENERIC_INDEX,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return codecid;
        }
    }
}
IMAGEAUTO_DEMUXER(, LibAVCodec.CodecID.SUNRAST)
#define IMAGEAUTO_DEMUXER(sunrast, codecid)
[CCode (cname="sunrast_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(sunrast) " demuxer"
    //  .item_name = av_default_item_name,
    //  .option = ff_img2pipe_options,
    //  .version = LIBAVUTIL_VERSION_INT,
}
[CCode (cname="ff_image_sunrast_pipe_demuxer", cheader="")]
public class InputDemuxer : AVInputFormat {\
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(sunrast) "_pipe",
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "piped " AV_STRINGIFY(sunrast) " sequence",
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    ); // = sunrast_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    ); // = ff_img_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    ); // = ff_img_read_packet,
    //  .priv_class = sunrast_class,
    //  .flags = AVFMT_GENERIC_INDEX,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return codecid;
        }
    }
}
IMAGEAUTO_DEMUXER(,     LibAVCodec.CodecID.SVG)
#define IMAGEAUTO_DEMUXER(svg, codecid)
[CCode (cname="svg_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(svg) " demuxer"
    //  .item_name = av_default_item_name,
    //  .option = ff_img2pipe_options,
    //  .version = LIBAVUTIL_VERSION_INT,
}
[CCode (cname="ff_image_svg_pipe_demuxer", cheader="")]
public class InputDemuxer : AVInputFormat {\
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(svg) "_pipe",
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "piped " AV_STRINGIFY(svg) " sequence",
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    ); // = svg_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    ); // = ff_img_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    ); // = ff_img_read_packet,
    //  .priv_class = svg_class,
    //  .flags = AVFMT_GENERIC_INDEX,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return codecid;
        }
    }
}
IMAGEAUTO_DEMUXER(,    LibAVCodec.CodecID.TIFF)
#define IMAGEAUTO_DEMUXER(tiff, codecid)
[CCode (cname="tiff_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(tiff) " demuxer"
    //  .item_name = av_default_item_name,
    //  .option = ff_img2pipe_options,
    //  .version = LIBAVUTIL_VERSION_INT,
}
[CCode (cname="ff_image_tiff_pipe_demuxer", cheader="")]
public class InputDemuxer : AVInputFormat {\
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(tiff) "_pipe",
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "piped " AV_STRINGIFY(tiff) " sequence",
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    ); // = tiff_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    ); // = ff_img_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    ); // = ff_img_read_packet,
    //  .priv_class = tiff_class,
    //  .flags = AVFMT_GENERIC_INDEX,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return codecid;
        }
    }
}
IMAGEAUTO_DEMUXER(,    LibAVCodec.CodecID.WEBP)
#define IMAGEAUTO_DEMUXER(webp, codecid)
[CCode (cname="webp_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(webp) " demuxer"
    //  .item_name = av_default_item_name,
    //  .option = ff_img2pipe_options,
    //  .version = LIBAVUTIL_VERSION_INT,
}
[CCode (cname="ff_image_webp_pipe_demuxer", cheader="")]
public class InputDemuxer : AVInputFormat {\
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(webp) "_pipe",
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "piped " AV_STRINGIFY(webp) " sequence",
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    ); // = webp_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    ); // = ff_img_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    ); // = ff_img_read_packet,
    //  .priv_class = webp_class,
    //  .flags = AVFMT_GENERIC_INDEX,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return codecid;
        }
    }
}
IMAGEAUTO_DEMUXER(,     LibAVCodec.CodecID.XPM)
#define IMAGEAUTO_DEMUXER(xpm, codecid)
[CCode (cname="xpm_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(xpm) " demuxer"
    //  .item_name = av_default_item_name,
    //  .option = ff_img2pipe_options,
    //  .version = LIBAVUTIL_VERSION_INT,
}
[CCode (cname="ff_image_xpm_pipe_demuxer", cheader="")]
public class InputDemuxer : AVInputFormat {\
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(xpm) "_pipe",
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "piped " AV_STRINGIFY(xpm) " sequence",
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    ); // = xpm_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    ); // = ff_img_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    ); // = ff_img_read_packet,
    //  .priv_class = xpm_class,
    //  .flags = AVFMT_GENERIC_INDEX,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return codecid;
        }
    }
}
IMAGEAUTO_DEMUXER(,     LibAVCodec.CodecID.XWD)
#define IMAGEAUTO_DEMUXER(xwd, codecid)
[CCode (cname="xwd_class", cheader="")]
public class AVClass : AVClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(xwd) " demuxer"
    //  .item_name = av_default_item_name,
    //  .option = ff_img2pipe_options,
    //  .version = LIBAVUTIL_VERSION_INT,
}
[CCode (cname="ff_image_xwd_pipe_demuxer", cheader="")]
public class InputDemuxer : AVInputFormat {\
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = AV_STRINGIFY(xwd) "_pipe",
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "piped " AV_STRINGIFY(xwd) " sequence",
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    ); // = xwd_probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    ); // = ff_img_read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    ); // = ff_img_read_packet,
    //  .priv_class = xwd_class,
    //  .flags = AVFMT_GENERIC_INDEX,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return codecid;
        }
    }
}
