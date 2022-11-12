/***********************************************************
@brief MicroDVD subtitle demuxer
@copyright 2010  Aurelien Jacobs <aurel@gnuage.org>
@copyright 2012  Clément Bœsch <u pkh me>
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

//  #define OFFSET(x) offsetof(MicroDVDContext, x)
//  #define SD AV_OPT_FLAG_SUBTITLE_PARAM|AV_OPT_FLAG_DECODING_PARAM
//  static const LibAVUtil.Option microdvd_options[] = {
//      { "subfps", "set the movie frame rate fallback", OFFSET(frame_rate), AV_OPT_TYPE_RATIONAL, {.dbl=0}, 0, INT_MAX, SD },
//      { NULL }
//  }

[CCode (cname="microdvd_class", cheader_filename="")]
public class MicroDVDDemuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "microdvddec";
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
    //  .option = microdvd_options,
    [CCode (cname="version", cheader_filename="")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;
        }
    }
}

[CCode (cname="struct MicroDVDContext", cheader_filename="")]
public struct MicroDVDDemuxerPrivateData { }

[CCode (cname="ff_microdvd_demuxer", cheader_filename="")]
public class MicroDVDDemuxer : AVInputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "microdvd";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "MicroDVD subtitle format";
        }
    }

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MicroDVDDemuxerPrivateData);
        }
    }

    [CCode (cname="microdvd_probe", cheader_filename="")]
    public override int read_probe (
        AVProbeData format_context
    );

    [CCode (cname="microdvd_read_header", cheader_filename="")]
    public override int read_header (
        AVFormatContext format_context
    );

    [CCode (cname="microdvd_read_packet", cheader_filename="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="microdvd_read_seek", cheader_filename="")]
    public override int read_seek2 (
        AVFormatContext format_context,
        int stream_index,
        int64 min_ts,
        int64 ts,
        int64 max_ts,
        int flags
    );

    [CCode (cname="microdvd_read_close", cheader_filename="")]
    public override int read_close (
        AVFormatContext format_context
    );
    //  .priv_class = microdvd_class,
}

} // namespace LibAVFormat
