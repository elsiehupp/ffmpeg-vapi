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
@file VapourSynth demuxer

Synthesizes vapour (?)
***********************************************************/

[CCode (cname="class_vs", cheader_filename="")]
public class VapourSynthDemuxerClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "VapourSynth demuxer";
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

[CCode (cname="struct VSContext", cheader_filename="")]
public struct VapourSynthDemuxerPrivateData { }

[CCode (cname="ff_vapoursynth_demuxer", cheader_filename="")]
public class VapourSynthDemuxer : AVInputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "vapoursynth";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "VapourSynth demuxer";
        }
    }

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (VapourSynthDemuxerPrivateData);
        }
    }

    [CCode (cname="probe_vs", cheader_filename="")]
    public override int read_probe (
        AVProbeData format_context
    );

    [CCode (cname="read_header_vs", cheader_filename="")]
    public override int read_header (
        AVFormatContext format_context
    );

    [CCode (cname="read_packet_vs", cheader_filename="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="read_close_vs", cheader_filename="")]
    public override int read_close (
        AVFormatContext format_context
    );

    [CCode (cname="read_seek_vs", cheader_filename="")]
    public override int read_seek (
        AVFormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );
    //  .priv_class = class_vs,
}

} // namespace LibAVFormat
