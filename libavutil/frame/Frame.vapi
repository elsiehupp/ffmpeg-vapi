/***********************************************************
@brief This file is part of FFmpeg.

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

namespace LibAVUtil {

/***********************************************************
@file
@ingroup lavu_frame
reference-counted frame API
***********************************************************/

/***********************************************************
@brief This structure describes decoded (raw) audio or video data.

Frame must be allocated using av_frame_alloc (). Note that this only
allocates the Frame itself, the buffers for the data must be managed
through other means (see below).
Frame must be freed with av_frame_free ().

Frame is typically allocated once and then reused multiple times to hold
different data (e.g. a single Frame to hold frames received from a
decoder). In such a case, av_frame_unref () will free any references held by
the frame and reset it to its original clean state before it
is reused again.

The data described by an Frame is usually reference counted through the
LibAVUtil.Buffer API. The underlying buffer references are stored in Frame.buf /
Frame.extended_buf. An Frame is considered to be reference counted if at
least one reference is set, i.e. if Frame.buf[0] != null. In such a case,
every single data plane must be contained in one of the buffers in
Frame.buf or Frame.extended_buf.
There may be a single buffer for all the data, or one separate buffer for
each plane, or anything in between.

sizeof (Frame) is not a part of the public ABI, so new fields may be added
to the end with a minor bump.

Fields can be accessed through LibAVUtil.Options, the name string used, matches the
C structure field name for fields accessible through LibAVUtil.Options. The Class
for Frame can be obtained from avcodec_get_frame_class ()
***********************************************************/
[CCode (cname="struct AVFrame", cheader_filename="ffmpeg/libavutil/frame.h")]
public struct Frame {

    [CCode (cname="AV_NUM_DATA_POINTERS", cheader_filename="ffmpeg/libavutil/frame.h")]
    public const size_t AV_NUM_DATA_POINTERS;

    /***********************************************************
    @brief Pointer to the picture/channel planes.
    This might be different from the first allocated byte

    Some decoders access areas outside 0,0 - width,height, please
    see avcodec_align_dimensions2 (). Some filters and swscale can read
    up to 16 bytes beyond the planes, if these filters are to be used,
    then 16 extra bytes must be allocated.

    NOTE: Except for hwaccel formats, pointers not needed by the format
    MUST be set to null.
    ***********************************************************/
    [CCode (cname="data")]
    public uint8* data[AV_NUM_DATA_POINTERS];

    /***********************************************************
    @brief For video, size in bytes of each picture line.
    For audio, size in bytes of each plane.

    For audio, only linesize[0] may be set. For planar audio, each channel
    plane must be the same size.

    For video the linesizes should be multiples of the CPUs alignment
    preference, this is 16 or 32 for modern desktop CPUs.
    Some code requires such alignment other code can be slower without
    correct alignment, for yet other it makes no difference.

    @note The linesize may be larger than the size of usable data -- there
    may be extra padding present for performance reasons.
    ***********************************************************/
    [CCode (cname="linesize")]
    public int linesize[AV_NUM_DATA_POINTERS];

    /***********************************************************
    @brief Pointers to the data planes/channels.

    For video, this should simply point to data[].

    For planar audio, each channel has a separate data pointer, and
    linesize[0] contains the size of each channel buffer.
    For packed audio, there is just one data pointer, and linesize[0]
    contains the total size of the buffer for all channels.

    @note Both data and extended_data should always be set in a valid frame,
    but for planar audio with more channels that can fit in data,
    extended_data must be used in order to access all channels.
    ***********************************************************/
    [CCode (cname="extended_data")]
    public uint8** extended_data;

    /***********************************************************
    @name Video dimensions
    Video frames only. The coded dimensions (in pixels) of the video frame,
    i.e. the size of the rectangle that contains some well-defined values.

    @note The part of the frame intended for display/presentation is further
    restricted by the @link cropping "Cropping rectangle".
    ***********************************************************/
    [CCode (cname="width")]
    public int width;
    [CCode (cname="height")]
    public int height;

