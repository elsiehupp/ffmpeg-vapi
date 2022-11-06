/*
 * Tracked MOD demuxer (libopenmpt)
 * Copyright (c) 2016 Josh de Kock
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

static const AVClass class_openmpt = {
    .class_name = "libopenmpt",
    .item_name  = av_default_item_name,
    .option     = options,
    .version    = LIBAVUTIL_VERSION_INT,
};

AVInputFormat ff_libopenmpt_demuxer = {
    .name           = "libopenmpt",
    .long_name      = NULL_IF_CONFIG_SMALL("Tracker formats (libopenmpt)"),
    .priv_data_size = sizeof(OpenMPTContext),
    .read_probe     = read_probe_openmpt,
    .read_header    = read_header_openmpt,
    .read_packet    = read_packet_openmpt,
    .read_close     = read_close_openmpt,
    .read_seek      = read_seek_openmpt,
    .priv_class     = &class_openmpt,
#if OPENMPT_API_VERSION_AT_LEAST(0,3,0)
    .extensions     = "669,amf,ams,dbm,digi,dmf,dsm,dtm,far,gdm,ice,imf,it,j2b,m15,mdl,med,mmcmp,mms,mo3,mod,mptm,mt2,mtm,nst,okt,plm,ppm,psm,pt36,ptm,s3m,sfx,sfx2,st26,stk,stm,stp,ult,umx,wow,xm,xpk",
#else
    .extensions     = "669,amf,ams,dbm,digi,dmf,dsm,far,gdm,ice,imf,it,j2b,m15,mdl,med,mmcmp,mms,mo3,mod,mptm,mt2,mtm,nst,okt,plm,ppm,psm,pt36,ptm,s3m,sfx,sfx2,st26,stk,stm,ult,umx,wow,xm,xpk",
#endif
};
