/***********************************************************
General DV muxer/demuxer
@copyright 2003 Roman Shaposhnik

Many thanks to Dan Dennedy <dan@dennedy.org> for providing wealth
of DV technical info.

Raw DV format
@copyright 2002 Fabrice Bellard

50 Mbps (DVCPRO50) support
@copyright 2006 Daniel Maas <dmaas@maasdigital.com>
***********************************************************/
/***********************************************************
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

[CCode (cname="ff_dv_muxer", cheader="")]
public class DVOutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "dv"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "DV (Digital Video)"
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return ;
        }
    } // = "dv"
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (DVMuxContext);
        }
    }
    [CCode (cname="audio_codec", cheader="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.PCM_S16LE;
        }
    }
    [CCode (cname="video_codec", cheader="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.DVVIDEO;
        }
    }
    [CCode (cname="dv_write_header", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );
    [CCode (cname="dv_write_packet", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );
    [CCode (cname="dv_write_trailer", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    );
}