    /***********************************************************
    @brief Number of audio samples (per channel) described by this frame
    ***********************************************************/
    [CCode (cname="nb_samples")]
    public int nb_samples;

    /***********************************************************
    @brief Format of the frame, -1 if unknown or unset
    Values correspond to enum PixelFormat for video frames,
    enum SampleFormat for audio)
    ***********************************************************/
    [CCode (cname="format")]
    public int format;

    /***********************************************************
    @brief 1 -> keyframe, 0-> not
    ***********************************************************/
    [CCode (cname="key_frame")]
    public int key_frame;

    /***********************************************************
    @brief Picture type of the frame.
    ***********************************************************/
    [CCode (cname="pict_type")]
    public PictureType pict_type;

    /***********************************************************
    @brief Sample aspect ratio for the video frame, 0/1 if unknown/unspecified.
    ***********************************************************/
    [CCode (cname="sample_aspect_ratio")]
    public Rational sample_aspect_ratio;

    /***********************************************************
    @brief Presentation timestamp in time_base units (time when frame should be shown to user).
    ***********************************************************/
    [CCode (cname="pts")]
    public int64 pts;

    /***********************************************************
    @brief DTS copied from the LibAVCodec.Packet that triggered returning this frame. (if frame threading isn't used)
    This is also the Presentation time of this Frame calculated from
    only LibAVCodec.Packet.dts values without pts values.
    ***********************************************************/
    [CCode (cname="pkt_dts")]
    public int64 packet_dts;

    /***********************************************************
    @brief Picture number in bitstream order
    ***********************************************************/
    [CCode (cname="coded_picture_number")]
    public int coded_picture_number;

    /***********************************************************
    @brief Picture number in display order
    ***********************************************************/
    [CCode (cname="display_picture_number")]
    public int display_picture_number;

    /***********************************************************
    @brief Quality (between 1 (good) and FF_LAMBDA_MAX (bad))
    ***********************************************************/
    [CCode (cname="quality")]
    public int quality;

    /***********************************************************
    @brief For some private data of the user
    ***********************************************************/
    [CCode (cname="opaque")]
    public void *opaque;

    /***********************************************************
    @brief When decoding, this signals how much the picture must be delayed.
    extra_delay = repeat_pict / (2 * fps)
    ***********************************************************/
    [CCode (cname="repeat_pict")]
    public int repeat_pict;

    /***********************************************************
    @brief The content of the picture is interlaced.
    ***********************************************************/
    [CCode (cname="interlaced_frame")]
    public int interlaced_frame;

    /***********************************************************
    @brief If the content is interlaced, is top field displayed first.
    ***********************************************************/
    [CCode (cname="top_field_first")]
    public int top_field_first;

    /***********************************************************
    @brief Tell user application that palette has changed from previous frame.
    ***********************************************************/
    [CCode (cname="palette_has_changed")]
    public int palette_has_changed;

    /***********************************************************
    @brief Reordered opaque 64 bits (generally an integer or a double precision float
    PTS but can be anything).
    The user sets LibAVCodec.CodecContext.reordered_opaque to represent the input at
    that time,
    the decoder reorders values as needed and sets Frame.reordered_opaque
    to exactly one of the values provided by the user through LibAVCodec.CodecContext.reordered_opaque
    ***********************************************************/
    [CCode (cname="reordered_opaque")]
    public int64 reordered_opaque;

    /***********************************************************
    @brief Sample rate of the audio data.
    ***********************************************************/
    [CCode (cname="sample_rate")]
    public int sample_rate;

    /***********************************************************
    @brief Channel layout of the audio data.
    ***********************************************************/
    [CCode (cname="channel_layout")]
    public uint64 channel_layout;

