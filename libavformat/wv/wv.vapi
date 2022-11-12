/***********************************************************
WavPack shared functions
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

[CCode (cname="", cheader_filename="")]
public const size_t WV_HEADER_SIZE; // 32

[Flags]
public enum BlockFlags {
    WV_FLAG_INITIAL_BLOCK,
    WV_FLAG_FINAL_BLOCK,
}

/***********************************************************
Specs say that maximum block size is 1Mb
***********************************************************/
public const size_t WV_BLOCK_LIMIT;

[CCode (cname="struct WvHeader", cheader_filename="")]
public struct WvHeader {
    /***********************************************************
    Size of the block data (excluding the header)
    ***********************************************************/
    public uint32 blocksize;
    /***********************************************************
    Bitstream version
    ***********************************************************/
    public uint16 version;
    /***********************************************************
    Total number of samples in the stream
    ***********************************************************/
    public uint32 total_samples;
    /***********************************************************
    Index of the first sample in this block
    ***********************************************************/
    public uint32 block_idx;
    /***********************************************************
    Number of samples in this block
    ***********************************************************/
    public uint32 samples;
    public BlockFlags flags;
    public uint32 crc;

    public int initial;
    public int final;
}

/***********************************************************
Parse a WavPack block header.

@param wv this struct will be filled with parse header information
@param data header data, must be WV_HEADER_SIZE bytes long

@return 0 on success, a negative LibAVUtil.ErrorCode code on failure
***********************************************************/
public int ff_wv_parse_header (
    WvHeader wv,
    uint8[] data
);

} // namespace LibAVFormat
