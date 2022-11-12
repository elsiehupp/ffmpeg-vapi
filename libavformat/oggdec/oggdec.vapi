/***********************************************************
@copyright 2005 Michael Ahlberg, Måns Rullgård

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software", to deal in the Software without
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
***********************************************************/

namespace LibAVFormat {


[CCode (cname="struct ogg_codec", cheader_filename="")]
public abstract class OggCodec {
    public abstract uint8[] magic { public get; }
    public uint8 magicsize;
    public abstract uint8[] name { public get; }
    /***********************************************************
    Attempt to process a packet as a header
    @return 1 if the packet was a valid header,
            0 if the packet was not a header (was a data packet)
            -1 if an error occurred or for unsupported stream
    ***********************************************************/
    public abstract int header (
        AVFormatContext context,
        int arg
    );
    public abstract int packet (
        AVFormatContext context,
        int arg
    );
    /***********************************************************
    Translate a granule into a timestamp.
    Will set dts if non-null and known.
    @return pts
    ***********************************************************/
    public abstract uint64 gptopts (
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

[CCode (cname="struct ogg_stream", cheader_filename="")]
public struct OggStream {
    public uint8[] buffer;
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
    public OggCodec codec;
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

[CCode (cname="struct ogg_state", cheader_filename="")]
public struct OggState {
    public uint64 pos;
    public int curidx;
    public OggState *next;
    public int nstreams;
    public OggStream streams[1];
}

[CCode (cname="struct ogg", cheader_filename="")]
public struct Ogg {
    public OggStream[] streams;
    public int nstreams;
    public int headers;
    public int curidx;
    /***********************************************************
    file offset of the current page
    ***********************************************************/
    public int64 page_pos;
    public OggState state;
}

[Flags]
public enum OggFlags {
    OGG_FLAG_CONT,
    OGG_FLAG_BOS,
    OGG_FLAG_EOS,
}

[CCode (cname="", cheader_filename="")]
public const uint64 OGG_NOGRANULE_VALUE;

//  extern public class OggCodec ff_celt_codec;
//  extern public class OggCodec ff_daala_codec;
//  extern public class OggCodec ff_dirac_codec;
//  extern public class OggCodec ff_flac_codec;
//  extern public class OggCodec ff_ogm_audio_codec;
//  extern public class OggCodec ff_ogm_old_codec;
//  extern public class OggCodec ff_ogm_text_codec;
//  extern public class OggCodec ff_ogm_video_codec;
//  extern public class OggCodec ff_old_dirac_codec;
//  extern public class OggCodec ff_old_flac_codec;
//  extern public class OggCodec ff_opus_codec;
//  extern public class OggCodec ff_skeleton_codec;
//  extern public class OggCodec ff_speex_codec;
//  extern public class OggCodec ff_theora_codec;
//  extern public class OggCodec ff_vorbis_codec;
//  extern public class OggCodec ff_vp8_codec;

[CCode (cname="", cheader_filename="")]
public int ff_vorbis_comment (
    AVFormatContext ms,
    out LibAVUtil.Dictionary m,
    uint8[] buffer,
    int size,
    int parse_picture
);

[CCode (cname="", cheader_filename="")]
public int ff_vorbis_stream_comment (
    AVFormatContext as,
    AVStream st,
    uint8[] buffer,
    int size
);

[CCode (cname="", cheader_filename="")]
public static int ogg_find_stream (
    Ogg ogg,
    int serial
);

[CCode (cname="", cheader_filename="")]
public static uint64 ogg_gptopts (
    AVFormatContext format_context,
    int i,
    uint64 gp,
    out int64 dts
);

} // namespace LibAVFormat
