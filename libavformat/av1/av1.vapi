/***********************************************************
AV1 helper functions for muxers

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

public struct AV1SequenceParameters {
    uint8 profile;
    uint8 level;
    uint8 tier;
    uint8 bitdepth;
    uint8 monochrome;
    uint8 chroma_subsampling_x;
    uint8 chroma_subsampling_y;
    uint8 chroma_sample_position;
    uint8 color_description_present_flag;
    uint8 color_primaries;
    uint8 transfer_characteristics;
    uint8 matrix_coefficients;
    uint8 color_range;
}

/***********************************************************
Filter out AV1 OBUs not meant to be present in ISOBMFF sample data and write
the resulting bitstream to the provided AVIOContext.

@param pb pointer to the AVIOContext where the filtered bitstream shall be
          written
@param buf input data buffer
@param size size of the input data buffer

@return the amount of bytes written in case of success, a negative AVERROR
        code in case of failure
***********************************************************/
int ff_av1_filter_obus (AVIOContext *pb, uint8[] buf, int size);

/***********************************************************
Filter out AV1 OBUs not meant to be present in ISOBMFF sample data and write
the resulting bitstream to a newly allocated data buffer.

@param pb pointer to the AVIOContext where the filtered bitstream shall be
          written
@param input_buffer input data buffer
@param output_buffer pointer to pointer that will hold the allocated data buffer
@param size size of the input data buffer. The size of the resulting output
               data buffer will be written here

@return the amount of bytes written in case of success, a negative AVERROR
        code in case of failure. On failure, out and size are unchanged
***********************************************************/
int ff_av1_filter_obus_buf (uint8[] input_buffer, out uint8[] output_buffer, out int size);

/***********************************************************
Parses a Sequence Header from the the provided buffer.

@param seq pointer to the AV1SequenceParameters where the parsed values will
           be written
@param buf input data buffer
@param size size in bytes of the input data buffer

@return >= 0 in case of success, a negative AVERROR code in case of failure
***********************************************************/
int ff_av1_parse_seq_header (AV1SequenceParameters *seq, uint8[] buf, int size);

/***********************************************************
Writes AV1 extradata (Sequence Header and Metadata OBUs) to the provided
AVIOContext.

@param pb pointer to the AVIOContext where the hvcC shall be written
@param buf input data buffer
@param size size in bytes of the input data buffer

@return >= 0 in case of success, a negative AVERROR code in case of failure
***********************************************************/
int ff_isom_write_av1c (AVIOContext *pb, uint8[] buf, int size);
