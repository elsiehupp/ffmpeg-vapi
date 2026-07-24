/***********************************************************
@copyright 2001 Fabrice Bellard
***********************************************************/
/***********************************************************
@brief This file is part of FFmpeg.

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

namespace LibAVFormat {

/***********************************************************
@file @ingroup libavf
Main libavformat public API header
***********************************************************/

[Flags]
[CCode (cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
public enum LibAVFormat.DispositionFlags {
    /***********************************************************
    @brief The stream should be chosen by default among other
    streams of the same type, unless the user has explicitly
    specified otherwise.
    ***********************************************************/
    [CCode (cname="AV_DISPOSITION_DEFAULT")]
    DEFAULT,

    /***********************************************************
    @brief The stream is not in original language.

    @note LibAVFormat.DispositionFlags.ORIGINAL is the inverse of this disposition. At most
          one of them should be set in properly tagged streams.
    @note This disposition may apply to any stream type, not just audio.
    ***********************************************************/
    [CCode (cname="AV_DISPOSITION_DUB")]
    DUB,

    /***********************************************************
    @brief The stream is in original language.

    @see the notes for LibAVFormat.DispositionFlags.DUB
    ***********************************************************/
    [CCode (cname="AV_DISPOSITION_ORIGINAL")]
    ORIGINAL,

    /***********************************************************
    @brief The stream is a commentary track.
    ***********************************************************/
    [CCode (cname="AV_DISPOSITION_COMMENT")]
    COMMENT,

    /***********************************************************
    @brief The stream contains song lyrics.
    ***********************************************************/
    [CCode (cname="AV_DISPOSITION_LYRICS")]
    LYRICS,

    /***********************************************************
    @brief The stream contains karaoke audio.
    ***********************************************************/
    [CCode (cname="AV_DISPOSITION_KARAOKE")]
    KARAOKE,

    /***********************************************************
    @brief Track should be used during playback by default.
    Useful for subtitle track that should be displayed
    even when user did not explicitly ask for subtitles.
    ***********************************************************/
    [CCode (cname="AV_DISPOSITION_FORCED")]
    FORCED,

    /***********************************************************
    @brief Stream for hearing impaired audiences
    ***********************************************************/
    [CCode (cname="AV_DISPOSITION_HEARING_IMPAIRED")]
    HEARING_IMPAIRED,

    /***********************************************************
    @brief Stream for visual impaired audiences
    ***********************************************************/
    [CCode (cname="AV_DISPOSITION_VISUAL_IMPAIRED")]
    VISUAL_IMPAIRED,

    /***********************************************************
    @brief Stream without voice
    ***********************************************************/
    [CCode (cname="AV_DISPOSITION_CLEAN_EFFECTS")]
    CLEAN_EFFECTS,

    /***********************************************************
    @brief The stream is stored in the file as an attached picture/"cover art" (e.g.
    APIC frame in ID3v2). The first (usually only) packet associated with it
    will be returned among the first few packets read from the file unless
    seeking takes place. It can also be accessed at any time in
    LibAVFormat.Stream.attached_pic.
    ***********************************************************/
    [CCode (cname="AV_DISPOSITION_ATTACHED_PIC")]
    ATTACHED_PIC,

    /***********************************************************
    @brief The stream is sparse, and contains thumbnail images, often corresponding
    to chapter markers. Only ever used with LibAVFormat.DispositionFlags.ATTACHED_PIC.
    ***********************************************************/
    [CCode (cname="AV_DISPOSITION_TIMED_THUMBNAILS")]
    TIMED_THUMBNAILS,

    /***********************************************************
    The stream is intended to be mixed with a spatial audio track. For example,
    it could be used for narration or stereo music, and may remain unchanged by
    listener head rotation.
    ***********************************************************/
    [CCode (cname="AV_DISPOSITION_NON_DIEGETIC")]
    NON_DIEGETIC,

    /***********************************************************
    @brief To specify text track kind (different from subtitles default).
    ***********************************************************/
    [CCode (cname="AV_DISPOSITION_CAPTIONS")]
    CAPTIONS,

    /***********************************************************
    The subtitle stream contains a textual description of the video content.
    Typically intended for visually-impaired audiences or for the cases where the
    video cannot be seen.
    ***********************************************************/
    [CCode (cname="AV_DISPOSITION_DESCRIPTIONS")]
    DESCRIPTIONS,

    /***********************************************************
    The subtitle stream contains time-aligned metadata that is not intended to be
    directly presented to the user.
    ***********************************************************/
    [CCode (cname="AV_DISPOSITION_METADATA")]
    METADATA,

    /***********************************************************
    @brief Dependent audio stream (mix_type=0 in mpegts)

    The stream is intended to be mixed with another stream before presentation.
    Used for example to signal the stream contains an image part of a HEIF grid,
    or for mix_type=0 in mpegts.
    ***********************************************************/
    [CCode (cname="AV_DISPOSITION_DEPENDENT")]
    DEPENDENT,

    /***********************************************************
    @brief The video stream contains still images.

    Still images in video stream (still_picture_flag=1 in mpegts)
    ***********************************************************/
    [CCode (cname="AV_DISPOSITION_STILL_IMAGE")]
    STILL_IMAGE,

    /***********************************************************
    The video stream contains multiple layers, e.g. stereoscopic views (cf. H.264
    Annex G/H, or HEVC Annex F).
    ***********************************************************/
    [CCode (cname="AV_DISPOSITION_MULTILAYER")]
    MULTILAYER;

    /***********************************************************
    @return The LibAVFormat.DispositionFlags flag corresponding to disp or a negative error
        code if disp does not correspond to a known stream disposition.
    ***********************************************************/
    [CCode (cname="av_disposition_from_string")]
    public static LibAVFormat.DispositionFlags av_disposition_from_string (
        string disp
    );

    /***********************************************************
    @param disposition a combination of LibAVFormat.DispositionFlags values
    @return The string description corresponding to the lowest set bit in
        disposition. NULL when the lowest set bit does not correspond
        to a known disposition or when disposition is 0.
    ***********************************************************/
    [CCode (cname="av_disposition_to_string")]
    public static string av_disposition_to_string (
        LibAVFormat.DispositionFlags disposition
    );

}

} // namespace LibAVFormat
