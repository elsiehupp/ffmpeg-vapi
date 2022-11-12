/***********************************************************
MMS protocol common definitions.
@copyright 2010 Zhentan Feng <spyfeng at gmail dot com>
***********************************************************/
/***********************************************************
This file is part of FFmpeg.

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

[CCode (cname="struct MMSStream", cheader_filename="")]
public struct MMSStream {
    public int id;
}

[CCode (cname="struct MMSContext", cheader_filename="")]
public struct MMSContext {
    /***********************************************************
    TCP connection handle
    ***********************************************************/
    public URLContext mms_hd;
    public MMSStream streams;

    /***********************************************************
    ***********************************************************/
    /***********************************************************
    Buffer for outgoing packets.
    ***********************************************************/
    /*@{*/
    /***********************************************************
    Pointer for writing the buffer.
    ***********************************************************/
    public uint8[] write_out_ptr;
    /***********************************************************
    Buffer for outgoing packet.
    ***********************************************************/
    public uint8 out_buffer[512];
    /*@}*/

    /***********************************************************
    Buffer for incoming packets.
    ***********************************************************/
    /*@{*/
    /***********************************************************
    Buffer for incoming packets.
    ***********************************************************/
    public uint8 in_buffer[65536];
    /***********************************************************
    Pointer for reading from incoming buffer.
    ***********************************************************/
    public uint8[] read_in_ptr;
    /***********************************************************
    Reading length from incoming buffer.
    ***********************************************************/
    public int remaining_in_len;
    /*@}*/

    /***********************************************************
    Internal handling of the ASF header
    ***********************************************************/
    /*@{*/
    /***********************************************************
    Stored ASF header.
    ***********************************************************/
    public uint8[] asf_header;
    /***********************************************************
    Size of stored ASF header.
    ***********************************************************/
    public int asf_header_size;
    /***********************************************************
    The header has been received and parsed.
    ***********************************************************/
    public int header_parsed;
    public int asf_packet_len;
    public int asf_header_read_size;
    /*@}*/

    /***********************************************************
    stream numbers.
    ***********************************************************/
    public int stream_num;
    /***********************************************************
    allocated size of streams
    ***********************************************************/
    public uint nb_streams_allocated;
}

[CCode (cname="", cheader_filename="")]
public int ff_mms_asf_header_parser (
    MMSContext mms
);

[CCode (cname="", cheader_filename="")]
public int ff_mms_read_data (
    MMSContext mms,
    uint8[] buffer,
    int size
);

[CCode (cname="", cheader_filename="")]
public int ff_mms_read_header (
    MMSContext mms,
    uint8[] buffer,
    int size
);

} // namespace LibAVFormat
