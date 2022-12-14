/***********************************************************
@brief VorbisComment writer
@copyright 2009 James Darnley
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

/***********************************************************
@brief Calculate the length in bytes of a VorbisComment. This is the minimum
size required by ff_vorbiscomment_write ().

@param m The metadata structure to be parsed. For no metadata, set to NULL.
@param vendor_string The vendor string to be added into the VorbisComment.
For no string, set to an empty string.
@return The length in bytes.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int64 ff_vorbiscomment_length (
    LibAVUtil.Dictionary m,
    string vendor_string,
    AVChapter[] chapters,
    uint nb_chapters
);

/***********************************************************
@brief Write a VorbisComment into a buffer. The buffer, p, must have enough
data to hold the whole VorbisComment. The minimum size required can be
obtained by passing the same LibAVUtil.Dictionary and vendor_string to
ff_vorbiscomment_length ()

@param p The buffer in which to write.
@param m The metadata struct to write.
@param vendor_string The vendor string to write.
@param chapters The chapters to write.
@param nb_chapters The number of chapters to write.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ff_vorbiscomment_write (
    out uint8[] p,
    out LibAVUtil.Dictionary m,
    string vendor_string,
    AVChapter[] chapters,
    uint nb_chapters
);

//  extern const AVMetadataConv ff_vorbiscomment_metadata_conv[];

} // namespace LibAVFormat
