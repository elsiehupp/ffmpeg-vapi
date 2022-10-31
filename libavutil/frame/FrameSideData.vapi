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
@brief Structure to hold side data for an Frame.

sizeof (FrameSideData) is not a part of the public ABI,
so new fields may be added to the end with a minor bump.
***********************************************************/
[CCode (cname="struct AVFrameSideData", cheader_filename="libavcodec/frame.h")]
public struct FrameSideData {
    [CCode (cname="type")]
    public FrameSideDataType type;
    [CCode (cname="data")]
    public uint8[] data;
    [CCode (cname="size")]
    public int size;
    [CCode (cname="metadata")]
    public LibAVUtil.Dictionary[] metadata;
    [CCode (cname="buf")]
    public LibAVUtil.BufferRef buffer;
}

} // namespace LibAVUtil
