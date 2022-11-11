/***********************************************************
Tracked MOD demuxer (libopenmpt)
@copyright 2016 Josh de Kock
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

[CCode (cname="class_openmpt", cheader="")]
public class LibOpenMptDemuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "libopenmpt";
        }
    }
    [CCode (cname="item_name", cheader="")]
    public override string item_name (
        void *class_context
    ) {
        return av_default_item_name (
            class_context
        );
    }
    [CCode (cname="options", cheader="")]
    public override LibAVUtil.Option[] option { public get; }
    [CCode (cname="version", cheader="")]
    public override int version {
        public get {
            return LIBAVUTIL_VERSION_INT;
        }
    }
}

[CCode (cname="ff_libopenmpt_demuxer", cheader="")]
public class LibOpenMptDemuxer : AVInputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "libopenmpt";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "Tracker formats (libopenmpt)";
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (OpenMPTContext);
        }
    }
    [CCode (cname="read_probe_openmpt", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="read_header_openmpt", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );
    [CCode (cname="read_packet_openmpt", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    [CCode (cname="read_close_openmpt", cheader="")]
    public override int read_close (
        AVFormatContext format_context
    );
    [CCode (cname="read_seek_openmpt", cheader="")]
    public override int read_seek (
        AVFormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );
    //  .priv_class = class_openmpt,
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            if (OPENMPT_API_VERSION_AT_LEAST(0,3,0)) {
                return "669,amf,ams,dbm,digi,dmf,dsm,dtm,far,gdm,ice,imf,it,j2b,m15,mdl,med,mmcmp,mms,mo3,mod,mptm,mt2,mtm,nst,okt,plm,ppm,psm,pt36,ptm,s3m,sfx,sfx2,st26,stk,stm,stp,ult,umx,wow,xm,xpk";
            } else {
                return "669,amf,ams,dbm,digi,dmf,dsm,far,gdm,ice,imf,it,j2b,m15,mdl,med,mmcmp,mms,mo3,mod,mptm,mt2,mtm,nst,okt,plm,ppm,psm,pt36,ptm,s3m,sfx,sfx2,st26,stk,stm,ult,umx,wow,xm,xpk";
            }
        }
    }
}

} // namespace LibAVFormat
