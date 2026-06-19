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

[CCode (cheader_filename = "subprojects/ffmpeg/fftools/ffmpeg.h")]
namespace FFmpeg {

[CCode (cname="")]
#define VSYNC_AUTO       -1
#define VSYNC_PASSTHROUGH 0
#define VSYNC_CFR         1
#define VSYNC_VFR         2
#define VSYNC_VSCFR       0xfe
#define VSYNC_DROP        0xff

[CCode (cname="")]
#define MAX_STREAMS 1024    /***********************************************************
    arbitrary sanity check value
***********************************************************/

[CCode (cname="")]
public enum HWAccelID {
    HWACCEL_NONE = 0,
    HWACCEL_AUTO,
    HWACCEL_GENERIC,
    HWACCEL_VIDEOTOOLBOX,
    HWACCEL_QSV,
    HWACCEL_CUVID,
}

[CCode (cname="")]
[Compact]
public class HWAccel {
    string name;
    [CCode (cname="")]
    public int (*init)(AVCodecContext *s);
    public HWAccelID id;
    public AVPixelFormat pix_fmt;
}

[CCode (cname="")]
[Compact]
public class HWDevice {
    string name;
    public AVHWDeviceType type;
    public AVBufferRef device_ref;
}

/***********************************************************
select an input stream for an output stream
***********************************************************/
[CCode (cname="")]
[Compact]
public class StreamMap {
    /***********************************************************
    1 is this mapping is disabled by a negative map
    ***********************************************************/
    public int disabled;
    public int file_index;
    public int stream_index;
    public int sync_file_index;
    public int sync_stream_index;
    /***********************************************************
    name of an output link, for mapping lavfi outputs
    ***********************************************************/
    public string linklabel;
}

[CCode (cname="")]
[Compact]
public class AudioChannelMap {
    /***********************************************************
    input
    ***********************************************************/
    public int file_idx;
    /***********************************************************
    input
    ***********************************************************/
    public int stream_idx;
    /***********************************************************
    input
    ***********************************************************/
    public int channel_idx;

    /***********************************************************
    output
    ***********************************************************/
    public int ofile_idx;
    /***********************************************************
    output
    ***********************************************************/
    public int ostream_idx;
}

[CCode (cname="")]
[Compact]
public class OptionsContext {
    OptionGroup *g;

    /***********************************************************
    input/output options
    ***********************************************************/
    public int64 start_time;
    public int64 start_time_eof;
    public int seek_timestamp;
    string format;

    SpecifierOpt *codec_names;
    public int        nb_codec_names;
    SpecifierOpt *audio_channels;
    public int        nb_audio_channels;
    SpecifierOpt *audio_sample_rate;
    public int        nb_audio_sample_rate;
    SpecifierOpt *frame_rates;
    public int        nb_frame_rates;
    SpecifierOpt *frame_sizes;
    public int        nb_frame_sizes;
    SpecifierOpt *frame_pix_fmts;
    public int        nb_frame_pix_fmts;

    /***********************************************************
    input options
    ***********************************************************/
    public int64 input_ts_offset;
    public int loop;
    public int rate_emu;
    public int accurate_seek;
    public int thread_queue_size;

    SpecifierOpt *ts_scale;
    public int        nb_ts_scale;
    SpecifierOpt *dump_attachment;
    public int        nb_dump_attachment;
    SpecifierOpt *hwaccels;
    public int        nb_hwaccels;
    SpecifierOpt *hwaccel_devices;
    public int        nb_hwaccel_devices;
    SpecifierOpt *hwaccel_output_formats;
    public int        nb_hwaccel_output_formats;
    SpecifierOpt *autorotate;
    public int        nb_autorotate;

    /***********************************************************
    output options
    ***********************************************************/
    StreamMap *stream_maps;
    public int     nb_stream_maps;
    /***********************************************************
    one info entry per -map_channel
    ***********************************************************/
    AudioChannelMap *audio_channel_maps;
    /***********************************************************
    number of (valid) -map_channel settings
    ***********************************************************/
    public int           nb_audio_channel_maps;
    public int metadata_global_manual;
    public int metadata_streams_manual;
    public int metadata_chapters_manual;
    string *attachments;
    public int       nb_attachments;

    public int chapters_input_file;

