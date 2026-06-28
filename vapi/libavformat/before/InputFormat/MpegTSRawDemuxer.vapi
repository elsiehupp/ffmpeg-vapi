/***********************************************************
@brief MPEG-2 transport stream (aka DVB) demuxer
@copyright 2002-2003 Fabrice Bellard
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

[CCode (cname="MPEGTS_OPTIONS",cheader_filename="subprojects/ffmpeg/libavformat/mpegts.c")]
public define MPEGTS_OPTIONS
    new LibAVUtil.IntOption () {
        name = "resync_size",
        short_help_text = "set size limit for looking up a new synchronization",
        offset = offsetof (
            MpegTSContext,
            resync_size
        ),
        default_value = MAX_RESYNC_SIZE,
        minimum_value = 0,
        maximum_value = int.MAX,
        option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
    }

};

[CCode (cname="mpegts_class",cheader_filename="subprojects/ffmpeg/libavformat/mpegts.c")]
public class MpegTSDemuxerClass : LibAVUtil.Log.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/mpegts.c")]
    public override string class_name {
        public get {
            return "mpegts demuxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/mpegts.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="option")]
    public override LibAVUtil.Option[] options {
        public get {
            return {
                MPEGTS_OPTIONS,
                new LibAVUtil.BoolOption () {
                    name = "fix_teletext_pts",
                    short_help_text = "try to fix pts values of dvb teletext streams",
                    offset = offsetof (
                        MpegTSContext,
                        fix_teletext_pts
                    ),
                    default_value = 1,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
                },
                new LibAVUtil.IntOption () {
                    name = "ts_packetsize",
                    short_help_text = "output option carrying the raw packet size",
                    offset = offsetof (
                        MpegTSContext,
                        raw_packet_size
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM | LibAVUtil.OptionFlags.EXPORT | LibAVUtil.OptionFlags.READONLY
                },
                new LibAVUtil.BoolOption () {
                    name = "scan_all_pmts",
                    short_help_text = "scan and combine all PMTs",
                    offset = offsetof (
                        MpegTSContext,
                        scan_all_pmts
                    ),
                    default_value = -1,
                    minimum_value = -1,
                    maximum_value = 1,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
                },
                new LibAVUtil.BoolOption () {
                    name = "skip_unknown_pmt",
                    short_help_text = "skip PMTs for programs not advertised in the PAT",
                    offset = offsetof (
                        MpegTSContext,
                        skip_unknown_pmt
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
                },
                new LibAVUtil.BoolOption () {
                    name = "merge_pmt_versions",
                    short_help_text = "re-use streams when PMT's version/pids change",
                    offset = offsetof (
                        MpegTSContext,
                        merge_pmt_versions
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
                },
                new LibAVUtil.BoolOption () {
                    name = "skip_changes",
                    short_help_text = "skip changing / adding streams / programs",
                    offset = offsetof (
                        MpegTSContext,
                        skip_changes
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = 0
                },
                new LibAVUtil.BoolOption () {
                    name = "skip_clear",
                    short_help_text = "skip clearing programs",
                    offset = offsetof (
                        MpegTSContext,
                        skip_clear
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = 0
                },
                {
                    NULL
                }

            };

        }

    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/mpegts.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="mpegtsraw_class",cheader_filename="subprojects/ffmpeg/libavformat/mpegts.c")]
public class MpegTSRawDemuxerClass : LibAVUtil.Log.Class {
    [CCode (cname="class_name",cheader_filename="subprojects/ffmpeg/libavformat/mpegts.c")]
    public override string class_name {
        public get {
            return "mpegtsraw demuxer";

        }

    }

    [CCode (cname="item_name",cheader_filename="subprojects/ffmpeg/libavformat/mpegts.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="option")]
    public override LibAVUtil.Option[] options {
        public get {
            return {
                MPEGTS_OPTIONS,
                new LibAVUtil.BoolOption () {
                    name = "compute_pcr",
                    short_help_text = "compute exact PCR for each transport stream packet"
                    offset = offsetof (
                        MpegTSContext,
                        mpeg2ts_compute_pcr
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 1,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM
                },
                new LibAVUtil.IntOption () {
                    name = "ts_packetsize",
                    short_help_text = "output option carrying the raw packet size"
                    offset = offsetof (
                        MpegTSContext,
                        raw_packet_size
                    ),
                    default_value = 0,
                    minimum_value = 0,
                    maximum_value = 0,
                    option_flags = LibAVUtil.OptionFlags.DECODING_PARAM | LibAVUtil.OptionFlags.EXPORT | LibAVUtil.OptionFlags.READONLY
                },
                {
                    NULL
                }

            };

        }

    }

    [CCode (cname="version",cheader_filename="subprojects/ffmpeg/libavformat/mpegts.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
}

[CCode (cname="ff_mpegts_demuxer",cheader_filename="subprojects/ffmpeg/libavformat/mpegts.c")]
public class MPEGTSDemuxer : LibAVFormat.InputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/mpegts.c")]
    public override string name {
        public get {
            return "mpegts";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/mpegts.c")]
    public override string long_name {
        public get {
            return "MPEG-TS (MPEG-2 Transport Stream)";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/mpegts.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MpegTSContext);

        }

    }

    [CCode (cname="mpegts_probe",cheader_filename="subprojects/ffmpeg/libavformat/mpegts.c")]
    public override int read_probe (
        LibAVFormat.ProbeData format_context
    );

    [CCode (cname="mpegts_read_header",cheader_filename="subprojects/ffmpeg/libavformat/mpegts.c")]
    public override int read_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="mpegts_read_packet",cheader_filename="subprojects/ffmpeg/libavformat/mpegts.c")]
    public override int read_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="mpegts_read_close",cheader_filename="subprojects/ffmpeg/libavformat/mpegts.c")]
    public override int read_close (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="mpegts_get_dts",cheader_filename="subprojects/ffmpeg/libavformat/mpegts.c")]
    public override int64 read_timestamp (
        LibAVFormat.FormatContext format_context,
        int stream_index,
        int64[] pos,
        int64 pos_limit
    );

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/mpegts.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.SHOW_IDS | AVFormatFlags1.ALLOWS_TIMESTAMP_DISCONTINUITIES;

        }

    }
    //  .priv_class = mpegts_class;
}

[CCode (cname="ff_mpegtsraw_demuxer",cheader_filename="subprojects/ffmpeg/libavformat/mpegts.c")]
public class MpegTSRawDemuxer : LibAVFormat.InputFormat {
    [CCode (cname="name",cheader_filename="subprojects/ffmpeg/libavformat/mpegts.c")]
    public override string name {
        public get {
            return "mpegtsraw";

        }

    }

    [CCode (cname="long_name",cheader_filename="subprojects/ffmpeg/libavformat/mpegts.c")]
    public override string long_name {
        public get {
            return "raw MPEG-TS (MPEG-2 Transport Stream)";

        }

    }

    [CCode (cname="priv_data_size",cheader_filename="subprojects/ffmpeg/libavformat/mpegts.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MpegTSContext);

        }

    }

    [CCode (cname="mpegts_read_header",cheader_filename="subprojects/ffmpeg/libavformat/mpegts.c")]
    public override int read_header (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="mpegts_raw_read_packet",cheader_filename="subprojects/ffmpeg/libavformat/mpegts.c")]
    public override int read_packet (
        LibAVFormat.FormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="mpegts_read_close",cheader_filename="subprojects/ffmpeg/libavformat/mpegts.c")]
    public override int read_close (
        LibAVFormat.FormatContext format_context
    );

    [CCode (cname="mpegts_get_dts",cheader_filename="subprojects/ffmpeg/libavformat/mpegts.c")]
    public override int64 read_timestamp (
        LibAVFormat.FormatContext format_context,
        int stream_index,
        int64[] pos,
        int64 pos_limit
    );

    [CCode (cname="flags",cheader_filename="subprojects/ffmpeg/libavformat/mpegts.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.SHOW_IDS | AVFormatFlags1.ALLOWS_TIMESTAMP_DISCONTINUITIES;

        }

    }
    //  .priv_class = mpegtsraw_class;
}

} // namespace LibAVFormat
