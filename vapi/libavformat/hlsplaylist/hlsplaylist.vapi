/***********************************************************
@brief Apple HTTP Live Streaming segmenter
@copyright 2012, Luca Barbato
@copyright 2017 Akamai Technologies, Inc.
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
public enum PlaylistType {
    PLAYLIST_TYPE_NONE,
    PLAYLIST_TYPE_EVENT,
    PLAYLIST_TYPE_VOD,
    PLAYLIST_TYPE_NB,
}

[CCode (cname="", cheader_filename="")]
public void ff_hls_write_playlist_version (
    AVIOContext out,
    public int version
);

[CCode (cname="", cheader_filename="")]
public void ff_hls_write_audio_rendition (
    AVIOContext output,
    string agroup,
    string filename,
    string language,
    public int name_id,
    public int is_default
);

[CCode (cname="", cheader_filename="")]
public void ff_hls_write_stream_info (
    AVStream st,
    AVIOContext output,
    public int bandwidth,
    string filename,
    string agroup,
    string codecs,
    string ccgroup
);

[CCode (cname="", cheader_filename="")]
public void ff_hls_write_playlist_header (
    AVIOContext output,
    public int version,
    public int allowcache,
    public int target_duration,
    public int64 sequence,
    uint32 playlist_type,
    public int iframe_mode
);

[CCode (cname="", cheader_filename="")]
public void ff_hls_write_init_file (
    AVIOContext output,
    string filename,
    public int byterange_mode,
    public int64 size,
    public int64 pos
);

[CCode (cname="", cheader_filename="")]
public int ff_hls_write_file_entry (
    AVIOContext output,
    public int insert_discont,
    public int byterange_mode,
    double duration,
    public int round_duration,
    public int64 size,
    /***********************************************************
    Used only if HLS_SINGLE_FILE flag is set
    ***********************************************************/
    public int64 pos,
    /***********************************************************
    Ignored if NULL
    ***********************************************************/
    string baseurl,
    string filename,
    out double prog_date_time,
    public int64 video_keyframe_size,
    public int64 video_keyframe_pos,
    public int iframe_mode
);

[CCode (cname="", cheader_filename="")]
public void ff_hls_write_end_list (
    AVIOContext output
);

} // namespace LibAVFormat
