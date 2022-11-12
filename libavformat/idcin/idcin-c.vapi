/***********************************************************
@brief Id Quake II CIN File Demuxer
@copyright 2003 The FFmpeg project
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
@file id Quake II CIN file demuxer by Mike Melanson (melanson@pcisys.net)
For more information about the id CIN format, visit:
http://www.csse.monash.edu.au/~timf/

CIN is a somewhat quirky and ill-defined format. Here are some notes
for anyone trying to understand the technical details of this format:

The format has no definite file signature. This is problematic for a
general-purpose media player that wants to automatically detect file
types. However, a CIN file does start with 5 32-bit numbers that
specify audio and video parameters. This demuxer gets around the lack
of file signature by performing sanity checks on those parameters.
Probabilistically, this is a reasonable solution since the number of
valid combinations of the 5 parameters is a very small subset of the
total 160-bit number space.

Refer to the function idcin_probe() for the precise A/V parameters
that this demuxer allows.

Next, each audio and video frame has a duration of 1/14 sec. If the
audio sample rate is a multiple of the common frequency 22050 Hz it will
divide evenly by 14. However, if the sample rate is 11025 Hz:
11025 (samples/sec) / 14 (frames/sec) = 787.5 (samples/frame)
The way the CIN stores audio in this case is by storing 787 sample
frames in the first audio frame and 788 sample frames in the second
audio frame. Therefore, the total number of bytes in an audio frame
is given as:
audio frame #0: 787 * (bytes/sample) * (# channels) bytes in frame
audio frame #1: 788 * (bytes/sample) * (# channels) bytes in frame
audio frame #2: 787 * (bytes/sample) * (# channels) bytes in frame
audio frame #3: 788 * (bytes/sample) * (# channels) bytes in frame

Finally, not all id CIN creation tools agree on the resolution of the
color palette, apparently. Some creation tools specify red, green, and
blue palette components in terms of 6-bit VGA color DAC values which
range from 0..63. Other tools specify the RGB components as full 8-bit
values that range from 0..255. Since there are no markers in the file to
differentiate between the two variants, this demuxer uses the following
heuristic:
- load the 768 palette bytes from disk
- assume that they will need to be shifted left by 2 bits to
    transform them from 6-bit values to 8-bit values
- scan through all 768 palette bytes
    - if any bytes exceed 63, do not shift the bytes at all before
        transmitting them to the video decoder
***********************************************************/

[CCode (cname="struct IdcinDemuxContext", cheader_filename="")]
public struct IDCINDemuxerPrivateData { }

[CCode (cname="ff_idcin_demuxer", cheader_filename="")]
public class IDCINDemuxer : AVInputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "idcin";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "id Cinematic";
        }
    }

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (IDCINDemuxerPrivateData);
        }
    }

    [CCode (cname="idcin_probe", cheader_filename="")]
    public override int read_probe (
        AVProbeData format_context
    );

    [CCode (cname="idcin_read_header", cheader_filename="")]
    public override int read_header (
        AVFormatContext format_context
    );

    [CCode (cname="idcin_read_packet", cheader_filename="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    );

    [CCode (cname="idcin_read_seek", cheader_filename="")]
    public override int read_seek (
        AVFormatContext format_context,
        int stream_index,
        int64 timestamp,
        int flags
    );

    [CCode (cname="flags", cheader_filename="")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_NO_BYTE_SEEK;
        }
    }
}

} // namespace LibAVFormat
