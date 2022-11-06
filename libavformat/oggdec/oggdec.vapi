/**
    @copyright 2005 Michael Ahlberg, Måns Rullgård

    Permission is hereby granted, free of charge, to any person
    obtaining a copy of this software and associated documentation
    files (the "Software"), to deal in the Software without
    restriction, including without limitation the rights to use, copy,
    modify, merge, publish, distribute, sublicense, and/or sell copies
    of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be
    included in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
    EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
    MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
    NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
    HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
    WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
    DEALINGS IN THE SOFTWARE.
**/

namespace LibAVFormat {

public abstract class ogg_codec {
    public int8[] magic;
    public uint8 magicsize;
    public int8[] name;
    /***********************************************************
    Attempt to process a packet as a header
    @return 1 if the packet was a valid header,
            0 if the packet was not a header (was a data packet)
            -1 if an error occurred or for unsupported stream
    ***********************************************************/
    public public abstract int header (
        AVFormatContext context, int arg
    );
    public public abstract int packet (
        AVFormatContext context, int arg
    );
    /***********************************************************
    Translate a granule into a timestamp.
    Will set dts if non-null and known.
    @return pts
    ***********************************************************/
    public public abstract uint64 gptopts (
        AVFormatContext context,
        int arg1,
        uint64 arg2,
        out int64 dts
    );
    /***********************************************************
    1 if granule is the start time of the associated packet.
    0 if granule is the end time of the associated packet.
    ***********************************************************/
    public int granule_is_start;
    /***********************************************************
    Number of expected headers
    ***********************************************************/
    public int nb_header;
    public abstract void cleanup (
        AVFormatContext format_context,
        int idx
    );
}

public struct ogg_stream {
    public uint8[] buf;
    public uint bufsize;
    public uint bufpos;
    public uint pstart;
    public uint psize;
    public uint pflags;
    public uint pduration;
    public uint32 serial;
    public uint64 granule;
    public uint64 start_granule;
    public int64 lastpts;
    public int64 lastdts;
    /***********************************************************
    file offset of the first page needed to reconstruct the current packet
    ***********************************************************/
    public int64 sync_pos;
    /***********************************************************
    file offset of the current page
    ***********************************************************/
    public int64 page_pos;
    public int flags;
    public ogg_codec codec;
    public int header;
    public int nsegs;
    public int segp;
    public uint8 segments[255];
    /***********************************************************
    whether we're expecting a continuation in the next page
    ***********************************************************/
    public int incomplete;
    /***********************************************************
    current packet is the last one completed in the page
    ***********************************************************/
    public int page_end;
    public int keyframe_seek;
    public int got_start;
    /***********************************************************
    1 if the stream got some data (non-initial packets), 0 otherwise
    ***********************************************************/
    public int got_data;
    /***********************************************************
    set to the number of parsed headers
    ***********************************************************/
    public int nb_header;
    /***********************************************************
    set the number of packets to drop from the end
    ***********************************************************/
    public int end_trimming;
    public uint8[] new_metadata;
    public uint new_metadata_size;
    public void *private;
}

public struct ogg_state {
    public uint64 pos;
    public int curidx;
    public ogg_state *next;
    public int nstreams;
    public ogg_stream streams[1];
}

public struct ogg {
    public ogg_stream[] streams;
    public int nstreams;
    public int headers;
    public int curidx;
    /***********************************************************
    file offset of the current page
    ***********************************************************/
    public int64 page_pos;
    public ogg_state state;
}

[Flags]
public enum OggFlags {
    OGG_FLAG_CONT,
    OGG_FLAG_BOS,
    OGG_FLAG_EOS,
}

public const uint64 OGG_NOGRANULE_VALUE;

//  extern const struct ogg_codec ff_celt_codec;
//  extern const struct ogg_codec ff_daala_codec;
//  extern const struct ogg_codec ff_dirac_codec;
//  extern const struct ogg_codec ff_flac_codec;
//  extern const struct ogg_codec ff_ogm_audio_codec;
//  extern const struct ogg_codec ff_ogm_old_codec;
//  extern const struct ogg_codec ff_ogm_text_codec;
//  extern const struct ogg_codec ff_ogm_video_codec;
//  extern const struct ogg_codec ff_old_dirac_codec;
//  extern const struct ogg_codec ff_old_flac_codec;
//  extern const struct ogg_codec ff_opus_codec;
//  extern const struct ogg_codec ff_skeleton_codec;
//  extern const struct ogg_codec ff_speex_codec;
//  extern const struct ogg_codec ff_theora_codec;
//  extern const struct ogg_codec ff_vorbis_codec;
//  extern const struct ogg_codec ff_vp8_codec;

public int ff_vorbis_comment (
    AVFormatContext ms,
    out LibAVUtil.Dictionary m,
    uint8[] buf,
    int size,
    int parse_picture
);

public int ff_vorbis_stream_comment (
    AVFormatContext as,
    AVStream st,
    uint8[] buf,
    int size
);

public static int ogg_find_stream (
    ogg ogg,
    int serial
);

public static uint64 ogg_gptopts (
    AVFormatContext format_context,
    int i,
    uint64 gp,
    out int64 dts
);

} // namespace LibAVFormat
