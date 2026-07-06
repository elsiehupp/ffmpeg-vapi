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


[CCode (cname="struct ogg_codec",cheader_filename="subprojects/ffmpeg/libavformat/oggdec.h")]
public abstract class OggCodec {
    [CCode (cname="")]
    public abstract uint8[] magic { public get; }

    [CCode (cname="magicsize")]
    public abstract uint8 magicsize { public get; }

    [CCode (cname="")]
    public abstract uint8[] name { public get; }

    /***********************************************************
    @brief Attempt to process a packet as a header
    @return 1 if the packet was a valid header,
            0 if the packet was not a header (was a data packet)
            -1 if an error occurred or for unsupported stream
    ***********************************************************/
    [CCode (cname="")]
    public abstract int header (
        LibAVFormat.FormatContext context,
        int arg
    );

    [CCode (cname="")]
    public abstract int packet (
        LibAVFormat.FormatContext context,
        int arg
    );

    /***********************************************************
    @brief Translate a granule into a timestamp.
    Will set dts if non-null and known.
    @return pts
    ***********************************************************/
    [CCode (cname="")]
    public abstract uint64 gptopts (
        LibAVFormat.FormatContext context,
        int arg1,
        uint64 arg2,
        out int64 dts
    );

    /***********************************************************
    1 if granule is the start time of the associated packet.
    0 if granule is the end time of the associated packet.
    ***********************************************************/
    [CCode (cname="granule_is_start")]
    public virtual bool granule_is_start {
        public get {
            return false;
        }

    }

    /***********************************************************
    @brief Number of expected headers
    ***********************************************************/
    [CCode (cname="nb_header")]
    public abstract int nb_header { public get; }

    [CCode (cname="")]
    public abstract void cleanup (
        LibAVFormat.FormatContext format_context,
        int idx
    );

}

[CCode (cname="struct ogg_stream",cheader_filename="subprojects/ffmpeg/libavformat/oggdec.h")]
[Compact]
public class OggStream {
    [CCode (cname="")]
    public uint8[] buffer;

    [CCode (cname="")]
    public uint bufsize;

    [CCode (cname="")]
    public uint bufpos;

    [CCode (cname="")]
    public uint pstart;

    [CCode (cname="")]
    public uint psize;

    [CCode (cname="")]
    public uint pflags;

    [CCode (cname="")]
    public uint pduration;

    [CCode (cname="")]
    public uint32 serial;

    [CCode (cname="")]
    public uint64 granule;

    [CCode (cname="")]
    public uint64 start_granule;

    [CCode (cname="")]
    public int64 lastpts;

    [CCode (cname="")]
    public int64 lastdts;

    /***********************************************************
    @brief File offset of the first page needed to reconstruct the current packet
    ***********************************************************/
    [CCode (cname="")]
    public int64 sync_pos;

    /***********************************************************
    @brief File offset of the current page
    ***********************************************************/
    [CCode (cname="")]
    public int64 page_pos;

    [CCode (cname="")]
    public int flags;

    [CCode (cname="")]
    public OggCodec codec;

    [CCode (cname="")]
    public int header;

    [CCode (cname="")]
    public int nsegs;

    [CCode (cname="")]
    public int segp;

    [CCode (cname="")]
    public uint8 segments[255];

    /***********************************************************
    @brief Whether we're expecting a continuation in the next page
    ***********************************************************/
    [CCode (cname="")]
    public int incomplete;

    /***********************************************************
    @brief Current packet is the last one completed in the page
    ***********************************************************/
    [CCode (cname="")]
    public int page_end;

    [CCode (cname="")]
    public int keyframe_seek;

    [CCode (cname="")]
    public int got_start;

    /***********************************************************
    1 if the stream got some data (non-initial packets), 0 otherwise
    ***********************************************************/
    [CCode (cname="")]
    public int got_data;

    /***********************************************************
    @brief Set to the number of parsed headers
    ***********************************************************/
    [CCode (cname="")]
    public int nb_header;

    /***********************************************************
    @brief Set the number of packets to drop from the end
    ***********************************************************/
    [CCode (cname="")]
    public int end_trimming;

    [CCode (cname="")]
    public uint8[] new_metadata;

    [CCode (cname="")]
    public uint new_metadata_size;

    [CCode (cname="")]
    public void *private;
}

[CCode (cname="struct ogg_state",cheader_filename="subprojects/ffmpeg/libavformat/oggdec.h")]
[Compact]
public class OggState {
    [CCode (cname="")]
    public uint64 pos;

    [CCode (cname="")]
    public int curidx;

    [CCode (cname="")]
    public OggState? next;

    [CCode (cname="")]
    public int nstreams;

    [CCode (cname="")]
    public OggStream streams[1];
}

[CCode (cname="struct ogg",cheader_filename="subprojects/ffmpeg/libavformat/oggdec.h")]
[Compact]
public class Ogg {
    [CCode (cname="")]
    public OggStream[] streams;

    [CCode (cname="")]
    public int nstreams;

    [CCode (cname="")]
    public int headers;

    [CCode (cname="")]
    public int curidx;

    /***********************************************************
    @brief File offset of the current page
    ***********************************************************/
    [CCode (cname="")]
    public int64 page_pos;

    [CCode (cname="")]
    public OggState state;
}

[Flags]
[CCode (cheader_filename="subprojects/ffmpeg/libavformat/oggdec.h")]
public enum OggFlags {
    [CCode (cname="OGG_FLAG_CONT")]
    CONT,

    [CCode (cname="OGG_FLAG_BOS")]
    BOS,

    [CCode (cname="OGG_FLAG_EOS")]
    EOS;
}

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/oggdec.h")]
public const uint64 OGG_NOGRANULE_VALUE;

//  extern public static OggCodec ff_celt_codec;
//  extern public static OggCodec ff_daala_codec;
//  extern public static OggCodec ff_dirac_codec;
//  extern public static OggCodec ff_flac_codec;
//  extern public static OggCodec ff_ogm_audio_codec;
//  extern public static OggCodec ff_ogm_old_codec;
//  extern public static OggCodec ff_ogm_text_codec;
//  extern public static OggCodec ff_ogm_video_codec;
//  extern public static OggCodec ff_old_dirac_codec;
//  extern public static OggCodec ff_old_flac_codec;
//  extern public static OggCodec ff_opus_codec;
//  extern public static OggCodec ff_skeleton_codec;
//  extern public static OggCodec ff_speex_codec;
//  extern public static OggCodec ff_theora_codec;
//  extern public static OggCodec ff_vorbis_codec;
//  extern public static OggCodec ff_vp8_codec;

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/oggdec.h")]
public int ff_vorbis_comment (
    LibAVFormat.FormatContext ms,
    out LibAVUtil.Dictionary m,
    uint8[] buffer,
    int size,
    int parse_picture
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/oggdec.h")]
public int ff_vorbis_stream_comment (
    LibAVFormat.FormatContext as,
    LibAVFormat.Stream st,
    uint8[] buffer,
    int size
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/oggdec.h")]
public static int ogg_find_stream (
    Ogg ogg,
    int serial
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavformat/oggdec.h")]
public static uint64 ogg_gptopts (
    LibAVFormat.FormatContext format_context,
    int i,
    uint64 gp,
    out int64 dts
);

} // namespace LibAVFormat
