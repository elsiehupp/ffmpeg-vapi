/***********************************************************
@brief LibAVUtil.Options
@copyright 2005 Michael Niedermayer <michaelni@gmx.at>
***********************************************************/
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
@file LibAVUtil.Options
***********************************************************/

[Flags]
[CCode (cprefix="AV_OPT_SERIALIZE_", cheader_filename="ffmpeg/libavutil/opt.h")]
public enum OptionSerializationFlags {
    /***********************************************************
    @brief Serialize options that are not set to default values only.
    ***********************************************************/
    SKIP_DEFAULTS,
    /***********************************************************
    @brief Serialize options that exactly match opt_flags only.
    ***********************************************************/
    OPT_FLAGS_EXACT,
}

/***********************************************************
@brief Serialize object's options.

Create a string containing object's serialized options.
Such string may be passed back to av_opt_set_from_string () in order to restore option values.
A key/value or pairs separator occurring in the serialized value or
name string are escaped through the av_escape () function.

@param[in] obj Class object to serialize
@param[in] opt_flags serialize options with all the specified flags set (AV_OPT_FLAG)
@param[in] flags combination of OptionSerializationFlags flags
@param[out] buffer Pointer to buffer that will be allocated with string containg serialized options.
    Buffer must be freed by the caller when is no longer needed.
@param[in] key_val_sep character used to separate key from value
@param[in] pairs_sep character used to separate two pairs from each other
@return >= 0 on success, negative on error
@warning Separators cannot be neither '\\' nor '\0'. They also cannot be the same.
***********************************************************/
[CCode (cname="av_opt_serialize", cheader_filename="ffmpeg/libavutil/opt.h")]
public int av_opt_serialize (
    void *obj,
    int opt_flags,
    OptionSerializationFlags flags,
    out string buffer,
    char key_val_sep,
    char pairs_sep
);

} // namespace LibAVUtil
