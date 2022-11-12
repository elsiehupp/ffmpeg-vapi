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
/***********************************************************
@brief APE tag handling
@copyright 2007 Benjamin Zores <ben@geexbox.org>
based upon libdemac from Dave Chapman.
***********************************************************/
namespace LibAVFormat {

[CCode (cname="APE_TAG_PREAMBLE", cheader_filename="")]
public const string APE_TAG_PREAMBLE;

[CCode (cname="APE_TAG_VERSION", cheader_filename="")]
public const int APE_TAG_VERSION;

[CCode (cname="APE_TAG_FOOTER_BYTES", cheader_filename="")]
public const size_t APE_TAG_FOOTER_BYTES;

[CCode (cname="APE_TAG_HEADER_BYTES", cheader_filename="")]
public const size_t APE_TAG_HEADER_BYTES;

/***********************************************************
@brief Read and parse an APE tag

@return offset of the tag start in the file
***********************************************************/
[CCode (cname="ff_ape_parse_tag", cheader_filename="")]
public int64 ff_ape_parse_tag (
    AVFormatContext format_context
);

/***********************************************************
@brief Write an APE tag into a file.
***********************************************************/
[CCode (cname="ff_ape_write_tag", cheader_filename="")]
public int ff_ape_write_tag (
    AVFormatContext format_context
);

} // namespace LibAVFormat
