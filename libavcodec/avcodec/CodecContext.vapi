/***********************************************************
@@copyright 2001 Fabrice Bellard

This file is part of FFmpeg.

FFmpeg is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

FFmpeg is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with FFmpeg; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
***********************************************************/

namespace LibAVCodec {
using LibAVUtil;

/***********************************************************
@file
@ingroup libavc
LibAVCodec external API header
***********************************************************/

[CCode (cname="struct AVCodecInternal", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public struct AVCodecInternal { }

[CCode (cname="AV_NUM_DATA_POINTERS", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public const size_t AV_NUM_DATA_POINTERS;

public delegate void AVCodecDrawHorizontalBandDelegate (
    CodecContext codec_context,
    LibAVUtil.Frame input_frame,
    int offset[AV_NUM_DATA_POINTERS],
    int y,
    int type,
    int height
);
public delegate LibAVUtil.PixelFormat AVCodecGetFormatDelegate (
    CodecContext codec_context,
    LibAVUtil.PixelFormat fmt
);
public delegate int AVCodecGetBuffer2Delegate (
    CodecContext codec_context,
    LibAVUtil.Frame frame,
    int flags
);
public delegate int AVCodecExecutionDelegateDelegate (
    CodecContext c2,
    void *arg
);
public delegate int AVCodecExecutionDelegate (
    CodecContext codec_context,
    AVCodecExecutionDelegateDelegate func,
    void *arg2,
    out int ret,
    int count,
    int size
);
public delegate int AVCodecExecute2DelegateDelegate (
    CodecContext c2,
    void *arg,
    int jobnr,
    int threadnr
);
public delegate int AVCodecExecute2Delegate (
    CodecContext codec_context,
    AVCodecExecute2DelegateDelegate func,
    void *arg2,
    out int ret,
    int count
);
public delegate int AVCodecDefaultExecuteDelegate (
    CodecContext c2,
    void *arg2
);
public delegate int AVCodecDefaultExecute2Delegate (
    CodecContext c2,
    void *arg2,
    int arg3,
    int arg4
);

/***********************************************************
@brief Main external API structure.
New fields can be added to the end with minor version bumps.
Removal, reordering and changes to existing fields require a major
version bump.
You can use LibAVUtil.Options (av_opt* / av_set/get*()) to access these fields from user
applications.
The name string for LibAVUtil.Options options matches the associated command line
parameter name and can be found in LibAVCodec/options_table.h
The LibAVUtil.Option/command line parameter names differ in some cases from the C
structure field names for historic reasons or brevity.
sizeof (CodecContext) must not be used outside libav*.
***********************************************************/
[CCode (cname="struct AVCodecContext", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public struct CodecContext {
    /***********************************************************
    @brief Information on struct for av_log

    - set by avcodec_alloc_context3
    ***********************************************************/
    [CCode (cname="av_class")]
    public LibAVUtil.Class av_class;
    [CCode (cname="log_level_offset")]
    public int log_level_offset;

    /***********************************************************
    @see @link LibAVUtil.MediaType
    ***********************************************************/
    [CCode (cname="codec_type")]
    public LibAVUtil.MediaType codec_type;
    [CCode (cname="codec")]
    public Codec codec;

    /***********************************************************
    @see @link CodecID
    ***********************************************************/
    [CCode (cname="codec_id")]
    public CodecID codec_id;

    /***********************************************************
    @brief fourcc (LSB first, so "ABCD" -> ('D'<<24) + ('C'<<16) + ('B'<<8) + 'A').

    @description This is used to work around some encoder bugs.
        A demuxer should set this to what is stored in the field used to identify the codec.
        If there are multiple such fields in a container then the demuxer should choose the one
        which maximizes the information about the used codec.
        If the codec tag field in a container is larger than 32 bits then the demuxer should
        remap the longer ID to 32 bits with a table or other structure. Alternatively a new
        extra_codec_tag + size could be added but for this a clear advantage must be demonstrated
        first.

    - encoding: Set by user, if not then the default based on codec_id will be used.
    - decoding: Set by user, will be converted to uppercase by LibAVCodec during init.
    ***********************************************************/
    [CCode (cname="codec_tag")]
    public uint codec_tag;

    [CCode (cname="priv_data")]
    public void *priv_data;

    /***********************************************************
    @brief Private context used for internal data.

    @note Unlike priv_data, this is not codec-specific. It is used in general
        LibAVCodec functions.
    ***********************************************************/
    [CCode (cname="internal")]
    public AVCodecInternal internal;

    /***********************************************************
    @brief Private data of the user, can be used to carry app specific stuff.

    - encoding: Set by user.
    - decoding: Set by user.
    ***********************************************************/
    [CCode (cname="opaque")]
    public void *opaque;

    /***********************************************************
    @brief The average bitrate

    - encoding: Set by user; unused for constant quantizer encoding.
    - decoding: Set by user, may be overwritten by LibAVCodec
        if this info is available in the stream
    ***********************************************************/
    [CCode (cname="bit_rate")]
    public int64 bit_rate;

    /***********************************************************
    @brief Number of bits the bitstream is allowed to diverge from the reference.
        the reference can be CBR (for CBR pass1) or VBR (for pass2)

    - encoding: Set by user; unused for constant quantizer encoding.
    - decoding: unused
    ***********************************************************/
    [CCode (cname="bit_rate_tolerance")]
    public int bit_rate_tolerance;

    /***********************************************************
    @brief Global quality for codecs which cannot change it per frame.
        This should be proportional to MPEG-1/2/4 qscale.

    - encoding: Set by user.
    - decoding: unused
    ***********************************************************/
    [CCode (cname="global_quality")]
    public int global_quality;

    /***********************************************************
    @brief Compression level

    - encoding: Set by user.
    - decoding: unused
    ***********************************************************/
    [CCode (cname="compression_level")]
    public int compression_level;

    [CCode (cname="FF_COMPRESSION_DEFAULT", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public const int FF_COMPRESSION_DEFAULT;

    /***********************************************************
    @brief Codec flags

    - encoding: Set by user.
    - decoding: Set by user.
    ***********************************************************/
    [CCode (cname="flags")]
    public CodecFlags1 flags;

    /***********************************************************
    @brief Codec flags of type 2

    - encoding: Set by user.
    - decoding: Set by user.
    ***********************************************************/
    [CCode (cname="flags2")]
    public CodecFlags2 flags2;

    /***********************************************************
    @description Some codecs need / can use extradata like Huffman tables.
        
        - MJPEG: Huffman tables
        - rv10: additional flags
        - MPEG-4: global headers (they can be in the bitstream or here)

        The allocated memory should be AV_INPUT_BUFFER_PADDING_SIZE bytes larger
        than extradata_size to avoid problems if it is read with the bitstream reader.
        The bytewise contents of extradata must not depend on the architecture or CPU endianness.
        Must be allocated with the av_malloc () family of functions.

    - encoding: Set/allocated/freed by 
    - decoding: Set/allocated/freed by user.
    ***********************************************************/
    [CCode (cname="extradata")]
    public uint8[] extradata;
    [CCode (cname="extradata_size")]
    public int extradata_size;

    /***********************************************************
    @description This is the fundamental unit of time (in seconds) in terms
        of which frame timestamps are represented. For fixed-fps content,
        timebase should be 1/framerate and timestamp increments should be
        identically 1.
        This often, but not always is the inverse of the frame rate or field rate
        for video. 1/time_base is not the average frame rate if the frame rate is not
        constant.

        Like containers, elementary streams also can store timestamps, 1/time_base
        is the unit in which these timestamps are specified.
        As example of such codec time base see ISO/IEC 14496-2:2001 (E)
        vop_time_increment_resolution and fixed_vop_rate
        (fixed_vop_rate == 0 implies that it is different from the framerate)

    - encoding: MUST be set by user.
    - decoding: the use of this field for decoding is deprecated.
        Use framerate instead.
    ***********************************************************/
    [CCode (cname="time_base")]
    public LibAVUtil.Rational time_base;

    /***********************************************************
    @description For some codecs, the time base is closer to the field rate than the frame rate.
        Most notably, H.264 and MPEG-2 specify time_base as half of frame duration
        if no telecine is used ...

        Set to time_base ticks per frame. Default 1, e.g., H.264/MPEG-2 set it to 2.
    ***********************************************************/
    [CCode (cname="ticks_per_frame")]
    public int ticks_per_frame;

    /***********************************************************
    @brief Codec delay.

    Encoding: Number of frames delay there will be from the encoder input to
        the decoder output. (we assume the decoder matches the spec)
    Decoding: Number of frames delay in addition to what a standard decoder
        as specified in the spec would produce.

    Video:
        Number of frames the decoded output will be delayed relative to the
        encoded input.

    Audio:
        For encoding, this field is unused (see @link initial_padding).

        For decoding, this is the number of samples the decoder needs to
        output before the decoder's output is valid. When seeking, you should
        start decoding this many samples prior to your desired seek point.

    - encoding: Set by 
    - decoding: Set by 
    ***********************************************************/
    [CCode (cname="delay")]
    public int delay;

    /***********************************************************
    video only
    ***********************************************************/

    /***********************************************************
    @brief Picture width / height.

    @note Those fields may not match the values of the last
        LibAVUtil.Frame output by avcodec_decode_video2 due frame
        reordering.

    - encoding: MUST be set by user.
    - decoding: May be set by the user before opening the decoder if known e.g.
        from the container. Some decoders will require the dimensions
        to be set by the caller. During decoding, the decoder may
        overwrite those values as required while parsing the data.
    ***********************************************************/
    [CCode (cname="width")]
    public int width;
    [CCode (cname="height")]
    public int height;

    /***********************************************************
    @description Bitstream width / height, may be different from width/height e.g. when
        the decoded frame is cropped before being output or lowres is enabled.

    @note Those field may not match the value of the last
        LibAVUtil.Frame output by avcodec_receive_frame () due frame
        reordering.

    - encoding: unused
    - decoding: May be set by the user before opening the decoder if known
        e.g. from the container. During decoding, the decoder may
        overwrite those values as required while parsing the data.
    ***********************************************************/
    [CCode (cname="coded_width")]
    public int coded_width;
    [CCode (cname="coded_height")]
    public int coded_height;

    /***********************************************************
    @brief The number of pictures in a group of pictures, or 0 for intra_only

    - encoding: Set by user.
    - decoding: unused
    ***********************************************************/
    [CCode (cname="gop_size")]
    public int gop_size;

    /***********************************************************
    @brief Pixel format, see LibAVUtil.PixelFormat

    @note May be set by the demuxer if known from headers.
    @note May be overridden by the decoder if it knows better.

    @note This field may not match the value of the last
        LibAVUtil.Frame output by avcodec_receive_frame () due frame
        reordering.

    - encoding: Set by user.
    - decoding: Set by user if known, overridden by LibAVCodec while
        parsing the data.
    ***********************************************************/
    [CCode (cname="pix_fmt")]
    public LibAVUtil.PixelFormat pixel_format;

    /***********************************************************
    @description If non null, 'draw_horiz_band' is called by the LibAVCodec
        decoder to draw a horizontal band. It improves cache usage. Not
        all codecs can do that. You must check the codec capabilities
        beforehand.
        When multithreading is used, it may be called from multiple threads
        at the same time; threads might draw different parts of the same LibAVUtil.Frame,
        or multiple AVFrames, and there is no guarantee that slices will be drawn
        in order.
        The function is also used by hardware acceleration APIs.
        It is called at least once during frame decoding to pass
        the data needed for hardware render.
        In that mode instead of pixel data, LibAVUtil.Frame points to
        a structure specific to the acceleration API. The application
        reads the structure and can change some fields to indicate progress
        or mark state.

    - encoding: unused
    - decoding: Set by user.

    @param height the height of the slice
    @param y the y position of the slice
    @param type 1->top field, 2->bottom field, 3->frame
    @param offset offset into the LibAVUtil.Frame.data from which the slice should be read
    ***********************************************************/
    [CCode (cname="draw_horiz_band")]
    public AVCodecDrawHorizontalBandDelegate draw_horiz_band;

    /***********************************************************
    @brief Callback to negotiate the pixelFormat

    @param fmt is the list of formats which are supported by the codec,
        it is terminated by -1 as 0 is a valid format, the formats are ordered by quality.
        The first is always the native one.

    @note The callback may be called again immediately if initialization for
        the selected (hardware-accelerated) pixel format failed.
    @warning Behavior is undefined if the callback returns a value not
        in the fmt list of formats.
    @return the chosen format

    - encoding: unused
    - decoding: Set by user, if not set the native format will be chosen.
    ***********************************************************/
    [CCode (cname="get_format")]
    public AVCodecGetFormatDelegate get_format;

    /***********************************************************
    @brief Maximum number of B-frames between non-B-frames

    @note The output will be delayed by max_b_frames+1 relative to the input.

    - encoding: Set by user.
    - decoding: unused
    ***********************************************************/
    [CCode (cname="max_b_frames")]
    public int max_b_frames;

    /***********************************************************
    @brief Qscale factor between IP and B-frames

    @note If > 0 then the last P-frame quantizer will be used (q= lastp_q*factor+offset).
    @note If < 0 then normal ratecontrol will be done (q= -normal_q*factor+offset).

    - encoding: Set by user.
    - decoding: unused
    ***********************************************************/
    [CCode (cname="b_quant_factor")]
    public float b_quant_factor;

    /***********************************************************
    @brief Qscale offset between IP and B-frames

    - encoding: Set by user.
    - decoding: unused
    ***********************************************************/
    [CCode (cname="b_quant_offset")]
    public float b_quant_offset;

    /***********************************************************
    @brief Size of the frame reordering buffer in the decoder.
    
    @note For MPEG-2 it is 1 IPB or 0 low delay IP.

    - encoding: Set by 
    - decoding: Set by 
    ***********************************************************/
    [CCode (cname="has_b_frames")]
    public int has_b_frames;

    /***********************************************************
    @brief Qscale factor between P- and I-frames
    
    @note If > 0 then the last P-frame quantizer will be used (q = lastp_q * factor + offset).
    @note If < 0 then normal ratecontrol will be done (q= -normal_q*factor+offset).

    - encoding: Set by user.
    - decoding: unused
    ***********************************************************/
    [CCode (cname="i_quant_factor")]
    public float i_quant_factor;

    /***********************************************************
    @brief Qscale offset between P and I-frames

    - encoding: Set by user.
    - decoding: unused
    ***********************************************************/
    [CCode (cname="i_quant_offset")]
    public float i_quant_offset;

    /***********************************************************
    @brief Luminance masking (0-> disabled)

    - encoding: Set by user.
    - decoding: unused
    ***********************************************************/
    [CCode (cname="lumi_masking")]
    public float lumi_masking;

    /***********************************************************
    @brief Temporary complexity masking (0-> disabled)

    - encoding: Set by user.
    - decoding: unused
    ***********************************************************/
    [CCode (cname="temporal_cplx_masking")]
    public float temporal_cplx_masking;

    /***********************************************************
    @brief Spatial complexity masking (0-> disabled)

    - encoding: Set by user.
    - decoding: unused
    ***********************************************************/
    [CCode (cname="spatial_cplx_masking")]
    public float spatial_cplx_masking;

    /***********************************************************
    @brief P block masking (0-> disabled)

    - encoding: Set by user.
    - decoding: unused
    ***********************************************************/
    [CCode (cname="p_masking")]
    public float p_masking;

    /***********************************************************
    @brief Darkness masking (0-> disabled)

    - encoding: Set by user.
    - decoding: unused
    ***********************************************************/
    [CCode (cname="dark_masking")]
    public float dark_masking;

    /***********************************************************
    @brief Slice count

    - encoding: Set by 
    - decoding: Set by user (or 0).
    ***********************************************************/
    [CCode (cname="slice_count")]
    public int slice_count;

    /***********************************************************
    @brief Slice offsets in the frame in bytes

    - encoding: Set/allocated by 
    - decoding: Set/allocated by user (or null).
    ***********************************************************/
    [CCode (cname="slice_offset")]
    public int[] slice_offset;

    /***********************************************************
    @brief Sample aspect ratio (0 if unknown)
    
    @description That is the width of a pixel divided by the height of the pixel.
        Numerator and denominator must be relatively prime and smaller than 256 for some video standards.

    - encoding: Set by user.
    - decoding: Set by 
    ***********************************************************/
    [CCode (cname="sample_aspect_ratio")]
    public LibAVUtil.Rational sample_aspect_ratio;

    /***********************************************************
    @brief Motion estimation comparison function

    - encoding: Set by user.
    - decoding: unused
    ***********************************************************/
    [CCode (cname="me_cmp")]
    public int me_cmp;

    /***********************************************************
    @brief Subpixel motion estimation comparison function

    - encoding: Set by user.
    - decoding: unused
    ***********************************************************/
    [CCode (cname="me_sub_cmp")]
    public int me_sub_cmp;

    /***********************************************************
    @brief Macroblock comparison function (not supported yet)

    - encoding: Set by user.
    - decoding: unused
    ***********************************************************/
    [CCode (cname="mb_cmp")]
    public int mb_cmp;

    /***********************************************************
    @brief Interlaced DCT comparison function

    - encoding: Set by user.
    - decoding: unused
    ***********************************************************/
    [CCode (cname="ildct_cmp")]
    public InterlacedDCTComparison ildct_cmp;

    /***********************************************************
    @brief ME diamond size & shape

    - encoding: Set by user.
    - decoding: unused
    ***********************************************************/
    [CCode (cname="dia_size")]
    public int dia_size;

    /***********************************************************
    @brief Amount of previous MV predictors (2a+1 x 2a+1 square)

    - encoding: Set by user.
    - decoding: unused
    ***********************************************************/
    [CCode (cname="last_predictor_count")]
    public int last_predictor_count;

    /***********************************************************
    @brief Motion estimation prepass comparison function

    - encoding: Set by user.
    - decoding: unused
    ***********************************************************/
    [CCode (cname="me_pre_cmp")]
    public int me_pre_cmp;

    /***********************************************************
    @brief ME prepass diamond size & shape

    - encoding: Set by user.
    - decoding: unused
    ***********************************************************/
    [CCode (cname="pre_dia_size")]
    public int pre_dia_size;

    /***********************************************************
    @brief Subpel ME quality

    - encoding: Set by user.
    - decoding: unused
    ***********************************************************/
    [CCode (cname="me_subpel_quality")]
    public int me_subpel_quality;

    /***********************************************************
    @brief Maximum motion estimation search range in subpel units
        If 0 then no limit.

    - encoding: Set by user.
    - decoding: unused
    ***********************************************************/
    [CCode (cname="me_range")]
    public int me_range;

    /***********************************************************
    @brief Slice flags

    - encoding: unused
    - decoding: Set by user.
    ***********************************************************/
    [CCode (cname="slice_flags")]
    public SliceFlags slice_flags;

    /***********************************************************
    @brief Macroblock decision mode

    - encoding: Set by user.
    - decoding: unused
    ***********************************************************/
    [CCode (cname="mb_decision")]
    public MacroBlockDecisionMode mb_decision;

    /***********************************************************
    @brief Custom intra quantization matrix
    
    @note Must be allocated with the av_malloc () family of functions, and will be freed in
        avcodec_free_context ().

    - encoding: Set/allocated by user, freed by Can be null.
    - decoding: Set/allocated/freed by 
    ***********************************************************/
    [CCode (cname="intra_matrix")]
    public uint16[] intra_matrix;

    /***********************************************************
    @brief Custom inter quantization matrix
    
    @note Must be allocated with the av_malloc () family of functions, and will be freed in
        avcodec_free_context ().

    - encoding: Set/allocated by user, freed by Can be null.
    - decoding: Set/allocated/freed by 
    ***********************************************************/
    [CCode (cname="inter_matrix")]
    public uint16[] inter_matrix;

    /***********************************************************
    @brief Precision of the intra DC coefficient - 8

    - encoding: Set by user.
    - decoding: Set by LibAVCodec
    ***********************************************************/
    [CCode (cname="intra_dc_precision")]
    public int intra_dc_precision;

    /***********************************************************
    @brief Number of macroblock rows at the top which are skipped.

    - encoding: unused
    - decoding: Set by user.
    ***********************************************************/
    [CCode (cname="skip_top")]
    public int skip_top;

    /***********************************************************
    @brief Number of macroblock rows at the bottom which are skipped.

    - encoding: unused
    - decoding: Set by user.
    ***********************************************************/
    [CCode (cname="skip_bottom")]
    public int skip_bottom;

    /***********************************************************
    @brief Minimum macroblock Lagrange multiplier

    - encoding: Set by user.
    - decoding: unused
    ***********************************************************/
    [CCode (cname="mb_lmin")]
    public int mb_lmin;

    /***********************************************************
    @brief Maximum macroblock Lagrange multiplier

    - encoding: Set by user.
    - decoding: unused
    ***********************************************************/
    [CCode (cname="mb_lmax")]
    public int mb_lmax;

    /***********************************************************
    @brief Bidirectional refine

    - encoding: Set by user.
    - decoding: unused
    ***********************************************************/
    [CCode (cname="bidir_refine")]
    public int bidir_refine;

    /***********************************************************
    @brief Minimum GOP size

    - encoding: Set by user.
    - decoding: unused
    ***********************************************************/
    [CCode (cname="keyint_min")]
    public int keyint_min;

    /***********************************************************
    @brief Number of reference frames

    - encoding: Set by user.
    - decoding: Set by lavc.
    ***********************************************************/
    [CCode (cname="refs")]
    public int refs;

    /***********************************************************
    @note Value depends upon the compare function used for fullpel ME.

    - encoding: Set by user.
    - decoding: unused
    ***********************************************************/
    [CCode (cname="mv0_threshold")]
    public int mv0_threshold;

    /***********************************************************
    @brief Chromaticity coordinates of the source primaries.

    - encoding: Set by user
    - decoding: Set by LibAVCodec
    ***********************************************************/
    [CCode (cname="color_primaries")]
    public LibAVUtil.ColorPrimaries color_primaries;

    /***********************************************************
    @brief Color Transfer Characteristic.

    - encoding: Set by user
    - decoding: Set by LibAVCodec
    ***********************************************************/
    [CCode (cname="color_trc")]
    public LibAVUtil.ColorTransferCharacteristic color_trc;

    /***********************************************************
    @brief YUV colorspace type.

    - encoding: Set by user
    - decoding: Set by LibAVCodec
    ***********************************************************/
    [CCode (cname="colorspace")]
    public LibAVUtil.ColorSpace colorspace;

    /***********************************************************
    @brief MPEG vs JPEG YUV range.

    - encoding: Set by user
    - decoding: Set by LibAVCodec
    ***********************************************************/
    [CCode (cname="color_range")]
    public LibAVUtil.ColorRange color_range;

    /***********************************************************
    @brief This defines the location of chroma samples.

    - encoding: Set by user
    - decoding: Set by LibAVCodec
    ***********************************************************/
    [CCode (cname="chroma_sample_location")]
    public LibAVUtil.ChromaLocation chroma_sample_location;

    /***********************************************************
    @brief Number of slices.

    @description Indicates number of picture subdivisions. Used for parallelized
        decoding.

    - encoding: Set by user
    - decoding: unused
    ***********************************************************/
    [CCode (cname="slices")]
    public int slices;

    /***********************************************************
    @brief Field order

    - encoding: set by LibAVCodec
    - decoding: Set by user.
    ***********************************************************/
    [CCode (cname="field_order")]
    public FieldOrder field_order;

    /***********************************************************
    @brief Samples per second (audio only)
    ***********************************************************/
    [CCode (cname="sample_rate")]
    public int sample_rate;

    /***********************************************************
    @brief Number of audio channels (audio only)
    ***********************************************************/
    [CCode (cname="channels")]
    public int channels;

    /***********************************************************
    @brief Audio sample format

    - encoding: Set by user.
    - decoding: Set by 
    ***********************************************************/
    [CCode (cname="sample_fmt")]
    public LibAVUtil.SampleFormat sample_fmt;

    /***********************************************************
    The following data should not be initialized.
    ***********************************************************/

    /***********************************************************
    @brief Number of samples per channel in an audio frame.

    - encoding: set by LibAVCodec in avcodec_open2 (). Each submitted frame
        except the last must contain exactly frame_size samples per channel.
        May be 0 when the codec has AV_CODEC_CAP_VARIABLE_FRAME_SIZE set, then the
        frame size is not restricted.
    - decoding: may be set by some decoders to indicate constant frame size
    ***********************************************************/
    [CCode (cname="frame_size")]
    public int frame_size;

    /***********************************************************
    @brief Frame counter, set by 

    - encoding: total number of frames passed to the encoder so far.
    - decoding: total number of frames returned from the decoder so far.

    @note the counter is not incremented if encoding/decoding resulted in
        an error.
    ***********************************************************/
    [CCode (cname="frame_number")]
    public int frame_number;

    /***********************************************************
    @brief Number of bytes per packet if constant and known or 0
        Used by some WAV based audio codecs.
    ***********************************************************/
    [CCode (cname="block_align")]
    public int block_align;

    /***********************************************************
    @brief Audio cutoff bandwidth (0 means "automatic")

    - encoding: Set by user.
    - decoding: unused
    ***********************************************************/
    [CCode (cname="cutoff")]
    public int cutoff;

    /***********************************************************
    @brief Audio channel layout.

    - encoding: set by user.
    - decoding: set by user, may be overwritten by 
    ***********************************************************/
    [CCode (cname="channel_layout")]
    public uint64 channel_layout;

    /***********************************************************
    @brief Request decoder to use this channel layout if it can (0 for default)

    - encoding: unused
    - decoding: Set by user.
    ***********************************************************/
    [CCode (cname="request_channel_layout")]
    public uint64 request_channel_layout;

    /***********************************************************
    @brief Type of service that the audio stream conveys.

    - encoding: Set by user.
    - decoding: Set by 
    ***********************************************************/
    [CCode (cname="audio_service_type")]
    public AudioServiceType audio_service_type;

    /***********************************************************
    @brief Desired sample format

    - encoding: Not used.
    - decoding: Set by user. Decoder will decode to this format if it can.
    ***********************************************************/
    [CCode (cname="request_sample_fmt")]
    public LibAVUtil.SampleFormat request_sample_fmt;

    /***********************************************************
    @description This callback is called at the beginning of each frame to get data
        buffer (s) for it. There may be one contiguous buffer for all the data or
        there may be a buffer per each data plane or anything in between. What
        this means is, you may set however many entries in buf[] you feel necessary.
        Each buffer must be reference-counted using the LibAVUtil.Buffer API (see description
        of buf[] below).

        The following fields will be set in the frame before this callback is
        called:
        - format
        - width, height (video only)
        - sample_rate, channel_layout, nb_samples (audio only)
        Their values may differ from the corresponding values in
        CodecContext. This callback must use the frame values, not the codec
        context values, to calculate the required buffer size.

        This callback must fill the following fields in the frame:
        - data[]
        - linesize[]
        - extended_data:
        * if the data is planar audio with more than 8 channels, then this
            callback must allocate and fill extended_data to contain all pointers
            to all data planes. data[] must hold as many pointers as it can.
            extended_data must be allocated with av_malloc () and will be freed in
            av_frame_unref ().
        * otherwise extended_data must point to data
        - buf[] must contain one or more pointers to LibAVUtil.BufferRef structures. Each of
        the frame's data and extended_data pointers must be contained in these. That
        is, one LibAVUtil.BufferRef for each allocated chunk of memory, not necessarily one
        LibAVUtil.BufferRef per data[] entry. See: av_buffer_create (), av_buffer_alloc (),
        and av_buffer_ref ().
        - extended_buf and nb_extended_buf must be allocated with av_malloc () by
        this callback and filled with the extra buffers if there are more
        buffers than buf[] can hold. extended_buf will be freed in
        av_frame_unref ().

        If AV_CODEC_CAP_DR1 is not set then get_buffer2 () must call
        avcodec_default_get_buffer2 () instead of providing buffers allocated by
        some other means.

        Each data plane must be aligned to the maximum required by the target
        CPU.

        @see @link avcodec_default_get_buffer2 ()

        Video:

        If AV_GET_BUFFER_FLAG_REF is set in flags then the frame may be reused
        (read and/or written to if it is writable) later by 

        avcodec_align_dimensions2 () should be used to find the required width and
        height, as they normally need to be rounded up to the next multiple of 16.

        Some decoders do not support linesizes changing between frames.

        If frame multithreading is used and thread_safe_callbacks is set,
        this callback may be called from a different thread, but not from more
        than one at once. Does not need to be reentrant.

        @see @link avcodec_align_dimensions2 ()

        Audio:

        Decoders request a buffer of a particular size by setting
        LibAVUtil.Frame.nb_samples prior to calling get_buffer2 (). The decoder may,
        however, utilize only part of the buffer by setting LibAVUtil.Frame.nb_samples
        to a smaller value in the output frame.

        As a convenience, av_samples_get_buffer_size () and
        av_samples_fill_arrays () in libavutil may be used by custom get_buffer2 ()
        functions to find the required data size and to fill data pointers and
        linesize. In LibAVUtil.Frame.linesize, only linesize[0] may be set for audio
        since all planes must be the same size.

    @see @link av_samples_get_buffer_size (), av_samples_fill_arrays ()

    - encoding: unused
    - decoding: Set by LibAVCodec, user can override.
    ***********************************************************/
    [CCode (cname="get_buffer2")]
    public AVCodecGetBuffer2Delegate get_buffer2;

    /***********************************************************
    - encoding parameters
***********************************************************/

    /***********************************************************
    @brief Amount of qscale change between easy & hard scenes (0.0-1.0)
    ***********************************************************/
    [CCode (cname="qcompress")]
    public float qcompress;

    /***********************************************************
    @brief Amount of qscale smoothing over time (0.0-1.0)
    ***********************************************************/
    [CCode (cname="qblur")]
    public float qblur;

    /***********************************************************
    @brief Minimum quantizer

    - encoding: Set by user.
    - decoding: unused
    ***********************************************************/
    [CCode (cname="qmin")]
    public int qmin;

    /***********************************************************
    @brief Maximum quantizer

    - encoding: Set by user.
    - decoding: unused
    ***********************************************************/
    [CCode (cname="qmax")]
    public int qmax;

    /***********************************************************
    @brief Maximum quantizer difference between frames

    - encoding: Set by user.
    - decoding: unused
    ***********************************************************/
    [CCode (cname="max_qdiff")]
    public int max_qdiff;

    /***********************************************************
    @brief Decoder bitstream buffer size

    - encoding: Set by user.
    - decoding: unused
    ***********************************************************/
    [CCode (cname="rc_buffer_size")]
    public int rc_buffer_size;

    /***********************************************************
    @brief Ratecontrol override, see RcOverride

    - encoding: Allocated/set/freed by user.
    - decoding: unused
    ***********************************************************/
    [CCode (cname="rc_override")]
    public RcOverride[] rc_override;
    [CCode (cname="rc_override_count")]
    public int rc_override_count;

    /***********************************************************
    @brief Maximum bitrate

    - encoding: Set by user.
    - decoding: Set by user, may be overwritten by 
    ***********************************************************/
    [CCode (cname="rc_max_rate")]
    public int64 rc_max_rate;

    /***********************************************************
    @brief Minimum bitrate

    - encoding: Set by user.
    - decoding: unused
    ***********************************************************/
    [CCode (cname="rc_min_rate")]
    public int64 rc_min_rate;

    /***********************************************************
    @brief Ratecontrol attempt to use, at maximum, <value> of what can be used without an underflow.

    - encoding: Set by user.
    - decoding: unused.
    ***********************************************************/
    [CCode (cname="rc_max_available_vbv_use")]
    public float rc_max_available_vbv_use;

    /***********************************************************
    @brief Ratecontrol attempt to use, at least, <value> times the amount needed to prevent a vbv overflow.

    - encoding: Set by user.
    - decoding: unused.
    ***********************************************************/
    [CCode (cname="rc_min_vbv_overflow_use")]
    public float rc_min_vbv_overflow_use;

    /***********************************************************
    @brief Number of bits which should be loaded into the rc buffer before decoding starts.

    - encoding: Set by user.
    - decoding: unused
    ***********************************************************/
    [CCode (cname="rc_initial_buffer_occupancy")]
    public int rc_initial_buffer_occupancy;

    /***********************************************************
    @brief Trellis RD quantization

    - encoding: Set by user.
    - decoding: unused
    ***********************************************************/
    [CCode (cname="trellis")]
    public int trellis;

    /***********************************************************
    @brief Pass1 encoding statistics output buffer

    - encoding: Set by 
    - decoding: unused
    ***********************************************************/
    [CCode (cname="stats_out")]
    public string stats_out;

    /***********************************************************
    @brief Pass2 encoding statistics input buffer
    
    @note Concatenated stuff from stats_out of pass1 should be placed here.

    - encoding: Allocated/set/freed by user.
    - decoding: unused
    ***********************************************************/
    [CCode (cname="stats_in")]
    public string stats_in;

    /***********************************************************
    @brief Workaround bugs in encoders which sometimes cannot be detected automatically.

    - encoding: Set by user
    - decoding: Set by user
    ***********************************************************/
    [CCode (cname="workaround_bugs")]
    public BugWorkaroundFlags workaround_bugs;

    /***********************************************************
    @brief Strictly follow the standard (MPEG-4, ...).

    - encoding: Set by user.
    - decoding: Set by user.

    @warning Setting this to STRICT or higher means the encoder and decoder will
        generally do stupid things, whereas setting it to unofficial or lower
        will mean the encoder might produce output that is not supported by all
        spec-compliant decoders. Decoders don't differentiate between normal,
        unofficial and experimental (that is, they always try to decode things
        when they can) unless they are explicitly asked to behave stupidly
        (=strictly conform to the specs)
    ***********************************************************/
    [CCode (cname="strict_std_compliance")]
    public StrictStandardsCompliance strict_std_compliance;

    /***********************************************************
    @brief Error concealment flags

    - encoding: unused
    - decoding: Set by user.
    ***********************************************************/
    [CCode (cname="error_concealment")]
    public ErrorConcealmentFlags error_concealment;

    /***********************************************************
    @brief Debug

    - encoding: Set by user.
    - decoding: Set by user.
    ***********************************************************/
    [CCode (cname="debug")]
    public DebugFlags debug;

#if FF_API_DEBUG_MV
    /***********************************************************
    @brief Debug

    - encoding: Set by user.
    - decoding: Set by user.
    ***********************************************************/
    [CCode (cname="debug_mv")]
    public DebugMVFlags debug_mv;
#endif

    /***********************************************************
    @brief Error recognition; may misdetect some more or less valid parts as errors.

    - encoding: unused
    - decoding: Set by user.
    ***********************************************************/
    [CCode (cname="err_recognition")]
    public ErrorRecognitionFlags err_recognition;

    /***********************************************************
    @brief Opaque 64-bit number (generally a PTS) that will be reordered and
        output in LibAVUtil.Frame.reordered_opaque

    - encoding: Set by LibAVCodec to the reordered_opaque of the input
        frame corresponding to the last returned packet. Only
        supported by encoders with the
        AV_CODEC_CAP_ENCODER_REORDERED_OPAQUE capability.
    - decoding: Set by user.
    ***********************************************************/
    [CCode (cname="reordered_opaque")]
    public int64 reordered_opaque;

    /***********************************************************
    @brief Hardware accelerator in use

    - encoding: unused.
    - decoding: Set by LibAVCodec
    ***********************************************************/
    [CCode (cname="hwaccel")]
    public HardwareAcceleration hwaccel;

    /***********************************************************
    @brief Hardware accelerator context.

    @description For some hardware accelerators, a global context needs to be
        provided by the user. In that case, this holds display-dependent
        data FFmpeg cannot instantiate itself. Please refer to the
        FFmpeg Hardware accelerator documentation to know how to fill this
        is. e.g. for VA API, this is a struct vaapi_context.

    - encoding: unused
    - decoding: Set by user
    ***********************************************************/
    [CCode (cname="hwaccel_context")]
    public void *hwaccel_context;

    /***********************************************************
    @brief Error

    - encoding: Set by LibAVCodec if flags & AV_CODEC_FLAG_PSNR.
    - decoding: unused
    ***********************************************************/
    [CCode (cname="error")]
    public uint64 error[AV_NUM_DATA_POINTERS];

    /***********************************************************
    @brief DCT algorithm, @see @link DCTAlgorithm.

    - encoding: Set by user.
    - decoding: unused
    ***********************************************************/
    [CCode (cname="dct_algo")]
    public DCTAlgorithm dct_algo;

    /***********************************************************
    @brief IDCT algorithm, @see @link IDCTAlgorithm.

    - encoding: Set by user.
    - decoding: Set by user.
    ***********************************************************/
    [CCode (cname="idct_algo")]
    public IDCTAlgorithm idct_algo;

    /***********************************************************
    @brief Bits per sample/pixel from the demuxer (needed for huffyuv).

    - encoding: Set by 
    - decoding: Set by user.
    ***********************************************************/
    [CCode (cname="bits_per_coded_sample")]
    public int bits_per_coded_sample;

    /***********************************************************
    @brief Bits per sample/pixel of internal LibAVCodec pixel/sample format.

    - encoding: set by user.
    - decoding: set by 
    ***********************************************************/
    [CCode (cname="bits_per_raw_sample")]
    public int bits_per_raw_sample;

#if FF_API_LOWRES
    /***********************************************************
    @brief Low resolution decoding, 1->1/2 size, 2->1/4 size

    - encoding: unused
    - decoding: Set by user.
    ***********************************************************/
    [CCode (cname="lowres")]
    public int lowres;
#endif

    /***********************************************************
    @brief Thread count

    @description This is used to decide how many independent tasks should be passed to execute ()

    - encoding: Set by user.
    - decoding: Set by user.
    ***********************************************************/
    [CCode (cname="thread_count")]
    public int thread_count;

    /***********************************************************
    @brief Which multithreading methods to use.

    @description Use of FF_THREAD_FRAME will increase decoding delay by one frame per thread,
        so clients which cannot provide future frames should not use it.

    - encoding: Set by user, otherwise the default is used.
    - decoding: Set by user, otherwise the default is used.
    ***********************************************************/
    [CCode (cname="thread_type")]
    public ThreadType thread_type;

    /***********************************************************
    @brief Which multithreading methods are in use by the codec.

    - encoding: Set by 
    - decoding: Set by 
    ***********************************************************/
    [CCode (cname="active_thread_type")]
    public int active_thread_type;

    /***********************************************************
    @description Set by the client if its custom get_buffer () callback can be called
        synchronously from another thread, which allows faster multithreaded decoding.
        draw_horiz_band () will be called from other threads regardless of this setting.
        Ignored if the default get_buffer () is used.

    - encoding: Set by user.
    - decoding: Set by user.
    ***********************************************************/
    [CCode (cname="thread_safe_callbacks")]
    public int thread_safe_callbacks;

    /***********************************************************
    @description The codec may call this to execute several independent things.
        It will return only after finishing all tasks.
        The user may replace this with some multithreaded implementation,
        the default implementation will execute the parts serially.

    @param count the number of things to execute

    - encoding: Set by LibAVCodec, user can override.
    - decoding: Set by LibAVCodec, user can override.
    ***********************************************************/
    [CCode (cname="execute")]
    public AVCodecExecutionDelegate execute;

    /***********************************************************
    @description The codec may call this to execute several independent things.
        It will return only after finishing all tasks.
        The user may replace this with some multithreaded implementation,
        the default implementation will execute the parts serially.
        Also see avcodec_thread_init and e.g. the --enable-pthread configure option.

    @param codec_context context passed also to func
    @param count the number of things to execute
    @param arg2 argument passed unchanged to func
    @param ret return values of executed functions, must have space for "count" values. May be null.
    @param func function that will be called count times, with jobnr from 0 to count-1.
        threadnr will be in the range 0 to codec_context->thread_count-1 < MAX_THREADS and so that no
        two instances of func executing at the same time will have the same threadnr.
    @return always 0 currently, but code should handle a future improvement where when any call to func
        returns < 0 no further calls to func may be done and < 0 is returned.

    - encoding: Set by LibAVCodec, user can override.
    - decoding: Set by LibAVCodec, user can override.
    ***********************************************************/
    [CCode (cname="execute2")]
    public AVCodecExecute2Delegate execute2;

    /***********************************************************
    @brief Noise vs. sse weight for the nsse comparison function

    - encoding: Set by user.
    - decoding: unused
    ***********************************************************/
    [CCode (cname="nsse_weight")]
    public int nsse_weight;

    /***********************************************************
    @brief ProfileType

    - encoding: Set by user.
    - decoding: Set by 
    ***********************************************************/
    [CCode (cname="profile")]
    public ProfileType profile;

    /***********************************************************
    @brief Level

    - encoding: Set by user.
    - decoding: Set by 
    ***********************************************************/
    [CCode (cname="level")]
    public int level;

    [CCode (cname="FF_LEVEL_UNKNOWN", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public const int FF_LEVEL_UNKNOWN;

    /***********************************************************
    @brief Skip loop filtering for selected frames.

    - encoding: unused
    - decoding: Set by user.
    ***********************************************************/
    [CCode (cname="skip_loop_filter")]
    public Discard skip_loop_filter;

    /***********************************************************
    @brief Skip IDCT/dequantization for selected frames.

    - encoding: unused
    - decoding: Set by user.
    ***********************************************************/
    [CCode (cname="skip_idct")]
    public Discard skip_idct;

    /***********************************************************
    @brief Skip decoding for selected frames.

    - encoding: unused
    - decoding: Set by user.
    ***********************************************************/
    [CCode (cname="skip_frame")]
    public Discard skip_frame;

    /***********************************************************
    @description Header containing style information for text subtitles.
        For SUBTITLE_ASS subtitle type, it should contain the whole ASS
        [Script Info] and [V4+ Styles] section, plus the [Events] line and
        the Format line following. It shouldn't include any Dialogue line.

    - encoding: Set/allocated/freed by user (before avcodec_open2 ())
    - decoding: Set/allocated/freed by LibAVCodec (by avcodec_open2 ())
    ***********************************************************/
    [CCode (cname="subtitle_header")]
    public uint8[] subtitle_header;
    [CCode (cname="subtitle_header_size")]
    public int subtitle_header_size;

    /***********************************************************
    @description Audio only. The number of "priming" samples (padding) inserted by the
        encoder at the beginning of the audio. I.e. this number of leading
        decoded samples must be discarded by the caller to get the original audio
        without leading padding.

    - decoding: unused

    - encoding: Set by The timestamps on the output packets are
        adjusted by the encoder so that they always refer to the
        first sample of the data actually contained in the packet,
        including any added padding. E.g. if the timebase is
        1/samplerate and the timestamp of the first input sample is
        0, the timestamp of the first output packet will be
        -initial_padding.
    ***********************************************************/
    [CCode (cname="initial_padding")]
    public int initial_padding;

    /***********************************************************
    @brief Framerate

    - decoding: For codecs that store a framerate value in the compressed
        bitstream, the decoder may export it here. { 0, 1} when
        unknown.

    - encoding: May be used to signal the framerate of CFR content to an
        encoder.
    ***********************************************************/
    [CCode (cname="framerate")]
    public LibAVUtil.Rational framerate;

    /***********************************************************
    @brief Nominal unaccelerated pixel format, see LibAVUtil.PixelFormat.

    - encoding: unused.
    - decoding: Set by LibAVCodec before calling get_format ()
    ***********************************************************/
    [CCode (cname="sw_pix_fmt")]
    public LibAVUtil.PixelFormat sw_pix_fmt;

    /***********************************************************
    @brief Timebase in which pkt_dts/pts and Packet.dts/pts are.

    - encoding: unused.
    - decoding: set by user.
    ***********************************************************/
    [CCode (cname="pkt_timebase")]
    public LibAVUtil.Rational pkt_timebase;

    /***********************************************************
    @brief CodecDescriptor

    - encoding: unused.
    - decoding: set by 
    ***********************************************************/
    [CCode (cname="codec_descriptor")]
    public CodecDescriptor codec_descriptor;

#if !FF_API_LOWRES
    /***********************************************************
    @brief Low resolution decoding, 1-> 1/2 size, 2->1/4 size

    - encoding: unused
    - decoding: Set by user.
    ***********************************************************/
    [CCode (cname="lowres")]
    public int lowres;
#endif

    /***********************************************************
    @brief Current statistics for PTS correction.
    ***********************************************************/

    /***********************************************************
    @brief Number of incorrect PTS values so far

    - encoding: unused
    - decoding: maintained and used by LibAVCodec, not intended to be used by user apps
    ***********************************************************/
    [CCode (cname="pts_correction_num_faulty_pts")]
    public int64 pts_correction_num_faulty_pts;

    /***********************************************************
    @brief Number of incorrect DTS values so far

    - encoding: unused
    - decoding: maintained and used by LibAVCodec, not intended to be used by user apps
    ***********************************************************/
    [CCode (cname="pts_correction_num_faulty_dts")]
    public int64 pts_correction_num_faulty_dts;

    /***********************************************************
    @brief PTS of the last frame

    - encoding: unused
    - decoding: maintained and used by LibAVCodec, not intended to be used by user apps
    ***********************************************************/
    [CCode (cname="pts_correction_last_pts")]
    public int64 pts_correction_last_pts;

    /***********************************************************
    @brief DTS of the last frame

    - encoding: unused
    - decoding: maintained and used by LibAVCodec, not intended to be used by user apps
    ***********************************************************/
    [CCode (cname="pts_correction_last_dts")]
    public int64 pts_correction_last_dts;

    /***********************************************************
    @brief Character encoding of the input subtitles file.

    - encoding: unused
    - decoding: set by user
    ***********************************************************/
    [CCode (cname="sub_charenc")]
    public string sub_charenc;

    /***********************************************************
    @brief Subtitles character encoding mode.
    
    @description Formats or codecs might be adjusting this
        setting (if they are doing the conversion themselves,
        for instance).

    - encoding: unused
    - decoding: set by LibAVCodec
    ***********************************************************/
    [CCode (cname="sub_charenc_mode")]
    public SubtitleCharacterEncodingMode sub_charenc_mode;

    /***********************************************************
    @brief Skip processing alpha if supported by codec.

    @note that if the format uses pre-multiplied alpha (common with VP6,
        and recommended due to better video quality/compression)
        the image will look as if alpha-blended onto a black background.
        However for formats that do not use pre-multiplied alpha
        there might be serious artefacts (though e.g. libswscale currently
        assumes pre-multiplied alpha anyway).

    - encoding: unused
    - decoding: set by user
    ***********************************************************/
    [CCode (cname="skip_alpha")]
    public int skip_alpha;

    /***********************************************************
    @brief Number of samples to skip after a discontinuity

    - encoding: set by LibAVCodec
    - decoding: unused
    ***********************************************************/
    [CCode (cname="seek_preroll")]
    public int seek_preroll;

#if !FF_API_DEBUG_MV
    /***********************************************************
    @brief Debug motion vectors

    - encoding: Set by user.
    - decoding: Set by user.
    ***********************************************************/
    [CCode (cname="debug_mv")]
    public DebugMotionVectors debug_mv;
#endif

    /***********************************************************
    @brief Custom intra quantization matrix

    - encoding: Set by user, can be null.
    - decoding: unused.
    ***********************************************************/
    [CCode (cname="chroma_intra_matrix")]
    public uint16[] chroma_intra_matrix;

    /***********************************************************
    @brief Dump format separator. Can be ", " or "\n      " or anything else

    - encoding: Set by user.
    - decoding: Set by user.
    ***********************************************************/
    [CCode (cname="dump_separator")]
    public uint8[] dump_separator;

    /***********************************************************
    @brief ',' separated list of allowed decoders. If null then all are allowed

    - encoding: unused
    - decoding: set by user
    ***********************************************************/
    [CCode (cname="codec_whitelist")]
    public string codec_whitelist;

    /***********************************************************
    @brief Properties of the stream that gets decoded

    - encoding: unused
    - decoding: set by LibAVCodec
    ***********************************************************/
    [CCode (cname="properties")]
    public CodecPropertyFlags1 properties;

    /***********************************************************
    @brief Additional data associated with the entire coded stream.

    - encoding: may be set by LibAVCodec after avcodec_open2 ().
    - decoding: unused
    ***********************************************************/
    [CCode (cname="coded_side_data")]
    public PacketSideData[] coded_side_data;
    [CCode (cname="nb_coded_side_data")]
    public int nb_coded_side_data;

    /***********************************************************
    @description A reference to the LibAVUtil.HardwareFrameContext describing the input (for encoding)
        or output (decoding) frames. The reference is set by the caller and
        afterwards owned (and freed) by LibAVCodec - it should never be read by
        the caller after being set.

    - encoding: For hardware encoders configured to use a hwaccel pixel
        format, this field should be set by the caller to a reference
        to the LibAVUtil.HardwareFrameContext describing input frames.
        LibAVUtil.HardwareFrameContext.format must be equal to
        CodecContext.pixel_format.

        This field should be set before avcodec_open2 () is called.

    - decoding: This field should be set by the caller from the get_format ()
        callback. The previous reference (if any) will always be
        unreffed by LibAVCodec before the get_format () call.

        If the default get_buffer2 () is used with a hwaccel pixel
        format, then this LibAVUtil.HardwareFrameContext will be used for
        allocating the frame buffers.
    ***********************************************************/
    [CCode (cname="hw_frames_ctx")]
    public LibAVUtil.BufferRef hw_frames_ctx;

    /***********************************************************
    @brief Control the form of Subtitle.rects[N]->ass

    - encoding: unused
    - decoding: set by user
    ***********************************************************/
    [CCode (cname="sub_text_format")]
    public SubtitleTextFormatAssignment sub_text_format;

    /***********************************************************
    @description Audio only. The amount of padding (in samples) appended by the encoder to
        the end of the audio. I.e. this number of decoded samples must be
        discarded by the caller from the end of the stream to get the original
        audio without any trailing padding.

    - encoding: unused
    - decoding: unused
    ***********************************************************/
    [CCode (cname="trailing_padding")]
    public int trailing_padding;

    /***********************************************************
    @brief The number of pixels per image to maximally accept.

    - encoding: set by user
    - decoding: set by user
    ***********************************************************/
    [CCode (cname="max_pixels")]
    public int64 max_pixels;

    /***********************************************************
    @description A reference to the LibAVUtil.HardwareDeviceContext describing the device which will
        be used by a hardware encoder/decoder. The reference is set by the
        caller and afterwards owned (and freed) by 

        This should be used if either the codec device does not require
        hardware frames or any that are used are to be allocated internally by
         If the user wishes to supply any of the frames used as
        encoder input or decoder output then hw_frames_ctx should be used
        instead. When hw_frames_ctx is set in get_format () for a decoder, this
        field will be ignored while decoding the associated stream segment, but
        may again be used on a following one after another get_format () call.

        For both encoders and decoders this field should be set before
        avcodec_open2 () is called and must not be written to thereafter.

        Note that some decoders may require this field to be set initially in
        order to support hw_frames_ctx at all - in that case, all frames
        contexts used must be created on the same device.
    ***********************************************************/
    [CCode (cname="hw_device_ctx")]
    public LibAVUtil.BufferRef hw_device_ctx;

    /***********************************************************
    @brief Bit set of HardwareAccelerationFlags, which affect
        hardware accelerated decoding (if active).

    - encoding: unused
    - decoding: Set by user (either before avcodec_open2 (), or in the
        CodecContext.get_format callback)
    ***********************************************************/
    [CCode (cname="hwaccel_flags")]
    public HardwareAccelerationFlags hwaccel_flags;

    /***********************************************************
    @description Video decoding only. Certain video codecs support cropping, meaning that
        only a sub-rectangle of the decoded frame is intended for display. This
        option controls how cropping is handled by 

        When set to 1 (the default), LibAVCodec will apply cropping internally.
        I.e. it will modify the output frame width/height fields and offset the
        data pointers (only by as much as possible while preserving alignment, or
        by the full amount if the AV_CODEC_FLAG_UNALIGNED flag is set) so that
        the frames output by the decoder refer only to the cropped area. The
        crop_* fields of the output frames will be zero.

        When set to 0, the width/height fields of the output frames will be set
        to the coded dimensions and the crop_* fields will describe the cropping
        rectangle. Applying the cropping is left to the caller.

    @warning When hardware acceleration with opaque output frames is used,
        LibAVCodec is unable to apply cropping from the top/left border.

    @note when this option is set to zero, the width/height fields of the
        CodecContext and output AVFrames have different meanings. The codec
        context fields store display dimensions (with the coded dimensions in
        coded_width/height), while the frame fields store the coded dimensions
        (with the display dimensions being determined by the crop_* fields).
    ***********************************************************/
    [CCode (cname="apply_cropping")]
    public int apply_cropping;

    /***********************************************************
    @description Video decoding only. Sets the number of extra hardware frames which
        the decoder will allocate for use by the caller. This must be set
        before avcodec_open2 () is called.

        Some hardware decoders require all frames that they will use for
        output to be defined in advance before decoding starts. For such
        decoders, the hardware frame pool must therefore be of a fixed size.
        The extra frames set here are on top of any number that the decoder
        needs internally in order to operate normally (for example, frames
        used as reference pictures).
    ***********************************************************/
    [CCode (cname="extra_hw_frames")]
    public int extra_hw_frames;

    /***********************************************************
    @brief The percentage of damaged samples to discard a frame.

    - encoding: unused
    - decoding: set by user
    ***********************************************************/
    [CCode (cname="discard_damaged_percentage")]
    public int discard_damaged_percentage;

    /***********************************************************
    @description Allocate an CodecContext and set its fields to default values. The
        resulting struct should be freed with avcodec_free_context ().

    @param codec if non-null, allocate private data and initialize defaults
        for the given codec. It is illegal to then call avcodec_open2 ()
        with a different codec.
        If null, then the codec-specific defaults won't be initialized,
        which may result in suboptimal default settings (this is
        important mainly for encoders, e.g. libx264).

    @return An CodecContext filled with default values or null on failure.
    ***********************************************************/
    [CCode (cname="avcodec_alloc_context3", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public CodecContext avcodec_alloc_context3 (
        Codec codec
    );

    /***********************************************************
    @description Free the codec context and everything associated with it and write null to
        the provided pointer.
    ***********************************************************/
    [CCode (cname="avcodec_free_context", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public void avcodec_free_context (
        CodecContext codec_context
    );

    /***********************************************************
    @description Initialize the CodecContext to use the given Codec. Prior to using this
        function the context has to be allocated with avcodec_alloc_context3 ().

        The functions avcodec_find_decoder_by_name (), avcodec_find_encoder_by_name (),
        avcodec_find_decoder () and avcodec_find_encoder () provide an easy way for
        retrieving a codec.

    @warning This function is not thread safe!

    @note Always call this function before using decoding routines (such as
    @link avcodec_receive_frame ()).

    @code
        avcodec_register_all ();
        av_dict_set (&opts, "b", "2.5M", 0);
        codec = avcodec_find_decoder (AV_CODEC_ID_H264);
        if (codec == null)
            exit (1);

        context = avcodec_alloc_context3 (codec);

        if (avcodec_open2 (context, codec, opts) < 0)
            exit (1);
    @endcode

    @param codec_context The context to initialize.
    @param codec The codec to open this context for. If a non-null codec has been
        previously passed to avcodec_alloc_context3 () or
        for this context, then this parameter MUST be either null or
        equal to the previously passed codec.
    @param options A dictionary filled with CodecContext and codec-private options.
        On return this object will be filled with options that were not found.

    @return zero on success, a negative value on error
    @see @link avcodec_alloc_context3 (), avcodec_find_decoder (), avcodec_find_encoder (),
        av_dict_set (), av_opt_find ().
    ***********************************************************/
    [CCode (cname="avcodec_open2", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public int avcodec_open2 (
        CodecContext codec_context,
        Codec codec,
        out LibAVUtil.Dictionary options
    );

    /***********************************************************
    @description Close a given CodecContext and free all the data associated with it
        (but not the CodecContext itself).

        Calling this function on an CodecContext that hasn't been opened will free
        the codec-specific data allocated in avcodec_alloc_context3 () with a non-null
        codec. Subsequent calls will do nothing.

    @note Do not use this function. Use avcodec_free_context () to destroy a
        codec context (either open or closed). Opening and closing a codec context
        multiple times is not supported anymore -- use multiple codec contexts
        instead.
    ***********************************************************/
    //  [CCode (cname="avcodec_close", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    //  public int avcodec_close (
    //      CodecContext codec_context
    //  );

    /***********************************************************
    @description The default callback for CodecContext.get_buffer2 (). It is made public so
        it can be called by custom get_buffer2 () implementations for decoders without
        AV_CODEC_CAP_DR1 set.
    ***********************************************************/
    [CCode (cname="avcodec_default_get_buffer2", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public int avcodec_default_get_buffer2 (
        CodecContext codec_context,
        LibAVUtil.Frame frame,
        int flags
    );

    /***********************************************************
    @description Modify width and height values so that they will result in a memory
        buffer that is acceptable for the codec if you do not use any horizontal
        padding.

        May only be used if a codec with AV_CODEC_CAP_DR1 has been opened.
    ***********************************************************/
    [CCode (cname="avcodec_align_dimensions", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public void avcodec_align_dimensions (
        CodecContext codec_context,
        int width,
        int height
    );

    /***********************************************************
    @description Modify width and height values so that they will result in a memory
        buffer that is acceptable for the codec if you also ensure that all
        line sizes are a multiple of the respective linesize_align[i].

        May only be used if a codec with AV_CODEC_CAP_DR1 has been opened.
    ***********************************************************/
    [CCode (cname="avcodec_align_dimensions2", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public void avcodec_align_dimensions2 (
        CodecContext codec_context,
        int width,
        int height,
        int linesize_align[AV_NUM_DATA_POINTERS]
    );

    [CCode (cname="avcodec_encode_subtitle", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public int avcodec_encode_subtitle (
        CodecContext codec_context,
        uint8[] buf,
        int buf_size,
        Subtitle sub
    );

    /***********************************************************
    @brief Decode a subtitle message.

    @description Return a negative value on error, otherwise return the number of bytes used.
        If no subtitle could be decompressed, got_sub_ptr is zero.
        Otherwise, the subtitle is stored in sub.
        Note that AV_CODEC_CAP_DR1 is not available for subtitle codecs. This is for
        simplicity, because the performance difference is expect to be negligible
        and reusing a get_buffer written for video codecs would probably perform badly
        due to a potentially very different allocation pattern.

        Some decoders (those marked with AV_CODEC_CAP_DELAY) have a delay between input
        and output. This means that for some packets they will not immediately
        produce decoded output and need to be flushed at the end of decoding to get
        all the decoded data. Flushing is done by calling this function with packets
        with avpkt->data set to null and avpkt->size set to 0 until it stops
        returning subtitles. It is safe to flush even those decoders that are not
        marked with AV_CODEC_CAP_DELAY, then no subtitles will be returned.

    @note The CodecContext MUST have been opened with @link avcodec_open2 ()
        before packets may be fed to the decoder.

    @param codec_context the codec context
    @param[out] sub The Preallocated Subtitle in which the decoded subtitle will be stored,
        must be freed with avsubtitle_free if got_sub_ptr is set.
    @param[in,out] got_sub_ptr Zero if no subtitle could be decompressed, otherwise, it is nonzero.
    @param[in] avpkt The input Packet containing the input buffer.
    ***********************************************************/
    [CCode (cname="avcodec_decode_subtitle2", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public int avcodec_decode_subtitle2 (
        CodecContext codec_context,
        out Subtitle sub,
        out int got_sub_ptr,
        Packet avpkt
    );

    /***********************************************************
    @brief Supply raw packet data as input to a decoder.

    @description Internally, this call will copy relevant CodecContext fields, which can
        influence decoding per-packet, and apply them when the packet is actually
        decoded. (For example CodecContext.skip_frame, which might direct the
        decoder to drop the frame contained by the packet sent with this function.)

    @warning The input buffer, avpkt->data must be AV_INPUT_BUFFER_PADDING_SIZE
        larger than the actual read bytes because some optimized bitstream
        readers read 32 or 64 bits at once and could read over the end.

    @warning Do not mix this API with the legacy API (like avcodec_decode_video2 ())
        on the same CodecContext. It will return unexpected results now
        or in future LibAVCodec versions.

    @note The CodecContext MUST have been opened with @link avcodec_open2 ()
        before packets may be fed to the decoder.

    @param codec_context codec context
    @param[in] avpkt The input Packet. Usually, this will be a single video
        frame, or several complete audio frames.
        Ownership of the packet remains with the caller, and the
        decoder will not write to the packet. The decoder may create
        a reference to the packet data (or copy it if the packet is
        not reference-counted).
        Unlike with older APIs, the packet is always fully consumed,
        and if it contains multiple frames (e.g. some audio codecs),
        will require you to call avcodec_receive_frame () multiple
        times afterwards before you can send a new packet.
        It can be null (or an Packet with data set to null and
        size set to 0); in this case, it is considered a flush
        packet, which signals the end of the stream. Sending the
        first flush packet will return success. Subsequent ones are
        unnecessary and will return AVERROR_EOF. If the decoder
        still has frames buffered, it will return them after sending
        a flush packet.

    @return 0 on success, otherwise negative error code:
        LibAVUtil.ErrorCode (EAGAIN): nput is not accepted in the current state - user
        must read output with avcodec_receive_frame () (once
        all output is read, the packet should be resent, and
        the call will not fail with EAGAIN).
        AVERROR_EOF: the decoder has been flushed, and no new packets can
        be sent to it (also returned if more than 1 flush
        packet is sent)
        LibAVUtil.ErrorCode (EINVAL): codec not opened, it is an encoder, or requires flush
        LibAVUtil.ErrorCode (ENOMEM): failed to add packet to internal queue, or similar
        other errors: legitimate decoding errors
    ***********************************************************/
    [CCode (cname="avcodec_send_packet", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public int avcodec_send_packet (
        CodecContext codec_context,
        Packet avpkt
    );

    /***********************************************************
    @brief Return decoded output data from a decoder.

    @param codec_context codec context
    @param frame This will be set to a reference-counted video or audio
        frame (depending on the decoder type) allocated by the
        decoder. Note that the function will always call
        av_frame_unref (frame) before doing anything else.

    @return
        0: success, a frame was returned
        LibAVUtil.ErrorCode (EAGAIN): output is not available in this state - user must try
            to send new input
        AVERROR_EOF: the decoder has been fully flushed, and there will be
            no more output frames
        LibAVUtil.ErrorCode (EINVAL): codec not opened, or it is an encoder
        AVERROR_INPUT_CHANGED: current decoded frame has changed parameters
            with respect to first decoded frame. Applicable
            when flag AV_CODEC_FLAG_DROPCHANGED is set.
        other negative values: legitimate decoding errors
    ***********************************************************/
    [CCode (cname="avcodec_receive_frame", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public int avcodec_receive_frame (
        CodecContext codec_context,
        LibAVUtil.Frame frame
    );

    /***********************************************************
    @description Supply a raw video or audio frame to the encoder. Use avcodec_receive_packet ()
        to retrieve buffered output packets.

    @param codec_context codec context
    @param[in] frame LibAVUtil.Frame containing the raw audio or video frame to be encoded.
        Ownership of the frame remains with the caller, and the
        encoder will not write to the frame. The encoder may create
        a reference to the frame data (or copy it if the frame is
        not reference-counted).
        It can be null, in which case it is considered a flush
        packet. This signals the end of the stream. If the encoder
        still has packets buffered, it will return them after this
        call. Once flushing mode has been entered, additional flush
        packets are ignored, and sending frames will return
        AVERROR_EOF.

        For audio:
        If AV_CODEC_CAP_VARIABLE_FRAME_SIZE is set, then each frame
        can have any number of samples.
        If it is not set, frame->nb_samples must be equal to
        codec_context->frame_size for all frames except the last.
        The final frame may be smaller than codec_context->frame_size.
    @return 0 on success, otherwise negative error code:
        LibAVUtil.ErrorCode (EAGAIN): input is not accepted in the current state - user
            must read output with avcodec_receive_packet () (once
            all output is read, the packet should be resent, and
            the call will not fail with EAGAIN).
        AVERROR_EOF: the encoder has been flushed, and no new frames can
            be sent to it
        LibAVUtil.ErrorCode (EINVAL): codec not opened, refcounted_frames not set, it is a
            decoder, or requires flush
        LibAVUtil.ErrorCode (ENOMEM): failed to add packet to internal queue, or similar
        other errors: legitimate decoding errors
    ***********************************************************/
    [CCode (cname="avcodec_send_frame", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public int avcodec_send_frame (
        CodecContext codec_context,
        LibAVUtil.Frame frame
    );

    /***********************************************************
    @brief Read encoded data from the encoder.

    @param codec_context codec context
    @param avpkt This will be set to a reference-counted packet allocated by the
        encoder. Note that the function will always call
        av_frame_unref (frame) before doing anything else.
    @return 0 on success, otherwise negative error code:
        LibAVUtil.ErrorCode (EAGAIN): output is not available in the current state - user
            must try to send input
        AVERROR_EOF: the encoder has been fully flushed, and there will be
            no more output packets
        LibAVUtil.ErrorCode (EINVAL): codec not opened, or it is an encoder
            other errors: legitimate decoding errors
    ***********************************************************/
    [CCode (cname="avcodec_receive_packet", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public int avcodec_receive_packet (
        CodecContext codec_context,
        Packet avpkt
    );

    /***********************************************************
    @description Create and return a LibAVUtil.HardwareFrameContext with values adequate for hardware
        decoding. This is meant to get called from the get_format callback, and is
        a helper for preparing a LibAVUtil.HardwareFrameContext for CodecContext.hw_frames_ctx.
        This API is for decoding with certain hardware acceleration modes/APIs only.

        The returned LibAVUtil.HardwareFrameContext is not initialized. The caller must do this
        with av_hwframe_ctx_init ().

        Calling this function is not a requirement, but makes it simpler to avoid
        codec or hardware API specific details when manually allocating frames.

        Alternatively to this, an API user can set CodecContext.hw_device_ctx,
        which sets up CodecContext.hw_frames_ctx fully automatically, and makes
        it unnecessary to call this function or having to care about
        LibAVUtil.HardwareFrameContext initialization at all.

        There are a number of requirements for calling this function:

        - It must be called from get_format with the same codec_context parameter that was
            passed to get_format. Calling it outside of get_format is not allowed, and
            can trigger undefined behavior.
        - The function is not always supported (see description of return values).
            Even if this function returns successfully, hwaccel initialization could
            fail later. (The degree to which implementations check whether the stream
            is actually supported varies. Some do this check only after the user's
            get_format callback returns.)
        - The hw_pix_fmt must be one of the choices suggested by get_format. If the
            user decides to use a LibAVUtil.HardwareFrameContext prepared with this API function,
            the user must return the same hw_pix_fmt from get_format.
        - The device_ref passed to this function must support the given hw_pix_fmt.
        - After calling this API function, it is the user's responsibility to
            initialize the LibAVUtil.HardwareFrameContext (returned by the out_frames_ref parameter),
            and to set CodecContext.hw_frames_ctx to it. If done, this must be done
            before returning from get_format (this is implied by the normal
            CodecContext.hw_frames_ctx API rules).
        - The LibAVUtil.HardwareFrameContext parameters may change every time time get_format is
            called. Also, CodecContext.hw_frames_ctx is reset before get_format. So
            you are inherently required to go through this process again on every
            get_format call.
        - It is perfectly possible to call this function without actually using
            the resulting LibAVUtil.HardwareFrameContext. One use-case might be trying to reuse a
            previously initialized LibAVUtil.HardwareFrameContext, and calling this API function
            only to test whether the required frame parameters have changed.
        - Fields that use dynamically allocated values of any kind must not be set
            by the user unless setting them is explicitly allowed by the documentation.
            If the user sets LibAVUtil.HardwareFrameContext.free and LibAVUtil.HardwareFrameContext.user_opaque,
            the new free callback must call the potentially set previous free callback.
            This API call may set any dynamically allocated fields, including the free
            callback.

        The function will set at least the following fields on LibAVUtil.HardwareFrameContext
        (potentially more, depending on hwaccel API):

        - All fields set by av_hwframe_ctx_alloc ().
        - Set the format field to hw_pix_fmt.
        - Set the sw_format field to the most suited and most versatile format. (An
            implication is that this will prefer generic formats over opaque formats
            with arbitrary restrictions, if possible.)
        - Set the width/height fields to the coded frame size, rounded up to the
            API-specific minimum alignment.
        - Only _if_ the hwaccel requires a pre-allocated pool: set the initial_pool_size
            field to the number of maximum reference surfaces possible with the codec,
            plus 1 surface for the user to work (meaning the user can safely reference
            at most 1 decoded surface at a time), plus additional buffering introduced
            by frame threading. If the hwaccel does not require pre-allocation, the
            field is left to 0, and the decoder will allocate new surfaces on demand
            during decoding.
        - Possibly LibAVUtil.HardwareFrameContext.hwctx fields, depending on the underlying
            hardware API.

        Essentially, out_frames_ref returns the same as av_hwframe_ctx_alloc (), but
        with basic frame parameters set.

        The function is stateless, and does not change the CodecContext or the
        device_ref LibAVUtil.HardwareDeviceContext.

    @param codec_context The context which is currently calling get_format, and which
        implicitly contains all state needed for filling the returned
        LibAVUtil.HardwareFrameContext properly.
    @param device_ref A reference to the LibAVUtil.HardwareDeviceContext describing the device
        which will be used by the hardware decoder.
    @param hw_pix_fmt The hwaccel format you are going to return from get_format.
    @param out_frames_ref On success, set to a reference to an _uninitialized_
        LibAVUtil.HardwareFrameContext, created from the given device_ref.
        Fields will be set to values required for decoding.
        Not changed if an error is returned.
    @return zero on success, a negative value on error. The following error codes
        have special semantics:
        LibAVUtil.ErrorCode (ENOENT): the decoder does not support this functionality. Setup
        is always manual, or it is a decoder which does not
        support setting CodecContext.hw_frames_ctx at all,
        or it is a software format.
        LibAVUtil.ErrorCode (EINVAL): it is known that hardware decoding is not supported for
        this configuration, or the device_ref is not supported
        for the hwaccel referenced by hw_pix_fmt.
    ***********************************************************/
    [CCode (cname="avcodec_get_hw_frames_parameters", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public int avcodec_get_hw_frames_parameters (
        CodecContext codec_context,
        LibAVUtil.BufferRef device_ref,
        LibAVUtil.PixelFormat hw_pix_fmt,
        out LibAVUtil.BufferRef out_frames_ref
    );

    /***********************************************************
    @return a positive value if s is open (i.e. avcodec_open2 () was called on it
        with no corresponding avcodec_close ()), 0 otherwise.
    ***********************************************************/
    [CCode (cname="avcodec_is_open", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public int avcodec_is_open (
        CodecContext codec_context
    );

    [CCode (cname="v", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public void avcodec_string (
        string buf,
        int buf_size,
        CodecContext enc,
        int encode
    );

    [CCode (cname="avcodec_default_get_format", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public LibAVUtil.PixelFormat avcodec_default_get_format (
        CodecContext codec_context,
        LibAVUtil.PixelFormat fmt
    );

    [CCode (cname="avcodec_default_execute", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public int avcodec_default_execute (
        CodecContext codec_context,
        AVCodecDefaultExecuteDelegate func,
        void *arg,
        out int ret,
        int count,
        int size
    );

    [CCode (cname="avcodec_default_execute2", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public int avcodec_default_execute2 (
        CodecContext codec_context,
        AVCodecDefaultExecute2Delegate func,
        void *arg,
        out int ret,
        int count
    );

    /***********************************************************
    @description Reset the internal decoder state / flush internal buffers. Should be called
        e.g. when seeking or when switching to a different stream.

    @note when refcounted frames are not used (i.e. codec_context->refcounted_frames is 0),
        this invalidates the frames previously returned from the decoder. When
        refcounted frames are used, the decoder just releases any references it might
        keep internally, but the caller's reference remains valid.
    ***********************************************************/
    [CCode (cname="avcodec_flush_buffers", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public void avcodec_flush_buffers (
        CodecContext codec_context
    );

    /***********************************************************
    @brief Return audio frame duration.

    @param codec_context codec context
    @param frame_bytes size of the frame, or 0 if unknown
    @return frame duration, in samples, if known. 0 if not able to
        determine.
    ***********************************************************/
    [CCode (cname="av_get_audio_frame_duration", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public int av_get_audio_frame_duration (
        CodecContext codec_context,
        int frame_bytes
    );

}

} // namespace LibAVCodec