    /***********************************************************
    @brief LibAVUtil.Buffer references backing the data for this frame. If all elements of
    this array are null, then this frame is not reference counted. This array
    must be filled contiguously -- if buf[i] is non-null then buf[j] must
    also be non-null for all j < i.

    There may be at most one LibAVUtil.Buffer per data plane, so for video this array
    always contains all the references. For planar audio with more than
    AV_NUM_DATA_POINTERS channels, there may be more buffers than can fit in
    this array. Then the extra LibAVUtil.BufferRef pointers are stored in the
    extended_buf array.
    ***********************************************************/
    [CCode (cname="buf")]
    public LibAVUtil.BufferRef buf[AV_NUM_DATA_POINTERS];

    /***********************************************************
    @brief For planar audio which requires more than AV_NUM_DATA_POINTERS
    LibAVUtil.BufferRef pointers, this array will hold all the references which
    cannot fit into Frame.buf.

    Note that this is different from Frame.extended_data, which always
    contains all the pointers. This array only contains the extra pointers,
    which cannot fit into Frame.buf.

    This array is always allocated using av_malloc () by whoever constructs
    the frame. It is freed in av_frame_unref ().
    ***********************************************************/
    [CCode (cname="extended_buf")]
    public LibAVUtil.BufferRef extended_buf;

    /***********************************************************
    @brief Number of elements in extended_buf.
    ***********************************************************/
    [CCode (cname="nb_extended_buf")]
    public int extended_buffer_count;

    [CCode (cname="side_data")]
    public FrameSideData[] side_data;
    [CCode (cname="nb_side_data")]
    public int nb_side_data;

    /***********************************************************
    @brief Frame flags, a combination of @link lavu_frame_flags
    ***********************************************************/
    [CCode (cname="flags")]
    public FrameFlags flags;

    /***********************************************************
    @brief MPEG vs JPEG YUV range.

    - encoding: Set by user
    - decoding: Set by LibAVCodec
    ***********************************************************/
    [CCode (cname="color_range")]
    public ColorRange color_range;

    [CCode (cname="color_primaries")]
    public ColorPrimaries color_primaries;

    [CCode (cname="color_trc")]
    public ColorTransferCharacteristic color_transfer_characteristic;

    /***********************************************************
    @brief YUV colorspace type.

    - encoding: Set by user
    - decoding: Set by LibAVCodec
    ***********************************************************/
    [CCode (cname="colorspace")]
    public ColorSpace colorspace;

    [CCode (cname="chroma_location")]
    public ChromaLocation chroma_location;

    /***********************************************************
    @brief Frame timestamp estimated using various heuristics, in stream time base

    - encoding: unused
    - decoding: set by LibAVCodec, read by user.
    ***********************************************************/
    [CCode (cname="best_effort_timestamp")]
    public int64 best_effort_timestamp;

    /***********************************************************
    @brief Reordered pos from the last LibAVCodec.Packet that has been input into the decoder

    - encoding: unused
    - decoding: Read by user.
    ***********************************************************/
    [CCode (cname="pkt_pos")]
    public int64 packet_position;

    /***********************************************************
    @brief Duration of the corresponding packet, expressed in
    AVStream->time_base units, 0 if unknown.

    - encoding: unused
    - decoding: Read by user.
    ***********************************************************/
    [CCode (cname="pkt_duration")]
    public int64 packet_duration;

    /***********************************************************
    @brief Metadata.

    - encoding: Set by user.
    - decoding: Set by LibAVCodec.
    ***********************************************************/
    [CCode (cname="metadata")]
    public LibAVUtil.Dictionary metadata;

    /***********************************************************
    @brief Decode error flags of the frame, set to a combination of
    DecodeErrorFlags flags if the decoder produced a frame, but there
    were errors during the decoding.

    - encoding: unused
    - decoding: set by LibAVCodec, read by user.
    ***********************************************************/
    [CCode (cname="decode_error_flags")]
    public DecodeErrorFlags decode_error_flags;

    /***********************************************************
    @brief Number of audio channels, only used for audio.

    - encoding: unused
    - decoding: Read by user.
    ***********************************************************/
    [CCode (cname="channels")]
    public int audio_channel_count;

    /***********************************************************
    @brief Size of the corresponding packet containing the compressed
    frame.
    It is set to a negative value if unknown.

    - encoding: unused
    - decoding: set by LibAVCodec, read by user.
    ***********************************************************/
    [CCode (cname="pkt_size")]
    public int packet_size;

