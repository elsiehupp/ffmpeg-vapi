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

//  #define IMAGEAUTO_DEMUXER(imgname, codecid)

public abstract class ImageClass : AVClass {
    [CCode (cname="item_name", cheader="")]
    public override string item_name (
        void *class_context
    ) {
        return av_default_item_name (
            class_context
        );
    }
    //  .option = ff_img2pipe_options,
    [CCode (cname="version", cheader="")]
    public override int version {
        public get {
            return LIBAVUTIL_VERSION_INT;
        }
    }
}

public abstract class ImageDemuxer : AVInputFormat {
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="ff_img_read_header", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );
    [CCode (cname="ff_img_read_packet", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    //  .flags = AVFMT_GENERIC_INDEX,
}

[CCode (cname="bmp_class", cheader="")]
public class BMPClass : ImageClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "bmp demuxer";
        }
    }
}

[CCode (cname="ff_image_bmp_pipe_demuxer", cheader="")]
public class BMPPipeDemuxer : ImageDemuxer {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "bmp_pipe";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "piped bmp sequence";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="bmp_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    //  .priv_class = bmp_class,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.BMP;
        }
    }
}

[CCode (cname="dds_class", cheader="")]
public class DDSClass : ImageClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "dds demuxer";
        }
    }
}

[CCode (cname="ff_image_dds_pipe_demuxer", cheader="")]
public class DDSPipeDemuxer : ImageDemuxer {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "dds_pipe";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "piped dds sequence";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="dds_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="priv_class", cheader="")]
    //  .priv_class = dds_class,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.DDS;
        }
    }
}

[CCode (cname="dpx_class", cheader="")]
public class DPXClass : ImageClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "dpx demuxer";
        }
    }
}

[CCode (cname="ff_image_dpx_pipe_demuxer", cheader="")]
public class DPXPipeDemuxer : ImageDemuxer {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "dpx_pipe";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "piped dpx sequence";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="dpx_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="priv_class", cheader="")]
    //  .priv_class = dpx_class,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.DPX;
        }
    }
}

[CCode (cname="exr_class", cheader="")]
public class EXRClass : ImageClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "exr demuxer";
        }
    }
}

[CCode (cname="ff_image_exr_pipe_demuxer", cheader="")]
public class EXRPipeDemuxer : ImageDemuxer {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "exr_pipe";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "piped exr sequence";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="exr_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="priv_class", cheader="")]
    //  .priv_class = exr_class,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.EXR;
        }
    }
}

[CCode (cname="gif_class", cheader="")]
public class GIFClass : ImageClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "gif demuxer";
        }
    }
}

[CCode (cname="ff_image_gif_pipe_demuxer", cheader="")]
public class GIFPipeDemuxer : ImageDemuxer {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "gif_pipe";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "piped gif sequence";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="gif_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="priv_class", cheader="")]
    //  .priv_class = gif_class,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.GIF;
        }
    }
}

[CCode (cname="j2k_class", cheader="")]
public class J2KClass : ImageClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "j2k demuxer";
        }
    }
}

[CCode (cname="ff_image_j2k_pipe_demuxer", cheader="")]
public class J2KPipeDemuxer : ImageDemuxer {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "j2k_pipe";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "piped j2k sequence";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="j2k_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="priv_class", cheader="")]
    //  .priv_class = j2k_class,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.JPEG2000;
        }
    }
}

[CCode (cname="jpeg_class", cheader="")]
public class JPEGClass : ImageClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "jpeg demuxer";
        }
    }
}

[CCode (cname="ff_image_jpeg_pipe_demuxer", cheader="")]
public class JPEGPipeDemuxer : ImageDemuxer {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "jpeg_pipe";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "piped jpeg sequence";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="jpeg_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="priv_class", cheader="")]
    //  .priv_class = jpeg_class,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.MJPEG;
        }
    }
}

[CCode (cname="jpegls_class", cheader="")]
public class JPEGLSClass : ImageClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "jpegls demuxer";
        }
    }
}

