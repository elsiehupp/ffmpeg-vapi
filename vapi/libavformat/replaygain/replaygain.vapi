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
@brief Parse replaygain tags and export them as per-stream side data.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ff_replaygain_export (
    AVStream st,
    LibAVUtil.Dictionary metadata
);


/***********************************************************
@brief Export already decoded replaygain values as per-stream side data.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ff_replaygain_export_raw (
    AVStream st,
    int32 tg,
    uint32 tp,
    int32 ag,
    uint32 ap
);

} // namespace LibAVFormat
