/*
 * MXF demuxer.
 * Copyright (c) 2006 SmartJog S.A., Baptiste Coudurier <baptiste dot coudurier at smartjog dot com>
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

/*
 * References
 * SMPTE 336M KLV Data Encoding Protocol Using Key-Length-Value
 * SMPTE 377M MXF File Format Specifications
 * SMPTE 378M Operational Pattern 1a
 * SMPTE 379M MXF Generic Container
 * SMPTE 381M Mapping MPEG Streams into the MXF Generic Container
 * SMPTE 382M Mapping AES3 and Broadcast Wave Audio into the MXF Generic Container
 * SMPTE 383M Mapping DV-DIF Data to the MXF Generic Container
 *
 * Principle
 * Search for Track numbers which will identify essence element KLV packets.
 * Search for SourcePackage which define tracks which contains Track numbers.
 * Material Package contains tracks with reference to SourcePackage tracks.
 * Search for Descriptors (Picture, Sound) which contains codec info and parameters.
 * Assign Descriptors to correct Tracks.
 *
 * Metadata reading functions read Local Tags, get InstanceUID(0x3C0A) then add MetaDataSet to MXFContext.
 * Metadata parsing resolves Strong References to objects.
 *
 * Simple demuxer, only OP1A supported and some files might not work at all.
 * Only tracks with associated descriptors will be decoded. "Highly Desirable" SMPTE 377M D.1
 */

static const AVOption options[] = {
    { "eia608_extract", "extract eia 608 captions from s436m track",
      offsetof(MXFContext, eia608_extract), AV_OPT_TYPE_BOOL, {.i64 = 0}, 0, 1,
      AV_OPT_FLAG_DECODING_PARAM },
    { NULL },
};

static const AVClass demuxer_class = {
    .class_name = "mxf",
    .item_name  = av_default_item_name,
    .option     = options,
    .version    = LIBAVUTIL_VERSION_INT,
    .category   = AV_CLASS_CATEGORY_DEMUXER,
};

AVInputFormat ff_mxf_demuxer = {
    .name           = "mxf",
    .long_name      = NULL_IF_CONFIG_SMALL("MXF (Material eXchange Format)"),
    .flags          = AVFMT_SEEK_TO_PTS,
    .priv_data_size = sizeof(MXFContext),
    .read_probe     = mxf_probe,
    .read_header    = mxf_read_header,
    .read_packet    = mxf_read_packet,
    .read_close     = mxf_read_close,
    .read_seek      = mxf_read_seek,
    .priv_class     = &demuxer_class,
};