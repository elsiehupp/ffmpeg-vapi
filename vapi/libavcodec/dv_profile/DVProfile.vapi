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

namespace LibAVCodec {
using LibAVUtil;

/***********************************************************
@brief Minimum number of bytes to read from a DV stream in order to
determine the profile (6 DIF blocks)
***********************************************************/
[CCode (cname="DV_PROFILE_BYTES", cheader_filename="ffmpeg/libavcodec/dv_profile.h")]
public const size_t DV_PROFILE_BYTES;

/***********************************************************
@brief DVProfile is used to express the differences between various
DV flavors. For now it's primarily used for differentiating
525/60 and 625/50, but the plans are to use it for various
DV specs as well (e.g. SMPTE314M vs. IEC 61834).
***********************************************************/
[CCode (cname="struct DVProfile", cheader_filename="ffmpeg/libavcodec/dv_profile.h")]
public struct DVProfile {
    /***********************************************************
    @brief Value of the dsf in the DV header
        ***********************************************************/
    [CCode (cname="dsf")]
    public int dsf;

    /***********************************************************
    @brief Stype for VAUX source pack
        ***********************************************************/
    [CCode (cname="video_stype")]
    public int video_stype;

    /***********************************************************
    @brief Total size of one frame in bytes
        ***********************************************************/
    [CCode (cname="frame_size")]
    public int frame_size;

    /***********************************************************
    @brief Number of DIF segments per DIF channel
        ***********************************************************/
    [CCode (cname="difseg_size")]
    public int difseg_size;

    /***********************************************************
    @brief Number of DIF channels per frame
        ***********************************************************/
    [CCode (cname="n_difchan")]
    public int n_difchan;

    /***********************************************************
    @brief 1/framerate
        ***********************************************************/
    [CCode (cname="time_base")]
    public LibAVUtil.Rational time_base;

    /***********************************************************
    @brief FPS from the LTS standpoint
        ***********************************************************/
    [CCode (cname="ltc_divisor")]
    public int ltc_divisor;

    /***********************************************************
    @brief Picture height in pixels
        ***********************************************************/
    [CCode (cname="height")]
    public int height;

    /***********************************************************
    @brief Picture width in pixels
        ***********************************************************/
    [CCode (cname="width")]
    public int width;

    /***********************************************************
    @brief Sample aspect ratios for 4:3 and 16:9
        ***********************************************************/
    [CCode (cname="sar")]
    public LibAVUtil.Rational sar[2];

    /***********************************************************
    @brief Picture pixel format
        ***********************************************************/
    [CCode (cname="pix_fmt")]
    public LibAVUtil.PixelFormat pixel_format;

    /***********************************************************
    @brief Blocks per macroblock
        ***********************************************************/
    [CCode (cname="bpm")]
    public int blocks_per_macroblock;

    /***********************************************************
    @brief AC block sizes, in bits
        ***********************************************************/
    [CCode (cname="block_sizes")]
    public uint8[] block_sizes;

    /***********************************************************
    @brief Size of audio_shuffle table
        ***********************************************************/
    [CCode (cname="audio_stride")]
    public int audio_stride;

    /***********************************************************
    @brief Minimum amount of audio samples for 48kHz, 44.1kHz and 32kHz
        ***********************************************************/
    [CCode (cname="audio_min_samples")]
    public int audio_min_samples[3];

    /***********************************************************
    @brief How many samples are supposed to be in each frame in a 5 frames window
        ***********************************************************/
    [CCode (cname="audio_samples_dist")]
    public int audio_samples_dist[5];

    /***********************************************************
    @brief PCM shuffling table
        ***********************************************************/
    //  [CCode (cname="audio_shuffle")]
    //  public uint8 (*audio_shuffle)[9];

    /***********************************************************
    @brief Get a DV profile for the provided compressed frame.

    @param sys the profile used for the previous frame, may be null
    @param frame the compressed data buffer
    @param buf_size size of the buffer in bytes
    @return the DV profile for the supplied data or null on failure
        ***********************************************************/
    [CCode (cname="av_dv_frame_profile", cheader_filename="ffmpeg/libavcodec/dv_profile.h")]
    public DVProfile av_dv_frame_profile (
        DVProfile sys,
        uint8[] frame,
        uint buf_size
    );

    /***********************************************************
    @brief Get a DV profile for the provided stream parameters.
        ***********************************************************/
    [CCode (cname="av_dv_codec_profile", cheader_filename="ffmpeg/libavcodec/dv_profile.h")]
    public DVProfile av_dv_codec_profile (
        int width,
        int height,
        LibAVUtil.PixelFormat pixel_format
    );

    /***********************************************************
    @brief Get a DV profile for the provided stream parameters.
    The frame rate is used as a best-effort parameter.
        ***********************************************************/
    [CCode (cname="av_dv_codec_profile2", cheader_filename="ffmpeg/libavcodec/dv_profile.h")]
    public DVProfile av_dv_codec_profile2 (
        int width,
        int height,
        LibAVUtil.PixelFormat pixel_format,
        LibAVUtil.Rational frame_rate
    );
}

} // namespace LibAVCodec
