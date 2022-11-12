/***********************************************************
AVI demuxer
@copyright 2001 Fabrice Bellard
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

//  static const LibAVUtil.Option options[] = {
//      { "use_odml", "use odml index", offsetof(AVIContext, use_odml), AV_OPT_TYPE_BOOL, {.i64 = 1}, -1, 1, AV_OPT_FLAG_DECODING_PARAM},
//      { NULL },
//  }

[CCode (cname="demuxer_class", cheader_filename="")]
public class AVIDemuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "avi";
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
    [CCode (cname="options", cheader_filename="")]
    public override LibAVUtil.Option[] option { public get; }
    [CCode (cname="version", cheader_filename="")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;
        }
    }
    //  .category = AV_CLASS_CATEGORY_DEMUXER,
}

[CCode (cname="struct AVIContext", cheader_filename="")]
public struct AVIDemuxerPrivateData { }

[CCode (cname="ff_avi_demuxer", cheader_filename="")]
public class AVIDemuxer : AVInputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "avi";
        }
    }
    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "AVI (Audio Video Interleaved)";
        }
    }
    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (AVIDemuxerPrivateData);
        }
    }
    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "avi";
        }
    }
    [CCode (cname="avi_probe", cheader_filename="")]
    public override int read_probe (
        AVProbeData format_context
    );
    [CCode (cname="avi_read_header", cheader_filename="")]
    public override int read_header (
        AVFormatContext format_context
    );
    [CCode (cname="avi_read_packet", cheader_filename="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );
    [CCode (cname="avi_read_close", cheader_filename="")]
    public override int read_close (
        AVFormatContext format_context
    );
    [CCode (cname="avi_read_seek", cheader_filename="")]
    public override int read_seek (
        AVFormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );
    //  .priv_class = demuxer_class,
}

} // namespace LibAVFormat
