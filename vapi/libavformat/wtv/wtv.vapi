/***********************************************************
@brief Windows Television (WTV)
@copyright 2010-2011 Peter Ross <pross@xvid.org>
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
public const size_t WTV_SECTOR_BITS; // 12
[CCode (cname="", cheader_filename="")]
public const size_t WTV_SECTOR_SIZE; // (1 << WTV_SECTOR_BITS)
[CCode (cname="", cheader_filename="")]
public const size_t WTV_BIGSECTOR_BITS; // 18
[CCode (cname="", cheader_filename="")]
public size_t WTV_PAD8 (size_t x); // (((x) + 7) & ~7)

//  extern const uint8 ff_timeline_le16[16];
//  extern const uint8 ff_timeline_table_0_entries_Events_le16[62];
//  extern const uint8 ff_table_0_entries_legacy_attrib_le16[58];
//  extern const uint8 ff_table_0_entries_time_le16[40];

//  extern const ff_asf_guid ff_dir_entry_guid;
//  extern const ff_asf_guid ff_wtv_guid;
//  extern const ff_asf_guid ff_timestamp_guid;
//  extern const ff_asf_guid ff_data_guid;
//  extern const ff_asf_guid ff_SBE2_STREAM_DESC_EVENT;
//  extern const ff_asf_guid ff_stream1_guid;
//  extern const ff_asf_guid ff_sync_guid;
//  extern const ff_asf_guid ff_index_guid;
//  extern const ff_asf_guid ff_mediatype_audio;
//  extern const ff_asf_guid ff_mediatype_video;
//  extern const ff_asf_guid ff_format_none;
//  extern const AVCodecGuid ff_video_guids[];

//  extern const ff_asf_guid ff_DSATTRIB_TRANSPORT_PROPERTIES;
//  extern const ff_asf_guid ff_metadata_guid;
//  extern const ff_asf_guid ff_stream2_guid;
//  extern const ff_asf_guid ff_mediasubtype_cpfilters_processed;
//  extern const ff_asf_guid ff_format_cpfilters_processed;
//  extern const ff_asf_guid ff_format_waveformatex;
//  extern const ff_asf_guid ff_format_mpeg2_video;
//  extern const ff_asf_guid ff_format_videoinfo2;

} // namespace LibAVFormat
