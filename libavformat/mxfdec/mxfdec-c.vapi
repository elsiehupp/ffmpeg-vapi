/***********************************************************
MXF demuxer.
@copyright 2006 SmartJog S.A., Baptiste Coudurier <baptiste dot coudurier at smartjog dot com>
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

/***********************************************************
References
SMPTE 336M KLV Data Encoding Protocol Using Key-Length-Value
SMPTE 377M MXF File Format Specifications
SMPTE 378M Operational Pattern 1a
SMPTE 379M MXF Generic Container
SMPTE 381M Mapping MPEG Streams into the MXF Generic Container
SMPTE 382M Mapping AES3 and Broadcast Wave Audio into the MXF Generic Container
SMPTE 383M Mapping DV-DIF Data to the MXF Generic Container

Principle
Search for Track numbers which will identify essence element KLV packets.
Search for SourcePackage which define tracks which contains Track numbers.
Material Package contains tracks with reference to SourcePackage tracks.
Search for Descriptors (Picture, Sound) which contains codec info and parameters.
Assign Descriptors to correct Tracks.

Metadata reading functions read Local Tags, get InstanceUID(0x3C0A) then add MetaDataSet to MXFContext.
Metadata parsing resolves Strong References to objects.

Simple demuxer, only OP1A supported and some files might not work at all.
Only tracks with associated descriptors will be decoded. "Highly Desirable" SMPTE 377M D.1
***********************************************************/

//  static const LibAVUtil.Option options[] = {
//      { "eia608_extract", "extract eia 608 captions from s436m track",
//        offsetof(MXFContext, eia608_extract), AV_OPT_TYPE_BOOL, {.i64 = 0}, 0, 1,
//        AV_OPT_FLAG_DECODING_PARAM },
//      { NULL },
//  }

[CCode (cname="demuxer_class", cheader="")]
public class MXFDemuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader="")]
    public override string class_name {
        public get {
            return "mxf";
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
    //  .category = AV_CLASS_CATEGORY_DEMUXER,
}

[CCode (cname="ff_mxf_demuxer", cheader="")]
public class MXFDemuxer : AVInputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return "mxf";
        }
    }
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return "MXF (Material eXchange Format)";
        }
    }
    [CCode (cname="flags", cheader="")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_SEEK_TO_PTS;
        }
    }
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MXFContext);
        }
    }
    [CCode (cname="mxf_probe", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="mxf_read_header", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    );
    [CCode (cname="mxf_read_packet", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    [CCode (cname="mxf_read_close", cheader="")]
    public override int read_close (
        AVFormatContext format_context
    );
    [CCode (cname="mxf_read_seek", cheader="")]
    public override int read_seek (
        AVFormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );
    //  .priv_class = demuxer_class,
}

} // namespace LibAVFormat
