/***********************************************************
@brief LibAVUtil.Options
@copyright 2005 Michael Niedermayer <michaelni@gmx.at>
***********************************************************/
/***********************************************************
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
@file LibAVUtil.Options
***********************************************************/

[Flags]
[CCode (cprefix="AV_OPT_FLAG_", cheader_filename="ffmpeg/libavutil/opt.h")]
public enum OptionFlags {
    /***********************************************************
    @brief Accept to parse a value without a key; the key will then be returned
    as null.
    ***********************************************************/
    IMPLICIT_KEY,
    /***********************************************************
    @brief A generic parameter which can be set by the user for muxing
    or encoding
    ***********************************************************/
    ENCODING_PARAM,
    /***********************************************************
    @brief A generic parameter which can be set by the user for
    demuxing or decoding
    ***********************************************************/
    DECODING_PARAM,
    AUDIO_PARAM,
    VIDEO_PARAM,
    SUBTITLE_PARAM,
    /***********************************************************
    @brief The option is intended for exporting values to the caller.
    ***********************************************************/
    EXPORT,
    /***********************************************************
    @brief The option may not be set through the LibAVUtil.Options API, only
    read. This flag only makes sense when OptionFlags.EXPORT
    is also set.
    ***********************************************************/
    READONLY,
    /***********************************************************
    @brief A generic parameter which can be set by the user for bit
    stream filtering
    ***********************************************************/
    BSF_PARAM,
    /***********************************************************
    @brief A generic parameter which can be set by the user for filtering
    ***********************************************************/
    FILTERING_PARAM,
    /***********************************************************
    @brief Set if option is deprecated, users should refer to
    Option.help text for more information
    ***********************************************************/
    DEPRECATED,
    /***********************************************************
    FIXME think about enc-audio, ... style flags
    ***********************************************************/
}

} // namespace LibAVUtil