[CCode (cname="ff_image_jpegls_pipe_demuxer", cheader="")]
public class JPEGLSPipeDemuxer : ImageDemuxer {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "jpegls_pipe";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "piped jpegls sequence";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="jpegls_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="priv_class", cheader="")]
    //  .priv_class = jpegls_class,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.JPEGLS;
        }
    }
}

[CCode (cname="pam_class", cheader="")]
public class PAMClass : ImageClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "pam demuxer";
        }
    }
}

[CCode (cname="ff_image_pam_pipe_demuxer", cheader="")]
public class PAMPipeDemuxer : ImageDemuxer {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "pam_pipe";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "piped pam sequence";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="pam_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="priv_class", cheader="")]
    //  .priv_class = pam_class,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.PAM;
        }
    }
}

[CCode (cname="pbm_class", cheader="")]
public class PBMClass : ImageClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "pbm demuxer";
        }
    }
}

[CCode (cname="ff_image_pbm_pipe_demuxer", cheader="")]
public class PBMPipeDemuxer : ImageDemuxer {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "pbm_pipe";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "piped pbm sequence";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="pbm_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="priv_class", cheader="")]
    //  .priv_class = pbm_class,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.PBM;
        }
    }
}

[CCode (cname="pcx_class", cheader="")]
public class PCXClass : ImageClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "pcx demuxer";
        }
    }
}

[CCode (cname="ff_image_pcx_pipe_demuxer", cheader="")]
public class PCXPipeDemuxer : ImageDemuxer {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "pcx_pipe";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "piped pcx sequence";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="pcx_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="priv_class", cheader="")]
    //  .priv_class = pcx_class,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.PCX;
        }
    }
}

[CCode (cname="pgm_class", cheader="")]
public class PGMClass : ImageClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "pgm demuxer";
        }
    }
}

[CCode (cname="ff_image_pgm_pipe_demuxer", cheader="")]
public class PGMPipeDemuxer : ImageDemuxer {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "pgm_pipe";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "piped pgm sequence";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="pgm_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="priv_class", cheader="")]
    //  .priv_class = pgm_class,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.PGM;
        }
    }
}

[CCode (cname="pgmyuv_class", cheader="")]
public class PGMYUVClass : ImageClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "pgmyuv demuxer";
        }
    }
}

[CCode (cname="ff_image_pgmyuv_pipe_demuxer", cheader="")]
public class PGMYUVPipeDemuxer : ImageDemuxer {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "pgmyuv_pipe";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "piped pgmyuv sequence";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="pgmyuv_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="priv_class", cheader="")]
    //  .priv_class = pgmyuv_class,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.PGMYUV;
        }
    }
}

[CCode (cname="pictor_class", cheader="")]
public class PictorClass : ImageClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "pictor demuxer";
        }
    }
}

[CCode (cname="ff_image_pictor_pipe_demuxer", cheader="")]
public class PictorPipeDemuxer : ImageDemuxer {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "pictor_pipe";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "piped pictor sequence";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="pictor_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="priv_class", cheader="")]
    //  .priv_class = pictor_class,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.PICTOR;
        }
    }
}

[CCode (cname="png_class", cheader="")]
public class PNGClass : ImageClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "png demuxer";
        }
    }
}

[CCode (cname="ff_image_png_pipe_demuxer", cheader="")]
public class PNGPipeDemuxer : ImageDemuxer {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "png_pipe";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "piped png sequence";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="png_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="priv_class", cheader="")]
    //  .priv_class = png_class,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.PNG;
        }
    }
}

[CCode (cname="ppm_class", cheader="")]
public class PPMClass : ImageClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "ppm demuxer";
        }
    }
}

[CCode (cname="ff_image_ppm_pipe_demuxer", cheader="")]
public class PPMPipeDemuxer : ImageDemuxer {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "ppm_pipe";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "piped ppm sequence";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="ppm_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="priv_class", cheader="")]
    //  .priv_class = ppm_class,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.PPM;
        }
    }
}

[CCode (cname="psd_class", cheader="")]
public class PSDClass : ImageClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "psd demuxer";
        }
    }
}

