/***********************************************************
Blackmagic DeckLink common code
Copyright (c) 2013-2014 Ramiro Polla, Luca Barbato, Deti Fliegl
Copyright (c) 2017 Akamai Technologies, Inc.

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
namespace LibAVDevice {

//  #include <DeckLinkAPIVersion.h>
//  #if BLACKMAGIC_DECKLINK_API_VERSION < 0x0b000000
//  #define IID_IDeckLinkProfileAttributes IID_IDeckLinkAttributes
//  #define IDeckLinkProfileAttributes IDeckLinkAttributes
//  #endif


[CCode (cname="struct decklink_output_callback",cheader_filename="subprojects/ffmpeg/libavdevice/decklink_common.h")]
[Compact]
public class DeckLinkOutputCallback {}

[CCode (cname="struct decklink_input_callback",cheader_filename="subprojects/ffmpeg/libavdevice/decklink_common.h")]
[Compact]
public class DeckLinkInputCallback {}

[CCode (cname="struct AVPacketQueue",cheader_filename="subprojects/ffmpeg/libavdevice/decklink_common.h")]
[Compact]
public class LibAVDevice.PacketQueue {
    [CCode (cname="")]
    public LibAVFormat.PacketList? first_pkt;

    [CCode (cname="")]
    public LibAVFormat.PacketList? last_pkt;

    [CCode (cname="")]
    public int nb_packets;

    [CCode (cname="")]
    public uint64 size;

    [CCode (cname="")]
    public int abort_request;

    [CCode (cname="")]
    public pthread_mutex_t mutex;

    [CCode (cname="")]
    public pthread_cond_t cond;

    [CCode (cname="")]
    public LibAVFormat.FormatContext? avctx;

    [CCode (cname="")]
    public int64 max_q_size;
}

[CCode (cname="struct decklink_ctx",cheader_filename="subprojects/ffmpeg/libavdevice/decklink_common.h")]
[Compact]
public class decklink_ctx {
    /***********************************************************
    DeckLink SDK interfaces
    ***********************************************************/
    [CCode (cname="")]
    public IDeckLink? dl;

    [CCode (cname="")]
    public IDeckLinkOutput? dlo;

    [CCode (cname="")]
    public IDeckLinkInput? dli;

    [CCode (cname="")]
    public IDeckLinkConfiguration? cfg;

    [CCode (cname="")]
    public IDeckLinkProfileAttributes? attr;

    [CCode (cname="")]
    public decklink_output_callback? output_callback;

    /***********************************************************
    DeckLink mode information
    ***********************************************************/
    [CCode (cname="")]
    public BMDTimeValue bmd_tb_den;

    [CCode (cname="")]
    public BMDTimeValue bmd_tb_num;

    [CCode (cname="")]
    public BMDDisplayMode bmd_mode;

    [CCode (cname="")]
    public BMDVideoConnection video_input;

    [CCode (cname="")]
    public BMDAudioConnection audio_input;

    [CCode (cname="")]
    public BMDTimecodeFormat tc_format;

    [CCode (cname="")]
    public int bmd_width;

    [CCode (cname="")]
    public int bmd_height;

    [CCode (cname="")]
    public int bmd_field_dominance;

    [CCode (cname="")]
    public int supports_vanc;

    /***********************************************************
    Capture buffer queue
    ***********************************************************/
    [CCode (cname="")]
    public LibAVDevice.PacketQueue queue;

    /***********************************************************
    Streams present
    ***********************************************************/
    [CCode (cname="")]
    public int audio;

    [CCode (cname="")]
    public int video;

    /***********************************************************
    Status
    ***********************************************************/
    [CCode (cname="")]
    public int playback_started;

    [CCode (cname="")]
    public int capture_started;

    [CCode (cname="")]
    public int64 last_pts;

    [CCode (cname="")]
    public ulong frameCount;

    [CCode (cname="")]
    public uint dropped;

    [CCode (cname="")]
    public LibAVFormat.Stream? audio_st;

    [CCode (cname="")]
    public LibAVFormat.Stream? video_st;

    [CCode (cname="")]
    public LibAVFormat.Stream? teletext_st;

    [CCode (cname="")]
    public uint16 cdp_sequence_num;

    /***********************************************************
    Options
    ***********************************************************/
    [CCode (cname="")]
    public int list_devices;

    [CCode (cname="")]
    public int list_formats;

    [CCode (cname="")]
    public int64 teletext_lines;

    [CCode (cname="")]
    public double preroll;

    [CCode (cname="")]
    public int duplex_mode;

    [CCode (cname="")]
    public DecklinkPtsSource audio_pts_source;

    [CCode (cname="")]
    public DecklinkPtsSource video_pts_source;

    [CCode (cname="")]
    public int draw_bars;

    [CCode (cname="")]
    public BMDPixelFormat raw_format;

    [CCode (cname="")]
    public int frames_preroll;

    [CCode (cname="")]
    public int frames_buffer;

    public pthread_mutex_t mutex;

    [CCode (cname="")]
    public pthread_cond_t cond;

    [CCode (cname="")]
    public int frames_buffer_available_spots;

    [CCode (cname="")]
    public int autodetect;

