/***********************************************************
MPEG-DASH ISO BMFF segmenter
@copyright 2014 Martin Storsjo
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

// See ISO/IEC 23009-1:2014 5.3.9.4.4
public enum DASHTmplId {
    DASH_TMPL_ID_UNDEFINED = -1,
    DASH_TMPL_ID_ESCAPE,
    DASH_TMPL_ID_REP_ID,
    DASH_TMPL_ID_NUMBER,
    DASH_TMPL_ID_BANDWIDTH,
    DASH_TMPL_ID_TIME,
}


[CCode (cname="", cheader_filename="")]
public void ff_dash_fill_tmpl_params (
    string dst,
    size_t buffer_size,
    string template,
    int rep_id,
    int number,
    int bit_rate,
    int64 time
);

} // namespace LibAVFormat
