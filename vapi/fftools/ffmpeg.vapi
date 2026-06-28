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

[CCode (cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
namespace FFmpeg {

[CCode (cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
public enum VsyncType {
    [CCode (cname="VSYNC_AUTO")]
    AUTO, // -1

    [CCode (cname="VSYNC_PASSTHROUGH")]
    PASSTHROUGH, // 0

    [CCode (cname="VSYNC_CFR")]
    CFR, // 1

    [CCode (cname="VSYNC_VFR")]
    VFR, // 2

    [CCode (cname="VSYNC_VSCFR")]
    VSCFR, // 0xfe

    [CCode (cname="VSYNC_DROP")]
    DROP; // 0xff
}

/***********************************************************
arbitrary sanity check value
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
public const size_t MAX_STREAMS; // 1024

[CCode (cname="enum HWAccelID",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
public enum HardwareAccelerationType {
    [CCode (cname="HWACCEL_NONE")]
    NONE, // = 0,

    [CCode (cname="HWACCEL_AUTO")]
    AUTO,

    [CCode (cname="HWACCEL_GENERIC")]
    GENERIC,

    [CCode (cname="HWACCEL_VIDEOTOOLBOX")]
    VIDEOTOOLBOX,

    [CCode (cname="HWACCEL_QSV")]
    QSV,

    [CCode (cname="HWACCEL_CUVID")]
    CUVID;
}

[CCode (cname="struct HWAccel",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
[Compact]
public class HWAccel {
    [CCode (cname="")]
    public string name;

    public delegate int InitDelegate (
        AVCodecContext? av_codec_context
    );

    [CCode (cname="init")]
    public InitDelegate init;

    [CCode (cname="")]
    public HWAccelID id;

    [CCode (cname="")]
    public LibAVUtil.PixelFormat pix_fmt;
}

[CCode (cname="struct HWDevice",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
[Compact]
public class HWDevice {
    [CCode (cname="")]
    public string name;

    [CCode (cname="")]
    public AVHWDeviceType type;

    [CCode (cname="")]
    public AVBufferRef device_ref;
}

/***********************************************************
select an input stream for an output stream
***********************************************************/
[CCode (cname="struct StreamMap",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
[Compact]
public class StreamMap {
    /***********************************************************
    1 is this mapping is disabled by a negative map
    ***********************************************************/
    [CCode (cname="")]
    public int disabled;

    [CCode (cname="")]
    public int file_index;

    [CCode (cname="")]
    public int stream_index;

    [CCode (cname="")]
    public int sync_file_index;

    [CCode (cname="")]
    public int sync_stream_index;

    /***********************************************************
    name of an output link, for mapping lavfi outputs
    ***********************************************************/
    [CCode (cname="")]
    public string linklabel;
}

[CCode (cname="struct AudioChannelMap",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
[Compact]
public class AudioChannelMap {
    /***********************************************************
    input
    ***********************************************************/
    [CCode (cname="")]
    public int file_idx;

    /***********************************************************
    input
    ***********************************************************/
    [CCode (cname="")]
    public int stream_idx;

    /***********************************************************
    input
    ***********************************************************/
    [CCode (cname="")]
    public int channel_idx;

    /***********************************************************
    output
    ***********************************************************/
    [CCode (cname="")]
    public int ofile_idx;

    /***********************************************************
    output
    ***********************************************************/
    [CCode (cname="")]
    public int ostream_idx;
}

[CCode (cname="struct OptionsContext",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
[Compact]
public class OptionsContext {
    [CCode (cname="")]
    public OptionGroup? g;

    /***********************************************************
    input/output options
    ***********************************************************/
    [CCode (cname="")]
    public int64 start_time;

    [CCode (cname="")]
    public int64 start_time_eof;

    [CCode (cname="")]
    public int seek_timestamp;

    [CCode (cname="")]
    public string format;

    [CCode (cname="")]
    public SpecifierOpt codec_names;

    [CCode (cname="")]
    public int nb_codec_names;

    [CCode (cname="")]
    public SpecifierOpt audio_channels;

    [CCode (cname="")]
    public int nb_audio_channels;

    [CCode (cname="")]
    public SpecifierOpt audio_sample_rate;

    [CCode (cname="")]
    public int nb_audio_sample_rate;

    [CCode (cname="")]
    public SpecifierOpt frame_rates;

    [CCode (cname="")]
    public int nb_frame_rates;

    [CCode (cname="")]
    public SpecifierOpt frame_sizes;

    [CCode (cname="")]
    public int nb_frame_sizes;

    [CCode (cname="")]
    public SpecifierOpt frame_pix_fmts;

    [CCode (cname="")]
    public int nb_frame_pix_fmts;

    /***********************************************************
    input options
    ***********************************************************/
    [CCode (cname="")]
    public int64 input_ts_offset;

    [CCode (cname="")]
    public int loop;

    [CCode (cname="")]
    public int rate_emu;

    [CCode (cname="")]
    public int accurate_seek;

    [CCode (cname="")]
    public int thread_queue_size;

    [CCode (cname="")]
    public SpecifierOpt ts_scale;

    [CCode (cname="")]
    public int nb_ts_scale;

    [CCode (cname="")]
    public SpecifierOpt dump_attachment;

    [CCode (cname="")]
    public int nb_dump_attachment;

    [CCode (cname="")]
    public SpecifierOpt hwaccels;

    [CCode (cname="")]
    public int nb_hwaccels;

    [CCode (cname="")]
    public SpecifierOpt hwaccel_devices;

    [CCode (cname="")]
    public int nb_hwaccel_devices;

    [CCode (cname="")]
    public SpecifierOpt hwaccel_output_formats;

    [CCode (cname="")]
    public int nb_hwaccel_output_formats;

    [CCode (cname="")]
    public SpecifierOpt autorotate;

    [CCode (cname="")]
    public int nb_autorotate;

    /***********************************************************
    output options
    ***********************************************************/
    [CCode (cname="")]
    public StreamMap? stream_maps;

    [CCode (cname="")]
    public int nb_stream_maps;

    /***********************************************************
    one info entry per -map_channel
    ***********************************************************/
    [CCode (cname="")]
    public AudioChannelMap? audio_channel_maps;

    /***********************************************************
    number of (valid) -map_channel settings
    ***********************************************************/
    [CCode (cname="")]
    public int nb_audio_channel_maps;

    [CCode (cname="")]
    public int metadata_global_manual;

    [CCode (cname="")]
    public int metadata_streams_manual;

    [CCode (cname="")]
    public int metadata_chapters_manual;

    [CCode (cname="")]
    public string? attachments;

    [CCode (cname="")]
    public int nb_attachments;

    [CCode (cname="")]
    public int chapters_input_file;

    [CCode (cname="")]
    public int64 recording_time;

    [CCode (cname="")]
    public int64 stop_time;

    [CCode (cname="")]
    public uint64 limit_filesize;

    [CCode (cname="")]
    public float mux_preload;

    [CCode (cname="")]
    public float mux_max_delay;

    [CCode (cname="")]
    public int shortest;

    [CCode (cname="")]
    public int bitexact;

    [CCode (cname="")]
    public int video_disable;

    [CCode (cname="")]
    public int audio_disable;

    [CCode (cname="")]
    public int subtitle_disable;

    [CCode (cname="")]
    public int data_disable;

    /***********************************************************
    indexed by output file stream index
    ***********************************************************/
    [CCode (cname="")]
    public out int streamid_map;

    [CCode (cname="")]
    public int nb_streamid_map;

    [CCode (cname="")]
    public SpecifierOpt metadata;

    [CCode (cname="")]
    public int nb_metadata;

    [CCode (cname="")]
    public SpecifierOpt max_frames;

    [CCode (cname="")]
    public int nb_max_frames;

    [CCode (cname="")]
    public SpecifierOpt bitstream_filters;

    [CCode (cname="")]
    public int nb_bitstream_filters;

    [CCode (cname="")]
    public SpecifierOpt codec_tags;

    [CCode (cname="")]
    public int nb_codec_tags;

    [CCode (cname="")]
    public SpecifierOpt sample_fmts;

    [CCode (cname="")]
    public int nb_sample_fmts;

    [CCode (cname="")]
    public SpecifierOpt qscale;

    [CCode (cname="")]
    public int nb_qscale;

    [CCode (cname="")]
    public SpecifierOpt forced_key_frames;

    [CCode (cname="")]
    public int nb_forced_key_frames;

    [CCode (cname="")]
    public SpecifierOpt force_fps;

    [CCode (cname="")]
    public int nb_force_fps;

    [CCode (cname="")]
    public SpecifierOpt frame_aspect_ratios;

    [CCode (cname="")]
    public int nb_frame_aspect_ratios;

    [CCode (cname="")]
    public SpecifierOpt rc_overrides;

    [CCode (cname="")]
    public int nb_rc_overrides;

    [CCode (cname="")]
    public SpecifierOpt intra_matrices;

    [CCode (cname="")]
    public int nb_intra_matrices;

    [CCode (cname="")]
    public SpecifierOpt inter_matrices;

    [CCode (cname="")]
    public int nb_inter_matrices;

    [CCode (cname="")]
    public SpecifierOpt chroma_intra_matrices;

    [CCode (cname="")]
    public int nb_chroma_intra_matrices;

    [CCode (cname="")]
    public SpecifierOpt top_field_first;

    [CCode (cname="")]
    public int nb_top_field_first;

    [CCode (cname="")]
    public SpecifierOpt metadata_map;

    [CCode (cname="")]
    public int nb_metadata_map;

    [CCode (cname="")]
    public SpecifierOpt presets;

    [CCode (cname="")]
    public int nb_presets;

    [CCode (cname="")]
    public SpecifierOpt copy_initial_nonkeyframes;

    [CCode (cname="")]
    public int nb_copy_initial_nonkeyframes;

    [CCode (cname="")]
    public SpecifierOpt copy_prior_start;

    [CCode (cname="")]
    public int nb_copy_prior_start;

    [CCode (cname="")]
    public SpecifierOpt filters;

    [CCode (cname="")]
    public int nb_filters;

    [CCode (cname="")]
    public SpecifierOpt filter_scripts;

    [CCode (cname="")]
    public int nb_filter_scripts;

    [CCode (cname="")]
    public SpecifierOpt reinit_filters;

    [CCode (cname="")]
    public int nb_reinit_filters;

    [CCode (cname="")]
    public SpecifierOpt fix_sub_duration;

    [CCode (cname="")]
    public int nb_fix_sub_duration;

    [CCode (cname="")]
    public SpecifierOpt canvas_sizes;

    [CCode (cname="")]
    public int nb_canvas_sizes;

    [CCode (cname="")]
    public SpecifierOpt pass;

    [CCode (cname="")]
    public int nb_pass;

    [CCode (cname="")]
    public SpecifierOpt passlogfiles;

    [CCode (cname="")]
    public int nb_passlogfiles;

    [CCode (cname="")]
    public SpecifierOpt max_muxing_queue_size;

    [CCode (cname="")]
    public int nb_max_muxing_queue_size;

    [CCode (cname="")]
    public SpecifierOpt guess_layout_max;

    [CCode (cname="")]
    public int nb_guess_layout_max;

    [CCode (cname="")]
    public SpecifierOpt apad;

    [CCode (cname="")]
    public int nb_apad;

    [CCode (cname="")]
    public SpecifierOpt discard;

    [CCode (cname="")]
    public int nb_discard;

    [CCode (cname="")]
    public SpecifierOpt disposition;

    [CCode (cname="")]
    public int nb_disposition;

    [CCode (cname="")]
    public SpecifierOpt program;

    [CCode (cname="")]
    public int nb_program;

    [CCode (cname="")]
    public SpecifierOpt time_bases;

    [CCode (cname="")]
    public int nb_time_bases;

    [CCode (cname="")]
    public SpecifierOpt enc_time_bases;

    [CCode (cname="")]
    public int nb_enc_time_bases;
}

[CCode (cname="struct InputFilter",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
[Compact]
public class InputFilter {
    [CCode (cname="")]
    public LibAVFilter.FilterContext? filter;

    [CCode (cname="")]
    public InputStream? ist;

    [CCode (cname="")]
    public FilterGraph? graph;

    [CCode (cname="")]
    public uint8? name;

    /***********************************************************
    LibAVUtil.MediaType.SUBTITLE for sub2video
    ***********************************************************/
    [CCode (cname="")]
    public LibAVUtil.MediaType type;

    [CCode (cname="")]
    public AVFifoBuffer? frame_queue;

    /***********************************************************
    parameters configured for this input
    ***********************************************************/
    [CCode (cname="")]
    public int format;

    [CCode (cname="")]
    public int width;

    [CCode (cname="")]
    public int height;

    [CCode (cname="")]
    public AVRational sample_aspect_ratio;

    [CCode (cname="")]
    public int sample_rate;

    [CCode (cname="")]
    public int channels;

    [CCode (cname="")]
    public uint64 channel_layout;

    [CCode (cname="")]
    public AVBufferRef hw_frames_ctx;

    [CCode (cname="")]
    public int eof;
}

[CCode (cname="struct OutputFilter",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
[Compact]
public class OutputFilter {
    [CCode (cname="")]
    public LibAVFilter.FilterContext? filter;

    [CCode (cname="")]
    public OutputStream? ost;

    [CCode (cname="")]
    public FilterGraph? graph;

    [CCode (cname="")]
    public uint8? name;

    /***********************************************************
    temporary storage until stream maps are processed
    ***********************************************************/
    [CCode (cname="")]
    public LibAVFilter.FilterInOut? out_tmp;

    [CCode (cname="")]
    public LibAVUtil.MediaType type;

    /***********************************************************
    desired output stream properties
    ***********************************************************/
    [CCode (cname="")]
    public int width, height;

    [CCode (cname="")]
    public AVRational frame_rate;

    [CCode (cname="")]
    public int format;

    [CCode (cname="")]
    public int sample_rate;

    [CCode (cname="")]
    public uint64 channel_layout;

    /***********************************************************
    Those are only set if no format is specified and the encoder
    gives us multiple options.
    ***********************************************************/
    [CCode (cname="")]
    public int[] formats;

    [CCode (cname="")]
    public uint64[] channel_layouts;

    [CCode (cname="")]
    public int[] sample_rates;
}

[CCode (cname="struct classFilterGraph",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
[Compact]
public classFilterGraph {
    [CCode (cname="")]
    public int index;

    [CCode (cname="")]
    public string graph_desc;

    [CCode (cname="")]
    public LibAVFilter.FilterGraph? graph;

    [CCode (cname="")]
    public int reconfiguration;

    [CCode (cname="")]
    public InputFilter **inputs;

    [CCode (cname="")]
    public int nb_inputs;

    [CCode (cname="")]
    public OutputFilter **outputs;

    [CCode (cname="")]
    public int nb_outputs;
}

[CCode (cname="struct classInputStream",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
[Compact]
public classInputStream {
    [CCode (cname="")]
    public int file_index;

    [CCode (cname="")]
    public VStream? st;

    /***********************************************************
    true if stream data should be discarded
    ***********************************************************/
    [CCode (cname="")]
    public int discard;

    [CCode (cname="")]
    public int user_set_discard;

    /***********************************************************
    non zero if the packets must be decoded in 'raw_fifo', see DecodingNeeded
    ***********************************************************/
    [CCode (cname="")]
    public DecodingNeeded decoding_needed;

    [CCode (cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
    public enum DecodingNeeded {
        [CCode (cname="DECODING_FOR_OST")]
        FOR_OST, // 1

        [CCode (cname="DECODING_FOR_FILTER")]
        FOR_FILTER; // 2
    }

    public AVCodecContext? dec_ctx;

    /***********************************************************
    a ref of decoded_frame, to be sent to filters
    ***********************************************************/
    [CCode (cname="")]
    public AVCodec? dec;

    [CCode (cname="")]
    public AVFrame decoded_frame;

    [CCode (cname="")]
    public AVFrame filter_frame;

    /***********************************************************
    time when read started
    ***********************************************************/
    [CCode (cname="")]
    public int64 start;

    /***********************************************************
    predicted dts of the next packet read for this stream or
    (when there are several frames in a packet) of the next
    frame in current packet (in AV_TIME_BASE units)
    ***********************************************************/
    [CCode (cname="")]
    public int64 next_dts;

    /***********************************************************
    dts of the last packet read for this stream (in AV_TIME_BASE units)
    ***********************************************************/
    [CCode (cname="")]
    public int64 dts;

    /***********************************************************
    synthetic pts for the next decode frame (in AV_TIME_BASE units)
    ***********************************************************/
    [CCode (cname="")]
    public int64 next_pts;

    /***********************************************************
    current pts of the decoded frame (in AV_TIME_BASE units)
    ***********************************************************/
    [CCode (cname="")]
    public int64 pts;

    [CCode (cname="")]
    public int wrap_correction_done;

    [CCode (cname="")]
    public int64 filter_in_rescale_delta_last;

    /***********************************************************
    pts with the smallest value in a current stream
    ***********************************************************/
    [CCode (cname="")]
    public int64 min_pts;

    /***********************************************************
    pts with the higher value in a current stream
    ***********************************************************/
    [CCode (cname="")]
    public int64 max_pts;

    /***********************************************************
    when forcing constant input framerate through -r,
    this contains the pts that will be given to the next decoded frame
    ***********************************************************/
    [CCode (cname="")]
    public int64 cfr_next_pts;

    /***********************************************************
    number of samples in the last decoded audio frame before looping
    ***********************************************************/
    [CCode (cname="")]
    public int64 nb_samples;

    [CCode (cname="")]
    public double ts_scale;

    [CCode (cname="")]
    public int saw_first_ts;

    [CCode (cname="")]
    public LibAVUtil.Dictionary? decoder_opts;

    /***********************************************************
    framerate forced with -r
    ***********************************************************/
    [CCode (cname="")]
    public AVRational framerate;

    [CCode (cname="")]
    public int top_field_first;

    [CCode (cname="")]
    public int guess_layout_max;

    [CCode (cname="")]
    public int autorotate;

    [CCode (cname="")]
    public int fix_sub_duration;

    /***********************************************************
    previous decoded subtitle and related variables
    ***********************************************************/
    [Compact]
    public class PrevSub { // not a declared type!!!
        [CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
        public int got_output;

        [CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
        public int ret;

        [CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
        public AVSubtitle subtitle;
    }

    public PrevSub prev_sub;

    [CCode (cname="struct sub2video",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
    [Compact]
    public class Sub2Video {
        [CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
        public int64 last_pts;

        [CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
        public int64 end_pts;

        /***********************************************************
        queue of AVSubtitle* before filter init
        ***********************************************************/
        [CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
        public AVFifoBuffer? sub_queue;

        [CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
        public AVFrame frame;

        [CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
        public int w;

        [CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
        public int h;
    }

    [CCode (cname="sub2video")]
    public Sub2Video sub2video;

    [CCode (cname="")]
    public int dr1;

    /***********************************************************
    decoded data from this stream goes into all those filters
    (currently video and audio only)
    ***********************************************************/
    [CCode (cname="")]
    public InputFilter **filters;

    [CCode (cname="")]
    public int nb_filters;

    [CCode (cname="")]
    public int reinit_filters;

    /***********************************************************
    hwaccel options
    ***********************************************************/
    [CCode (cname="")]
    public HWAccelID hwaccel_id;

    [CCode (cname="")]
    public AVHWDeviceType hwaccel_device_type;

    [CCode (cname="")]
    public string hwaccel_device;

    [CCode (cname="")]
    public public LibAVUtil.PixelFormat hwaccel_output_format;

    /***********************************************************
    hwaccel context
    ***********************************************************/
    [CCode (cname="")]
    public void *hwaccel_ctx;

    public delegate void HwAccelUninitDelegate (
        AVCodecContext? av_codec_context
    );

    [CCode (cname="hwaccel_uninit")]
    public HwAccelUninitDelegate hwaccel_uninit;

    public delegate int HwAccelGetBufferDelegate (
        AVCodecContext? av_codec_context,
        AVFrame? frame,
        int flags
    );

    [CCode (cname="hwaccel_get_buffer")]
    public HwAccelGetBufferDelegate hwaccel_get_buffer;

    public delegate int HwAccelRetrieveDataDelegate (
        AVCodecContext? av_codec_context,
        AVFrame? frame
    );

    [CCode (cname="hwaccel_retrieve_data")]
    public HwAccelRetrieveDataDelegate hwaccel_retrieve_data;

    [CCode (cname="")]
    public LibAVUtil.PixelFormat hwaccel_pix_fmt;

    [CCode (cname="")]
    public LibAVUtil.PixelFormat hwaccel_retrieved_pix_fmt;

    [CCode (cname="")]
    public AVBufferRef hw_frames_ctx;

    /***********************************************************
    stats
    ***********************************************************/

    /***********************************************************
    combined size of all the packets read
    ***********************************************************/
    [CCode (cname="")]
    public uint64 data_size;

    /***********************************************************
    number of packets successfully read for this stream
    ***********************************************************/
    [CCode (cname="")]
    public uint64 nb_packets;

    /***********************************************************
    number of frames/samples retrieved from the decoder
    ***********************************************************/
    [CCode (cname="")]
    public uint64 frames_decoded;

    [CCode (cname="")]
    public uint64 samples_decoded;

    [CCode (cname="")]
    public int64[] dts_buffer;

    [CCode (cname="")]
    public int nb_dts_buffer;

    [CCode (cname="")]
    public int got_output;
}

[CCode (cname="struct InputFile",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
[Compact]
public class InputFile {
    [CCode (cname="")]
    public LibAVFormat.FormatContext? ctx;

    /***********************************************************
    true if eof reached
    ***********************************************************/
    [CCode (cname="")]
    public int eof_reached;

    /***********************************************************
    true if last read attempt returned EAGAIN
    ***********************************************************/
    [CCode (cname="")]
    public int eagain;

    /***********************************************************
    index of first stream in input_streams
    ***********************************************************/
    [CCode (cname="")]
    public int ist_index;

    /***********************************************************
    set number of times input stream should be looped
    ***********************************************************/
    [CCode (cname="")]
    public int loop;

    /***********************************************************
    actual duration of the longest stream in a file at the
    moment when looping happens
    ***********************************************************/
    [CCode (cname="")]
    public int64 duration;

    /***********************************************************
    time base of the duration
    ***********************************************************/
    [CCode (cname="")]
    public AVRational time_base;

    [CCode (cname="")]
    public int64 input_ts_offset;

    [CCode (cname="")]
    public int64 ts_offset;

    [CCode (cname="")]
    public int64 last_ts;

    /***********************************************************
    user-specified start time in AV_TIME_BASE or AV_NOPTS_VALUE
    ***********************************************************/
    [CCode (cname="")]
    public int64 start_time;

    [CCode (cname="")]
    public int seek_timestamp;

    [CCode (cname="")]
    public int64 recording_time;

    /***********************************************************
    number of stream that ffmpeg is aware of; may be different
    from ctx.nb_streams if new streams appear during av_read_frame ()
    ***********************************************************/
    [CCode (cname="")]
    public int nb_streams;

    /***********************************************************
    number of streams that the user was warned of
    ***********************************************************/
    [CCode (cname="")]
    public int nb_streams_warn;

    [CCode (cname="")]
    public int rate_emu;

    [CCode (cname="")]
    public int accurate_seek;

#if HAVE_THREADS
    public AVThreadMessageQueue? in_thread_queue;

    /***********************************************************
    thread reading from this file
    ***********************************************************/
    [CCode (cname="")]
    public pthread_t thread;

    /***********************************************************
    reading packets from the thread should not block
    ***********************************************************/
    [CCode (cname="")]
    public int non_blocking;

    /***********************************************************
    the thread has been joined
    ***********************************************************/
    [CCode (cname="")]
    public int joined;

    /***********************************************************
    maximum number of queued packets
    ***********************************************************/
    [CCode (cname="")]
    public int thread_queue_size;
#endif
}

[CCode (cname="enum forced_keyframes_const",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
public enum ForcedKeyFrames {
    [CCode (cname="FKF_N")]
    N,

    [CCode (cname="FKF_N_FORCED")]
    N_FORCED,

    [CCode (cname="FKF_PREV_FORCED_N")]
    PREV_FORCED_N,

    [CCode (cname="FKF_PREV_FORCED_T")]
    PREV_FORCED_T,

    [CCode (cname="FKF_T")]
    T,

    [CCode (cname="FKF_NB")]
    NB
}

[Flags]
[CCode (cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
public enum AbortOnFlags {
    [CCode (cname="ABORT_ON_FLAG_EMPTY_OUTPUT")]
    EMPTY_OUTPUT; // (1 <<  0)
}

//  extern string const forced_keyframes_const_names[];

[CCode (cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
public enum OSTFinished {
    [CCode (cname="ENCODER_FINISHED")]
    ENCODER, // = 1,

    [CCode (cname="MUXER_FINISHED")]
    MUXER; // = 2;
}

[CCode (cname="struct OutputStream",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
[Compact]
public class OutputStream {
    /***********************************************************
    file index
    ***********************************************************/
    [CCode (cname="")]
    public int file_index;

    /***********************************************************
    stream index in the output file
    ***********************************************************/
    [CCode (cname="")]
    public int index;

    /***********************************************************
    InputStream index
    ***********************************************************/
    [CCode (cname="")]
    public int source_index;

    /***********************************************************
    stream in the output file
    ***********************************************************/
    [CCode (cname="")]
    public LibAVFormat.Stream? st;

    /***********************************************************
    true if encoding needed for this stream
    ***********************************************************/
    [CCode (cname="")]
    public int encoding_needed;

    [CCode (cname="")]
    public int frame_number;

    /***********************************************************
    input pts and corresponding output pts for A/V sync
    ***********************************************************/

    /***********************************************************
    input stream to sync against
    ***********************************************************/
    [CCode (cname="")]
    public InputStream? sync_ist;

    /***********************************************************
    output frame counter, could be changed to some true timestamp
    // FIXME look at frame_number
    ***********************************************************/
    [CCode (cname="")]
    public int64 sync_opts;

    /***********************************************************
    pts of the first frame encoded for this stream, used for
    limiting recording time
    ***********************************************************/
    [CCode (cname="")]
    public int64 first_pts;

    /***********************************************************
    dts of the last packet sent to the muxer
    ***********************************************************/
    [CCode (cname="")]
    public int64 last_mux_dts;

    /***********************************************************
    the timebase of the packets sent to the muxer
    ***********************************************************/
    [CCode (cname="")]
    public AVRational mux_timebase;

    [CCode (cname="")]
    public AVRational enc_timebase;

    [CCode (cname="")]
    public int nb_bitstream_filters;

    [CCode (cname="")]
    public AVBSFContext **bsf_ctx;

    [CCode (cname="")]
    public AVCodecContext? enc_ctx;

    /***********************************************************
    associated input codec parameters with encoders options applied
    ***********************************************************/
    [CCode (cname="")]
    public AVCodecParameters? ref_par;

    [CCode (cname="")]
    public AVCodec? enc;

    [CCode (cname="")]
    public int64 max_frames;

    [CCode (cname="")]
    public AVFrame? filtered_frame;

    [CCode (cname="")]
    public AVFrame? last_frame;

    [CCode (cname="")]
    public int last_dropped;

    [CCode (cname="")]
    public int last_nb0_frames[3];

    [CCode (cname="")]
    public void *hwaccel_ctx;

    /***********************************************************
    video only
    ***********************************************************/
    [CCode (cname="")]
    public AVRational frame_rate;

    [CCode (cname="")]
    public int is_cfr;

    [CCode (cname="")]
    public int force_fps;

    [CCode (cname="")]
    public int top_field_first;

    [CCode (cname="")]
    public int rotate_overridden;

    [CCode (cname="")]
    public double rotate_override_value;

    [CCode (cname="")]
    public AVRational frame_aspect_ratio;

    /***********************************************************
    forced key frames
    ***********************************************************/
    [CCode (cname="")]
    public int64 forced_kf_ref_pts;

    [CCode (cname="")]
    public int64[] forced_kf_pts;

    [CCode (cname="")]
    public int forced_kf_count;

    [CCode (cname="")]
    public int forced_kf_index;

    [CCode (cname="")]
    public string forced_keyframes;

    [CCode (cname="")]
    public AVExpr? forced_keyframes_pexpr;

    [CCode (cname="")]
    public double forced_keyframes_expr_const_values[ForcedKeyFrames.NB];

    /***********************************************************
    audio only
    ***********************************************************/
    /***********************************************************
    list of the channels id to pick from the source stream
    ***********************************************************/
    [CCode (cname="")]
    public int[] audio_channels_map;

    /***********************************************************
    number of channels in audio_channels_map
    ***********************************************************/
    [CCode (cname="")]
    public int audio_channels_mapped;

    [CCode (cname="")]
    public string logfile_prefix;

    [CCode (cname="")]
    public FILE? logfile;

    [CCode (cname="")]
    public OutputFilter? filter;

    [CCode (cname="")]
    public string avfilter;

    /***********************************************************
    filtergraph associated to the -filter option
    ***********************************************************/
    [CCode (cname="")]
    public string filters;

    /***********************************************************
    filtergraph script associated to the -filter_script option
    ***********************************************************/
    [CCode (cname="")]
    public string filters_script;

    [CCode (cname="")]
    public LibAVUtil.Dictionary? encoder_opts;

    [CCode (cname="")]
    public LibAVUtil.Dictionary? sws_dict;

    [CCode (cname="")]
    public LibAVUtil.Dictionary? swr_opts;

    [CCode (cname="")]
    public LibAVUtil.Dictionary? resample_opts;

    [CCode (cname="")]
    public string apad;

    /***********************************************************
    no more packets should be written for this stream
    ***********************************************************/
    [CCode (cname="")]
    public OSTFinished finished;

    /***********************************************************
    true if the steram is unavailable (possibly temporarily)
    ***********************************************************/
    [CCode (cname="")]
    public int unavailable;

    [CCode (cname="")]
    public int stream_copy;

    /***********************************************************
    init_output_stream () has been called for this stream
    The encoder and the bitstream filters have been initialized
    and the stream parameters are set in the LibAVFormat.Stream.
    ***********************************************************/
    [CCode (cname="")]
    public int initialized;

    [CCode (cname="")]
    public int inputs_done;

    [CCode (cname="")]
    public string attachment_filename;

    [CCode (cname="")]
    public int copy_initial_nonkeyframes;

    [CCode (cname="")]
    public int copy_prior_start;

    [CCode (cname="")]
    public string disposition;

    [CCode (cname="")]
    public int keep_pix_fmt;

    /***********************************************************
    stats
    ***********************************************************/

    /***********************************************************
    combined size of all the packets written
    ***********************************************************/
    [CCode (cname="")]
    public uint64 data_size;

    /***********************************************************
    number of packets send to the muxer
    ***********************************************************/
    [CCode (cname="")]
    public uint64 packets_written;

    /***********************************************************
    number of frames/samples sent to the encoder
    ***********************************************************/
    [CCode (cname="")]
    public uint64 frames_encoded;

    [CCode (cname="")]
    public uint64 samples_encoded;

    /***********************************************************
    packet quality factor
    ***********************************************************/
    [CCode (cname="")]
    public int quality;

    [CCode (cname="")]
    public int max_muxing_queue_size;

    /***********************************************************
    the packets are buffered here until the muxer is ready to be initialized
    ***********************************************************/
    [CCode (cname="")]
    public AVFifoBuffer? muxing_queue;

    /***********************************************************
    packet picture type
    ***********************************************************/
    [CCode (cname="")]
    public int pict_type;

    /***********************************************************
    frame encode sum of squared error values
    ***********************************************************/
    [CCode (cname="")]
    public int64 error[4];
}

[CCode (cname="struct OutputFile",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
[Compact]
public class OutputFile {
    [CCode (cname="")]
    public LibAVFormat.FormatContext? ctx;

    [CCode (cname="")]
    public LibAVUtil.Dictionary? opts;

    /***********************************************************
    index of the first stream in output_streams
    ***********************************************************/
    [CCode (cname="")]
    public int ost_index;

    /***********************************************************
    desired length of the resulting file in microseconds == AV_TIME_BASE units
    ***********************************************************/
    [CCode (cname="")]
    public int64 recording_time;

    /***********************************************************
    start time in microseconds == AV_TIME_BASE units
    ***********************************************************/
    [CCode (cname="")]
    public int64 start_time;

    /***********************************************************
    filesize limit expressed in bytes
    ***********************************************************/
    [CCode (cname="")]
    public uint64 limit_filesize;

    [CCode (cname="")]
    public int shortest;

    [CCode (cname="")]
    public int header_written;
}

//  extern InputStream **input_streams;
//  extern int nb_input_streams;
//  extern InputFile **input_files;
//  extern int nb_input_files;

//  extern OutputStream **output_streams;
//  extern int nb_output_streams;
//  extern OutputFile **output_files;
//  extern int nb_output_files;

//  extern FilterGraph **filtergraphs;
//  extern int nb_filtergraphs;

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
//  extern AVIOContext? progress_avio;
//  extern float max_error_rate;
//  extern string videotoolbox_pixfmt;

//  extern int filter_nbthreads;
//  extern int filter_complex_nbthreads;
//  extern int vstats_version;

//  extern const AVIOInterruptCB int_cb;

//  extern const OptionDef options[];
//  extern const HWAccel hwaccels[];
//  extern AVBufferRef? hw_device_ctx;
//  #if CONFIG_QSV
//  extern string qsv_device;
//  #endif
//  extern HWDevice? filter_hw_device;


[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
public void term_init ();

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
public void term_exit ();

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
public void reset_options (
    OptionsContext? options_context,
    int is_input
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
public void show_usage ();

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
public void opt_output_file (
    void *optctx,
    string filename
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
public void remove_avoptions (
    LibAVUtil.Dictionary **av_dictionary_a,
    LibAVUtil.Dictionary? b
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
public void assert_avoptions (
    LibAVUtil.Dictionary? m
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
public int guess_input_channel_layout (
    InputStream? ist
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
public LibAVUtil.PixelFormat choose_pixel_fmt (
    LibAVFormat.Stream? st,
    AVCodecContext? avctx,
    AVCodec? codec,
    LibAVUtil.PixelFormat target
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
public void choose_sample_fmt (
    LibAVFormat.Stream? st,
    AVCodec? codec
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
public int configure_filtergraph (
    FilterGraph? fg
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
public int configure_output_filter (
    FilterGraph? fg,
    OutputFilter? ofilter,
    LibAVFilter.FilterInOut? out
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
public void check_filter_outputs ();

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
public int ist_in_filtergraph (
    FilterGraph? fg,
    InputStream? ist
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
public int filtergraph_is_simple (
    FilterGraph? fg
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
public int init_simple_filtergraph (
    InputStream? ist,
    OutputStream? ost
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
public int init_complex_filtergraph (
    FilterGraph? fg
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
public void sub2video_update (
    InputStream? ist,
    AVSubtitle? sub
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
public int ifilter_parameters_from_frame (
    InputFilter? ifilter,
    AVFrame? frame
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
public int ffmpeg_parse_options (
    int argc,
    string? argv
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
public int videotoolbox_init (
    AVCodecContext? av_codec_context
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
public int qsv_init (
    AVCodecContext? av_codec_context
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
public int cuvid_init (
    AVCodecContext? av_codec_context
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
HWDevice? hw_device_get_by_name (
    string name
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
public int hw_device_init_from_string (
    string arg,
    HWDevice **dev
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
public void hw_device_free_all ();

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
public int hw_device_setup_for_decode (
    InputStream? ist
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
public int hw_device_setup_for_encode (
    OutputStream? ost
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/fftools/ffmpeg.h")]
public int hwaccel_decode_init (
    AVCodecContext? avctx
);

} // namespace FFmpeg
