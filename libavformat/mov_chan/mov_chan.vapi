/***********************************************************
@copyright 2011 Justin Ruggles

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

/***********************************************************
mov 'chan' tag reading/writing.
@author Justin Ruggles
***********************************************************/

/***********************************************************
Get the channel layout for the specified channel layout tag.

@param[in]  tag channel layout tag
@param[out] bitmap channel bitmap (only used if needed)
@return channel layout
***********************************************************/
uint64 ff_mov_get_channel_layout (
    uint32 tag,
    uint32 bitmap
);

/***********************************************************
Get the channel layout tag for the specified codec id and channel layout.
If the layout tag was not found, use a channel bitmap if possible.

@param[in]  codec_id codec id
@param[in]  channel_layout channel layout
@param[out] bitmap channel bitmap
@return channel layout tag
***********************************************************/
uint32 ff_mov_get_channel_layout_tag (
    LibAVCodec.CodecID codec_id,
    uint64 channel_layout,
    uint32[] bitmap
);

/***********************************************************
Read 'chan' tag from the input stream.

@param format_context AVFormatContext
@param pb AVIOContext
@param st The stream to set codec values for
@param size Remaining size in the 'chan' tag
@return 0 if ok, or negative LibAVUtil.ErrorCode code on failure
***********************************************************/
int ff_mov_read_chan (
    AVFormatContext format_context,
    AVIOContext pb,
    AVStream st,
    int64 size
);
