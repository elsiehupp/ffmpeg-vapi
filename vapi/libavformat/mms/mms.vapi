/***********************************************************
@brief MMS protocol common definitions.
@copyright 2010 Zhentan Feng <spyfeng at gmail dot com>
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

[CCode (cname="struct MMSStream", cheader_filename="")]
public struct MMSStream {
    [CCode (cname="", cheader_filename="")]
    public int id;
}

[CCode (cname="struct MMSContext", cheader_filename="")]
public struct MMSContext {
    /***********************************************************
    @brief TCP connection handle
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public URLContext mms_hd;

    [CCode (cname="", cheader_filename="")]
    public MMSStream streams;

    /***********************************************************
        ***********************************************************/
    /***********************************************************
    @brief Buffer for outgoing packets.
        ***********************************************************/
    /*@{*/
    /***********************************************************
    @brief Pointer for writing the buffer.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public uint8[] write_out_ptr;

    /***********************************************************
    @brief Buffer for outgoing packet.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public uint8 out_buffer[512];
    /*@}*/

    /***********************************************************
    @brief Buffer for incoming packets.
        ***********************************************************/
    /*@{*/
    /***********************************************************
    @brief Buffer for incoming packets.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public uint8 in_buffer[65536];

    /***********************************************************
    @brief Pointer for reading from incoming buffer.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public uint8[] read_in_ptr;

    /***********************************************************
    @brief Reading length from incoming buffer.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int remaining_in_len;
    /*@}*/

    /***********************************************************
    @brief Internal handling of the ASF header
        ***********************************************************/
    /*@{*/
    /***********************************************************
    @brief Stored ASF header.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public uint8[] asf_header;

    /***********************************************************
    @brief Size of stored ASF header.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int asf_header_size;

    /***********************************************************
    @brief The header has been received and parsed.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int header_parsed;

    [CCode (cname="", cheader_filename="")]
    public int asf_packet_len;

    [CCode (cname="", cheader_filename="")]
    public int asf_header_read_size;
    /*@}*/

    /***********************************************************
    @brief Stream numbers.
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int stream_num;

    /***********************************************************
    @brief Allocated size of streams
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
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
