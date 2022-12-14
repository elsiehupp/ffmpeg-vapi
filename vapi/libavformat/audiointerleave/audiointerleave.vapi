/***********************************************************
@brief Audio interleaving prototypes and declarations

@copyright 2009 Baptiste Coudurier <baptiste dot coudurier at gmail dot com>
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

[CCode (cname="struct AudioInterleaveContext", cheader_filename="")]
public struct AudioInterleaveContext {
    LibAVUtil.FifoBuffer fifo;

    /***********************************************************
    @brief Size of currently allocated FIFO
        ***********************************************************/
    uint fifo_size;

    /***********************************************************
    @brief Current dts
        ***********************************************************/
    uint64 dts;

    /***********************************************************
    @brief Size of one sample all channels included
        ***********************************************************/
    int sample_size;

    /***********************************************************
    @brief Must be 0-terminated
        ***********************************************************/
    int[] samples_per_frame;

    /***********************************************************
    @brief Current samples per frame, pointer to samples_per_frame
        ***********************************************************/
    int[] samples;

    /***********************************************************
    @brief Time base of output audio packets
        ***********************************************************/
    LibAVUtil.Rational time_base;
}

[CCode (cname="ff_audio_interleave_init", cheader_filename="")]
public int ff_audio_interleave_init (
    AVFormatContext format_context,
    int[] samples_per_frame,
    LibAVUtil.Rational time_base
);

[CCode (cname="ff_audio_interleave_close", cheader_filename="")]
public void ff_audio_interleave_close (
    AVFormatContext format_context
);

public delegate int GetPacketDelegate (
    AVFormatContext format_context,
    LibAVCodec.Packet packet_1,
    LibAVCodec.Packet packet_2,
    int arg
);

public delegate int CompareTimeStampDelegate (
    AVFormatContext format_context,
    LibAVCodec.Packet packet_1,
    LibAVCodec.Packet packet_2
);

/***********************************************************
@brief Rechunk audio PCM packets per AudioInterleaveContext.samples_per_frame
and interleave them correctly.
The first element of AVStream.priv_data must be AudioInterleaveContext
when using this function.

@param get_packet function will output a packet when streams are correctly interleaved.
@param compare_ts function will compare AVPackets and decide interleaving order.
***********************************************************/
[CCode (cname="ff_audio_rechunk_interleave", cheader_filename="")]
public int ff_audio_rechunk_interleave (
    AVFormatContext format_context,
    LibAVCodec.Packet out,
    LibAVCodec.Packet packet,
    int flush,
    GetPacketDelegate get_packet,
    CompareTimeStampDelegate compare_ts
);

} // namespace LibAVFormat