    public int64 recording_time;
    public int64 stop_time;
    public uint64 limit_filesize;
    float mux_preload;
    float mux_max_delay;
    public int shortest;
    public int bitexact;

    public int video_disable;
    public int audio_disable;
    public int subtitle_disable;
    public int data_disable;

    /***********************************************************
    indexed by output file stream index
    ***********************************************************/
    public int   *streamid_map;
    public int nb_streamid_map;

    SpecifierOpt *metadata;
    public int        nb_metadata;
    SpecifierOpt *max_frames;
    public int        nb_max_frames;
    SpecifierOpt *bitstream_filters;
    public int        nb_bitstream_filters;
    SpecifierOpt *codec_tags;
    public int        nb_codec_tags;
    SpecifierOpt *sample_fmts;
    public int        nb_sample_fmts;
    SpecifierOpt *qscale;
    public int        nb_qscale;
    SpecifierOpt *forced_key_frames;
    public int        nb_forced_key_frames;
    SpecifierOpt *force_fps;
    public int        nb_force_fps;
    SpecifierOpt *frame_aspect_ratios;
    public int        nb_frame_aspect_ratios;
    SpecifierOpt *rc_overrides;
    public int        nb_rc_overrides;
    SpecifierOpt *intra_matrices;
    public int        nb_intra_matrices;
    SpecifierOpt *inter_matrices;
    public int        nb_inter_matrices;
    SpecifierOpt *chroma_intra_matrices;
    public int        nb_chroma_intra_matrices;
    SpecifierOpt *top_field_first;
    public int        nb_top_field_first;
    SpecifierOpt *metadata_map;
    public int        nb_metadata_map;
    SpecifierOpt *presets;
    public int        nb_presets;
    SpecifierOpt *copy_initial_nonkeyframes;
    public int        nb_copy_initial_nonkeyframes;
    SpecifierOpt *copy_prior_start;
    public int        nb_copy_prior_start;
    SpecifierOpt *filters;
    public int        nb_filters;
    SpecifierOpt *filter_scripts;
    public int        nb_filter_scripts;
    SpecifierOpt *reinit_filters;
    public int        nb_reinit_filters;
    SpecifierOpt *fix_sub_duration;
    public int        nb_fix_sub_duration;
    SpecifierOpt *canvas_sizes;
    public int        nb_canvas_sizes;
    SpecifierOpt *pass;
    public int        nb_pass;
    SpecifierOpt *passlogfiles;
    public int        nb_passlogfiles;
    SpecifierOpt *max_muxing_queue_size;
    public int        nb_max_muxing_queue_size;
    SpecifierOpt *guess_layout_max;
    public int        nb_guess_layout_max;
    SpecifierOpt *apad;
    public int        nb_apad;
    SpecifierOpt *discard;
    public int        nb_discard;
    SpecifierOpt *disposition;
    public int        nb_disposition;
    SpecifierOpt *program;
    public int        nb_program;
    SpecifierOpt *time_bases;
    public int        nb_time_bases;
    SpecifierOpt *enc_time_bases;
    public int        nb_enc_time_bases;
}

[CCode (cname="")]
[Compact]
public class InputFilter {
    AVFilterContext    *filter;
    InputStream *ist;
    FilterGraph *graph;
    public uint8            *name;
    /***********************************************************
    AVMEDIA_TYPE_SUBTITLE for sub2video
    ***********************************************************/
    public AVMediaType    type;

    AVFifoBuffer *frame_queue;

    /***********************************************************
    parameters configured for this input
    ***********************************************************/
    public int format;

    public int width, height;
    public AVRational sample_aspect_ratio;

    public int sample_rate;
    public int channels;
    public uint64 channel_layout;

    public AVBufferRef hw_frames_ctx;

    public int eof;
}

[CCode (cname="")]
[Compact]
public class OutputFilter {
    AVFilterContext     *filter;
    OutputStream *ost;
    FilterGraph  *graph;
    public uint8             *name;

    /***********************************************************
    temporary storage until stream maps are processed
    ***********************************************************/
    AVFilterInOut       *out_tmp;
    public AVMediaType     type;

    /***********************************************************
    desired output stream properties
    ***********************************************************/
    public int width, height;
    public AVRational frame_rate;
    public int format;
    public int sample_rate;
    public uint64 channel_layout;

