/***********************************************************
Copyright (c) 2001 Fabrice Bellard

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

namespace LibAVFormat {

/***********************************************************
@file
@ingroup libavf
Main libavformat public API header
***********************************************************/

[CCode (cname="struct AVBPrint",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
[Compact]
public class LibAVFormat.BPrintBuffer {

    /***********************************************************
    @file
    @ingroup libavf
    Main libavformat public API header
    ***********************************************************/

    /***********************************************************
    Make a RFC 4281/6381 like string describing a codec for MIME types.

    @param par pointer to an LibAVCodec.CodecParameters struct describing the codec
    @param frame_rate an LibAVUtil.Rational for the frame rate, for deciding the
                      right profile for video codecs. Pass an invalid
                      LibAVUtil.Rational (1/0) to indicate that it is unknown.
    @param bprint_buffer_out the LibAVFormat.BPrintBuffer to write the output to
    @return <0 on error
    ***********************************************************/
    [CCode (cname="av_mime_codec_str",cheader_filename="subprojects/ffmpeg/libformat/avformat.h")]
    public static int av_mime_codec_str (
        LibAVCodec.CodecParameters? par,
        LibAVUtil.Rational frame_rate,
        out LibAVFormat.BPrintBuffer? bprint_buffer_out
    );

    /***********************************************************
    @}
    ***********************************************************/

}

} // namespace LibAVFormat
