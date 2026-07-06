/***********************************************************
Blackmagic DeckLink input
Copyright (c) 2013-2014 Ramiro Polla

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

[CCode (cname="ff_decklink_read_header",cheader_filename="subprojects/ffmpeg/libavdevice/decklink_dec.h")]
public int ff_decklink_read_header (
    LibAVFormat.FormatContext? avctx
);

[CCode (cname="ff_decklink_read_packet",cheader_filename="subprojects/ffmpeg/libavdevice/decklink_dec.h")]
public int ff_decklink_read_packet (
    LibAVFormat.FormatContext? avctx,
    LibAVCodec.Packet? pkt
);

[CCode (cname="ff_decklink_read_close",cheader_filename="subprojects/ffmpeg/libavdevice/decklink_dec.h")]
public int ff_decklink_read_close (
    LibAVFormat.FormatContext? avctx
);

[CCode (cname="ff_decklink_list_input_devices",cheader_filename="subprojects/ffmpeg/libavdevice/decklink_dec.h")]
public int ff_decklink_list_input_devices (
    LibAVFormat.FormatContext? avctx,
    LibAVFormat.DeviceInfoList? device_list
);


} // namespace LibAVDevice