    // those are only set if no format is specified and the encoder gives us multiple options
    public int[] formats;
    public uint64[] channel_layouts;
    public int[] sample_rates;
}

[CCode (cname="")]
[Compact]
public classFilterGraph {
    public int            index;
    const char    *graph_desc;

    AVFilterGraph *graph;
    public int reconfiguration;

    InputFilter   **inputs;
    public int          nb_inputs;
    OutputFilter **outputs;
    public int         nb_outputs;
}

[CCode (cname="")]
[Compact]
public classInputStream {
    public int file_index;
    AVStream *st;
    /***********************************************************
    true if stream data should be discarded
    ***********************************************************/
    public int discard;
    public int user_set_discard;
    /***********************************************************
    non zero if the packets must be decoded in 'raw_fifo', see DECODING_FOR_*
    ***********************************************************/
    public int decoding_needed;
#define DECODING_FOR_OST    1
#define DECODING_FOR_FILTER 2

    AVCodecContext *dec_ctx;
    /***********************************************************
    a ref of decoded_frame, to be sent to filters
    ***********************************************************/
    AVCodec *dec;
    public AVFrame decoded_frame;
    public AVFrame filter_frame;

    /***********************************************************
    time when read started
    ***********************************************************/
    public int64       start;
    /***********************************************************
    predicted dts of the next packet read for this stream or
    (when there are several frames in a packet) of the next
    frame in current packet (in AV_TIME_BASE units)
    ***********************************************************/
    public int64       next_dts;
    /***********************************************************
    dts of the last packet read for this stream (in AV_TIME_BASE units)
    ***********************************************************/
    public int64       dts;

    /***********************************************************
    synthetic pts for the next decode frame (in AV_TIME_BASE units)
    ***********************************************************/
    public int64       next_pts;
    /***********************************************************
    current pts of the decoded frame  (in AV_TIME_BASE units)
    ***********************************************************/
    public int64       pts;
    public int           wrap_correction_done;

    public int64 filter_in_rescale_delta_last;

    /***********************************************************
    pts with the smallest value in a current stream
    ***********************************************************/
    public int64 min_pts;
    /***********************************************************
    pts with the higher value in a current stream
    ***********************************************************/
    public int64 max_pts;

    /***********************************************************
    when forcing constant input framerate through -r,
    this contains the pts that will be given to the next decoded frame
    ***********************************************************/
    public int64 cfr_next_pts;

    /***********************************************************
    number of samples in the last decoded audio frame before looping
    ***********************************************************/
    public int64 nb_samples;

    double ts_scale;
    public int saw_first_ts;
    AVDictionary *decoder_opts;
    /***********************************************************
    framerate forced with -r
    ***********************************************************/
    public AVRational framerate;
    public int top_field_first;
    public int guess_layout_max;

    public int autorotate;

    public int fix_sub_duration;

    /***********************************************************
    previous decoded subtitle and related variables
    ***********************************************************/
    [Compact]
    public class PrevSub { // not a declared type!!!
        int got_output;
        int ret;
        AVSubtitle subtitle;
    }

    PrevSub prev_sub;

    [Compact]
    public class sub2video {
        int64 last_pts;
        int64 end_pts;
        /***********************************************************
        queue of AVSubtitle* before filter init
    ***********************************************************/
        AVFifoBuffer *sub_queue;
        public AVFrame frame;
        int w;
        int h;
    }
    sub2video sub2video;

    public int dr1;

    /***********************************************************
    decoded data from this stream goes into all those filters
    (currently video and audio only)
    ***********************************************************/
    InputFilter **filters;
    public int        nb_filters;

    public int reinit_filters;

    /***********************************************************
    hwaccel options
    ***********************************************************/
    public HWAccelID hwaccel_id;
    public AVHWDeviceType hwaccel_device_type;
    public char  *hwaccel_device;
    public AVPixelFormat hwaccel_output_format;

    /***********************************************************
    hwaccel context
    ***********************************************************/
    void  *hwaccel_ctx;
    [CCode (cname="")]
    public void (*hwaccel_uninit)(AVCodecContext *s);
    [CCode (cname="")]
    public int  (*hwaccel_get_buffer)(AVCodecContext *s, AVFrame *frame, int flags);
    [CCode (cname="")]
    public int  (*hwaccel_retrieve_data)(AVCodecContext *s, AVFrame *frame);
    public AVPixelFormat hwaccel_pix_fmt;
    public AVPixelFormat hwaccel_retrieved_pix_fmt;
    public AVBufferRef hw_frames_ctx;

    /***********************************************************
    stats
    ***********************************************************/
    // combined size of all the packets read
    public uint64 data_size;
    /***********************************************************
    number of packets successfully read for this stream
    ***********************************************************/
    public uint64 nb_packets;
    // number of frames/samples retrieved from the decoder
    public uint64 frames_decoded;
    public uint64 samples_decoded;

    public int64 *dts_buffer;
    public int nb_dts_buffer;

    public int got_output;
}

[CCode (cname="")]
[Compact]
public class InputFile {
    AVFormatContext *ctx;
    /***********************************************************
    true if eof reached
    ***********************************************************/
    public int eof_reached;
    /***********************************************************
    true if last read attempt returned EAGAIN
    ***********************************************************/
    public int eagain;
    /***********************************************************
    index of first stream in input_streams
    ***********************************************************/
    public int ist_index;
    /***********************************************************
    set number of times input stream should be looped
    ***********************************************************/
    public int loop;
    /***********************************************************
    actual duration of the longest stream in a file at the
    moment when looping happens
    ***********************************************************/
    public int64 duration;
    /***********************************************************
    time base of the duration
    ***********************************************************/
    public AVRational time_base;
    public int64 input_ts_offset;

