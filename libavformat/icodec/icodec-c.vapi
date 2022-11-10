/***********************************************************
Microsoft Windows ICO demuxer
@copyright 2011 Peter Ross (pross@xvid.org)
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

/***********************************************************
@file Microsoft Windows ICO demuxer
***********************************************************/

[CCode (cname="ff_ico_demuxer", cheader="")]
public class InputDemuxer : AVInputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "ico"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "Microsoft Windows ICO"
    [CCode (cname="priv_data_size", cheader="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (IcoDemuxContext);
        }
    }
    [CCode (cname="", cheader="")]
    public override int read_probe (
        AVProbeData format_context
    ); // = probe,
    [CCode (cname="", cheader="")]
    public override int read_header (
        AVFormatContext format_context
    ); // = read_header,
    [CCode (cname="", cheader="")]
    public override int read_packet (
        AVFormatContext format_context,
        LibAVCodec.Packet packet
    ); // = read_packet,
    [CCode (cname="", cheader="")]
    public override int read_close (
        AVFormatContext format_context
    ); // = ico_read_close,
    //  .flags = AVFMT_NOTIMESTAMPS,
}
