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
namespace LibAVFilter {

/***********************************************************
The intended target is OpenCL 1.2, so disable warnings for APIs
deprecated after that.  This primarily applies to clCreateCommandQueue (),
we can't use the replacement clCreateCommandQueueWithProperties () because
it was introduced in OpenCL 2.0.
***********************************************************/
//  public define CL_USE_DEPRECATED_OPENCL_1_2_APIS

[CCode (cname="struct OpenCLFilterContext",cheader_filename="subprojects/ffmpeg/libavfilter/opencl.h")]
[Compact]
public class OpenCLFilterContext {
    [CCode (cname="class")]
    public LibAVUtil.Log.Class av_class;

    public LibAVUtil.BufferRef? device_ref;
    [CCode (cname="")]

    [CCode (cname="")]
    public AVHWDeviceContext? device;

    [CCode (cname="")]
    public AVOpenCLDeviceContext? hwctx;

    [CCode (cname="")]
    public cl_program program;

    [CCode (cname="")]
    public LibAVUtil.PixelFormat output_format;

    [CCode (cname="")]
    public int output_width;

    [CCode (cname="")]
    public int output_height;
}


/***********************************************************
set argument to specific Kernel.
This macro relies on usage of local label "fail" and variables:
avctx, cle and err.
***********************************************************/
//  [CCode (cname="CL_SET_KERNEL_ARG",cheader_filename="subprojects/ffmpeg/libavfilter/opencl.h")]
//  public define CL_SET_KERNEL_ARG (
//      void *kernel,
//      void *arg_num,
//      void *type,
//      void *arg
//  );
//  {
//      cle = clSetKernelArg (kernel, arg_num, sizeof (type), arg);
//      if (cle != CL_SUCCESS) {
//          av_log (avctx, LibAVUtil.Log.Level.ERROR, "Failed to set kernel "
//                 "argument %d: error %d.\n", arg_num, cle);
//          err = AVERROR (EIO);
//          goto fail;
//      }
//  }

/***********************************************************
A helper macro to handle OpenCL errors. It will assign errcode to
variable err, log error msg, and jump to fail label on error.
***********************************************************/
//  [CCode (cname="CL_FAIL_ON_ERROR",cheader_filename="subprojects/ffmpeg/libavfilter/opencl.h")]
//  public define CL_FAIL_ON_ERROR (
//      void *errcode,
//      ...
//  );
//  {
//      if (cle != CL_SUCCESS) {
//          av_log (avctx, LibAVUtil.Log.Level.ERROR, __VA_ARGS__);
//          err = errcode;
//          goto fail;
//      }
//  }

/***********************************************************
release an OpenCL Kernel
***********************************************************/
//  [CCode (cname="CL_RELEASE_KERNEL",cheader_filename="subprojects/ffmpeg/libavfilter/opencl.h")]
//  public define CL_RELEASE_KERNEL (
//      void *k
//  );
//  {
//      if (k) {
//          cle = clReleaseKernel (k);
//          if (cle != CL_SUCCESS)
//              av_log (avctx, LibAVUtil.Log.Level.ERROR, "Failed to release "
//                     "OpenCL kernel: %d.\n", cle);
//      }
//  }

/***********************************************************
release an OpenCL Memory Object
***********************************************************/
//  [CCode (cname="CL_RELEASE_MEMORY",cheader_filename="subprojects/ffmpeg/libavfilter/opencl.h")]
//  public define CL_RELEASE_MEMORY (
//      void *m
//  );
//  {
//      if (m) {
//          cle = clReleaseMemObject (m);
//          if (cle != CL_SUCCESS)
//              av_log (avctx, LibAVUtil.Log.Level.ERROR, "Failed to release "
//                     "OpenCL memory: %d.\n", cle);
//      }
//  }

/***********************************************************
release an OpenCL Command Queue
***********************************************************/
//  [CCode (cname="CL_RELEASE_QUEUE",cheader_filename="subprojects/ffmpeg/libavfilter/opencl.h")]
//  public define CL_RELEASE_QUEUE (
//      void *q
//  );
//  {
//      if (q) {
//          cle = clReleaseCommandQueue (q);
//          if (cle != CL_SUCCESS)
//              av_log (avctx, LibAVUtil.Log.Level.ERROR, "Failed to release "
//                     "OpenCL command queue: %d.\n", cle);
//      }
//  }

/***********************************************************
Return that all inputs and outputs support only LibAVUtil.PixelFormat.OPENCL.
***********************************************************/
[CCode (cname="ff_opencl_filter_query_formats",cheader_filename="subprojects/ffmpeg/libavfilter/opencl.h")]
public int ff_opencl_filter_query_formats (
    LibAVFilter.FilterContext? avctx
);

/***********************************************************
Check that the input link contains a suitable hardware frames
context and extract the device from it.
***********************************************************/
[CCode (cname="ff_opencl_filter_config_input",cheader_filename="subprojects/ffmpeg/libavfilter/opencl.h")]
public int ff_opencl_filter_config_input (
    LibAVFilter.FilterLink? inlink
);

/***********************************************************
Create a suitable hardware frames context for the output.
***********************************************************/
[CCode (cname="ff_opencl_filter_config_output",cheader_filename="subprojects/ffmpeg/libavfilter/opencl.h")]
public int ff_opencl_filter_config_output (
    LibAVFilter.FilterLink? outlink
);

/***********************************************************
Initialise an OpenCL filter context.
***********************************************************/
[CCode (cname="ff_opencl_filter_init",cheader_filename="subprojects/ffmpeg/libavfilter/opencl.h")]
public int ff_opencl_filter_init (
    LibAVFilter.FilterContext? avctx
);

/***********************************************************
Uninitialise an OpenCL filter context.
***********************************************************/
[CCode (cname="ff_opencl_filter_uninit",cheader_filename="subprojects/ffmpeg/libavfilter/opencl.h")]
public void ff_opencl_filter_uninit (
    LibAVFilter.FilterContext? avctx
);

/***********************************************************
Load a new OpenCL program from strings in memory.

Creates a new program and compiles it for the current device.
Will log any build errors if compilation fails.
***********************************************************/
[CCode (cname="ff_opencl_filter_load_program",cheader_filename="subprojects/ffmpeg/libavfilter/opencl.h")]
public int ff_opencl_filter_load_program (
    LibAVFilter.FilterContext? avctx,
    string? program_source_array,
    int nb_strings
);

/***********************************************************
Load a new OpenCL program from a file.

Same as ff_opencl_filter_load_program (), but from a file.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/opencl.h")]
public int ff_opencl_filter_load_program_from_file (
    LibAVFilter.FilterContext? avctx,
    string filename
);

/***********************************************************
Find the work size needed needed for a given plane of an image.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/opencl.h")]
public int ff_opencl_filter_work_size_from_image (
    LibAVFilter.FilterContext? avctx,
    size_t? work_size,
    AVFrame frame,
    int plane,
    int block_alignment
);

/***********************************************************
Print a 3x3 matrix into a buffer as __constant array, which could
be included in an OpenCL program.
***********************************************************/
[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/opencl.h")]
public void ff_opencl_print_const_matrix_3x3 (
    AVBPrint? buf,
    string name_str,
    double mat[3][3]
);

} // namespace LibAVFilter