    public int64 ts_offset;
    public int64 last_ts;
    /***********************************************************
    user-specified start time in AV_TIME_BASE or AV_NOPTS_VALUE
    ***********************************************************/
    public int64 start_time;
    public int seek_timestamp;
    public int64 recording_time;
    /***********************************************************
    number of stream that ffmpeg is aware of; may be different
    from ctx.nb_streams if new streams appear during av_read_frame ()
    ***********************************************************/
    public int nb_streams;
    /***********************************************************
    number of streams that the user was warned of
    ***********************************************************/
    public int nb_streams_warn;
    public int rate_emu;
    public int accurate_seek;

#if HAVE_THREADS
    AVThreadMessageQueue *in_thread_queue;
    /***********************************************************
    thread reading from this file
    ***********************************************************/
    pthread_t thread;
    /***********************************************************
    reading packets from the thread should not block
    ***********************************************************/
    public int non_blocking;
    /***********************************************************
    the thread has been joined
    ***********************************************************/
    public int joined;
    /***********************************************************
    maximum number of queued packets
    ***********************************************************/
    public int thread_queue_size;
#endif
}

[CCode (cname="")]
public enum forced_keyframes_const {
    FKF_N,
    FKF_N_FORCED,
    FKF_PREV_FORCED_N,
    FKF_PREV_FORCED_T,
    FKF_T,
    FKF_NB
}

[CCode (cname="")]
#define ABORT_ON_FLAG_EMPTY_OUTPUT (1 <<  0)

//  extern string const forced_keyframes_const_names[];

[CCode (cname="")]
public enum OSTFinished {
    ENCODER_FINISHED = 1,
    MUXER_FINISHED = 2,
}

[CCode (cname="")]
[Compact]
public class OutputStream {
    /***********************************************************
    file index
    ***********************************************************/
    public int file_index;
    /***********************************************************
    stream index in the output file
    ***********************************************************/
    public int index;
    /***********************************************************
    InputStream index
    ***********************************************************/
    public int source_index;
    /***********************************************************
    stream in the output file
    ***********************************************************/
    public AVStream *st;
    /***********************************************************
    true if encoding needed for this stream
    ***********************************************************/
    public int encoding_needed;
    public int frame_number;

    /***********************************************************
    input pts and corresponding output pts
       for A/V sync
    ***********************************************************/
    /***********************************************************
    input stream to sync against
    ***********************************************************/
    public InputStream *sync_ist;
    /***********************************************************
    output frame counter, could be changed to some true timestamp
    // FIXME look at frame_number
    ***********************************************************/
    public int64 sync_opts;
    /***********************************************************
    pts of the first frame encoded for this stream, used for
    limiting recording time
    ***********************************************************/
    public int64 first_pts;
    /***********************************************************
    dts of the last packet sent to the muxer
    ***********************************************************/
    public int64 last_mux_dts;
    /***********************************************************
    the timebase of the packets sent to the muxer
    ***********************************************************/
    public AVRational mux_timebase;
    public AVRational enc_timebase;

