/***********************************************************
Copyright (c) 2012 Clément Bœsch

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

[CCode (cname="enum sub_sort")]
public enum sub_sort {
    /***********************************************************
    Sort by timestamps, then position
    ***********************************************************/
    SUB_SORT_TS_POS,
    /***********************************************************
    Sort by position, then timestamps
    ***********************************************************/
    SUB_SORT_POS_TS,
}

[CCode (cname="enum ff_utf_type")]
public enum ff_utf_type {
    /***********************************************************
    Or other 8 bit encodings
    ***********************************************************/
    FF_UTF_8,
    FF_UTF16LE,
    FF_UTF16BE,
}

public struct FFTextReader {
    int type;
    AVIOContext pb;
    uchar buf[8];
    int buf_pos;
    int buf_len;
    AVIOContext buf_pb;
}

/***********************************************************
Initialize the FFTextReader from the given AVIOContext. This function will
read some bytes from pb, and test for UTF-8 or UTF-16 BOMs. Further accesses
to FFTextReader will read more data from pb.
If s is not NULL, the user will be warned if a UTF-16 conversion takes place.

The purpose of FFTextReader is to transparently convert read data to UTF-8
if the stream had a UTF-16 BOM.

@param s Pointer to provide av_log context
@param r object which will be initialized
@param pb stream to read from (referenced as long as FFTextReader is in use)
***********************************************************/
void ff_text_init_avio (
    void *s,
    FFTextReader *r,
    AVIOContext *pb
);

/***********************************************************
Similar to ff_text_init_avio (), but sets it up to read from a bounded buffer.

@param r object which will be initialized
@param buf buffer to read from (referenced as long as FFTextReader is in use)
@param size size of buf
***********************************************************/
void ff_text_init_buf (
    FFTextReader *r,
    void *buf,
    size_t size
);

/***********************************************************
Return the byte position of the next byte returned by ff_text_r8 (). For
UTF-16 source streams, this will return the original position, but it will
be incorrect if a codepoint was only partially read with ff_text_r8 ().
***********************************************************/
int64 ff_text_pos (
    FFTextReader *r
);

/***********************************************************
Return the next byte. The return value is always 0 - 255. Returns 0 on EOF.
If the source stream is UTF-16, this reads from the stream converted to
UTF-8. On invalid UTF-16, 0 is returned.
***********************************************************/
int ff_text_r8 (
    FFTextReader *r
);

/***********************************************************
Return non-zero if EOF was reached.
***********************************************************/
int ff_text_eof (
    FFTextReader *r
);

/***********************************************************
Like ff_text_r8 (), but don't remove the byte from the buffer.
***********************************************************/
int ff_text_peek_r8 (
    FFTextReader *r
);

/***********************************************************
Read the given number of bytes (in UTF-8). On error or EOF, \0 bytes are
written.
***********************************************************/
void ff_text_read (
    FFTextReader *r,
    string buf,
    size_t size
);

public struct FFDemuxSubtitlesQueue {
    /***********************************************************
    Array of subtitles packets
    ***********************************************************/
    LibAVCodec.Packet[] subs;
    /***********************************************************
    Number of subtitles packets
    ***********************************************************/
    int nb_subs;
    /***********************************************************
    Allocated size for subs
    ***********************************************************/
    int allocated_size;
    /***********************************************************
    Current position for the read packet callback
    ***********************************************************/
    int current_sub_idx;
    /***********************************************************
    Sort method to use when finalizing subtitles
    ***********************************************************/
    sub_sort sort;
    /***********************************************************
    Set to 1 to keep duplicated subtitle events
    ***********************************************************/
    int keep_duplicates;
}

/***********************************************************
Insert a new subtitle event.

@param event the subtitle line, may not be zero terminated
@param len the length of the event (in strlen () sense, so without '\0')
@param merge set to 1 if the current event should be concatenated with the
             previous one instead of adding a new entry, 0 otherwise
***********************************************************/
LibAVCodec.Packet *ff_subtitles_queue_insert (
    FFDemuxSubtitlesQueue *q,
    uint8[] event,
    size_t len,
    int merge
);

/***********************************************************
Set missing durations, sort subtitles by PTS (and then byte position), and
drop duplicated events.
***********************************************************/
void ff_subtitles_queue_finalize (
    void *log_ctx,
    FFDemuxSubtitlesQueue *q
);

/***********************************************************
Generic read_packet () callback for subtitles demuxers using this queue
system.
***********************************************************/
int ff_subtitles_queue_read_packet (
    FFDemuxSubtitlesQueue *q,
    LibAVCodec.Packet *packet
);

/***********************************************************
Update current_sub_idx to emulate a seek. Except the first parameter, it
matches AVInputFormat.read_seek2 prototypes.
***********************************************************/
int ff_subtitles_queue_seek (
    FFDemuxSubtitlesQueue *q,
    AVFormatContext *s,
    int stream_index,
    int64 min_ts,
    int64 ts,
    int64 max_ts,
    int flags
);

/***********************************************************
Remove and destroy all the subtitles packets.
***********************************************************/
void ff_subtitles_queue_clean (
    FFDemuxSubtitlesQueue *q
);

/***********************************************************
SMIL helper to load next chunk ("<...>" or untagged content) in buf.

@param c cached character, to avoid a backward seek
***********************************************************/
int ff_smil_extract_next_text_chunk (
    FFTextReader *tr,
    LibAVUtil.BPrintBuffer *buf,
    string c
);

/***********************************************************
SMIL helper to point on the value of an attribute in the given tag.

@param s SMIL tag ("<...>")
@param attr the attribute to look for
***********************************************************/
string ff_smil_get_attr_ptr (
    string s,
    string attr
);

/***********************************************************
@brief Same as ff_subtitles_read_text_chunk (), but read from an AVIOContext.
***********************************************************/
void ff_subtitles_read_chunk (
    AVIOContext *pb,
    LibAVUtil.BPrintBuffer *buf
);

/***********************************************************
@brief Read a subtitles chunk from FFTextReader.

A chunk is defined by a multiline "event", ending with a second line break.
The trailing line breaks are trimmed. CRLF are supported.
Example: "foo\r\nbar\r\n\r\nnext" will print "foo\r\nbar" into buf, and pb
will focus on the 'n' of the "next" string.

@param tr I/O context
@param buf an initialized buf where the chunk is written

@note buf is cleared before writing into it.
***********************************************************/
void ff_subtitles_read_text_chunk (
    FFTextReader *tr,
    LibAVUtil.BPrintBuffer *buf
);

/***********************************************************
Get the number of characters to increment to jump to the next line, or to
the end of the string.
The function handles the following line breaks schemes:
LF, CRLF (MS), or standalone CR (old MacOS).
***********************************************************/
static int ff_subtitles_next_line (
    string ptr
);

/***********************************************************
Read a line of text. Discards line ending characters.
The function handles the following line breaks schemes:
LF, CRLF (MS), or standalone CR (old MacOS).

Returns the number of bytes written to buf. Always writes a terminating 0,
similar as with snprintf.

@note returns a negative error code if a \0 byte is found
***********************************************************/
size_t ff_subtitles_read_line (
    FFTextReader *tr,
    string buf,
    size_t size
);
