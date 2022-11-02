/***********************************************************
WavPack shared functions

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

#define WV_HEADER_SIZE 32

#define WV_FLAG_INITIAL_BLOCK (1 << 11)
#define WV_FLAG_FINAL_BLOCK (1 << 12)

/***********************************************************
***********************************************************/
// specs say that maximum block size is 1Mb
#define WV_BLOCK_LIMIT 1048576

public struct WvHeader {
    /***********************************************************
    ***********************************************************/
    uint32 blocksize; //< size of the block data (excluding the header)
    /***********************************************************
    ***********************************************************/
    uint16 version; //< bitstream version
    uint32 total_samples; //< total number of samples in the stream
    /***********************************************************
    ***********************************************************/
    uint32 block_idx; //< index of the first sample in this block
    /***********************************************************
    ***********************************************************/
    uint32 samples; //< number of samples in this block
    uint32 flags;
    uint32 crc;

    int initial, final;
}

/***********************************************************
Parse a WavPack block header.

@param wv this struct will be filled with parse header information
@param data header data, must be WV_HEADER_SIZE bytes long

@return 0 on success, a negative AVERROR code on failure
***********************************************************/
int ff_wv_parse_header(WvHeader *wv, uint8[] data);
