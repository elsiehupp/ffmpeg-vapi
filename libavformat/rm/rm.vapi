/***********************************************************
"Real" compatible muxer and demuxer.
@copyright 2000, 2001 Fabrice Bellard
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

//  extern string const ff_rm_metadata[4];
//  extern const AVCodecTag ff_rm_codec_tags[];

[CCode (cname="struct RMStream", cheader_filename="")]
public struct RMStream { }

[CCode (cname="", cheader_filename="")]
public RMStream ff_rm_alloc_rmstream ();

[CCode (cname="", cheader_filename="")]
public void ff_rm_free_rmstream (
    RMStream rms
);

/*< input format for Realmedia-style RTSP streams
***********************************************************/
//  extern AVInputFormat ff_rdt_demuxer;

/***********************************************************
@brief Read the MDPR chunk, which contains stream-specific codec initialization
parameters.

@param format_context context containing RMContext and AVIOContext for stream reading
@param pb context to read the data from
@param st the stream that the MDPR chunk belongs to and where to store the
      parameters read from the chunk into
@param rst real-specific stream information
@param codec_data_size size of the MDPR chunk
@return 0 on success, errno codes on error
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ff_rm_read_mdpr_codecdata (
    AVFormatContext format_context,
    AVIOContext pb,
    AVStream st, RMStream rst,
    uint codec_data_size,
    uint8[] mime
);

/***********************************************************
@brief Parse one rm-stream packet from the input bytestream.

@param format_context context containing RMContext and AVIOContext for stream reading
@param pb context to read the data from
@param st stream to which the packet to be read belongs
@param rst Real-specific stream information
@param len packet length to read from the input
@param packet packet location to store the parsed packet data
@param seq pointer to an integer containing the sequence number, may be
       updated
@param flags the packet flags
@param ts timestamp of the current packet
@return <0 on error, 0 if a packet was placed in the packet pointer. A
    value >0 means that no data was placed in packet, but that cached
    data is available by calling ff_rm_retrieve_cache ().
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ff_rm_parse_packet (
    AVFormatContext format_context,
    AVIOContext pb,
    AVStream st,
    RMStream rst,
    int len,
    LibAVCodec.Packet packet,
    out int seq,
    int flags,
    int64 ts
);

/***********************************************************
@brief Retrieve one cached packet from the rm-context. The real container can
store several packets (as interpreted by the codec) in a single container
packet, which means the demuxer holds some back when the first container
packet is parsed and returned. The result is that rm.audio_pkt_cnt is
a positive number, the amount of cached packets. Using this function, each
of those packets can be retrieved sequentially.

@param format_context context containing RMContext and AVIOContext for stream reading
@param pb context to read the data from
@param st stream that this packet belongs to
@param rst Real-specific stream information
@param packet location to store the packet data
@return the number of samples left for subsequent calls to this same
     function, or 0 if all samples have been retrieved.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ff_rm_retrieve_cache (
    AVFormatContext format_context,
    AVIOContext pb,
    AVStream st,
    RMStream rst,
    LibAVCodec.Packet packet
);

} // namespace LibAVFormat