    public int                    nb_bitstream_filters;
    public AVBSFContext            **bsf_ctx;

    public AVCodecContext *enc_ctx;
    /***********************************************************
    associated input codec parameters with encoders options applied
    ***********************************************************/
    public AVCodecParameters *ref_par;
    public AVCodec *enc;
    public int64 max_frames;
    public AVFrame *filtered_frame;
    public AVFrame *last_frame;
    public int last_dropped;
    public int last_nb0_frames[3];

    public void  *hwaccel_ctx;

    /***********************************************************
    video only
    ***********************************************************/
    public AVRational frame_rate;
    public int is_cfr;
    public int force_fps;
    public int top_field_first;
    public int rotate_overridden;
    public double rotate_override_value;

    public AVRational frame_aspect_ratio;

    /***********************************************************
    forced key frames
    ***********************************************************/
    public int64 forced_kf_ref_pts;
    public int64 *forced_kf_pts;
    public int forced_kf_count;
    public int forced_kf_index;
    public string forced_keyframes;
    public AVExpr *forced_keyframes_pexpr;
    public double forced_keyframes_expr_const_values[FKF_NB];

    /***********************************************************
    audio only
    ***********************************************************/
    /***********************************************************
    list of the channels id to pick from the source stream
    ***********************************************************/
    public int[] audio_channels_map;
    /***********************************************************
    number of channels in audio_channels_map
    ***********************************************************/
    public int audio_channels_mapped;

    public string logfile_prefix;
    public FILE *logfile;

    public OutputFilter *filter;
    public string avfilter;
    /***********************************************************
    filtergraph associated to the -filter option
    ***********************************************************/
    public string filters;
    /***********************************************************
    filtergraph script associated to the -filter_script option
    ***********************************************************/
    public string filters_script;

    public AVDictionary *encoder_opts;
    public AVDictionary *sws_dict;
    public AVDictionary *swr_opts;
    public AVDictionary *resample_opts;
    public string apad;
    /***********************************************************
    no more packets should be written for this stream
    ***********************************************************/
    public OSTFinished finished;
    /***********************************************************
    true if the steram is unavailable (possibly temporarily)
    ***********************************************************/
    public int unavailable;
    public int stream_copy;

    /***********************************************************
    init_output_stream () has been called for this stream
    The encoder and the bitstream filters have been initialized
    and the stream parameters are set in the AVStream.
    ***********************************************************/
    public int initialized;

    public int inputs_done;

    public string attachment_filename;
    public int copy_initial_nonkeyframes;
    public int copy_prior_start;
    public string disposition;

    public int keep_pix_fmt;

    /***********************************************************
    stats
    ***********************************************************/
    // combined size of all the packets written
    public uint64 data_size;
    // number of packets send to the muxer
    public uint64 packets_written;
    // number of frames/samples sent to the encoder
    public uint64 frames_encoded;
    public uint64 samples_encoded;

    /***********************************************************
    packet quality factor
    ***********************************************************/
    public int quality;

    public int max_muxing_queue_size;

    /***********************************************************
    the packets are buffered here until the muxer is ready to be initialized
    ***********************************************************/
    public AVFifoBuffer *muxing_queue;

    /***********************************************************
    packet picture type
    ***********************************************************/
    public int pict_type;

    /***********************************************************
    frame encode sum of squared error values
    ***********************************************************/
    public int64 error[4];
}

[CCode (cname="")]
[Compact]
public class OutputFile {
    public AVFormatContext *ctx;
    public AVDictionary *opts;
    /***********************************************************
    index of the first stream in output_streams
    ***********************************************************/
    public int ost_index;
    /***********************************************************
    desired length of the resulting file in microseconds == AV_TIME_BASE units
    ***********************************************************/
    public int64 recording_time;
    /***********************************************************
    start time in microseconds == AV_TIME_BASE units
    ***********************************************************/
    public int64 start_time;
    /***********************************************************
    filesize limit expressed in bytes
    ***********************************************************/
    public uint64 limit_filesize;

    public int shortest;

