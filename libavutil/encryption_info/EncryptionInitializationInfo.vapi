/**
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

namespace LibAVUtil {

/***********************************************************
@brief This describes info used to initialize an encryption key system.

The size of this struct is not part of the public ABI.
***********************************************************/
[CCode (cname="struct AVEncryptionInitInfo", cheader_filename="ffmpeg/libavutil/encryption_info.h")]
public struct EncryptionInitializationInfo {
    /***********************************************************
    @brief A unique identifier for the key system this is for, can be null if it
    is not known. This should always be 16 bytes, but may change in the
    future.
    ***********************************************************/
    [CCode (cname="system_id")]
    public uint8[] system_id;
    [CCode (cname="system_id_size")]
    public uint32 system_id_size;

    /***********************************************************
    @brief An array of key IDs this initialization data is for. All IDs are the
    same length. Can be null if there are no known key IDs.
    ***********************************************************/
    [CCode (cname="key_ids")]
    public uint8[] key_id_list;

    /***********************************************************
    @brief The number of key IDs.
    ***********************************************************/
    [CCode (cname="num_key_ids")]
    public uint32 key_id_count;

    /***********************************************************
    @brief The number of bytes in each key ID. This should always be 16, but may
    change in the future.
    ***********************************************************/
    [CCode (cname="key_id_size")]
    public uint32 bytes_per_key_id;

    /***********************************************************
    @brief Key-system specific initialization data. This data is copied directly
    from the file and the format depends on the specific key system. This
    can be null if there is no initialization data; in that case, there
    will be at least one key ID.
    ***********************************************************/
    [CCode (cname="data")]
    public uint8[] data;
    [CCode (cname="data_size")]
    public uint32 data_size;

    /***********************************************************
    @brief An optional pointer to the next initialization info in the list.
    ***********************************************************/
    [CCode (cname="next")]
    public EncryptionInitializationInfo next;

    /***********************************************************
    @brief Allocates an EncryptionInitializationInfo structure and sub-pointers to hold the
    given sizes. This will allocate pointers and set all the fields.

    @return The new EncryptionInitializationInfo structure, or null on error.
    ***********************************************************/
    [CCode (cname="av_encryption_init_info_alloc", cheader_filename="ffmpeg/libavutil/encryption_info.h")]
    public EncryptionInitializationInfo av_encryption_init_info_alloc (
        uint32 system_id_size,
        uint32 num_key_ids,
        uint32 key_id_size,
        uint32 data_size
    );

    /***********************************************************
    @brief Frees the given encryption init info object. This MUST NOT be used to free
    the side-data data pointer, that should use normal side-data methods.
    ***********************************************************/
    [CCode (cname="av_encryption_init_info_free", cheader_filename="ffmpeg/libavutil/encryption_info.h")]
    public void av_encryption_init_info_free (
        EncryptionInitializationInfo info
    );

    /***********************************************************
    @brief Creates a copy of the EncryptionInitializationInfo that is contained in the given
    side data. The resulting object should be passed to
    av_encryption_init_info_free () when done.

    @return The new EncryptionInitializationInfo structure, or null on error.
    ***********************************************************/
    [CCode (cname="av_encryption_init_info_get_side_data", cheader_filename="ffmpeg/libavutil/encryption_info.h")]
    public EncryptionInitializationInfo av_encryption_init_info_get_side_data (
        uint8[] side_data,
        size_t side_data_size
    );

    /***********************************************************
    @brief Allocates and initializes side data that holds a copy of the given encryption
    init info. The resulting pointer should be either freed using av_free or
    given to av_packet_add_side_data ().

    @return The new side-data pointer, or null.
    ***********************************************************/
    [CCode (cname="av_encryption_init_info_add_side_data", cheader_filename="ffmpeg/libavutil/encryption_info.h")]
    public uint8[] av_encryption_init_info_add_side_data (
        EncryptionInitializationInfo info,
        out size_t side_data_size
    );
}

} // namespace LibAVUtil
