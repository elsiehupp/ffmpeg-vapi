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

/***********************************************************
@file
Scene SAD functions
***********************************************************/

[CCode (cname="ff_scene_sad_fn")]
public delegate void FfSceneSadDelegate (
    uint8[] src1,
    ptrdiff_t stride1,
    uint8[] src2,
    ptrdiff_t stride2,
    ptrdiff_t width,
    ptrdiff_t height,
    uint64[] sum
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/scene_sad.h")]
public void ff_scene_sad_c (
    uint8[] src1,
    ptrdiff_t stride1,
    uint8[] src2,
    ptrdiff_t stride2,
    ptrdiff_t width,
    ptrdiff_t height,
    uint64[] sum
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/scene_sad.h")]
public void ff_scene_sad16_c (
    uint8[] src1,
    ptrdiff_t stride1,
    uint8[] src2,
    ptrdiff_t stride2,
    ptrdiff_t width,
    ptrdiff_t height,
    uint64[] sum
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/scene_sad.h")]
public FfSceneSadDelegate ff_scene_sad_get_fn_x86 (
    int depth
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavfilter/scene_sad.h")]
public FfSceneSadDelegate ff_scene_sad_get_fn (
    int depth
);
