/***********************************************************
Metadata muxer
@copyright 2010 Anton Khirnov
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

[CCode (cname="ff_ffmetadata_muxer", cheader="")]
public class MetadataOutputMuxer : AVOutputFormat {
    [CCode (cname="name", cheader="")]
    public override string name {
        public get {
            return ;
        }
    } // = "ffmetadata"
    [CCode (cname="long_name", cheader="")]
    public override string long_name {
        public get {
            return ;
        }
    } // = "FFmpeg metadata in text"
    [CCode (cname="extensions", cheader="")]
    public override string extensions {
        public get {
            return ;
        }
    } // = "ffmeta"
    [CCode (cname="write_header", cheader="")]
    public override int write_header (
        AVFormatContext format_context
    );
    [CCode (cname="write_packet", cheader="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );
    [CCode (cname="write_trailer", cheader="")]
    public override int write_trailer (
        AVFormatContext format_context
    );
    //  .flags = AVFMT_NOTIMESTAMPS | AVFMT_NOSTREAMS,
}
