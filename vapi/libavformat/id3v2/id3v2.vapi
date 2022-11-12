/***********************************************************
@brief ID3v2 header parser
@copyright 2003 Fabrice Bellard
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
public const size_t ID3v2_HEADER_SIZE; // 10

/***********************************************************
@brief Default magic bytes for ID3v2 header: "ID3"
***********************************************************/
[CCode (cname="", cheader_filename="")]
public const string ID3v2_DEFAULT_MAGIC; // "ID3"

[Flags]
public enum ID3v2Flags {
    ID3v2_FLAG_DATALEN,
    ID3v2_FLAG_UNSYNCH,
    ID3v2_FLAG_ENCRYPTION,
    ID3v2_FLAG_COMPRESSION,
}

[CCode (cname="", cheader_filename="")]
public const string ID3v2_PRIV_METADATA_PREFIX;

[CCode (cname="", cheader_filename="")]
public enum ID3v2Encoding {
    ID3v2_ENCODING_ISO8859,
    ID3v2_ENCODING_UTF16BOM,
    ID3v2_ENCODING_UTF16BE,
    ID3v2_ENCODING_UTF8,
}

[CCode (cname="struct ID3v2EncContext", cheader_filename="")]
public struct ID3v2EncContext {
    /***********************************************************
    @brief ID3v2 minor version, either 3 or 4
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int version;

    /***********************************************************
    @brief Offset of the tag total size
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int64 size_pos;

    /***********************************************************
    @brief Size of the tag written so far
        ***********************************************************/
    [CCode (cname="", cheader_filename="")]
    public int len;
}

[CCode (cname="struct ID3v2ExtraMeta", cheader_filename="")]
public struct ID3v2ExtraMeta {
    [CCode (cname="", cheader_filename="")]
    public string tag;

    [CCode (cname="", cheader_filename="")]
    public void *data;

    [CCode (cname="", cheader_filename="")]
    public ID3v2ExtraMeta *next;
}

[CCode (cname="struct ID3v2ExtraMetaGEOB", cheader_filename="")]
public struct ID3v2ExtraMetaGEOB {
    [CCode (cname="", cheader_filename="")]
    public uint32 datasize;

    [CCode (cname="", cheader_filename="")]
    public uint8[] mime_type;

    [CCode (cname="", cheader_filename="")]
    public uint8[] file_name;

    [CCode (cname="", cheader_filename="")]
    public uint8[] description;

    [CCode (cname="", cheader_filename="")]
    public uint8[] data;
}

[CCode (cname="struct ID3v2ExtraMetaAPIC", cheader_filename="")]
public struct ID3v2ExtraMetaAPIC {
    [CCode (cname="", cheader_filename="")]
    public LibAVUtil.BufferRef buffer;

    [CCode (cname="", cheader_filename="")]
    public string type;

    [CCode (cname="", cheader_filename="")]
    public string description;

    [CCode (cname="", cheader_filename="")]
    public LibAVCodec.CodecID id;
}

[CCode (cname="struct ID3v2ExtraMetaPRIV", cheader_filename="")]
public struct ID3v2ExtraMetaPRIV {
    [CCode (cname="", cheader_filename="")]
    public uint8[] owner;

    [CCode (cname="", cheader_filename="")]
    public uint8[] data;

    [CCode (cname="", cheader_filename="")]
    public uint32 datasize;
}

[CCode (cname="struct ID3v2ExtraMetaCHAP", cheader_filename="")]
public struct ID3v2ExtraMetaCHAP {
    [CCode (cname="", cheader_filename="")]
    public uint8[] element_id;

    [CCode (cname="", cheader_filename="")]
    public uint32 start;

    [CCode (cname="", cheader_filename="")]
    public uint32 end;

    [CCode (cname="", cheader_filename="")]
    public LibAVUtil.Dictionary meta;
}


/***********************************************************
@brief Detect ID3v2 Header.
@param buffer must be ID3v2_HEADER_SIZE byte long
@param magic magic bytes to identify the header.
If in doubt, use ID3v2_DEFAULT_MAGIC.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ff_id3v2_match (
    uint8[] buffer,
    string magic
);

/***********************************************************
@brief Get the length of an ID3v2 tag.
@param buffer must be ID3v2_HEADER_SIZE bytes long and point to the start of an
already detected ID3v2 tag
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ff_id3v2_tag_len (
    uint8[] buffer
);

/***********************************************************
@brief Read an ID3v2 tag into specified dictionary and retrieve supported extra metadata.

@param metadata Parsed metadata is stored here
@param extra_meta If not NULL, extra metadata is parsed into a list of
ID3v2ExtraMeta structs and *extra_meta points to the head of the list
***********************************************************/
[CCode (cname="", cheader_filename="")]
public void ff_id3v2_read_dict (
    AVIOContext pb,
    out LibAVUtil.Dictionary metadata,
    string magic,
    out ID3v2ExtraMeta extra_meta
);

