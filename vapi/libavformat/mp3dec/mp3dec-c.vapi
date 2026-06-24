/***********************************************************
@brief MP3 demuxer
@copyright 2003 Fabrice Bellard
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

static const LibAVUtil.Option options[] = {
    new LibAVUtil.BoolOption () {
        name = "usetoc",
        short_help_text = "use table of contents",
        offset = offsetof (
            MP3DecContext, usetoc
        ),
        default_value = 0,
        minimum_value = 0,
        maximum_value = 1,
        LibAVUtil.OptionFlags.DECODING_PARAM
    },
    {
        NULL
    }

};

[CCode (cname="demuxer_class",cheader_filename="ffmpeg/libformat/mp3dec.c")]
public class MP3DemuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name",cheader_filename="ffmpeg/libformat/mp3dec.c")]
    public override string class_name {
        public get {
            return "mp3";

        }

    }

    [CCode (cname="item_name",cheader_filename="ffmpeg/libformat/mp3dec.c")]
    public override string item_name (
        void *class_context
    ) {
        return base.item_name (
            class_context
        );
    }

    [CCode (cname="options",cheader_filename="ffmpeg/libformat/mp3dec.c")]
    public override LibAVUtil.Option[] option { public get; }

    [CCode (cname="version",cheader_filename="ffmpeg/libformat/mp3dec.c")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;

        }

    }
    //  .category = LibAVUtil.ClassCategory.DEMUXER;
}

[CCode (cname="struct MP3DecContext",cheader_filename="ffmpeg/libformat/mp3dec.c")]
[Compact]
public class MP3DemuxerPrivateData { }

[CCode (cname="ff_mp3_demuxer",cheader_filename="ffmpeg/libformat/mp3dec.c")]
public class MP3Demuxer : AVInputFormat {
    [CCode (cname="name",cheader_filename="ffmpeg/libformat/mp3dec.c")]
    public override string name {
        public get {
            return "mp3";

        }

    }

    [CCode (cname="long_name",cheader_filename="ffmpeg/libformat/mp3dec.c")]
    public override string long_name {
        public get {
            return "MP2/3 (MPEG audio layer 2/3)";

        }

    }

    [CCode (cname="mp3_read_probe",cheader_filename="ffmpeg/libformat/mp3dec.c")]
    public override int read_probe (
        AVProbeData format_context
    );

    [CCode (cname="mp3_read_header",cheader_filename="ffmpeg/libformat/mp3dec.c")]
    public override int read_header (
        AVFormatContext format_context
    );

    [CCode (cname="mp3_read_packet",cheader_filename="ffmpeg/libformat/mp3dec.c")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="mp3_seek",cheader_filename="ffmpeg/libformat/mp3dec.c")]
    public override int read_seek (
        AVFormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="priv_data_size",cheader_filename="ffmpeg/libformat/mp3dec.c")]
    public override size_t priv_data_size {
        public get {
            return sizeof (MP3DemuxerPrivateData);

        }

    }

    [CCode (cname="flags",cheader_filename="ffmpeg/libformat/mp3dec.c")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFormatFlags1.USE_GENERIC_INDEX;

        }

    }

    /***********************************************************
    @brief XXX: use probe
    ***********************************************************/
    [CCode (cname="extensions",cheader_filename="ffmpeg/libformat/mp3dec.c")]
    public override string extensions {
        public get {
            return "mp2,mp3,m2a,mpa";

        }

    }
    //  .priv_class = demuxer_class;
}

} // namespace LibAVFormat
