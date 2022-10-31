/***********************************************************
@brief Pixel format descriptor
@copyright 2009 Michael Niedermayer <michaelni@gmx.at>

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

namespace LibAVUtil {

/***********************************************************
@brief Descriptor that unambiguously describes how the bits of a pixel are
stored in the up to 4 data planes of an image. It also stores the
subsampling factors and number of components.

@note This is separate of the colorspace (RGB, YCbCr, YPbPr, JPEG-style YUV
    and all the YUV variants) PixelFormatDescriptor just stores how values
    are stored not what these values represent.
***********************************************************/
[CCode (cname="struct AVPixFmtDescriptor", cheader_filename="ffmpeg/libavutil/pixdesc.h")]
public struct PixelFormatDescriptor {
    [CCode (cname="name")]
    public string name;

    /***********************************************************
    @brief The number of components each pixel has, (1-4)
    ***********************************************************/
    [CCode (cname="nb_components")]
    public uint8 component_count;

    /***********************************************************
    @brief Amount to shift the luma width right to find the chroma width.
    For YV12 this is 1 for example.
    chroma_width = AV_CEIL_RSHIFT (luma_width, log2_chroma_w)
    The note above is needed to ensure rounding up.
    This value only refers to the chroma components.
    ***********************************************************/
    [CCode (cname="log2_chroma_w")]
    public uint8 log2_chroma_w;

    /***********************************************************
    @brief Amount to shift the luma height right to find the chroma height.
    For YV12 this is 1 for example.
    chroma_height= AV_CEIL_RSHIFT (luma_height, log2_chroma_h)
    The note above is needed to ensure rounding up.
    This value only refers to the chroma components.
    ***********************************************************/
    [CCode (cname="log2_chroma_h")]
    public uint8 log2_chroma_h;

    /***********************************************************
    @brief Combination of PixelFormatFlags.
    ***********************************************************/
    [CCode (cname="flags")]
    public PixelFormatFlags flags;

    /***********************************************************
    @brief Parameters that describe how pixels are packed.
    If the format has 1 or 2 components, then luma is 0.
    If the format has 3 or 4 components:
      if the RGB flag is set then 0 is red, 1 is green and 2 is blue;
      otherwise 0 is luma, 1 is chroma-U and 2 is chroma-V.

    If present, the Alpha channel is always the last component.
    ***********************************************************/
    [CCode (cname="comp")]
    public ComponentDescriptor comp[4];

    /***********************************************************
    @brief Alternative comma-separated names.
    ***********************************************************/
    [CCode (cname="alias")]
    public string alias;

    /***********************************************************
    @brief Return the number of bits per pixel used by the pixel format
    described by pixdesc. Note that this is not the same as the number
    of bits per sample.

    The returned number of bits refers to the number of bits actually
    used for storing the pixel information, that is padding bits are
    not counted.
    ***********************************************************/
    [CCode (cname="av_get_bits_per_pixel", cheader_filename="ffmpeg/libavutil/pixdesc.h")]
    public int av_get_bits_per_pixel (
        PixelFormatDescriptor pixdesc
    );

    /***********************************************************
    @brief Return the number of bits per pixel for the pixel format
    described by pixdesc, including any padding or unused bits.
    ***********************************************************/
    [CCode (cname="av_get_padded_bits_per_pixel", cheader_filename="ffmpeg/libavutil/pixdesc.h")]
    public int av_get_padded_bits_per_pixel (
        PixelFormatDescriptor pixdesc
    );

    /***********************************************************
    @brief Iterate over all pixel format descriptors known to libavutil.

    @param prev previous descriptor. null to get the first descriptor.

    @return next descriptor or null after the last descriptor
    ***********************************************************/
    [CCode (cname="av_pix_fmt_desc_next", cheader_filename="ffmpeg/libavutil/pixdesc.h")]
    public PixelFormatDescriptor av_pix_fmt_desc_next (
        PixelFormatDescriptor prev
    );

    /***********************************************************
    @return an PixelFormat id described by desc, or PixelFormat.NONE if desc
    is not a valid pointer to a pixel format descriptor.
    ***********************************************************/
    [CCode (cname="av_pix_fmt_desc_get_id", cheader_filename="ffmpeg/libavutil/pixdesc.h")]
    public PixelFormat av_pix_fmt_desc_get_id (
        PixelFormatDescriptor desc
    );

    /***********************************************************
    @brief Read a line from an image, and write the values of the
    pixel format component c to output_buffer.

    @param data the array containing the pointers to the planes of the image
    @param linesize the array containing the linesizes of the image
    @param desc the pixel format descriptor for the image
    @param x the horizontal coordinate of the first pixel to read
    @param y the vertical coordinate of the first pixel to read
    @param w the width of the line to read, that is the number of
    values to write to output_buffer
    @param read_pal_component if not zero and the format is a paletted
    format writes the values corresponding to the palette
    component c in data[1] to output_buffer, rather than the palette indexes in
    data[0]. The behavior is undefined if the format is not paletted.
    @param output_element_size size of elements in output_buffer array (2 or 4 byte)
    ***********************************************************/
    [CCode (cname="av_read_image_line2", cheader_filename="ffmpeg/libavutil/pixdesc.h")]
    public void av_read_image_line2 (
        out void *output_buffer,
        out uint8 data[4],
        int linesize[4],
        PixelFormatDescriptor desc,
        int x,
        int y,
        int c,
        int w,
        int read_pal_component,
        int output_element_size
    );

    [CCode (cname="av_read_image_line", cheader_filename="ffmpeg/libavutil/pixdesc.h")]
    public void av_read_image_line (
        out uint16[] output_buffer,
        out uint8 data[4],
        int linesize[4],
        PixelFormatDescriptor desc,
        int x,
        int y,
        int c,
        int w,
        int read_pal_component
    );

    /***********************************************************
    @brief Write the values from input_buffer to the pixel format component c of an
    image line.

    @param input_buffer array containing the values to write
    @param data the array containing the pointers to the planes of the
    image to write into. It is supposed to be zeroed.
    @param linesize the array containing the linesizes of the image
    @param desc the pixel format descriptor for the image
    @param x the horizontal coordinate of the first pixel to write
    @param y the vertical coordinate of the first pixel to write
    @param w the width of the line to write, that is the number of
    values to write to the image line
    @param input_element_size size of elements in input_buffer array (2 or 4 byte)
    ***********************************************************/
    [CCode (cname="av_write_image_line2", cheader_filename="ffmpeg/libavutil/pixdesc.h")]
    public void av_write_image_line2 (
        void *input_buffer, out uint8 data[4],
        int linesize[4], PixelFormatDescriptor desc,
        int x, int y, int c, int w, int input_element_size
    );

    [CCode (cname="av_write_image_line", cheader_filename="ffmpeg/libavutil/pixdesc.h")]
    public void av_write_image_line (
        uint16[] input_buffer, out uint8 data[4],
        int linesize[4], PixelFormatDescriptor desc,
        int x, int y, int c, int w
    );

}

} // namespace LibAVUtil
