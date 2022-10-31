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
@brief This describes encryption info for a packet. This contains frame-specific
info for how to decrypt the packet before passing it to the decoder.

The size of this struct is not part of the public ABI.
***********************************************************/
[CCode (cname="struct AVEncryptionInfo", cheader_filename="ffmpeg/libavutil/encryption_info.h")]
public struct EncryptionInfo {
    /***********************************************************
    @brief The fourcc encryption scheme, in big-endian byte order.
    ***********************************************************/
    [CCode (cname="scheme")]
    public uint32 scheme;

    /***********************************************************
    @brief Only used for pattern encryption. This is the number of 16-byte blocks
    that are encrypted.
    ***********************************************************/
    [CCode (cname="crypt_byte_block")]
    public uint32 crypt_byte_block;

    /***********************************************************
    @brief Only used for pattern encryption. This is the number of 16-byte blocks
    that are clear.
    ***********************************************************/
    [CCode (cname="skip_byte_block")]
    public uint32 skip_byte_block;

    /***********************************************************
    @brief The ID of the key used to encrypt the packet. This should always be
    16 bytes long, but may be changed in the future.
    ***********************************************************/
    [CCode (cname="key_id")]
    public uint8[] key_id;
    [CCode (cname="key_id_size")]
    public uint32 key_id_size;

    /***********************************************************
    @brief The initialization vector. This may have been zero-filled to
    be the correct block size. This should always be 16 bytes
    long, but may be changed in the future.
    ***********************************************************/
    [CCode (cname="iv", cheader_filename="ffmpeg/libavutil/encryption_info.h")]
    public uint8[] initialization_vector;
    [CCode (cname="iv_size", cheader_filename="ffmpeg/libavutil/encryption_info.h")]
    public uint32 initialization_vector_size;

    /***********************************************************
    @brief An array of subsample encryption info specifying how parts of the sample
    are encrypted. If there are no subsamples, then the whole sample is
    encrypted.
    ***********************************************************/
    [CCode (cname="subsamples")]
    public SubsampleEncryptionInfo[] subsample_list;
    [CCode (cname="subsample_count")]
    public uint32 subsample_count;

    /***********************************************************
    @brief Allocates an EncryptionInfo structure and sub-pointers to hold the given
    number of subsamples. This will allocate pointers for the key ID, IV,
    and subsample entries, set the size members, and zero-initialize the rest.

    @param subsample_count The number of subsamples.
    @param key_id_size The number of bytes in the key ID, should be 16.
    @param iv_size The number of bytes in the IV, should be 16.

    @return The new EncryptionInfo structure, or null on error.
    ***********************************************************/
    [CCode (cname="av_encryption_info_alloc", cheader_filename="ffmpeg/libavutil/encryption_info.h")]
    public EncryptionInfo av_encryption_info_alloc (
        uint32 subsample_count,
        uint32 key_id_size,
        uint32 iv_size
    );

    /***********************************************************
    @brief Allocates an EncryptionInfo structure with a copy of the given data.
    @return The new EncryptionInfo structure, or null on error.
    ***********************************************************/
    [CCode (cname="av_encryption_info_clone", cheader_filename="ffmpeg/libavutil/encryption_info.h")]
    public EncryptionInfo av_encryption_info_clone (
        EncryptionInfo info
    );

    /***********************************************************
    @brief Frees the given encryption info object. This MUST NOT be used to free the
    side-data data pointer, that should use normal side-data methods.
    ***********************************************************/
    [CCode (cname="av_encryption_info_free", cheader_filename="ffmpeg/libavutil/encryption_info.h")]
    public void av_encryption_info_free (
        EncryptionInfo info
    );

    /***********************************************************
    @brief Creates a copy of the EncryptionInfo that is contained in the given side
    data. The resulting object should be passed to av_encryption_info_free ()
    when done.

    @return The new EncryptionInfo structure, or null on error.
    ***********************************************************/
    [CCode (cname="av_encryption_info_get_side_data", cheader_filename="ffmpeg/libavutil/encryption_info.h")]
    public EncryptionInfo av_encryption_info_get_side_data (
        uint8[] side_data,
        size_t side_data_size
    );

    /***********************************************************
    @brief Allocates and initializes side data that holds a copy of the given encryption
    info. The resulting pointer should be either freed using av_free or given
    to av_packet_add_side_data ().

    @return The new side-data pointer, or null.
    ***********************************************************/
    [CCode (cname="av_encryption_info_add_side_data", cheader_filename="ffmpeg/libavutil/encryption_info.h")]
    public uint8[] av_encryption_info_add_side_data (
        EncryptionInfo info,
        out size_t side_data_size
    );
}

} // namespace LibAVUtil
