/***********************************************************
RTMP packet utilities
@copyright 2009 Konstantin Shishkov
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

/***********************************************************
maximum possible number of different RTMP channels
***********************************************************/
public const size_t RTMP_CHANNELS;

/***********************************************************
channels used to for RTMP packets with different purposes (i.e. data, network
control, remote procedure calls, etc.)
***********************************************************/
public enum RTMPChannel {
    /***********************************************************
    Channel for network-related messages (bandwidth report, ping, etc)
    ***********************************************************/
    RTMP_NETWORK_CHANNEL,
    /***********************************************************
    Channel for sending server control messages
    ***********************************************************/
    RTMP_SYSTEM_CHANNEL,
    /***********************************************************
    Channel for audio data
    ***********************************************************/
    RTMP_AUDIO_CHANNEL,
    /***********************************************************
    Channel for video data
    ***********************************************************/
    RTMP_VIDEO_CHANNEL,
    /***********************************************************
    Channel for a/v invokes
    ***********************************************************/
    RTMP_SOURCE_CHANNEL;
}

/***********************************************************
known RTMP packet types
***********************************************************/
public enum RTMPPacketType {
    /***********************************************************
    Chunk size change
    ***********************************************************/
    RTMP_PT_CHUNK_SIZE,
    /***********************************************************
    Number of bytes read
    ***********************************************************/
    RTMP_PT_BYTES_READ,
    /***********************************************************
    User control
    ***********************************************************/
    RTMP_PT_USER_CONTROL,
    /***********************************************************
    Window acknowledgement size
    ***********************************************************/
    RTMP_PT_WINDOW_ACK_SIZE,
    /***********************************************************
    Peer bandwidth
    ***********************************************************/
    RTMP_PT_SET_PEER_BW,
    /***********************************************************
    Audio packet
    ***********************************************************/
    RTMP_PT_AUDIO,
    /***********************************************************
    Video packet
    ***********************************************************/
    RTMP_PT_VIDEO,
    /***********************************************************
    Flex shared stream
    ***********************************************************/
    RTMP_PT_FLEX_STREAM,
    /***********************************************************
    Flex shared object
    ***********************************************************/
    RTMP_PT_FLEX_OBJECT,
    /***********************************************************
    Flex shared message
    ***********************************************************/
    RTMP_PT_FLEX_MESSAGE,
    /***********************************************************
    Some notification
    ***********************************************************/
    RTMP_PT_NOTIFY,
    /***********************************************************
    Shared object
    ***********************************************************/
    RTMP_PT_SHARED_OBJ,
    /***********************************************************
    Invoke some stream action
    ***********************************************************/
    RTMP_PT_INVOKE,
    /***********************************************************
    FLV metadata
    ***********************************************************/
    RTMP_PT_METADATA;
}

/***********************************************************
possible RTMP packet header sizes
***********************************************************/
public enum RTMPPacketSize {
    /***********************************************************
    Packet has 12-byte header
    ***********************************************************/
    RTMP_PS_TWELVEBYTES,
    /***********************************************************
    Packet has 8-byte header
    ***********************************************************/
    RTMP_PS_EIGHTBYTES,
    /***********************************************************
    Packet has 4-byte header
    ***********************************************************/
    RTMP_PS_FOURBYTES,
    /***********************************************************
    Packet is really a next chunk of a packet
    ***********************************************************/
    RTMP_PS_ONEBYTE;
}

/***********************************************************
structure for holding RTMP packets
***********************************************************/
public struct RTMPPacket {
    /***********************************************************
    RTMP channel ID (nothing to do with audio/video channels though)
    ***********************************************************/
    int channel_id;
    /***********************************************************
    Packet payload type
    ***********************************************************/
    RTMPPacketType type;
    /***********************************************************
    Packet full timestamp
    ***********************************************************/
    uint32 timestamp;
    /***********************************************************
    24-bit timestamp or increment to the previous one, in
    milliseconds (latter only for media packets). Clipped to a
    maximum of 0xFFFFFF, indicating an extended timestamp field.
    ***********************************************************/
    uint32 ts_field;
    /***********************************************************
    Probably an additional channel ID used during streaming data
    ***********************************************************/
    uint32 extra;
    /***********************************************************
    Packet payload
    ***********************************************************/
    uint8[] data;
    /***********************************************************
    Packet payload size
    ***********************************************************/
    int size;
    /***********************************************************
    Amount of data read so far
    ***********************************************************/
    int offset;
    /***********************************************************
    Amount read, including headers
    ***********************************************************/
    int read;
}

