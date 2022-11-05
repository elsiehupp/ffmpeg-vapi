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
misc image utilities

@addtogroup lavu_picture
***********************************************************/

/***********************************************************
@brief Compute the max pixel step for each plane of an image with a
format described by pixdesc.

The pixel step is the distance in bytes between the first byte of
the group of bytes which describe a pixel component and the first
byte of the successive group in the same plane for the same
component.

@param max_pixsteps an array which is filled with the max pixel step
for each plane. Since a plane may contain different pixel
components, the computed max_pixsteps[plane] is relative to the
component in the plane with the max pixel step.
@param max_pixstep_comps an array which is filled with the component
for each plane which has the max pixel step. May be null.
***********************************************************/
[CCode (cname="av_image_fill_max_pixsteps", cheader_filename="ffmpeg/libavutil/imgutils.h")]
public void av_image_fill_max_pixsteps (
    int max_pixsteps[4],
    int max_pixstep_comps[4],
    PixelFormatDescriptor pixdesc
);

/***********************************************************
@brief Compute the size of an image line with format pixel_format and width
width for the plane plane.

@return the computed size in bytes
***********************************************************/
[CCode (cname="av_image_get_linesize", cheader_filename="ffmpeg/libavutil/imgutils.h")]
public int av_image_get_linesize (
    PixelFormat pixel_format,
    int width,
    int plane
);

/***********************************************************
@brief Fill plane linesizes for an image with pixel format pixel_format and
width width.

@param linesizes array to be filled with the linesize for each plane
@return >= 0 in case of success, a negative error code otherwise
***********************************************************/
[CCode (cname="av_image_fill_linesizes", cheader_filename="ffmpeg/libavutil/imgutils.h")]
public int av_image_fill_linesizes (
    int linesizes[4],
    PixelFormat pixel_format,
    int width
);

/***********************************************************
@brief Fill plane data pointers for an image with pixel format pixel_format and
height height.

@param data pointers array to be filled with the pointer for each image plane
@param ptr the pointer to a buffer which will contain the image
@param linesizes the array containing the linesize for each
plane, should be filled by av_image_fill_linesizes ()
@return the size in bytes required for the image buffer, a negative
error code in case of failure
***********************************************************/
[CCode (cname="av_image_fill_pointers", cheader_filename="ffmpeg/libavutil/imgutils.h")]
public int av_image_fill_pointers (
    out uint8 data[4], PixelFormat pixel_format, int height,
    uint8[] ptr, int linesizes[4]
);

/***********************************************************
@brief Allocate an image with size w and h and pixel format pixel_format, and
fill pointers and linesizes accordingly.
The allocated image buffer has to be freed by using
av_freep (&pointers[0]).

@param align the value to use for buffer size alignment
@return the size in bytes required for the image buffer, a negative
error code in case of failure
***********************************************************/
[CCode (cname="av_image_alloc", cheader_filename="ffmpeg/libavutil/imgutils.h")]
public int av_image_alloc (
    out uint8 pointers[4], int linesizes[4],
    int w, int h, PixelFormat pixel_format, int align
);

/***********************************************************
@brief Copy image plane from input_buffer to output_buffer.
That is, copy "height" number of lines of "bytewidth" bytes each.
The first byte of each successive line is separated by *_linesize
bytes.

bytewidth must be contained by both absolute values of output_linesize
and input_linesize, otherwise the function behavior is undefined.

@param output_linesize linesize for the image plane in output_buffer
@param input_linesize linesize for the image plane in input_buffer
***********************************************************/
[CCode (cname="av_image_copy_plane", cheader_filename="ffmpeg/libavutil/imgutils.h")]
public void av_image_copy_plane (
    out uint8[] output_buffer,
    out int output_linesize,
    uint8[] input_buffer,
    int input_linesize,
    int bytewidth,
    int height
);

/***********************************************************
@brief Copy image in input_data to output_data.

@param output_linesizes linesizes for the image in output_data
@param input_linesizes linesizes for the image in input_data
***********************************************************/
[CCode (cname="av_image_copy", cheader_filename="ffmpeg/libavutil/imgutils.h")]
public void av_image_copy (
    out uint8 output_data[4],
    out int output_linesizes[4],
    out uint8 input_data[4],
    int input_linesizes[4],
    PixelFormat pixel_format,
    int width, int height
);

/***********************************************************
@brief Copy image data located in uncacheable (e.g. GPU mapped) memory. Where
available, this function will use special functionality for reading from such
memory, which may result in greatly improved performance compared to plain
av_image_copy ().

The data pointers and the linesizes must be aligned to the maximum required
by the CPU architecture.

@note The linesize parameters have the type size_t here, while they are
    int for av_image_copy ().
@note On x86, the linesizes currently need to be aligned to the cacheline
    size (i.e. 64) to get improved performance.
***********************************************************/
[CCode (cname="av_image_copy_uc_from", cheader_filename="ffmpeg/libavutil/imgutils.h")]
public void av_image_copy_uc_from (
    out uint8 output_data[4],
    out size_t output_linesizes[4],
    out uint8 input_data[4],
    size_t input_linesizes[4],
    PixelFormat pixel_format,
    int width, int height
);

