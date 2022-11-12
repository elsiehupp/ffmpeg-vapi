/***********************************************************
@brief Sony OpenMG (OMA) demuxer

@copyright 2008, 2013 Maxim Poliakovski
              2008 Benjamin Larsson
              2011 David Goldwich
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
@file This is a demuxer for Sony OpenMG Music files

Known file extensions: ".oma", "aa3"
The format of such files consists of three parts:
- "ea3" header carrying overall info and metadata. Except for starting with
"ea" instead of "ID", it's an ID3v2 header.
- "EA3" header is a Sony-specific header containing information about
the OpenMG file: codec type (usually ATRAC, can also be MP3 or WMA),
codec specific info (packet size, sample rate, channels and so on)
and DRM related info (file encryption, content id).
- Sound data organized in packets follow the EA3 header
(can be encrypted using the Sony DRM!).

Supported decoders: ATRAC3, ATRAC3+, MP3, LPCM
***********************************************************/

[CCode (cname="struct OMAContext", cheader_filename="")]
public struct OMADemuxerPrivateData { }

[CCode (cname="ff_oma_demuxer", cheader_filename="")]
public class OMADemuxer : AVInputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "oma";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "Sony OpenMG audio";
        }
    }

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (OMADemuxerPrivateData);
        }
    }

    [CCode (cname="oma_read_probe", cheader_filename="")]
    public override int read_probe (
        AVProbeData format_context
    );

    [CCode (cname="oma_read_header", cheader_filename="")]
    public override int read_header (
        AVFormatContext format_context
    );

    [CCode (cname="oma_read_packet", cheader_filename="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="oma_read_seek", cheader_filename="")]
    public override int read_seek (
        AVFormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="oma_read_close", cheader_filename="")]
    public override int read_close (
        AVFormatContext format_context
    );

    [CCode (cname="flags", cheader_filename="")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_GENERIC_INDEX;
        }
    }

    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "oma,omg,aa3";
        }
    }
    //  .codec_tag = (AVCodecTag[]){ff_oma_codec_tags, 0},
}

} // namespace LibAVFormat
