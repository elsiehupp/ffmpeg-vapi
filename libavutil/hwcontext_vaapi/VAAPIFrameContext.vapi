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
@brief VAAPI-specific data associated with a frame pool.

Allocated as HardwareFrameContext.hwctx.
***********************************************************/
[CCode (cname="struct AVVAAPIFramesContext", cheader_filename="ffmpeg/libavutil/hwcontext_vaapi.h")]
public class VAAPIFrameContext : AbstractHardwareContext {
    /***********************************************************
    @brief Set by the user to apply surface attributes to all surfaces in
    the frame pool. If null, default settings are used.
    ***********************************************************/
    [CCode (cname="attributes")]
    public VASurfaceAttribp[] attribute_list;
    [CCode (cname="nb_attributes")]
    public int attribute_count;

    /***********************************************************
    @brief The surfaces IDs of all surfaces in the pool after creation.
    Only valid if HardwareFrameContext.initial_pool_size was positive.
    These are intended to be used as the render_targets arguments to
    vaCreateContext ().
    ***********************************************************/
    [CCode (cname="surface_ids")]
    public VASurfaceID[] surface_id_list;
    [CCode (cname="nb_surfaces")]
    public int surface_count;
}

} // namespace LibAVUtil
