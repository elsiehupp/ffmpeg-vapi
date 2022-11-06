/*
 * Image format
 * Copyright (c) 2000, 2001, 2002 Fabrice Bellard
 * Copyright (c) 2004 Michael Niedermayer
 *
 * This file is part of FFmpeg.
 *
 * FFmpeg is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * FFmpeg is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with FFmpeg; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 */

#define IMAGEAUTO_DEMUXER(imgname, codecid)\
static const AVClass imgname ## _class = {\
    //  .class_name = AV_STRINGIFY(imgname) " demuxer",\
    //  .item_name  = av_default_item_name,\
    //  .option     = ff_img2pipe_options,\
    //  .version    = LIBAVUTIL_VERSION_INT,\
};\
public class InputFormat : AVInputFormat ff_image_ ## imgname ## _pipe_demuxer = {\
    //  .name           = AV_STRINGIFY(imgname) "_pipe",\
    //  .long_name      = "piped " AV_STRINGIFY(imgname) " sequence",\
    //  .priv_data_size = sizeof(VideoDemuxData),\
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );     = imgname ## _probe,\
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );    = ff_img_read_header,\
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );    = ff_img_read_packet,\
    //  .priv_class     = & imgname ## _class,\
    //  .flags          = AVFMT_GENERIC_INDEX, \
    //  .raw_codec_id   = codecid,\
};

IMAGEAUTO_DEMUXER(bmp,     AV_CODEC_ID_BMP)
IMAGEAUTO_DEMUXER(dds,     AV_CODEC_ID_DDS)
IMAGEAUTO_DEMUXER(dpx,     AV_CODEC_ID_DPX)
IMAGEAUTO_DEMUXER(exr,     AV_CODEC_ID_EXR)
IMAGEAUTO_DEMUXER(gif,     AV_CODEC_ID_GIF)
IMAGEAUTO_DEMUXER(j2k,     AV_CODEC_ID_JPEG2000)
IMAGEAUTO_DEMUXER(jpeg,    AV_CODEC_ID_MJPEG)
IMAGEAUTO_DEMUXER(jpegls,  AV_CODEC_ID_JPEGLS)
IMAGEAUTO_DEMUXER(pam,     AV_CODEC_ID_PAM)
IMAGEAUTO_DEMUXER(pbm,     AV_CODEC_ID_PBM)
IMAGEAUTO_DEMUXER(pcx,     AV_CODEC_ID_PCX)
IMAGEAUTO_DEMUXER(pgm,     AV_CODEC_ID_PGM)
IMAGEAUTO_DEMUXER(pgmyuv,  AV_CODEC_ID_PGMYUV)
IMAGEAUTO_DEMUXER(pictor,  AV_CODEC_ID_PICTOR)
IMAGEAUTO_DEMUXER(png,     AV_CODEC_ID_PNG)
IMAGEAUTO_DEMUXER(ppm,     AV_CODEC_ID_PPM)
IMAGEAUTO_DEMUXER(psd,     AV_CODEC_ID_PSD)
IMAGEAUTO_DEMUXER(qdraw,   AV_CODEC_ID_QDRAW)
IMAGEAUTO_DEMUXER(sgi,     AV_CODEC_ID_SGI)
IMAGEAUTO_DEMUXER(sunrast, AV_CODEC_ID_SUNRAST)
IMAGEAUTO_DEMUXER(svg,     AV_CODEC_ID_SVG)
IMAGEAUTO_DEMUXER(tiff,    AV_CODEC_ID_TIFF)
IMAGEAUTO_DEMUXER(webp,    AV_CODEC_ID_WEBP)
IMAGEAUTO_DEMUXER(xpm,     AV_CODEC_ID_XPM)
IMAGEAUTO_DEMUXER(xwd,     AV_CODEC_ID_XWD)