    public int header_written;
}

//  extern InputStream **input_streams;
//  extern int        nb_input_streams;
//  extern InputFile   **input_files;
//  extern int        nb_input_files;

//  extern OutputStream **output_streams;
//  extern int         nb_output_streams;
//  extern OutputFile   **output_files;
//  extern int         nb_output_files;

//  extern FilterGraph **filtergraphs;
//  extern int        nb_filtergraphs;

//  extern string vstats_filename;
//  extern string sdp_filename;

//  extern float audio_drift_threshold;
//  extern float dts_delta_threshold;
//  extern float dts_error_threshold;

//  extern int audio_volume;
//  extern int audio_sync_method;
//  extern int video_sync_method;
//  extern float frame_drop_threshold;
//  extern int do_benchmark;
//  extern int do_benchmark_all;
//  extern int do_deinterlace;
//  extern int do_hex_dump;
//  extern int do_pkt_dump;
//  extern int copy_ts;
//  extern int start_at_zero;
//  extern int copy_tb;
//  extern int debug_ts;
//  extern int exit_on_error;
//  extern int abort_on_flags;
//  extern int print_stats;
//  extern int qp_hist;
//  extern int stdin_interaction;
//  extern int frame_bits_per_raw_sample;
//  extern AVIOContext *progress_avio;
//  extern float max_error_rate;
//  extern string videotoolbox_pixfmt;

//  extern int filter_nbthreads;
//  extern int filter_complex_nbthreads;
//  extern int vstats_version;

//  extern const AVIOInterruptCB int_cb;

//  extern const OptionDef options[];
//  extern const HWAccel hwaccels[];
//  extern AVBufferRef *hw_device_ctx;
#if CONFIG_QSV
//  extern string qsv_device;
#endif
//  extern HWDevice *filter_hw_device;


[CCode (cname="")]
public void term_init ();
[CCode (cname="")]
public void term_exit ();

[CCode (cname="")]
public void reset_options (OptionsContext *o, int is_input);
[CCode (cname="")]
public void show_usage ();

[CCode (cname="")]
public void opt_output_file (void *optctx, string filename);

[CCode (cname="")]
public void remove_avoptions (AVDictionary **a, AVDictionary *b);
[CCode (cname="")]
public void assert_avoptions (AVDictionary *m);

[CCode (cname="")]
public int guess_input_channel_layout (InputStream *ist);

[CCode (cname="")]
public AVPixelFormat choose_pixel_fmt (AVStream *st, AVCodecContext *avctx, AVCodec *codec, AVPixelFormat target);
[CCode (cname="")]
public void choose_sample_fmt (AVStream *st, AVCodec *codec);

[CCode (cname="")]
public int configure_filtergraph (FilterGraph *fg);
[CCode (cname="")]
public int configure_output_filter (FilterGraph *fg, OutputFilter *ofilter, AVFilterInOut *out);
[CCode (cname="")]
public void check_filter_outputs ();
[CCode (cname="")]
public int ist_in_filtergraph (FilterGraph *fg, InputStream *ist);
[CCode (cname="")]
public int filtergraph_is_simple (FilterGraph *fg);
[CCode (cname="")]
public int init_simple_filtergraph (InputStream *ist, OutputStream *ost);
[CCode (cname="")]
public int init_complex_filtergraph (FilterGraph *fg);

[CCode (cname="")]
public void sub2video_update (InputStream *ist, AVSubtitle *sub);

[CCode (cname="")]
public int ifilter_parameters_from_frame (InputFilter *ifilter, AVFrame *frame);

[CCode (cname="")]
public int ffmpeg_parse_options (int argc, string *argv);

[CCode (cname="")]
public int videotoolbox_init (AVCodecContext *s);
[CCode (cname="")]
public int qsv_init (AVCodecContext *s);
[CCode (cname="")]
public int cuvid_init (AVCodecContext *s);

[CCode (cname="")]
HWDevice *hw_device_get_by_name (string name);
[CCode (cname="")]
public int hw_device_init_from_string (string arg, HWDevice **dev);
[CCode (cname="")]
public void hw_device_free_all ();

[CCode (cname="")]
public int hw_device_setup_for_decode (InputStream *ist);
[CCode (cname="")]
public int hw_device_setup_for_encode (OutputStream *ost);

[CCode (cname="")]
public int hwaccel_decode_init (AVCodecContext *avctx);
