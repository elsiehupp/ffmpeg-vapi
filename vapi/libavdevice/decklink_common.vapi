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

//  #include <DeckLinkAPIVersion.h>
//  #if BLACKMAGIC_DECKLINK_API_VERSION < 0x0b000000
//  #define IID_IDeckLinkProfileAttributes IID_IDeckLinkAttributes
//  #define IDeckLinkProfileAttributes IDeckLinkAttributes
//  #endif

#ifdef _WIN32
static string dup_wchar_to_utf8 (wchar_t *w)
{
    string s = NULL;
    int l = WideCharToMultiByte (CP_UTF8, 0, w, -1, 0, 0, 0, 0);
    s = (string ) av_malloc (l);
    if (s)
        WideCharToMultiByte (CP_UTF8, 0, w, -1, s, l, 0, 0);
    return s;
}
public define DECKLINK_STR    OLECHAR *
public define DECKLINK_STRDUP dup_wchar_to_utf8
public define DECKLINK_FREE (s) SysFreeString (s)
#elif defined (__APPLE__)
static string dup_cfstring_to_utf8 (CFStringRef w)
{
    char s[256];
    CFStringGetCString (w, s, 255, kCFStringEncodingUTF8);
    return av_strdup (s);
}
public define DECKLINK_STR    const __CFString *
public define DECKLINK_STRDUP dup_cfstring_to_utf8
public define DECKLINK_FREE (s) CFRelease (s)
#else
public define DECKLINK_STR    string
public define DECKLINK_STRDUP av_strdup
/***********************************************************
free () is needed for a string returned by the DeckLink SDL.
***********************************************************/
public define DECKLINK_FREE (s) free ((void *) s)
#endif

class decklink_output_callback;
class decklink_input_callback;

[CCode (cname="",cheader_filename="")]
[Compact]
public class AVPacketQueue {
    AVPacketList *first_pkt;
    AVPacketList *last_pkt;
    public int nb_packets;
    ulong long size;
    public int abort_request;
    pthread_mutex_t mutex;
    pthread_cond_t cond;
    AVFormatContext *avctx;
    public int64 max_q_size;
}

[CCode (cname="",cheader_filename="")]
[Compact]
public class decklink_ctx {
    /***********************************************************
    DeckLink SDK interfaces
    ***********************************************************/
    IDeckLink *dl;
    IDeckLinkOutput *dlo;
    IDeckLinkInput *dli;
    IDeckLinkConfiguration *cfg;
    IDeckLinkProfileAttributes *attr;
    decklink_output_callback *output_callback;

    /***********************************************************
    DeckLink mode information
    ***********************************************************/
    BMDTimeValue bmd_tb_den;
    BMDTimeValue bmd_tb_num;
    BMDDisplayMode bmd_mode;
    BMDVideoConnection video_input;
    BMDAudioConnection audio_input;
    BMDTimecodeFormat tc_format;
    public int bmd_width;
    public int bmd_height;
    public int bmd_field_dominance;
    public int supports_vanc;

    /***********************************************************
    Capture buffer queue
    ***********************************************************/
    AVPacketQueue queue;

    /***********************************************************
    Streams present
    ***********************************************************/
    [CCode (cname="")]
    public int audio;
    public int video;

    /***********************************************************
    Status
    ***********************************************************/
    [CCode (cname="")]
    public int playback_started;
    public int capture_started;
    public int64 last_pts;
    ulong frameCount;
    public uint dropped;
    AVStream *audio_st;
    AVStream *video_st;
    AVStream *teletext_st;
    uint16 cdp_sequence_num;

    /***********************************************************
    Options
    ***********************************************************/
    [CCode (cname="")]
    public int list_devices;
    public int list_formats;
    public int64 teletext_lines;
    double preroll;
    public int duplex_mode;
    DecklinkPtsSource audio_pts_source;
    DecklinkPtsSource video_pts_source;
    public int draw_bars;
    BMDPixelFormat raw_format;

    [CCode (cname="")]
    public int frames_preroll;
    public int frames_buffer;

    pthread_mutex_t mutex;
    pthread_cond_t cond;
    public int frames_buffer_available_spots;
    public int autodetect;

#if CONFIG_LIBKLVANC
    struct klvanc_context_s *vanc_ctx;
#endif

    public int channels;
    public int audio_depth;
}

[CCode (cname="",cheader_filename="")]
public enum decklink_direction_t {
    DIRECTION_IN,
    DIRECTION_OUT
}

#ifdef _WIN32
#if BLACKMAGIC_DECKLINK_API_VERSION < 0x0a040000
public typedef ulong buffercount_type;
#else
public typedef uint buffercount_type;
#endif
IDeckLinkIterator *CreateDeckLinkIteratorInstance ();
#else
public typedef uint32 buffercount_type;
#endif

static const BMDAudioConnection decklink_audio_connection_map[] = {
    (BMDAudioConnection)0,
    bmdAudioConnectionEmbedded,
    bmdAudioConnectionAESEBU,
    bmdAudioConnectionAnalog,
    bmdAudioConnectionAnalogXLR,
    bmdAudioConnectionAnalogRCA,
    bmdAudioConnectionMicrophone;
}

static const BMDVideoConnection decklink_video_connection_map[] = {
    (BMDVideoConnection)0,
    bmdVideoConnectionSDI,
    bmdVideoConnectionHDMI,
    bmdVideoConnectionOpticalSDI,
    bmdVideoConnectionComponent,
    bmdVideoConnectionComposite,
    bmdVideoConnectionSVideo;
}

static const BMDTimecodeFormat decklink_timecode_format_map[] = {
    (BMDTimecodeFormat)0,
    bmdTimecodeRP188VITC1,
    bmdTimecodeRP188VITC2,
    bmdTimecodeRP188LTC,
    bmdTimecodeRP188Any,
    bmdTimecodeVITC,
    bmdTimecodeVITCField2,
    bmdTimecodeSerial;
}

[CCode (cname="",cheader_filename="")]
public int ff_decklink_set_configs (
    AVFormatContext *avctx,
    decklink_direction_t direction
);

[CCode (cname="",cheader_filename="")]
public int ff_decklink_set_format (
    AVFormatContext *avctx,
    int width,
    int height,
    int tb_num,
    int tb_den,
    AVFieldOrder field_order,
    decklink_direction_t direction = DIRECTION_OUT,
    int num = 0
);

[CCode (cname="",cheader_filename="")]
public int ff_decklink_set_format (
    AVFormatContext *avctx,
    decklink_direction_t direction,
    int num
);

[CCode (cname="",cheader_filename="")]
public int ff_decklink_list_devices (
    AVFormatContext *avctx,
    AVDeviceInfoList *device_list,
    int show_inputs,
    int show_outputs
);

[CCode (cname="",cheader_filename="")]
public void ff_decklink_list_devices_legacy (
    AVFormatContext *avctx,
    int show_inputs,
    int show_outputs
);

[CCode (cname="",cheader_filename="")]
public int ff_decklink_list_formats (
    AVFormatContext *avctx,
    decklink_direction_t direction = DIRECTION_OUT
);

[CCode (cname="",cheader_filename="")]
public void ff_decklink_cleanup (
    AVFormatContext *avctx
);

[CCode (cname="",cheader_filename="")]
public int ff_decklink_init_device (
    AVFormatContext *avctx,
    char* name
);