/***********************************************************
@brief Read an ID3v2 tag, including supported extra metadata.

Data is read from and stored to AVFormatContext.

@param extra_meta If not NULL, extra metadata is parsed into a list of
ID3v2ExtraMeta structs and *extra_meta points to the head of the list
@param[opt] max_search_search restrict ID3 magic number search (bytes from start)
***********************************************************/
[CCode (cname="", cheader_filename="")]
public void ff_id3v2_read (
    AVFormatContext format_context,
    string magic,
    out ID3v2ExtraMeta extra_meta,
    uint max_search_size
);

/***********************************************************
@brief Initialize an ID3v2 tag.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public void ff_id3v2_start (
    ID3v2EncContext id3,
    AVIOContext pb,
    int id3v2_version,
    string magic
);

/***********************************************************
@brief Convert and write all global metadata from format_context into an ID3v2 tag.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ff_id3v2_write_metadata (
    AVFormatContext format_context,
    ID3v2EncContext id3
);

/***********************************************************
@brief Write an attached picture from packet into an ID3v2 tag.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ff_id3v2_write_apic (
    AVFormatContext format_context,
    ID3v2EncContext id3,
    LibAVCodec.Packet packet
);

/***********************************************************
@brief Finalize an opened ID3v2 tag.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public void ff_id3v2_finish (
    ID3v2EncContext id3,
    AVIOContext pb,
    int padding_bytes
);

/***********************************************************
@brief Write an ID3v2 tag containing all global metadata from format_context.
@param id3v2_version Subversion of ID3v2; supported values are 3 and 4
@param magic magic bytes to identify the header
If in doubt, use ID3v2_DEFAULT_MAGIC.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ff_id3v2_write_simple (
    AVFormatContext format_context,
    int id3v2_version,
    string magic
);

/***********************************************************
@brief Free memory allocated parsing special (non-text) metadata.
@param extra_meta Pointer to a pointer to the head of a ID3v2ExtraMeta list, *extra_meta is set to NULL.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public void ff_id3v2_free_extra_meta (
    out ID3v2ExtraMeta extra_meta
);

/***********************************************************
@brief Create a stream for each APIC (attached picture) extracted from the
ID3v2 header.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ff_id3v2_parse_apic (
    AVFormatContext format_context,
    out ID3v2ExtraMeta extra_meta
);

/***********************************************************
@brief Create chapters for all CHAP tags found in the ID3v2 header.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ff_id3v2_parse_chapters (
    AVFormatContext format_context,
    out ID3v2ExtraMeta extra_meta
);

/***********************************************************
@brief Parse PRIV tags into a dictionary. The PRIV owner is the metadata key. The
PRIV data is the value, with non-printable characters escaped.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ff_id3v2_parse_priv_dict (
    out LibAVUtil.Dictionary dictionary,
    out ID3v2ExtraMeta extra_meta
);

/***********************************************************
@brief Add metadata for all PRIV tags in the ID3v2 header. The PRIV owner is the
metadata key. The PRIV data is the value, with non-printable characters
escaped.
***********************************************************/
[CCode (cname="", cheader_filename="")]
public int ff_id3v2_parse_priv (
    AVFormatContext format_context,
    out ID3v2ExtraMeta extra_meta
);

//  extern const AVMetadataConv ff_id3v2_34_metadata_conv[];
//  extern const AVMetadataConv ff_id3v2_4_metadata_conv[];

/***********************************************************
@brief A list of text information frames allowed in both ID3 v2.3 and v2.4
http://www.id3.org/id3v2.4.0-frames
http://www.id3.org/id3v2.4.0-changes
***********************************************************/
//  extern const char ff_id3v2_tags[][4];

/***********************************************************
@brief ID3v2.4-only text information frames.
***********************************************************/
//  extern const char ff_id3v2_4_tags[][4];

/***********************************************************
@brief ID3v2.3-only text information frames.
***********************************************************/
//  extern const char ff_id3v2_3_tags[][4];

//  extern const CodecMime ff_id3v2_mime_tags[];

//  extern string const ff_id3v2_picture_types[21];

} // namespace LibAVFormat