#if CONFIG_LIBKLVANC
    [CCode (cname="")]
    public klvanc_context_s? vanc_ctx;
#endif

    public int channels;

    [CCode (cname="")]
    public int audio_depth;
}

[CCode (cname="enum decklink_direction_t",cheader_filename="subprojects/ffmpeg/libavdevice/decklink_common.h")]
public enum DeckLinkDirection {
    [CCode (cname="DIRECTION_IN")]
    IN,

    [CCode (cname="DIRECTION_OUT")]
    OUT
}

//  #ifdef _WIN32
//  #if BLACKMAGIC_DECKLINK_API_VERSION < 0x0a040000
//  public typedef ulong buffercount_type;
//  #else
//  public typedef uint buffercount_type;
//  #endif
//  IDeckLinkIterator *CreateDeckLinkIteratorInstance ();
//  #else
//  public typedef uint32 buffercount_type;
//  #endif

static BMDAudioConnection decklink_audio_connection_map[] = {
    (BMDAudioConnection)0,
    bmdAudioConnectionEmbedded,
    bmdAudioConnectionAESEBU,
    bmdAudioConnectionAnalog,
    bmdAudioConnectionAnalogXLR,
    bmdAudioConnectionAnalogRCA,
    bmdAudioConnectionMicrophone
};

static BMDVideoConnection decklink_video_connection_map[] = {
    (BMDVideoConnection)0,
    bmdVideoConnectionSDI,
    bmdVideoConnectionHDMI,
    bmdVideoConnectionOpticalSDI,
    bmdVideoConnectionComponent,
    bmdVideoConnectionComposite,
    bmdVideoConnectionSVideo
};

static BMDTimecodeFormat decklink_timecode_format_map[] = {
    (BMDTimecodeFormat)0,
    bmdTimecodeRP188VITC1,
    bmdTimecodeRP188VITC2,
    bmdTimecodeRP188LTC,
    bmdTimecodeRP188Any,
    bmdTimecodeVITC,
    bmdTimecodeVITCField2,
    bmdTimecodeSerial
};

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/decklink_common.h")]
public int ff_decklink_set_configs (
    LibAVFormat.FormatContext? avctx,
    decklink_direction_t direction
);

// note: this function name is overloaded in the original C code
[CCode (cname="ff_decklink_set_format",cheader_filename="subprojects/ffmpeg/libavdevice/decklink_common.h")]
public int ff_decklink_set_format_1 (
    LibAVFormat.FormatContext? avctx,
    int width,
    int height,
    int tb_num,
    int tb_den,
    AVFieldOrder field_order,
    decklink_direction_t direction = DeckLinkDirection.OUT,
    int num = 0
);

// note: this function name is overloaded in the original C code
[CCode (cname="ff_decklink_set_format",cheader_filename="subprojects/ffmpeg/libavdevice/decklink_common.h")]
public int ff_decklink_set_format_2 (
    LibAVFormat.FormatContext? avctx,
    decklink_direction_t direction,
    int num
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/decklink_common.h")]
public int ff_decklink_list_devices (
    LibAVFormat.FormatContext? avctx,
    LibAVFormat.DeviceInfoList? device_list,
    int show_inputs,
    int show_outputs
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/decklink_common.h")]
public void ff_decklink_list_devices_legacy (
    LibAVFormat.FormatContext? avctx,
    int show_inputs,
    int show_outputs
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/decklink_common.h")]
public int ff_decklink_list_formats (
    LibAVFormat.FormatContext? avctx,
    decklink_direction_t direction = DeckLinkDirection.OUT
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/decklink_common.h")]
public void ff_decklink_cleanup (
    LibAVFormat.FormatContext? avctx
);

[CCode (cname="",cheader_filename="subprojects/ffmpeg/libavdevice/decklink_common.h")]
public int ff_decklink_init_device (
    LibAVFormat.FormatContext? avctx,
    char* name
);

} // namespace LibAVDevice
