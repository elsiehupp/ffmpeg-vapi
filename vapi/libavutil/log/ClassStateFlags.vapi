/***********************************************************
Copyright (c) 2006 Michael Niedermayer <michaelni@gmx.at>

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
namespace LibAVUtil {
namespace Log {

[CCode (cname="enum AVClassStateFlags",cprefix="AV_CLASS_STATE_",cheader_filename="subprojects/ffmpeg/libavutil/log.h")]
public enum LibAVUtil.Log.ClassStateFlags {
    /***********************************************************
    Object initialization has finished and it is now in the 'runtime' stage.
    This affects e.g. what options can be set on the object (only
    AV_OPT_FLAG_RUNTIME_PARAM options can be set on initialized objects).
    ***********************************************************/
    INITIALIZED; // = (1 << 0),
}

} // namespace Log
} // namespace LibAVUtil