[CCode (cname="ff_image_psd_pipe_demuxer", cheader="")]
public class PSDPipeDemuxer : ImageDemuxer {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "psd_pipe";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "piped psd sequence";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="psd_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="priv_class", cheader="")]
    //  .priv_class = psd_class,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.PSD;
        }
    }
}

[CCode (cname="qdraw_class", cheader="")]
public class QDrawClass : ImageClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "qdraw demuxer";
        }
    }
}

[CCode (cname="ff_image_qdraw_pipe_demuxer", cheader="")]
public class QDrawPipeDemuxer : ImageDemuxer {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "qdraw_pipe";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "piped qdraw sequence";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="qdraw_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="priv_class", cheader="")]
    //  .priv_class = qdraw_class,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.QDRAW;
        }
    }
}

[CCode (cname="sgi_class", cheader="")]
public class SGIClass : ImageClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "sgi demuxer";
        }
    }
}

[CCode (cname="ff_image_sgi_pipe_demuxer", cheader="")]
public class SGIPipeDemuxer : ImageDemuxer {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "sgi_pipe";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "piped sgi sequence";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="sgi_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="priv_class", cheader="")]
    //  .priv_class = sgi_class,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.SGI;
        }
    }
}

[CCode (cname="sunrast_class", cheader="")]
public class SunrastClass : ImageClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "sunrast demuxer";
        }
    }
}

[CCode (cname="ff_image_sunrast_pipe_demuxer", cheader="")]
public class SunrastPipeDemuxer : ImageDemuxer {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "sunrast_pipe";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "piped sunrast sequence";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="sunrast_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="priv_class", cheader="")]
    //  .priv_class = sunrast_class,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.SUNRAST;
        }
    }
}

[CCode (cname="svg_class", cheader="")]
public class SVGClass : ImageClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "svg demuxer";
        }
    }
}

[CCode (cname="ff_image_svg_pipe_demuxer", cheader="")]
public class SVGPipeDemuxer : ImageDemuxer {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "svg_pipe";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "piped svg sequence";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="svg_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="priv_class", cheader="")]
    //  .priv_class = svg_class,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.SVG;
        }
    }
}

[CCode (cname="tiff_class", cheader="")]
public class TIFFClass : ImageClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "tiff demuxer";
        }
    }
}

[CCode (cname="ff_image_tiff_pipe_demuxer", cheader="")]
public class TIFFPipeDemuxer : ImageDemuxer {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "tiff_pipe";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "piped tiff sequence";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="tiff_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="priv_class", cheader="")]
    //  .priv_class = tiff_class,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.TIFF;
        }
    }
}

[CCode (cname="webp_class", cheader="")]
public class WebPClass : ImageClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "webp demuxer";
        }
    }
}

[CCode (cname="ff_image_webp_pipe_demuxer", cheader="")]
public class WebPPipeDemuxer : ImageDemuxer {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "webp_pipe";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "piped webp sequence";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="webp_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="priv_class", cheader="")]
    //  .priv_class = webp_class,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.WEBP;
        }
    }
}

[CCode (cname="xpm_class", cheader="")]
public class XPMClass : ImageClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "xpm demuxer";
        }
    }
}

[CCode (cname="ff_image_xpm_pipe_demuxer", cheader="")]
public class XPMPipeDemuxer : ImageDemuxer {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "xpm_pipe";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "piped xpm sequence";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="xpm_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="priv_class", cheader="")]
    //  .priv_class = xpm_class,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.XPM;
        }
    }
}

[CCode (cname="xwd_class", cheader="")]
public class XWDClass : ImageClass {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "xwd demuxer";
        }
    }
}

[CCode (cname="ff_image_xwd_pipe_demuxer", cheader="")]
public class XWDPipeDemuxer : ImageDemuxer {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "xwd_pipe";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "piped xwd sequence";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VideoDemuxData);
        }
    }
    [CCode (cname="xwd_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="priv_class", cheader="")]
    //  .priv_class = xwd_class,
    [CCode (cname="raw_codec_id", cheader="")]
    public override LibAVCodec.CodecID raw_codec_id {
        public get {
            return LibAVCodec.CodecID.XWD;
        }
    }
}