    /***********************************************************
    @brief For hwaccel-format frames, this should be a reference to the
    HardwareFrameContext describing the frame.
    ***********************************************************/
    [CCode (cname="hw_frames_ctx")]
    public LibAVUtil.BufferRef hardware_frames_context;

    /***********************************************************
    @brief LibAVUtil.BufferRef for free use by the API user. FFmpeg will never check the
    contents of the buffer ref. FFmpeg calls av_buffer_unref () on it when
    the frame is unreferenced. av_frame_copy_props () calls create a new
    reference with av_buffer_ref () for the target frame's opaque_ref field.

    This is unrelated to the opaque field, although it serves a similar
    purpose.
    ***********************************************************/
    [CCode (cname="opaque_ref")]
    public LibAVUtil.BufferRef opaque_ref;

    /***********************************************************
    @anchor cropping
    @name Cropping
    Video frames only. The number of pixels to discard from the the
    top/bottom/left/right border of the frame to obtain the sub-rectangle of
    the frame intended for presentation.
    ***********************************************************/
    [CCode (cname="crop_top")]
    public size_t crop_top;
    [CCode (cname="crop_bottom")]
    public size_t crop_bottom;
    [CCode (cname="crop_left")]
    public size_t crop_left;
    [CCode (cname="crop_right")]
    public size_t crop_right;

    /***********************************************************
    @brief LibAVUtil.BufferRef for internal use by a single libav* library.
    Must not be used to transfer data between libraries.
    Has to be null when ownership of the frame leaves the respective library.

    Code outside the FFmpeg libs should never check or change the contents of the buffer ref.

    FFmpeg calls av_buffer_unref () on it when the frame is unreferenced.
    av_frame_copy_props () calls create a new reference with av_buffer_ref ()
    for the target frame's private_ref field.
    ***********************************************************/
    //  [CCode (cname="private_ref")]
    //  public LibAVUtil.BufferRef private_ref;

    /***********************************************************
    @brief Get the name of a colorspace.
    @return a static string identifying the colorspace; can be null.
    ***********************************************************/
    [CCode (cname="av_get_colorspace_name", cheader_filename="ffmpeg/libavutil/frame.h")]
    public string av_get_colorspace_name (
        ColorSpace val
    );

    /***********************************************************
    @brief Allocate an Frame and set its fields to default values. The resulting
    struct must be freed using av_frame_free ().

    @return An Frame filled with default values or null on failure.

    @note this only allocates the Frame itself, not the data buffers. Those
    must be allocated through other means, e.g. with av_frame_get_buffer () or
    manually.
    ***********************************************************/
    [CCode (cname="av_frame_alloc", cheader_filename="ffmpeg/libavutil/frame.h")]
    public Frame av_frame_alloc ();

    /***********************************************************
    @brief Free the frame and any dynamically allocated objects in it,
    e.g. extended_data. If the frame is reference counted, it will be
    unreferenced first.

    @param frame frame to be freed. The pointer will be set to null.
    ***********************************************************/
    [CCode (cname="av_frame_free", cheader_filename="ffmpeg/libavutil/frame.h")]
    public void av_frame_free (
        Frame frame
    );

    /***********************************************************
    @brief Set up a new reference to the data described by the source frame.

    Copy frame properties from input_buffer to output_frame and create a new reference for each
    LibAVUtil.BufferRef from input_frame.

    If input_frame is not reference counted, new buffers are allocated and the data is
    copied.

    @warning: output_frame MUST have been either unreferenced with av_frame_unref (output_frame),
        or newly allocated with av_frame_alloc () before calling this
        function, or undefined behavior will occur.

    @return 0 on success, a negative LibAVUtil.ErrorCode on error
    ***********************************************************/
    [CCode (cname="av_frame_ref", cheader_filename="ffmpeg/libavutil/frame.h")]
    public int av_frame_ref (
        Frame output_frame,
        Frame input_frame
    );

