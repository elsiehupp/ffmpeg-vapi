/**
    Copyright (C) 2005 Michael Ahlberg, Måns Rullgård

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

public struct ogg_codec {
    int8[] magic;
    uint8 magicsize;
    int8[] name;
    /***********************************************************
    Attempt to process a packet as a header
    @return 1 if the packet was a valid header,
            0 if the packet was not a header (was a data packet)
            -1 if an error occurred or for unsupported stream
    ***********************************************************/
    int (*header)(AVFormatContext *, int);
    int (*packet)(AVFormatContext *, int);
    /***********************************************************
    Translate a granule into a timestamp.
    Will set dts if non-null and known.
    @return pts
    ***********************************************************/
    uint64 (*gptopts)(AVFormatContext *, int, uint64, int64[] dts);
    /***********************************************************
    1 if granule is the start time of the associated packet.
    0 if granule is the end time of the associated packet.
    ***********************************************************/
    int granule_is_start;
    /***********************************************************
    Number of expected headers
    ***********************************************************/
    int nb_header;
    void (*cleanup)(AVFormatContext *s, int idx);
}

public struct ogg_stream {
    uint8[] buf;
    uint bufsize;
    uint bufpos;
    uint pstart;
    uint psize;
    uint pflags;
    uint pduration;
    uint32 serial;
    uint64 granule;
    uint64 start_granule;
    int64 lastpts;
    int64 lastdts;
    /***********************************************************
    file offset of the first page needed to reconstruct the current packet
    ***********************************************************/
    int64 sync_pos;
    /***********************************************************
    file offset of the current page
    ***********************************************************/
    int64 page_pos;
    int flags;
    ogg_codec *codec;
    int header;
    int nsegs, segp;
    uint8 segments[255];
    /***********************************************************
    whether we're expecting a continuation in the next page
    ***********************************************************/
    int incomplete;
    /***********************************************************
    current packet is the last one completed in the page
    ***********************************************************/
    int page_end;
    int keyframe_seek;
    int got_start;
    /***********************************************************
    1 if the stream got some data (non-initial packets), 0 otherwise
    ***********************************************************/
    int got_data;
    /***********************************************************
    set to the number of parsed headers
    ***********************************************************/
    int nb_header;
    /***********************************************************
    set the number of packets to drop from the end
    ***********************************************************/
    int end_trimming;
    uint8[] new_metadata;
    uint new_metadata_size;
    void *private;
}

public struct ogg_state {
    uint64 pos;
    int curidx;
    ogg_state *next;
    int nstreams;
    ogg_stream streams[1];
}

public struct ogg {
    ogg_stream *streams;
    int nstreams;
    int headers;
    int curidx;
    /***********************************************************
    file offset of the current page
    ***********************************************************/
    int64 page_pos;
    ogg_state *state;
}

#define OGG_FLAG_CONT 1
#define OGG_FLAG_BOS 2
#define OGG_FLAG_EOS 4

#define OGG_NOGRANULE_VALUE (-1ull)

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

int ff_vorbis_comment (AVFormatContext *ms, AVDictionary **m,
                      uint8[] buf, int size, int parse_picture);

int ff_vorbis_stream_comment (AVFormatContext *as, AVStream *st,
                             uint8[] buf, int size);

static inline int
ogg_find_stream (ogg * ogg, int serial)
{
    int i;

    for (i = 0; i < ogg.nstreams; i++)
        if (ogg.streams[i].serial == serial)
            return i;

    return -1;
}

static inline uint64
ogg_gptopts (AVFormatContext * s, int i, uint64 gp, int64[] dts)
{
    ogg *ogg = s.priv_data;
    ogg_stream *os = ogg.streams + i;
    uint64 pts = AV_NOPTS_VALUE;

    if (os.codec && os.codec.gptopts){
        pts = os.codec.gptopts (s, i, gp, dts);
    } else {
        pts = gp;
        if (dts)
            *dts = pts;
    }
    if (pts > INT64_MAX && pts != AV_NOPTS_VALUE) {
        // The return type is uint, we thus cannot return negative pts
        av_log (s, AV_LOG_ERROR, "invalid pts %"PRId64"\n", pts);
        pts = AV_NOPTS_VALUE;
    }

    return pts;
}
