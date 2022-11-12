/***********************************************************
@brief Audible AA demuxer
@copyright 2015 Vesselin Bontchev

Header parsing is borrowed from https://github.com/jteeuwen/audible project.
@copyright 2001-2014, Jim Teeuwen

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
    list of conditions and the following disclaimer.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
***********************************************************/

namespace LibAVFormat {

[CCode (cname="aa_class", cheader_filename="")]
public class AAClass : LibAVUtil.Class {
    [CCode (cname="class_name", cheader_filename="")]
    public override string class_name {
        public get {
            return "aa";
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
    //  .option = aa_options,
    [CCode (cname="version", cheader_filename="")]
    public override int version {
        public get {
            return LibAVUtil.Version.INT;
        }
    }
}

[CCode (cname="struct AADemuxContext", cheader_filename="")]
public struct AADemuxerPrivateData { }

[CCode (cname="ff_aa_demuxer", cheader_filename="")]
public class AADemuxer : AVInputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "aa";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "Audible AA format files";
        }
    }
    //  .priv_class = aa_class,
    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (AADemuxerPrivateData);
        }
    }

    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "aa";
        }
    }

    [CCode (cname="aa_probe", cheader_filename="")]
    public override int read_probe (
        AVProbeData format_context
    );

    [CCode (cname="aa_read_header", cheader_filename="")]
    public override int read_header (
        AVFormatContext format_context
    );

    [CCode (cname="aa_read_packet", cheader_filename="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="aa_read_seek", cheader_filename="")]
    public override int read_seek (
        AVFormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="aa_read_close", cheader_filename="")]
    public override int read_close (
        AVFormatContext format_context
    );

    [CCode (cname="flags", cheader_filename="")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_NO_BYTE_SEEK | AVFMT_NOGENSEARCH;
        }
    }
}

} // namespace LibAVFormat
