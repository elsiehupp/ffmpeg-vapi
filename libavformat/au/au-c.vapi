/***********************************************************
@brief AU muxer and demuxer
@copyright 2001 Fabrice Bellard

first version by Francois Revol <revol@free.fr>
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

#if CONFIG_AU_MUXER
/***********************************************************
@brief Reference documents:
http://www.opengroup.org/public/pubs/external/auformat.html
http://www.goice.co.jp/member/mo/formats/au.html
***********************************************************/

[CCode (cname="ff_au_muxer", cheader_filename="")]
public class AUMuxer : AVOutputFormat {
    [CCode (cname="name", cheader_filename="")]
    public override string name {
        public get {
            return "au";
        }
    }

    [CCode (cname="long_name", cheader_filename="")]
    public override string long_name {
        public get {
            return "Sun AU";
        }
    }

    [CCode (cname="mime_type", cheader_filename="")]
    public override string mime_type {
        public get {
            return "audio/basic";
        }
    }

    [CCode (cname="extensions", cheader_filename="")]
    public override string extensions {
        public get {
            return "au";
        }
    }

    [CCode (cname="priv_data_size", cheader_filename="")]
    public override size_t priv_data_size {
        public get {
            return sizeof (AUContext);
        }
    }

    [CCode (cname="audio_codec", cheader_filename="")]
    public override LibAVCodec.CodecID audio_codec {
        public get {
            return LibAVCodec.CodecID.PCM_S16BE;
        }
    }

    [CCode (cname="video_codec", cheader_filename="")]
    public override LibAVCodec.CodecID video_codec {
        public get {
            return LibAVCodec.CodecID.NONE;
        }
    }

    [CCode (cname="au_write_header", cheader_filename="")]
    public override int write_header (
        AVFormatContext format_context
    );

    [CCode (cname="ff_raw_write_packet", cheader_filename="")]
    public override int write_packet (
        void *opaque,
        uint8[] buffer,
        int buf_size
    );

    [CCode (cname="au_write_trailer", cheader_filename="")]
    public override int write_trailer (
        AVFormatContext format_context
    );
    //  .codec_tag = (AVCodecTag[]) { codec_au_tags, 0 },
    [CCode (cname="flags", cheader_filename="")]
    public override AVFormatFlags1 flags {
        public get {
            return AVFMT_NOTIMESTAMPS;
        }
    }
}

#endif /* CONFIG_AU_MUXER */

} // namespace LibAVFormat