    /***********************************************************
    @brief Create a new frame that references the same data as input_frame.

    This is a shortcut for av_frame_alloc ()+av_frame_ref ().

    @return newly created Frame on success, null on error.
    ***********************************************************/
    [CCode (cname="av_frame_clone", cheader_filename="ffmpeg/libavutil/frame.h")]
    public Frame av_frame_clone (
        Frame input_frame
    );

    /***********************************************************
    @brief Unreference all the buffers referenced by frame and reset the frame fields.
    ***********************************************************/
    [CCode (cname="av_frame_unref", cheader_filename="ffmpeg/libavutil/frame.h")]
    public void av_frame_unref (
        Frame frame
    );

    /***********************************************************
    @brief Move everything contained in input_frame to output_frame and reset input_frame.

    @warning: output_frame is not unreferenced, but directly overwritten without reading
        or deallocating its contents. Call av_frame_unref (output_frame) manually
        before calling this function to ensure that no memory is leaked.
    ***********************************************************/
    [CCode (cname="av_frame_move_ref", cheader_filename="ffmpeg/libavutil/frame.h")]
    public void av_frame_move_ref (
        Frame output_frame,
        Frame input_frame
    );

    /***********************************************************
    @brief Allocate new buffer (s) for audio or video data.

    The following fields must be set on frame before calling this function:
    - format (pixel format for video, sample format for audio)
    - width and height for video
    - nb_samples and channel_layout for audio

    This function will fill Frame.data and Frame.buf arrays and, if
    necessary, allocate and fill Frame.extended_data and Frame.extended_buf.
    For planar formats, one buffer will be allocated for each plane.

    @warning: if frame already has been allocated, calling this function will
        leak memory. In addition, undefined behavior can occur in certain
        cases.

    @param frame frame in which to store the new buffers.
    @param align Required buffer size alignment. If equal to 0, alignment will be
        chosen automatically for the current CPU. It is highly
        recommended to pass 0 here unless you know what you are doing.

    @return 0 on success, a negative LibAVUtil.ErrorCode on error.
    ***********************************************************/
    [CCode (cname="av_frame_get_buffer", cheader_filename="ffmpeg/libavutil/frame.h")]
    public int av_frame_get_buffer (
        Frame frame,
        int align
    );

    /***********************************************************
    @brief Check if the frame data is writable.

    @return A positive value if the frame data is writable (which is true if and
    only if each of the underlying buffers has only one reference, namely the one
    stored in this frame). Return 0 otherwise.

    If 1 is returned the answer is valid until av_buffer_ref () is called on any
    of the underlying LibAVUtil.BufferRef(s) (e.g. through av_frame_ref () or directly).

    @see @link av_frame_make_writable (), av_buffer_is_writable ()
    ***********************************************************/
    [CCode (cname="av_frame_is_writable", cheader_filename="ffmpeg/libavutil/frame.h")]
    public int av_frame_is_writable (
        Frame frame
    );

    /***********************************************************
    @brief Ensure that the frame data is writable, avoiding data copy if possible.

    Do nothing if the frame is writable, allocate new buffers and copy the data
    if it is not.

    @return 0 on success, a negative LibAVUtil.ErrorCode on error.

    @see @link av_frame_is_writable (), av_buffer_is_writable (),
    av_buffer_make_writable ()
    ***********************************************************/
    [CCode (cname="av_frame_make_writable", cheader_filename="ffmpeg/libavutil/frame.h")]
    public int av_frame_make_writable (
        Frame frame
    );

    /***********************************************************
    @brief Copy the frame data from input_frame to output_frame.

    This function does not allocate anything, output_frame must be already initialized and
    allocated with the same parameters as input_frame.

    This function only copies the frame data (i.e. the contents of the data /
    extended data arrays), not any other properties.

    @return >= 0 on success, a negative LibAVUtil.ErrorCode on error.
    ***********************************************************/
    [CCode (cname="av_frame_copy", cheader_filename="ffmpeg/libavutil/frame.h")]
    public int av_frame_copy (
        Frame output_frame,
        Frame input_frame
    );

