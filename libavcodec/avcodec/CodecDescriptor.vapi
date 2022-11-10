/***********************************************************
@copyright 2001 Fabrice Bellard
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

namespace LibAVCodec {
using LibAVUtil;

/***********************************************************
@file @ingroup libavc
LibAVCodec external API header
***********************************************************/

/***********************************************************
@brief This struct describes the properties of a single codec described by an
CodecID.
@see @link avcodec_descriptor_get ()
***********************************************************/
[CCode (cname="struct AVCodecDescriptor", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
public struct CodecDescriptor {
    [CCode (cname="id")]
    public CodecID id;
    [CCode (cname="type")]
    public LibAVUtil.MediaType type;

    /***********************************************************
    @brief Name of the codec described by this descriptor. It is non-empty and
    unique for each codec descriptor. It should contain alphanumeric
    characters and '_' only.
    ***********************************************************/
    [CCode (cname="name")]
    public string name;

    /***********************************************************
    @brief A more descriptive name for this codec. May be null.
    ***********************************************************/
    [CCode (cname="long_name")]
    public string long_name;

    /***********************************************************
    @brief Codec properties, a combination of CodecPropertyFlags2 flags.
    ***********************************************************/
    [CCode (cname="props")]
    public CodecPropertyFlags2 props;

    /***********************************************************
    @brief MIME type (s) associated with the codec.
    May be null; if not, a null-terminated array of MIME types.
    The first item is always non-null and is the preferred MIME type.
    ***********************************************************/
    [CCode (cname="mime_types")]
    public string[] mime_types;

    /***********************************************************
    @brief If non-null, an array of profiles recognized for this codec.
    Terminated with FF_PROFILE_UNKNOWN.
    ***********************************************************/
    [CCode (cname="profiles")]
    public Profile[] profiles;

    /***********************************************************
    @return descriptor for given codec ID or null if no descriptor exists.
    ***********************************************************/
    [CCode (cname="avcodec_descriptor_get", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public CodecDescriptor avcodec_descriptor_get (
        CodecID id
    );

    /***********************************************************
    @brief Iterate over all codec descriptors known to 

    @param prev previous descriptor. null to get the first descriptor.

    @return next descriptor or null after the last descriptor
    ***********************************************************/
    [CCode (cname="avcodec_descriptor_next", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public CodecDescriptor avcodec_descriptor_next (
        CodecDescriptor prev
    );

    /***********************************************************
    @return codec descriptor with the given name or null if no such descriptor
        exists.
    ***********************************************************/
    [CCode (cname="avcodec_descriptor_get_by_name", cheader_filename="ffmpeg/libavcodec/avcodec.h")]
    public CodecDescriptor avcodec_descriptor_get_by_name (
        string name
    );

}

} // namespace LibAVCodec
