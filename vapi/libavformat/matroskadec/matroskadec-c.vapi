/***********************************************************
@brief Matroska file demuxer
@copyright 2003-2008 The FFmpeg Project
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

/***********************************************************
@file Matroska file demuxer
@author Ronald Bultje <rbultje@ronald.bitfreak.net>
@author with a little help from Moritz Bunkus <moritz@bunkus.org>
@author totally reworked by Aurelien Jacobs <aurel@gnuage.org>
@see specs available on the Matroska project page: http://www.matroska.org/
***********************************************************/

[CCode (cname="struct MatroskaDemuxContext", cheader_filename="")]
public struct MatroskaDemuxerPrivateData { }

//  #define OFFSET (x) offsetof (MatroskaDemuxContext, x)
//  static const LibAVUtil.Option options[] = {
//      { "live", "flag indicating that the input is a live file that only has the headers.", OFFSET (is_live), AV_OPT_TYPE_BOOL, {.i64 = 0}, 0, 1, AV_OPT_FLAG_DECODING_PARAM },
//      { "bandwidth", "bandwidth of this stream to be specified in the DASH manifest.", OFFSET (bandwidth), AV_OPT_TYPE_INT, {.i64 = 0}, 0, INT_MAX, AV_OPT_FLAG_DECODING_PARAM },
//      { NULL },
//  }

[CCode (cname="webm_dash_class", cheader_filename="")]
public class WebMDashManifestDemuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "WebM DASH Manifest demuxer";
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
}

[CCode (cname="ff_matroska_demuxer", cheader_filename="")]
public class MatroskaDemuxer : AVInputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "matroska,webm";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "Matroska / WebM";
        }
    }

    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "mkv,mk3d,mka,mks";
        }
    }

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MatroskaDemuxerPrivateData);
        }
    }

    [CCode (cname="matroska_probe", cheader_filename="")]
    public override int read_probe (
        AVProbeData format_context
    );

    [CCode (cname="matroska_read_header", cheader_filename="")]
    public override int read_header (
        AVFormatContext format_context
    );

    [CCode (cname="matroska_read_packet", cheader_filename="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="matroska_read_close", cheader_filename="")]
    public override int read_close (
        AVFormatContext format_context
    );

    [CCode (cname="matroska_read_seek", cheader_filename="")]
    public override int read_seek (
        AVFormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="mime_type", cheader_filename="")]
    public override string mime_type {
        public get {
            return "audio/webm,audio/x-matroska,video/webm,video/x-matroska";
        }
    }
}

[CCode (cname="ff_webm_dash_manifest_demuxer", cheader_filename="")]
public class WebMDashManifestDemuxer : AVInputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "webm_dash_manifest";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "WebM DASH Manifest";
        }
    }

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MatroskaDemuxerPrivateData);
        }
    }

    [CCode (cname="webm_dash_manifest_read_header", cheader_filename="")]
    public override int read_header (
        AVFormatContext format_context
    );

    [CCode (cname="webm_dash_manifest_read_packet", cheader_filename="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="matroska_read_close", cheader_filename="")]
    public override int read_close (
        AVFormatContext format_context
    ); // = ,
    //  .priv_class = webm_dash_class,
}

} // namespace LibAVFormat
