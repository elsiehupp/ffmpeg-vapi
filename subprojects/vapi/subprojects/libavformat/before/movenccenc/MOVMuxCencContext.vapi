/***********************************************************
@brief MOV CENC (Common Encryption) writer
@copyright 2015 Eran Kornblau <erankor at gmail dot com>
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

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/movenccenc.h")]
public const size_t CENC_KID_SIZE;

[CCode (cname="struct MOVMuxCencContext",cheader_filename="subprojects/ffmpeg/libavformat/movenccenc.h")]
[Compact]
public class MOVMuxCencContext {
    [CCode (cname="")]
    public LibAVUtil.AESCTRContext aes_ctr;

    [CCode (cname="")]
    public uint8[] auxiliary_info;

    [CCode (cname="")]
    public size_t auxiliary_info_size;

    [CCode (cname="")]
    public size_t auxiliary_info_alloc_size;

    [CCode (cname="")]
    public uint32 auxiliary_info_entries;

    /***********************************************************
    @brief Subsample support
    ***********************************************************/
    [CCode (cname="")]
    public int use_subsamples;

    [CCode (cname="")]
    public uint16 subsample_count;

    [CCode (cname="")]
    public size_t auxiliary_info_subsample_start;

    [CCode (cname="")]
    public uint8[] auxiliary_info_sizes;

    [CCode (cname="")]
    public size_t auxiliary_info_sizes_alloc_size;
}

/***********************************************************
@brief Initialize a CENC context
@param key encryption key, must have a length of AES_CTR_KEY_SIZE
@param use_subsamples when enabled parts of a packet can be encrypted, otherwise the whole packet is encrypted
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/movenccenc.h")]
public int ff_mov_cenc_init (
    MOVMuxCencContext cenc_context,
    uint8[] encryption_key,
    int use_subsamples,
    int bitexact
);

/***********************************************************
@brief Free a CENC context
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/movenccenc.h")]
public void ff_mov_cenc_free (
    MOVMuxCencContext cenc_context
);

/***********************************************************
@brief Write a fully encrypted packet
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/movenccenc.h")]
public int ff_mov_cenc_write_packet (
    MOVMuxCencContext cenc_context,
    LibAVFormat.IOContext pb,
    uint8[] buf_in,
    int size
);

/***********************************************************
@brief Parse AVC NAL units from annex B format, the nal size and type are written in the clear while the body is encrypted
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/movenccenc.h")]
public int ff_mov_cenc_avc_parse_nal_units (
    MOVMuxCencContext cenc_context,
    LibAVFormat.IOContext pb,
    uint8[] buf_in,
    int size
);

/***********************************************************
@brief Write AVC NAL units that are in MP4 format, the nal size and type are written in the clear while the body is encrypted
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/movenccenc.h")]
public int ff_mov_cenc_avc_write_nal_units (
    LibAVFormat.FormatContext format_context,
    MOVMuxCencContext cenc_context,
    int nal_length_size,
    LibAVFormat.IOContext pb,
    uint8[] buf_in,
    int size
);

/***********************************************************
@brief Write the cenc atoms that should reside inside stbl
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/movenccenc.h")]
public void ff_mov_cenc_write_stbl_atoms (
    MOVMuxCencContext cenc_context,
    LibAVFormat.IOContext pb
);

/***********************************************************
@brief Write the sinf atom, contained inside stsd
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/movenccenc.h")]
public int ff_mov_cenc_write_sinf_tag (
    MOVTrack track,
    LibAVFormat.IOContext pb,
    uint8[] kid
);

} // namespace LibAVFormat