/***********************************************************
@brief Setup the data pointers and linesizes based on the specified image
parameters and the provided array.

The fields of the given image are filled in by using the input_buffer
address which points to the image data buffer. Depending on the
specified pixel format, one or multiple image data pointers and
line sizes will be set. If a planar format is specified, several
pointers will be set pointing to the different picture planes and
the line sizes of the different planes will be stored in the
lines_sizes array. Call with input_buffer == null to get the required
size for the input_buffer buffer.

To allocate the buffer and fill in the output_data and output_linesize in
one call, use av_image_alloc ().

@param output_data data pointers to be filled in
@param output_linesize linesizes for the image in output_data to be filled in
@param input_buffer buffer which will contain or contains the actual image data, can be null
@param pixel_format the pixel format of the image
@param width the width of the image in pixels
@param height the height of the image in pixels
@param align the value used in input_buffer for linesize alignment
@return the size in bytes required for input_buffer, a negative error code
in case of failure
***********************************************************/
[CCode (cname="av_image_fill_arrays", cheader_filename="ffmpeg/libavutil/imgutils.h")]
public int av_image_fill_arrays (
    out uint8 *output_data[4],
    out int output_linesize[4],
    uint8[] input_buffer,
    PixelFormat pixel_format,
    int width,
    int height,
    int align
);

/***********************************************************
@brief Return the size in bytes of the amount of data required to store an
image with the given parameters.

@param pixel_format the pixel format of the image
@param width the width of the image in pixels
@param height the height of the image in pixels
@param align the assumed linesize alignment
@return the buffer size in bytes, a negative error code in case of failure
***********************************************************/
[CCode (cname="av_image_get_buffer_size", cheader_filename="ffmpeg/libavutil/imgutils.h")]
public int av_image_get_buffer_size (
    PixelFormat pixel_format,
    int width,
    int height,
    int align
);

/***********************************************************
@brief Copy image data from an image into a buffer.

av_image_get_buffer_size () can be used to compute the required size
for the buffer to fill.

@param output_buffer a buffer into which picture data will be copied
@param output_size the size in bytes of output_buffer
@param input_data pointers containing the source image data
@param input_linesize linesizes for the image in input_data
@param pixel_format the pixel format of the source image
@param width the width of the source image in pixels
@param height the height of the source image in pixels
@param align the assumed linesize alignment for output_buffer
@return the number of bytes written to output_buffer, or a negative value
(error code) on error
***********************************************************/
[CCode (cname="av_image_copy_to_buffer", cheader_filename="ffmpeg/libavutil/imgutils.h")]
public int av_image_copy_to_buffer (
    out uint8[] output_buffer,
    out int output_size,
    uint8 input_data[4],
    int input_linesize[4],
    PixelFormat pixel_format,
    int width,
    int height,
    int align
);

/***********************************************************
@brief Check if the given dimension of an image is valid, meaning that all
bytes of the image can be addressed with a signed int.

@param w the width of the picture
@param h the height of the picture
@param log_offset the offset to sum to the log level for logging with log_ctx
@param log_ctx the parent logging context, it may be null
@return >= 0 if valid, a negative error code otherwise
***********************************************************/
[CCode (cname="av_image_check_size", cheader_filename="ffmpeg/libavutil/imgutils.h")]
public int av_image_check_size (
    uint w,
    uint h,
    int log_offset,
    void *log_ctx
);

/***********************************************************
@brief Check if the given dimension of an image is valid, meaning that all
bytes of a plane of an image with the specified pixel_format can be addressed
with a signed int.

@param w the width of the picture
@param h the height of the picture
@param max_pixels the maximum number of pixels the user wants to accept
@param pixel_format the pixel format, can be PixelFormat.NONE if unknown.
@param log_offset the offset to sum to the log level for logging with log_ctx
@param log_ctx the parent logging context, it may be null
@return >= 0 if valid, a negative error code otherwise
***********************************************************/
[CCode (cname="av_image_check_size2", cheader_filename="ffmpeg/libavutil/imgutils.h")]
public int av_image_check_size2 (
    uint w,
    uint h,
    int64 max_pixels,
    PixelFormat pixel_format,
    int log_offset,
    void *log_ctx
);

/***********************************************************
@brief Check if the given sample aspect ratio of an image is valid.

It is considered invalid if the denominator is 0 or if applying the ratio
to the image size would make the smaller dimension less than 1. If the
sar numerator is 0, it is considered unknown and will return as valid.

@param w width of the image
@param h height of the image
@param sar sample aspect ratio of the image
@return 0 if valid, a negative LibAVUtil.ErrorCode code otherwise
***********************************************************/
[CCode (cname="av_image_check_sar", cheader_filename="ffmpeg/libavutil/imgutils.h")]
public int av_image_check_sar (
    uint w,
    uint h,
    Rational sar
);

/***********************************************************
@brief Overwrite the image data with black. This is suitable for filling a
sub-rectangle of an image, meaning the padding between the right most pixel
and the left most pixel on the next line will not be overwritten. For some
formats, the image size might be rounded up due to inherent alignment.

If the pixel format has alpha, the alpha is cleared to opaque.

This can return an error if the pixel format is not supported. Normally, all
non-hwaccel pixel formats should be supported.

Passing null for output_data is allowed. Then the function returns whether the
operation would have succeeded. (It can return an error if the pixel_format is
not supported.)

@param output_data data pointers to destination image
@param output_linesize linesizes for the destination image
@param pixel_format the pixel format of the image
@param range the color range of the image (important for colorspaces such as YUV)
@param width the width of the image in pixels
@param height the height of the image in pixels
@return 0 if the image data was cleared, a negative LibAVUtil.ErrorCode code otherwise
***********************************************************/
[CCode (cname="av_image_fill_black", cheader_filename="ffmpeg/libavutil/imgutils.h")]
public int av_image_fill_black (
    out uint8 output_data[4],
    out size_t output_linesize[4],
    PixelFormat pixel_format,
    ColorRange range,
    int width,
    int height
);

} // namespace LibAVUtil
