/***********************************************************
@copyright 2001 Fabrice Bellard

This file is part of FFmpeg.

FFmpeg is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

FFmpeg is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with FFmpeg; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
***********************************************************/

namespace LibAVCodec {
using LibAVUtil;

/***********************************************************
@file
@ingroup libavc
LibAVCodec external API header
***********************************************************/

/***********************************************************
@brief This structure stores compressed data. It is typically exported by demuxers
and then passed as input to decoders, or received as output from encoders and
then passed to muxers.

For video, it should typically contain one compressed frame. For audio it may
contain several compressed frames. Encoders are allowed to output empty
packets, with no compressed data, containing only side data
(e.g. to update some stream parameters at the end of encoding).

Packet is one of the few structs in FFmpeg, whose size is a part of public
ABI. Thus it may be allocated on stack and no new fields can be added to it
without LibAVCodec and libavformat major bump.

The semantics of data ownership depends on the buf field.
If it is set, the packet data is dynamically allocated and is
valid indefinitely until a call to av_packet_unref () reduces the
reference count to 0.

If the buf field is not set av_packet_ref () would make a copy instead
of increasing the reference count.

The side data is always allocated with av_malloc (), copied by
av_packet_ref () and freed by av_packet_unref ().

@see @link av_packet_ref
@see @link av_packet_unref
***********************************************************/
[CCode (cname="struct AVPacket", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public struct Packet {
    /***********************************************************
    @brief A reference to the reference-counted buffer where the packet data is
        stored.
    May be null, then the packet data is not reference-counted.
    ***********************************************************/
    [CCode (cname="buf")]
    public LibAVUtil.BufferRef buf;

    /***********************************************************
    @brief Presentation timestamp in AVStream.time_base units; the time at which
    the decompressed packet will be presented to the user.
    Can be AV_NOPTS_VALUE if it is not stored in the file.
    pts MUST be larger or equal to dts as presentation cannot happen before
    decompression, unless one wants to view hex dumps. Some formats misuse
    the terms dts and pts/cts to mean something different. Such timestamps
    must be converted to true pts/dts before they are stored in Packet.
    ***********************************************************/
    [CCode (cname="pts")]
    public int64 pts;

    /***********************************************************
    @brief Decompression timestamp in AVStream.time_base units; the time at which
    the packet is decompressed.
    Can be AV_NOPTS_VALUE if it is not stored in the file.
    ***********************************************************/
    [CCode (cname="dts")]
    public int64 dts;
    [CCode (cname="data")]
    public uint8[] data;
    [CCode (cname="size")]
    public int size;
    [CCode (cname="stream_index")]
    public int stream_index;

    /***********************************************************
    @brief A combination of AV_PKT_FLAG values
    ***********************************************************/
    [CCode (cname="flags")]
    public int flags;

    /***********************************************************
    @brief Additional packet data that can be provided by the container.
    Packet can contain several types of side information.
    ***********************************************************/
    [CCode (cname="side_data")]
    public PacketSideData[] side_data;
    [CCode (cname="side_data_elems")]
    public int side_data_elems;

    /***********************************************************
    @brief Duration of this packet in AVStream.time_base units, 0 if unknown.
    Equals next_pts - this_pts in presentation order.
    ***********************************************************/
    [CCode (cname="duration")]
    public int64 duration;

    /***********************************************************
    @brief Byte position in stream, -1 if unknown
    ***********************************************************/
    [CCode (cname="pos")]
    public int64 pos;

    /***********************************************************
    @addtogroup lavc_packet
    ***********************************************************/

    /***********************************************************
    @brief Allocate an Packet and set its fields to default values. The resulting
    struct must be freed using av_packet_free ().

    @return An Packet filled with default values or null on failure.

    @note this only allocates the Packet itself, not the data buffers. Those
    must be allocated through other means such as av_new_packet.

    @see @link av_new_packet
    ***********************************************************/
    [CCode (cname="av_packet_alloc", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public Packet av_packet_alloc ();

    /***********************************************************
    @brief Create a new packet that references the same data as input_packet.

    This is a shortcut for av_packet_alloc ()+av_packet_ref ().

    @return newly created Packet on success, null on error.

    @see @link av_packet_alloc
    @see @link av_packet_ref
    ***********************************************************/
    [CCode (cname="av_packet_clone", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public Packet av_packet_clone (
        Packet input_packet
    );

    /***********************************************************
    @brief Free the packet, if the packet is reference counted, it will be
    unreferenced first.

    @param packet packet to be freed. The pointer will be set to null.
    @note passing null is a no-op.
    ***********************************************************/
    [CCode (cname="av_packet_free", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public void av_packet_free (
        Packet packet
    );

    /***********************************************************
    @brief Initialize optional fields of a packet with default values.

    Note, this does not touch the data and size members, which have to be
    initialized separately.

    @param packet packet
    ***********************************************************/
    [CCode (cname="av_init_packet", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public void av_init_packet (
        Packet packet
    );

    /***********************************************************
    @brief Allocate the payload of a packet and initialize its fields with
    default values.

    @param packet packet
    @param size wanted payload size
    @return 0 if OK, LibAVUtil.ErrorCode otherwise
    ***********************************************************/
    [CCode (cname="av_new_packet", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public int av_new_packet (
        Packet packet,
        int size
    );

    /***********************************************************
    @brief Reduce packet size, correctly zeroing padding

    @param packet packet
    @param size new size
    ***********************************************************/
    [CCode (cname="av_shrink_packet", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public void av_shrink_packet (
        Packet packet,
        int size
    );

    /***********************************************************
    @brief Increase packet size, correctly zeroing padding

    @param packet packet
    @param grow_by number of bytes by which to increase the size of the packet
    ***********************************************************/
    [CCode (cname="av_grow_packet", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public int av_grow_packet (
        Packet packet,
        int grow_by
    );

    /***********************************************************
    @brief Initialize a reference-counted packet from av_malloc ()ed data.

    @param packet packet to be initialized. This function will set the data, size,
        and buf fields, all others are left untouched.
    @param data Data allocated by av_malloc () to be used as packet data. If this
        function returns successfully, the data is owned by the underlying LibAVUtil.Buffer.
        The caller may not access the data through other means.
    @param size size of data in bytes, without the padding. I.e. the full buffer
        size is assumed to be size + AV_INPUT_BUFFER_PADDING_SIZE.

    @return 0 on success, a negative LibAVUtil.ErrorCode on error
    ***********************************************************/
    [CCode (cname="av_packet_from_data", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public int av_packet_from_data (
        Packet packet,
        uint8[] data,
        int size
    );

    /***********************************************************
    @brief Allocate new information of a packet.

    @param packet packet
    @param type side information type
    @param size side information size
    @return pointer to fresh allocated data or null otherwise
    ***********************************************************/
    uint8[] av_packet_new_side_data (
        Packet packet,
        PacketSideDataType type,
        int size
    );

    /***********************************************************
    @brief Wrap an existing array as a packet side data.

    @param packet packet
    @param type side information type
    @param data the side data array. It must be allocated with the av_malloc ()
        family of functions. The ownership of the data is transferred to
        packet.
    @param size side information size
    @return a non-negative number on success, a negative LibAVUtil.ErrorCode code on
        failure. On failure, the packet is unchanged and the data remains
        owned by the caller.
    ***********************************************************/
    [CCode (cname="av_packet_add_side_data", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public int av_packet_add_side_data (
        Packet packet,
        PacketSideDataType type,
        uint8[] data,
        size_t size
    );

    /***********************************************************
    @brief Shrink the already allocated side data buffer

    @param packet packet
    @param type side information type
    @param size new side information size
    @return 0 on success, < 0 on failure
    ***********************************************************/
    [CCode (cname="av_packet_shrink_side_data", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public int av_packet_shrink_side_data (
        Packet packet,
        PacketSideDataType type,
        int size
    );

    /***********************************************************
    @brief Get side information from packet.

    @param packet packet
    @param type desired side information type
    @param size pointer for side information size to store (optional)
    @return pointer to data if present or null otherwise
    ***********************************************************/
    uint8[] av_packet_get_side_data (
        Packet packet,
        PacketSideDataType type,
        out int size
    );

    /***********************************************************
    @brief Convenience function to free all the side data stored.
    All the other fields stay untouched.

    @param packet packet
    ***********************************************************/
    [CCode (cname="av_packet_free_side_data", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public void av_packet_free_side_data (
        Packet packet
    );

    /***********************************************************
    @brief Setup a new reference to the data described by a given packet

    If input_packet is reference-counted, setup output_packet as a new reference to the
    buffer in input_packet. Otherwise allocate a new buffer in output_packet and copy the
    data from input_packet into it.

    All the other fields are copied from input_packet.

    @see @link av_packet_unref

    @param output_packet Destination packet
    @param input_packet Source packet

    @return 0 on success, a negative LibAVUtil.ErrorCode on error.
    ***********************************************************/
    [CCode (cname="av_packet_ref", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public int av_packet_ref (
        Packet output_packet,
        Packet input_packet
    );

    /***********************************************************
    @brief Wipe the packet.

    Unreference the buffer referenced by the packet and reset the
    remaining packet fields to their default values.

    @param packet The packet to be unreferenced.
    ***********************************************************/
    [CCode (cname="av_packet_unref", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public void av_packet_unref (
        Packet packet
    );

    /***********************************************************
    @brief Move every field in input_packet to output_packet and reset input_packet.

    @see @link av_packet_unref

    @param input_packet Source packet, will be reset
    @param output_packet Destination packet
    ***********************************************************/
    [CCode (cname="av_packet_move_ref", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public void av_packet_move_ref (
        Packet output_packet,
        Packet input_packet
    );

    /***********************************************************
    @brief Copy only "properties" fields from input_packet to output_packet.

    Properties for the purpose of this function are all the fields
    beside those related to the packet data (buf, data, size)

    @param output_packet Destination packet
    @param input_packet Source packet

    @return 0 on success LibAVUtil.ErrorCode on failure.
    ***********************************************************/
    [CCode (cname="av_packet_copy_props", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public int av_packet_copy_props (
        Packet output_packet,
        Packet input_packet
    );

    /***********************************************************
    @brief Ensure the data described by a given packet is reference counted.

    @note This function does not ensure that the reference will be writable.
        Use av_packet_make_writable instead for that purpose.

    @see @link av_packet_ref
    @see @link av_packet_make_writable

    @param packet packet whose data should be made reference counted.

    @return 0 on success, a negative LibAVUtil.ErrorCode on error. On failure, the
        packet is unchanged.
    ***********************************************************/
    [CCode (cname="av_packet_make_refcounted", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public int av_packet_make_refcounted (
        Packet packet
    );

    /***********************************************************
    @brief Create a writable reference for the data described by a given packet,
    avoiding data copy if possible.

    @param packet Packet whose data should be made writable.

    @return 0 on success, a negative LibAVUtil.ErrorCode on failure. On failure, the
        packet is unchanged.
    ***********************************************************/
    [CCode (cname="av_packet_make_writable", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public int av_packet_make_writable (
        Packet packet
    );

    /***********************************************************
    @brief Convert valid timing fields (timestamps / durations) in a packet from one
    timebase to another. Timestamps with unknown values (AV_NOPTS_VALUE) will be
    ignored.

    @param packet packet on which the conversion will be performed
    @param tb_src source timebase, in which the timing fields in packet are
        expressed
    @param tb_dst output_packet timebase, to which the timing fields will be
        converted
    ***********************************************************/
    [CCode (cname="av_packet_rescale_ts", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public void av_packet_rescale_ts (
        Packet packet,
        LibAVUtil.Rational tb_src,
        LibAVUtil.Rational tb_dst
    );

}

} // namespace LibAVCodec