/***********************************************************
Create new RTMP packet with given attributes.

@param packet packet
@param channel_id packet channel ID
@param type packet type
@param timestamp packet timestamp
@param size packet size
@return zero on success, negative value otherwise
***********************************************************/
public int ff_rtmp_packet_create (
    RTMPPacket packet,
    int channel_id,
    RTMPPacketType type,
    int timestamp,
    int size
);

/***********************************************************
Free RTMP packet.

@param packet packet
***********************************************************/
public void ff_rtmp_packet_destroy (
    RTMPPacket packet
);

/***********************************************************
Read RTMP packet sent by the server.

@param h reader context
@param packet packet
@param chunk_size current chunk size
@param prev_pkt previously read packet headers for all channels
                  (may be needed for restoring incomplete packet header)
@param nb_prev_pkt number of allocated elements in prev_pkt
@return number of bytes read on success, negative value otherwise
***********************************************************/
public int ff_rtmp_packet_read (
    URLContext url_context,
    RTMPPacket packet,
    int chunk_size,
    out RTMPPacket prev_pkt,
    int[] nb_prev_pkt
);

/***********************************************************
Read internal RTMP packet sent by the server.

@param h reader context
@param packet packet
@param chunk_size current chunk size
@param prev_pkt previously read packet headers for all channels
                  (may be needed for restoring incomplete packet header)
@param nb_prev_pkt number of allocated elements in prev_pkt
@param c the first byte already read
@return number of bytes read on success, negative value otherwise
***********************************************************/
public int ff_rtmp_packet_read_internal (
    URLContext url_context,
    RTMPPacket packet,
    int chunk_size,
    out RTMPPacket prev_pkt,
    int[] nb_prev_pkt,
    uint8 c
);

/***********************************************************
Send RTMP packet to the server.

@param h reader context
@param packet packet to send
@param chunk_size current chunk size
@param prev_pkt previously sent packet headers for all channels
                  (may be used for packet header compressing)
@param nb_prev_pkt number of allocated elements in prev_pkt
@return number of bytes written on success, negative value otherwise
***********************************************************/
public int ff_rtmp_packet_write (
    URLContext url_context,
    RTMPPacket packet,
    int chunk_size,
    out RTMPPacket prev_pkt,
    out int nb_prev_pkt
);

/***********************************************************
Print information and contents of RTMP packet.

@param opaque_context output context
@param packet packet to dump
***********************************************************/
public void ff_rtmp_packet_dump (
    void *opaque_context,
    RTMPPacket packet
);

/***********************************************************
Enlarge the prev_pkt array to fit the given channel

@param prev_pkt array with previously sent packet headers
@param nb_prev_pkt number of allocated elements in prev_pkt
@param channel the channel number that needs to be allocated
***********************************************************/
public int ff_rtmp_check_alloc_array (
    out RTMPPacket prev_pkt,
    out int nb_prev_pkt,
    int channel
);

/***********************************************************
@name Functions used to work with the AMF format (which is also used in .flv)
@see amf_* funcs in libavformat/flvdec.c
@{
***********************************************************/

/***********************************************************
Calculate number of bytes taken by first AMF entry in data.

@param data input data
@param data_end input buffer end
@return number of bytes used by first AMF entry
***********************************************************/
public int ff_amf_tag_size (
    uint8[] data,
    uint8[] data_end
);

/***********************************************************
Retrieve value of given AMF object field in string form.

@param data AMF object data
@param data_end input buffer end
@param name name of field to retrieve
@param dst buffer for storing result
@param dst_size output buffer size
@return 0 if search and retrieval succeeded, negative value otherwise
***********************************************************/
public int ff_amf_get_field_value (
    uint8[] data,
    uint8[] data_end,
    uint8[] name,
    uint8[] dst,
    int dst_size
);

