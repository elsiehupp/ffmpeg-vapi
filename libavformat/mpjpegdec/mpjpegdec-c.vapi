/***********************************************************
@brief Multipart JPEG format
@copyright 2015 Luca Barbato
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

//  #define OFFSET(x) offsetof(MPJPEGDemuxContext, x)
//  #define DEC AV_OPT_FLAG_DECODING_PARAM
//  static const LibAVUtil.Option mpjpeg_options[] = {
//      { "strict_mime_boundary",  "require MIME boundaries match", OFFSET(strict_mime_boundary), AV_OPT_TYPE_BOOL, {.i64 = 0}, 0, 1, DEC },
//      { NULL }
//  }

[CCode (cname="mpjpeg_demuxer_class", cheader_filename="")]
public class MPJPEGDemuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "MPJPEG demuxer";
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
    //  .option = mpjpeg_options,
    [CCode (cname="version", cheader_filename="")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;
        }
    }
}

[CCode (cname="struct MPJPEGDemuxContext", cheader_filename="")]
public struct MultipartJPEGDemuxerPrivateData { }

[CCode (cname="ff_mpjpeg_demuxer", cheader_filename="")]
public class MultipartJPEGDemuxer : AVInputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "mpjpeg";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "MIME multipart JPEG";
        }
    }

    [CCode (cname="mime_type", cheader_filename="")]
    public override string mime_type {
        public get {
            return "multipart/x-mixed-replace";
        }
    }

    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "mjpg";
        }
    }

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MultipartJPEGDemuxerPrivateData);
        }
    }

    [CCode (cname="mpjpeg_read_probe", cheader_filename="")]
    public override int read_probe (
        AVProbeData format_context
    );

    [CCode (cname="mpjpeg_read_header", cheader_filename="")]
    public override int read_header (
        AVFormatContext format_context
    );

    [CCode (cname="mpjpeg_read_packet", cheader_filename="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="mpjpeg_read_close", cheader_filename="")]
    public override int read_close (
        AVFormatContext format_context
    );
    //  .priv_class = mpjpeg_demuxer_class,
    [CCode (cname="flags", cheader_filename="")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_NOTIMESTAMPS;
        }
    }
}



} // namespace LibAVFormat
