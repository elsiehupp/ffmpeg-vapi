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

/***********************************************************
@brief Input/output formats
***********************************************************/

/***********************************************************
@brief This structure contains the data a format has to probe a file.
***********************************************************/
[CCode (cname="struct AVProbeData",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
[Compact]
public class LibAVFormat.ProbeData {
    [CCode (cname="filename")]
    public string filename;

    /***********************************************************
    @brief Buffer must have AVPROBE_PADDING_SIZE of extra allocated bytes filled with zero.
    ***********************************************************/
    [CCode (cname="buffer")]
    public uchar[] buffer;

    /***********************************************************
    @brief Size of buffer except extra allocated bytes
    ***********************************************************/
    [CCode (cname="buf_size")]
    public int buf_size;

    /***********************************************************
    @brief Mime_type, when known.
    ***********************************************************/
    [CCode (cname="mime_type")]
    public string mime_type;

    [CCode (cname="AVPROBE_SCORE_RETRY",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public const int AVPROBE_SCORE_RETRY;

    [CCode (cname="AVPROBE_SCORE_STREAM_RETRY",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public const int AVPROBE_SCORE_STREAM_RETRY;

    /***********************************************************
    @brief Score for file extension
    ***********************************************************/
    [CCode (cname="AVPROBE_SCORE_EXTENSION",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public const int AVPROBE_SCORE_EXTENSION;

    /***********************************************************
    @brief Score for file mime type
    ***********************************************************/
    [CCode (cname="AVPROBE_SCORE_MIME",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public const int AVPROBE_SCORE_MIME;

    /***********************************************************
    @brief score added for matching mime type
    ***********************************************************/
    [CCode (cname="AVPROBE_SCORE_MIME_BONUS",cheader_filename="subprojects/ffmpeg/libavformat/avformat.h")]
    public const int AVPROBE_SCORE_MIME_BONUS;

    /***********************************************************
    @brief Maximum score
    ***********************************************************/
    [CCode (cname="AVPROBE_SCORE_MAX",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public const int AVPROBE_SCORE_MAX;

    /***********************************************************
    @brief Extra allocated bytes at the end of the probe buffer
    ***********************************************************/
    [CCode (cname="AVPROBE_PADDING_SIZE",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public const size_t AVPROBE_PADDING_SIZE;

    /***********************************************************
    @addtogroup lavf_decoding
    @{
    ***********************************************************/

    /***********************************************************
    @brief Guess the file format.

    @param probe_data data to be probed
    @param is_opened Whether the file is already opened; determines whether
                     demuxers with or without LibAVFormat.FormatFlags1.NO_FILE are probed.
    ***********************************************************/
    [CCode (cname="av_probe_input_format",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public LibAVFormat.InputFormat? av_probe_input_format (
        LibAVFormat.ProbeData? probe_data,
        bool is_opened
    );

    /***********************************************************
    @brief Guess the file format.

    @param probe_data data to be probed
    @param is_opened Whether the file is already opened; determines whether
                     demuxers with or without LibAVFormat.FormatFlags1.NO_FILE are probed.
    @param score_max A probe score larger that this is required to accept a
                     detection, the variable is set to the actual detection
                     score afterwards.
                     If the score is <= AVPROBE_SCORE_MAX / 4 it is recommended
                     to retry with a larger probe buffer.
    ***********************************************************/
    [CCode (cname="av_probe_input_format2",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public LibAVFormat.InputFormat? av_probe_input_format2 (
        LibAVFormat.ProbeData? probe_data,
        bool is_opened,
        out int score_max
    );

    /***********************************************************
    @brief Guess the file format.

    @param is_opened Whether the file is already opened; determines whether
                     demuxers with or without LibAVFormat.FormatFlags1.NO_FILE are probed.
    @param score_ret The score of the best detection.
    ***********************************************************/
    [CCode (cname="av_probe_input_format3",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public LibAVFormat.InputFormat? av_probe_input_format3 (
        LibAVFormat.ProbeData? probe_data,
        bool is_opened,
        out int score_ret
    );

    /***********************************************************
    @}
    ***********************************************************/

}

} // namespace LibAVFormat