/***********************************************************
Write boolean value in AMF format to buffer.

@param dst pointer to the input buffer (will be modified)
@param val value to write
***********************************************************/
public void ff_amf_write_bool (
    out uint8[] dst,
    int val
);

/***********************************************************
Write number in AMF format to buffer.

@param dst pointer to the input buffer (will be modified)
@param num value to write
***********************************************************/
public void ff_amf_write_number (
    out uint8[] dst,
    double num
);

/***********************************************************
Write string in AMF format to buffer.

@param dst pointer to the input buffer (will be modified)
@param str string to write
***********************************************************/
public void ff_amf_write_string (
    out uint8[] dst,
    string str
);

/***********************************************************
Write a string consisting of two parts in AMF format to a buffer.

@param dst pointer to the input buffer (will be modified)
@param str1 first string to write, may be null
@param str2 second string to write, may be null
***********************************************************/
public void ff_amf_write_string2 (
    out uint8[] dst,
    string str1,
    string str2
);

/***********************************************************
Write AMF NULL value to buffer.

@param dst pointer to the input buffer (will be modified)
***********************************************************/
public void ff_amf_write_null (
    out uint8[] dst
);

/***********************************************************
Write marker for AMF object to buffer.

@param dst pointer to the input buffer (will be modified)
***********************************************************/
public void ff_amf_write_object_start (
    out uint8[] dst
);

/***********************************************************
Write string used as field name in AMF object to buffer.

@param dst pointer to the input buffer (will be modified)
@param str string to write
***********************************************************/
public void ff_amf_write_field_name (
    out uint8[] dst,
    string str
);

/***********************************************************
Write marker for end of AMF object to buffer.

@param dst pointer to the input buffer (will be modified)
***********************************************************/
public void ff_amf_write_object_end (
    out uint8[] dst
);

/***********************************************************
Read AMF boolean value.

@param[in,out] gbc GetByteContext initialized with AMF-formatted data
@param[out]    val 0 or 1
@return 0 on success or an LibAVUtil.ErrorCode code on failure
***********************************************************/
public int ff_amf_read_bool (
    GetByteContext gbc,
    out int val
);

/***********************************************************
Read AMF number value.

@param[in,out] gbc GetByteContext initialized with AMF-formatted data
@param[out]    val read value
@return 0 on success or an LibAVUtil.ErrorCode code on failure
***********************************************************/
public int ff_amf_read_number (
    GetByteContext gbc,
    out double val
);

/***********************************************************
Get AMF string value.

This function behaves the same as ff_amf_read_string except that
it does not expect the AMF type prepended to the actual data.
Appends a trailing null byte to output string in order to
ease later parsing.

@param[in,out] gbc GetByteContext initialized with AMF-formatted data
@param[out]    str read string
@param[in]     strsize buffer size available to store the read string
@param[out]    length read string length
@return 0 on success or an LibAVUtil.ErrorCode code on failure
***********************************************************/
public int ff_amf_get_string (
    GetByteContext bc,
    uint8[] str,
    int strsize,
    out int length
);

/***********************************************************
Read AMF string value.

Appends a trailing null byte to output string in order to
ease later parsing.

@param[in,out] gbc GetByteContext initialized with AMF-formatted data
@param[out]    str read string
@param[in]     strsize buffer size available to store the read string
@param[out]    length read string length
@return 0 on success or an LibAVUtil.ErrorCode code on failure
***********************************************************/
public int ff_amf_read_string (
    GetByteContext gbc,
    uint8[] str,
    int strsize,
    out int length
);

/***********************************************************
Read AMF NULL value.

@param[in,out] gbc GetByteContext initialized with AMF-formatted data
@return 0 on success or an LibAVUtil.ErrorCode code on failure
***********************************************************/
public int ff_amf_read_null (
    GetByteContext gbc
);

/***********************************************************
Match AMF string with a NULL-terminated string.

@return 0 if the strings do not match.
***********************************************************/
public int ff_amf_match_string (
    uint8[] data,
    int size,
    string str
);

/***********************************************************
AMF funcs
***********************************************************/

} // namespace LibAVFormat