    /***********************************************************
    @brief Copy only "metadata" fields from input_frame to output_frame.

    Metadata for the purpose of this function are those fields that do not affect
    the data layout in the buffers. E.g. pts, sample rate (for audio) or sample
    aspect ratio (for video), but not width/height or channel layout.
    Side data is also copied.
    ***********************************************************/
    [CCode (cname="av_frame_copy_props", cheader_filename="ffmpeg/libavutil/frame.h")]
    public int av_frame_copy_props (
        Frame output_frame,
        Frame input_frame
    );

    /***********************************************************
    @brief Get the buffer reference a given data plane is stored in.

    @param plane index of the data plane of interest in frame->extended_data.

    @return the buffer reference that contains the plane or null if the input
    frame is not valid.
    ***********************************************************/
    [CCode (cname="av_frame_get_plane_buffer", cheader_filename="ffmpeg/libavutil/frame.h")]
    public LibAVUtil.BufferRef av_frame_get_plane_buffer (
        Frame frame,
        int plane
    );

    /***********************************************************
    @brief Add a new side data to a frame.

    @param frame a frame to which the side data should be added
    @param type type of the added side data
    @param size size of the side data

    @return newly added side data on success, null on error
    ***********************************************************/
    [CCode (cname="av_frame_new_side_data", cheader_filename="ffmpeg/libavutil/frame.h")]
    public FrameSideData av_frame_new_side_data (
        Frame frame,
        FrameSideDataType type,
        int size
    );

    /***********************************************************
    @brief Add a new side data to a frame from an existing LibAVUtil.BufferRef

    @param frame a frame to which the side data should be added
    @param type the type of the added side data
    @param buf an LibAVUtil.BufferRef to add as side data. The ownership of
        the reference is transferred to the frame.

    @return newly added side data on success, null on error. On failure
        the frame is unchanged and the LibAVUtil.BufferRef remains owned by
        the caller.
    ***********************************************************/
    [CCode (cname="av_frame_new_side_data_from_buf", cheader_filename="ffmpeg/libavutil/frame.h")]
    public FrameSideData av_frame_new_side_data_from_buf (
        Frame frame,
        FrameSideDataType type,
        LibAVUtil.BufferRef buf
    );

    /***********************************************************
    @return a pointer to the side data of a given type on success, null if there
    is no side data with such type in this frame.
    ***********************************************************/
    [CCode (cname="av_frame_get_side_data", cheader_filename="ffmpeg/libavutil/frame.h")]
    public FrameSideData av_frame_get_side_data (
        Frame frame,
        FrameSideDataType type
    );

    /***********************************************************
    @brief If side data of the supplied type exists in the frame, free it and remove it
    from the frame.
    ***********************************************************/
    [CCode (cname="av_frame_remove_side_data", cheader_filename="ffmpeg/libavutil/frame.h")]
    public void av_frame_remove_side_data (
        Frame frame,
        FrameSideDataType type
    );

    /***********************************************************
    @brief Crop the given video Frame according to its crop_left/crop_top/crop_right/
    crop_bottom fields. If cropping is successful, the function will adjust the
    data pointers and the width/height fields, and set the crop fields to 0.

    In all cases, the cropping boundaries will be rounded to the inherent
    alignment of the pixel format. In some cases, such as for opaque hwaccel
    formats, the left/top cropping is ignored. The crop fields are set to 0 even
    if the cropping was rounded or ignored.

    @param frame the frame which should be cropped
    @param flags Some combination of FrameCropFlags flags, or 0.

    @return >= 0 on success, a negative LibAVUtil.ErrorCode on error. If the cropping fields
    were invalid, LibAVUtil.ErrorCode (ERANGE) is returned, and nothing is changed.
    ***********************************************************/
    [CCode (cname="av_frame_apply_cropping", cheader_filename="ffmpeg/libavutil/frame.h")]
    public int av_frame_apply_cropping (
        Frame frame,
        FrameCropFlags flags
    );

}

} // namespace LibAVUtil
