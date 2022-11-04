/***********************************************************
MMS protocol common definitions.
Copyright (c) 2010 Zhentan Feng <spyfeng at gmail dot com>

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

public struct MMSStream {
    int id;
}

public struct MMSContext {
    /***********************************************************
    TCP connection handle
    ***********************************************************/
    URLContext *mms_hd;
    MMSStream *streams;

    /***********************************************************
    ***********************************************************/
    /***********************************************************
    Buffer for outgoing packets.
    ***********************************************************/
    /*@{*/
    /***********************************************************
    Pointer for writing the buffer.
    ***********************************************************/
    uint8[] write_out_ptr;
    /***********************************************************
    Buffer for outgoing packet.
    ***********************************************************/
    uint8 out_buffer[512];
    /*@}*/

    /***********************************************************
    Buffer for incoming packets.
    ***********************************************************/
    /*@{*/
    /***********************************************************
    Buffer for incoming packets.
    ***********************************************************/
    uint8 in_buffer[65536];
    /***********************************************************
    Pointer for reading from incoming buffer.
    ***********************************************************/
    uint8[] read_in_ptr;
    /***********************************************************
    Reading length from incoming buffer.
    ***********************************************************/
    int remaining_in_len;
    /*@}*/

    /***********************************************************
    Internal handling of the ASF header
    ***********************************************************/
    /*@{*/
    /***********************************************************
    Stored ASF header.
    ***********************************************************/
    uint8[] asf_header;
    /***********************************************************
    Size of stored ASF header.
    ***********************************************************/
    int asf_header_size;
    /***********************************************************
    The header has been received and parsed.
    ***********************************************************/
    int header_parsed;
    int asf_packet_len;
    int asf_header_read_size;
    /*@}*/

    /***********************************************************
    stream numbers.
    ***********************************************************/
    int stream_num;
    /***********************************************************
    allocated size of streams
    ***********************************************************/
    uint nb_streams_allocated;
}

int ff_mms_asf_header_parser (MMSContext * mms);
int ff_mms_read_data (MMSContext *mms, uint8[] buf, int size);
int ff_mms_read_header (MMSContext * mms, uint8[]  buf, int size);
