/***********************************************************
@brief WavPack shared functions
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

[CCode (cname="", cheader_filename="")]
public const size_t WV_HEADER_SIZE; // 32

[Flags]
public enum BlockFlags {
    WV_FLAG_INITIAL_BLOCK,
    WV_FLAG_FINAL_BLOCK,
}

/***********************************************************
@brief Specs say that maximum block size is 1Mb
***********************************************************/
[CCode (cname="", cheader_filename="")]
public const size_t WV_BLOCK_LIMIT;

[CCode (cname="struct WvHeader", cheader_filename="")]
public struct WvHeader {
    /***********************************************************
    @brief Size of the block data (excluding the header)
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public uint32 blocksize;

    /***********************************************************
    @brief Bitstream version
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public uint16 version;

    /***********************************************************
    @brief Total number of samples in the stream
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public uint32 total_samples;

    /***********************************************************
    @brief Index of the first sample in this block
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public uint32 block_idx;

    /***********************************************************
    @brief Number of samples in this block
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public uint32 samples;

    [CCode (cname="", cheader_filename="")]
    public BlockFlags flags;

    [CCode (cname="", cheader_filename="")]
    public uint32 crc;

    [CCode (cname="", cheader_filename="")]
    public int initial;

    [CCode (cname="", cheader_filename="")]
    public int final;
}

/***********************************************************
@brief Parse a WavPack block header.

@param wv this struct will be filled with parse header information
@param data header data, must be WV_HEADER_SIZE bytes long

@return 0 on success, a negative LibAVUtil.ErrorCode code on failure
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ff_wv_parse_header (
    WvHeader wv,
    uint8[] data
);

} // namespace LibAVFormat
